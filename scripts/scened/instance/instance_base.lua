---------------------------------------------------------------------------
--操作类型
OPT_SET 	 = 0x01
OPT_UNSET 	 = 0x02
OPT_ADD 	 = 0x04
OPT_SUB 	 = 0x08
OPT_MARK	 = 0x10	--注释

--地图初始化时在这里取得剧情脚本
function Select_Instance_Script(mapid)
	local ret = INSTANCE_SCRIPT_TABLE[mapid]

	if ret ~= nil then
		return ret
	end

	return Instance_base
end

--地图实例的基类
Instance_base = {
	--地图实例指针
	ptr = nil,
	--构造函数
	new = function(self, object)
		object = object or {}
		setmetatable(object, self)
		self.__index = self
		return object
	end,
	
	-- 普通复活需要的元宝数
	COST_GOLD = 10,
	
	-- 仇恨度
	THREAT_V = 9999999,
	
	--名称
	Name = "Instance_base",
	--副本启动
	STATE_START = 1,
	
	--副本失败
	STATE_FAIL = 249,
	--副本通关
	STATE_FINISH = 250,
	
	--本地图实例是否进行全图广播
	broadcast_nogrid = 0,
	
	--是否复活保护
	is_fuhuobaohu = true,
	
	--是否新手保护
	is_xinshoubaohu = true,
	
	--是否挂机保护
	is_guajibaohu = true,
	
	--死后自动回城复活时间
	player_auto_respan = 120,
	
	
	--获取本地图是否需要持久化，及持久化名
	GetPersistenceName = function(self)
		return false, ""
	end,
	
	--获取路径
	GetMapDataHddPath = function(self,name)
		local tab = os.date("*t",os.time())
		local time_str = ""
		if(tab ~= nil)then
			time_str = string.format("%d%d%d",tab.year,tab.month,tab.day)
		end
		if(name == nil)then
			if(map_data_hdd_path == nil)then
				return "./../scenedata/"..time_str;
			end
			return map_data_hdd_path..time_str
		end
		
		if(map_data_hdd_path == nil)then
			return string.format("./../scenedata/%s/%s",time_str,name);
		end
		return map_data_hdd_path..time_str.."/"..name
	end,
	
	--保存数据到文件
	SaveDataToFile = function(self,name,content)
		if(name == nil or name == "")then
			return
		end
		--校验文件夹是否存在  不存在则创建
		mapLib.IsHaveFile(self.ptr,self:GetMapDataHddPath(),1)
		local data_config_file = self:GetMapDataHddPath(name)
		if(content ~= nil)then
			local mode = "a"
			local file = io.open(data_config_file,mode)
			file:write(content)
			file:close()
		end
	end,
	
	--保存到硬盘
	SaveDataToHdd = function(self, name, opt,value)
		if(name == nil or name == "")then
			return
		end
		--outError("[instance_base.lua]SaveDataHdd "..name.." "..opt.." "..value)
		local data_config_file = self:GetMapDataHddPath(name)
		--outError("[instance_base.lua]SaveDataHdd data_config_file "..data_config_file)
		local str_prex = "BinLogObject."
		if(opt == OPT_MARK)then--纯注释
			str_prex = "--"
		end
		local content = string.format("%s%s --time:%d\r\n",str_prex,value,os.time())
		self:SaveDataToFile(name,content)
	end,
	
	--从硬盘读取数据
	ReadDataFromHdd = function(self)
		local b,name = self:GetPersistenceName()
		if(b)then
			--如果没设置文件名
			if(name == nil or name == "")then
				outError("[instance_base.lua]ReadDataFromHdd name is nil "..name)
				return
			end
			--读取数据设置下标
			local data_config_file = self:GetMapDataHddPath(name)
			local content = ""
			if(mapLib.IsHaveFile(self.ptr,data_config_file,0) == 1)then
				local file = io.open(data_config_file,"r")
				for line in file:lines() do
					content = content..line
				end
				file:close()
			end
			if(content ~= nil and content ~= "")then
				local lua_str = string.format("return function(self)\n %s \n end",content)
				local f = assert(loadstring(lua_str))()
				f(self)
				--添加一条初始化记录
				self:SaveDataToHdd(name,OPT_MARK,"Init Instance Map data")
			end
		end
	end,
	
	SetBit = function(self, index, offset)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SET,string.format("SetBit(self,%d,%d)",index,offset))
		end
		binLogLib.SetBit(mapLib.GetParentPtr(self.ptr), index, offset)
	end,
	
	UnSetBit = function(self, index, offset)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_UNSET,string.format("UnSetBit(self,%d,%d)",index,offset))
		end
		binLogLib.UnSetBit(mapLib.GetParentPtr(self.ptr), index, offset)
	end,

	AddByte = function(self, index, offset, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_ADD,string.format("AddByte(self,%d,%d,%d)",index,offset,value))
		end
		binLogLib.AddByte(mapLib.GetParentPtr(self.ptr), index, offset, value)
	end,
	
	SubByte = function(self, index, offset, value)
		if(b)then
			self:SaveDataToHdd(name,OPT_SUB,string.format("SubByte(self,%d,%d,%d)",index,offset,value))
		end
		binLogLib.SubByte(mapLib.GetParentPtr(self.ptr), index, offset, value)
	end,
	
	SetByte = function(self, index, offset, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SET,string.format("SetByte(self,%d,%d,%d)",index,offset,value))
		end
		binLogLib.SetByte(mapLib.GetParentPtr(self.ptr), index, offset, value)
	end,
	
	AddUInt16 = function(self, index, offset, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_ADD,string.format("AddUInt16(self,%d,%d,%d)",index,offset,value))
		end
		binLogLib.AddUInt16(mapLib.GetParentPtr(self.ptr), index, offset, value)
	end,
	
	SubUInt16 = function(self, index, offset, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SUB,string.format("SubUInt16(self,%d,%d,%d)",index,offset,value))
		end
		binLogLib.SubUInt16(mapLib.GetParentPtr(self.ptr), index, offset, value)
	end,

	SetUInt16 = function(self, index, offset, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SET,string.format("SetUInt16(self,%d,%d,%d)",index,offset,value))
		end
		binLogLib.SetUInt16(mapLib.GetParentPtr(self.ptr), index, offset, value)
	end,
	
	SetUInt32 = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SET,string.format("SetUInt32(self,%d,%d)",index,value))
		end
		binLogLib.SetUInt32(mapLib.GetParentPtr(self.ptr), index, value)
	end,

	AddUInt32 = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_ADD,string.format("AddUInt32(self,%d,%d)",index,value))
		end
		binLogLib.AddUInt32(mapLib.GetParentPtr(self.ptr), index, value)
	end,
	
	SubUInt32 = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SUB,string.format("SubUInt32(self,%d,%d)",index,value))
		end
		binLogLib.SubUInt32(mapLib.GetParentPtr(self.ptr), index, value)
	end,
	
	SetInt32 = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SET,string.format("SetInt32(self,%d,%d)",index,value))
		end
		binLogLib.SetInt32(mapLib.GetParentPtr(self.ptr), index, value)
	end,

	AddInt32 = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_ADD,string.format("AddInt32(self,%d,%d)",index,value))
		end
		binLogLib.AddInt32(mapLib.GetParentPtr(self.ptr), index, value)
	end,
	
	SubInt32 = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SUB,string.format("SubInt32(self,%d,%d)",index,value))
		end
		binLogLib.SubInt32(mapLib.GetParentPtr(self.ptr), index, value)
	end,
	
	SetDouble = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SET,string.format("SetDouble(self,%d,%d)",index,value))
		end
		binLogLib.SetDouble(mapLib.GetParentPtr(self.ptr), index, value)
	end,

	AddDouble = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_ADD,string.format("AddDouble(self,%d,%d)",index,value))
		end
		binLogLib.AddDouble(mapLib.GetParentPtr(self.ptr), index, value)
	end,
	
	SubDouble = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SUB,string.format("SubDouble(self,%d,%d)",index,value))
		end
		binLogLib.SubDouble(mapLib.GetParentPtr(self.ptr), index, value)
	end,
	
	SetFloat = function(self, index, value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SET,string.format("SetFloat(self,%d,%d)",index,value))
		end
		binLogLib.SetFloat(mapLib.GetParentPtr(self.ptr), index, value)
	end,
	
	SetStr = function(self, index,value)
		local b,name = self:GetPersistenceName()
		if(b)then
			self:SaveDataToHdd(name,OPT_SET,string.format("SetStr(self,%d,\"%s\")",index,value))
		end
		binLogLib.SetStr(mapLib.GetParentPtr(self.ptr), index,value)
	end,
		
	GetBit = function(self, index, offset)
		return binLogLib.GetBit(mapLib.GetParentPtr(self.ptr), index, offset)
	end,
	
	GetByte = function(self, index, offset)
		return binLogLib.GetByte(mapLib.GetParentPtr(self.ptr), index, offset)
	end,
	
	GetUInt16 = function(self, index, offset)
		return binLogLib.GetUInt16(mapLib.GetParentPtr(self.ptr), index, offset)
	end,
	
	GetUInt32 = function(self, index)
		return binLogLib.GetUInt32(mapLib.GetParentPtr(self.ptr), index)
	end,
	
	GetInt32 = function(self, index)
		return binLogLib.GetInt32(mapLib.GetParentPtr(self.ptr), index)
	end,
	
	GetDouble = function(self, index)
		return binLogLib.GetDouble(mapLib.GetParentPtr(self.ptr), index)
	end,
	
	GetFloat = function(self, index)
		return binLogLib.GetFloat(mapLib.GetParentPtr(self.ptr), index)
	end,
	
	GetStr = function(self, index)
		return binLogLib.GetStr(mapLib.GetParentPtr(self.ptr), index)
	end,
	
	--获取本地图id
	GetMapId = function(self)
		return mapLib.GetMapID(self.ptr)
	end,
	--获取副本状态
	GetMapState = function(self)
		return self:GetByte(MAP_INT_FIELD_STATE, 1)
	end,
	--获取地图general id
	GetMapGeneralId = function(self)
		return self:GetStr(MAP_STR_GENERAL_ID)
	end,
	-- 获得分线
	GetMapLineNo = function(self)
		return self:GetUInt32(MAP_INT_FIELD_LINE_NO)
	end,
	
	--设置副本状态
	SetMapState = function(self, state)
		local oldstate = self:GetMapState()
		self:SetByte(MAP_INT_FIELD_STATE, 1, state)
		self:OnSetState(oldstate, state)
	end,
	
	--获取预留状态
	GetReserveState = function(self)
		return self:GetByte(MAP_INT_FIELD_STATE, 3)
	end,
	
	--设置预留状态
	SetReserveState = function(self, state)
		self:SetByte(MAP_INT_FIELD_STATE, 3, state)
	end,
	-- 获取地图创建时间
	GetMapCreateTime = function(self)
		return self:GetUInt32(MAP_INT_FIELD_CREATE_TM)
	end,
	-- 设置地图创建时间
	SetMapCreateTime = function(self, val)
		if self:GetMapCreateTime() == 0 then
			self:SetUInt32(MAP_INT_FIELD_CREATE_TM, val)
		end		
	end,

	-- 获取地图实际开始行动时间
	GetMapStartTime = function(self)
		return self:GetUInt32(MAP_INT_FIELD_START_TM)
	end,
	-- 设置地图实际开始行动时间
	SetMapStartTime = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_START_TM, val)
	end,
	
	--获得已刷怪物数量
	GetRefreshCreatureCount = function(self)
		return self:GetUInt32(MAP_INT_FIELD_REFRESH_CREATURE_COUNT)
	end,
	
	
	--获取地图任务的结束时间
	GetMapQuestEndTime = function(self)
		return self:GetUInt32(MAP_INT_FIELD_QUEST_END_TM)
	end,
	
	--设置地图的任务结束时间
	SetMapQuestEndTime = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_QUEST_END_TM, val)
	end,
	
	
	--获取地图的结束时间
	GetMapEndTime = function(self)
		return self:GetUInt32(MAP_INT_FIELD_END_TM)
	end,
	
	--设置地图的结束时间
	SetMapEndTime = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_END_TM, val)
	end,
	
	AddTimeOutCallback = 
		function (self, funcName, timestamp)
			mapLib.AddTimeStampTimer(self.ptr, funcName, timestamp)
		end,

	RemoveTimeOutCallback = 
		function(self, funcName)
			mapLib.DelTimeStampTimer(self.ptr, funcName)
		end,
	
	SetMapReward = 
		function(self, data)
			self:SetStr(MAP_STR_REWARD, data)
		end,
	
	-- 获得单人的复活时间
	GetSingleRespawnTime = 
		function(self, player)
			return self.player_auto_respan
		end,
	
	--获取击杀怪物数量
	GetMapKillNum = function(self)
		return self:GetUInt32(MAP_INT_FIELD_KILL_NUM)
	end,
	--设置击杀怪物数量
	SetMapKillNum = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_KILL_NUM, val)
	end,
	-- 获取地图预留值1
	GetMapReserveValue1 = function(self)
		return self:GetUInt32(MAP_INT_FIELD_RESERVE1)
	end,
	-- 设置地图预留值1
	SetMapReserveValue1 = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_RESERVE1, val)
	end,
	-- 获取地图预留值2
	GetMapReserveValue2 = function(self)
		return self:GetUInt32(MAP_INT_FIELD_RESERVE2)
	end,
	-- 设置地图预留值2
	SetMapReserveValue2 = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_RESERVE2, val)
	end,
	-- 获取地图预留值3
	GetMapReserveValue3 = function(self)
		return self:GetUInt32(MAP_INT_FIELD_RESERVE3)
	end,
	-- 设置地图预留值3
	SetMapReserveValue3 = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_RESERVE3, val)
	end,
	-- 获取地图预留值4
	GetMapReserveValue4 = function(self)
		return self:GetUInt32(MAP_INT_FIELD_RESERVE4)
	end,
	-- 设置地图预留值4
	SetMapReserveValue4 = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_RESERVE4, val)
	end,
	
	--设置副本类型
	SetInstanceType = function(self, val)
		self:SetUInt32(MAP_INT_FIELD_INSTANCE_TYPE, val)
	end,
	--获取副本类型
	GetInstanceType = function(self)
		return self:GetUInt32(MAP_INT_FIELD_INSTANCE_TYPE)
	end,

	-- 获取副本instanceId
	GetInstanceId = function(self)
		return self:GetUInt32(MAP_INT_FIELD_INSTANCE_ID)
	end,
	
	--脚本初始化事件，在每次初始化地图或者@脚本的时候触发
	OnInitScript = 
		function(self)
			self:SetByte(MAP_INT_FIELD_STATE, 2, self.player_auto_respan)
			if(self:GetMapState() == 0)then
				self:SetMapState(self.STATE_START)
				--设置地图创建时间
				self:SetMapCreateTime(os.time())
				-- 默认开始时间和创建时间一致, 有倒计时显示的除外
				self:SetMapStartTime(os.time())
			end
			self:OnInitGameObject()
		end,
	
	--开始移动前需要处理的逻辑
	OnMoveTo = 
		function(self, player)
			return true
		end,
	
	--开始攻击前需要处理的逻辑
	OnStartAttack =
		function(self, player)
			return true
		end,
	--跳跃前需要处理的逻辑
	OnStartJump = 
		function(self, playerInfo)
			return true
		end,
	
	-- 当玩家移动后
	OnPlayerAfterMove =
		function(self, player)
		end,
		
	--当客户端发来进入下一状态的指令
	OnTryToNextState = 
		function(self, player_ptr, level, param)
		end,
	-- 传送需要清除的buff
	NeedClearBuff = {},
	
	--玩家升级触发
	OnPlayerUpgrage = 
		function(self, player_ptr, prev, lv)
			if prev <= config.new_player_protected_level and config.new_player_protected_level < lv then
				unitLib.RemoveBuff(player_ptr, BUFF_NEW_PLAYER_PROTECTED)
			end
		end,
	--进入副本前的判断
	DoInstancEnter = function(self, player, cur_mapid, to_mapid)
	
		playerLib.Teleport(player,to_mapid, tb_map_info[to_mapid].into_point[1], tb_map_info[to_mapid].into_point[2])
		return true
	end,
	
	
	----------------------------------------------随机奖励---------------------------------------------
	-- dropIdTable : {dropId1, dropId2}
	-- itemTable: {{ItemId, count}}
	RandomReward = function(self, player, dropIdTable, itemTable, moneyOperType, itemOperType)
		dropIdTable = dropIdTable or {}
		itemTable = itemTable or {}
		moneyOperType = moneyOperType or MONEY_CHANGE_SELECT_LOOT
		itemOperType  = itemOperType  or LOG_ITEM_OPER_TYPE_LOOT
	
		local dict = {}
		
		-- 把里面的值拷贝过来
		for _, itemInfo in pairs(itemTable) do
			local itemId = itemInfo[ 1 ]
			local count  = itemInfo[ 2 ]
			if dict[itemId] == nil then
				dict[itemId] = 0
			end
			dict[itemId] = dict[itemId] + count
		end
		
		-- 获得奖励
		DoRandomDropTable(dropIdTable, dict)
		
		PlayerAddRewards(player, dict, moneyOperType, itemOperType)
			
		-- 压成字符串
		local reward = {}
		for itemId, count in pairs(dict) do
			table.insert(reward, itemId..":"..count)
		end
		local data = string.join(",", reward)
		
		return data
	end,
	
	--当玩家加入时触发
	OnJoinPlayer =
		function(self,player)
			local playerInfo = UnitInfo:new{ptr = player}
			
		end,

	--当玩家加入后触发
	OnAfterJoinPlayer =
		function(self,player)
			local playerInfo = UnitInfo:new{ptr = player}
			-- TODO: (这个得另外找个)如果等级是新手保护等级, 则加个BUFF
			if playerInfo:GetLevel() <= config.new_player_protected_level then
				SystemAddBuff(player, BUFF_NEW_PLAYER_PROTECTED, MAX_BUFF_DURATION)
			end
			-- 如果不能骑乘则下骑
			local mapid = self:GetMapId()
			if tb_map[mapid].is_ride == 0 then
				playerInfo:MountUnride()
			end
		end,
	
	--属性重算的时候是否删除buff
	CanRemoveBuff = function(self, player, buff_id)
		local buffs = config.can_remove_buff
		local map_id = unitLib.GetMapID(player)
		for _, buff in ipairs(buffs) do
			if(buff_id == buff)then
				return true
			end
		end
		return false
	end,

	--当玩家离开时触发
	OnLeavePlayer = function(self, player, is_offline)
	
	end,
	
	--地图需要清空人时要做的事
	IsNeedTeleportWhileMapClear = function(self, player)
		return 1
	end,
	--获得怪物的基础经验 			param2 怪物   param3 怪物的所有者
	DoGetCreatureBaseExp = function(self, creature, owner)
		-- 跨服的怪物没经验
		local isPkServer = globalGameConfig:IsPKServer()
		if isPkServer then
			return 0
		end
		
		local xp = 0
		local creatureInfo = UnitInfo:new{ptr = creature}
		local creatur_entry = creatureInfo:GetEntry()
		xp = tb_creature_template[creatur_entry].exp
		
		return xp
	end,	
	--玩家发送CMSG_INSTANCE_EXIT协议退出副本前的回调，预防发包
	DoPlayerExitInstance = 
		function(self, player)
			local mapid = self:GetMapId()
			if tb_map[mapid].type == MAP_TYPE_MAIN then
				return 0
			end
			return 1	--返回1的话为正常退出，返回0则不让退出
		end,
	--玩家设置pk模式前的回调 ，预防发包
	DoSetAttackModeCallback = 
		function(self, player, mode)
			local playerInfo = UnitInfo:new{ptr = player}
			if(playerInfo:GetLevel() < XINSHOUBAOHU_LEVEL and mode ~= ATTACK_MODE_PEACE)then
				return 0		--新手保护不允许修改攻击模式为非和平模式
			end
			return 1 
		end,
	
	--是否友好（友好1，不友好0）
	DoIsFriendly = 
		function(self, killer_ptr, target_ptr)
			
			if self:GetMapState() ~= self.STATE_START then
				return 1
			end
			
			local killerInfo = UnitInfo:new{ptr = killer_ptr}
			local targetInfo = UnitInfo:new{ptr = target_ptr}

			-- 先判断
			local ret = false
			if killerInfo:GetTypeID() == TYPEID_PLAYER then
				ret = targetInfo:GetTypeID() ~= TYPEID_UNIT or targetInfo:GetNpcFlags() ~= 0
			elseif killerInfo:GetTypeID() == TYPEID_UNIT then
				ret = targetInfo:GetTypeID() ~= TYPEID_PLAYER
			end

			if ret then
				return 1
			end

			return 0
		end,
	
	--复活处理
	DoRespawn =
		function(self,player,cur_map_id,respwan_map,respwan_type,respwan_x,respwan_y)
			--常规复活
			if(respwan_type == RESURRECTION_SPAWNPOINT or respwan_type == RESURRPCTION_TIME)then
				--暂时只处理回城复活，其他复活方式return掉
				unitLib.Respawn(player,respwan_type,100)
				playerLib.Teleport(player,respwan_map,respwan_x,respwan_y)	
			else
				return
			end
			
		end,

	--复活后干点啥
	DoAfterRespawn = 
		function(self, unit_ptr)
		end,
		
	--当玩家被玩家杀掉时触发
	OnPlayerKilled = function(self, player, killer)
		local playerInfo = UnitInfo:new{ptr = killer}
		--增加击杀玩家次数
		--playerInfo:AddKillPlayerCount(1)
		return 0
	end,
	
	-- 玩家受到实际伤害(负数表示加血)
	OnPlayerHurt = function(self, killer, player, damage)
		return 0
	end,
	
	-- 当玩家死亡(在OnPlayerKilled之后触发)
	OnPlayerDeath = function(self, player)
		return 0
	end,

	--计算加成 地图光环
	DoMapBuffBonus	=
		function(self,unit)

		end,	

	OnSetState =			--当副本状态发生变化时间触发
		function(self,fromstate,tostate)
			
		end,
	
	OnEnterArea =
		function(self,trigger,area_name,x,y)
			return false	--返回false则删除该区域通知
		end,
	OnMapBegin = 			--当副本计时开始时触发
		function(self)
			return true
		end,
	--使用游戏对象之前
	OnBeforeUseGameObject = 
		function(self, user, go, go_entryid, posX, posY)
			
			return 1	--返回1的话就继续使用游戏对象，返回0的话就不使用
		end,
	--使用游戏对象
	OnUseGameObject =
		function(self, user,go,go_entryid, posX, posY)
		
			return 1	--返回1的话成功使用游戏对象，返回0的话使用不成功
		end,
	
	-- 使用需要读进度条广播的游戏对象
	OnUseBroadCastGameObject =
		function(self, playerInfo, gameObjectInfo)
		end,
		
	
	--镜像相关
	--[[
		name : 镜像名字
		gender : 性别
		level : 镜像等级
		attrs : 镜像属性 {{属性id, 属性值}, ..., {}}
		weapon	: 武器
		avatar : 时装
		divine : 神兵
		spells: 技能数据 {{技能ID,释放概率（万分比）,这个技能动作时间,技能组}, ..., {}}
	--]]
	GetImageInfo = function(self, name, gender, level, attrs, weapon, avatar, divine, spells, force)
		local image = {}
				
		-- 基础数据
		image.name = name
		image.gender = gender or randInt(1, 2)
		image.level = level
		image.id = 6000 + image.gender
		
		-- 战斗属性
		image.attrs = {}
		for _, attr in pairs(attrs) do
			table.insert(image.attrs, {attr[ 1 ], attr[ 2 ]})
		end
		
		--模型数据
		image.weapon = weapon
		image.avatar = avatar
		image.divine = divine
		
		--技能数据
		image.spells = {}
		for _, spell in pairs(spells) do
			table.insert(image.spells, {spell[ 1 ], spell[ 2 ], spell[ 3 ], spell[ 4 ]})
		end
		
		-- 战力
		image.force = force
	
		return image
	end,

	--[[
		image : 镜像
		x : 坐标x
		y : 坐标y
		ai_name : 脚本名称
		faction : 帮派
		reborn_time : 重生时间
		plat_info : 平台信息
	--]]
	AddImageBody = function(self, image, x, y, ai_name, faction, reborn_time, plat_info)
		if image == nil then
			outFmtError('AddImageBody map_id = %u can not find image', self:GetMapID())
			return nil
		end
		
		if not faction  then
			faction = 3
		end

		local creature = mapLib.AddCreature(self.ptr, {templateid = image.id, pos_x = x ,pos_y = y, faction = faction, move_type = WAYFINDING_ATTACK_MOTION_TYPE, active_grid = 1, ai_name = ai_name, alias_name = '', reborn_time = reborn_time, npc_flag = 3})
		if creature == nil then
			return creature
		end	
		
		--显示相关
		local lua_creature = UnitInfo:new{ptr = creature}
		lua_creature:SetName(image.name)
		lua_creature:SetLevel(image.level)
		lua_creature:SetGender(image.gender)
		lua_creature:SetWeapon(image.weapon)
		lua_creature:SetAvatar(image.avatar)
		lua_creature:SetDivine(image.divine)
		lua_creature:SetForce(image.force)
		
		--属性相关
		self:SetCreaturePro(creature, image.attrs, false)

		-- 技能
		self:SetSpells(creature, image.spells)

		return creature, pet
	end,

	-- 打断
	OnDisrupt =
		function(self, killer)
			
		end,
	
	-- 初始化采集物
	OnInitGameObject = 
		function(self)
			local time = os.time()
			local startTime = self:GetMapCreateTime()
			if time - startTime > 2 then
				return
			end
			
			local mapid = self:GetMapId()
			if tb_map_gameobject[mapid] then
				local objects = tb_map_gameobject[mapid].gameobjects
				for _, id in pairs(objects) do
					local config = tb_map_gameobject_detail[id]
					if config then
						local gameObject = mapLib.AddGameObject(self.ptr, config.entry, config.position[ 1 ], config.position[ 2 ], GO_GEAR_STATUS_END)
						unitLib.SetOrientation(gameObject, config.orient / 100)
					end
				end
			end
		end,

 	--按怪物等级初始化怪物信息
	InitCreatureInfo = function(self, creature_ptr, bRecal, mul)
		mul = mul or 1
		local creature = UnitInfo:new{ptr = creature_ptr}	
		local entry = creature:GetEntry()
		local config = tb_creature_template[entry]
		if config then
			--给怪物添加基本信息
			creature:SetNpcFlags(config.npcflag)
			if creature:GetLevel() == 0 then
				creature:SetLevel(config.level)
			end
			creature:SetName(config.name)

			--给怪物添加技能
			self:SetSpells(creature_ptr, config.spell)

--			creature:SetBaseAttrs(config.pro, bRecal, mul)
			self:SetCreaturePro(creature, config.pro, bRecal, mul)
		else
			outFmtError("no entry[%d] for creature", entry)
		end
	end,
	
	-- 设置属性
	SetCreaturePro = function(self, creature, pros, bRecal, mul)
		creature:SetBaseAttrs(pros, bRecal, mul)
	end,
	
	-- 设置技能
	SetSpells = function (self, creature_ptr, spells)
		for i = 1, #spells do
			local spellInfo = spells[ i ]
			local skillConfig = tb_skill_base[spellInfo[ 1 ]]
			if skillConfig then
				local index = skillConfig.uplevel_id[ 1 ]
				local upgradeConfig = tb_skill_uplevel[index]
				local dist = upgradeConfig.distance
				local groupCD = skillConfig.groupCD
				local singleCD = skillConfig.singleCD
				local targetType = skillConfig.type
				creatureLib.MonsterAddSpell(creature_ptr, spellInfo[ 1 ], spellInfo[ 2 ], spellInfo[ 3 ], spellInfo[ 4 ], dist, groupCD, singleCD, targetType)
			end
		end
	end,
	
	-- 进行测试
	OnTest = function(self, player, args)
		local params = string.split(args, ' ')
		local playerInfo = UnitInfo:new{ptr = player}
		local count = 1
		if params[ 2 ] then
			count = tonumber(params[ 2 ])
		end
		for i = 1, count do
			AddLootGameObject(self.ptr, player, playerInfo:GetPlayerGuid(), 50006, 1, 1, 40, 20, 0)
		end
	end,

	-- 判断是否需要发送到场景服
	OnCheckIfSendToAppdAfterLootSelect = function (self, player, entry, count)
		return 1
	end,
	
	-- 判断是否够钱花元宝复活
	OnCheckIfCanCostRespawn = function (self, player)
		if unitInfo:IsAlive() then
			return
		end
		-- 非野外地图不能使用复活
		local mapid = self:GetMapId()
		if tb_map[mapid].type ~= MAP_TYPE_FIELD then
			return
		end
		-- 通知是否可以复活
		playerLib.SendToAppdDoSomething(player, SCENED_APPD_GOLD_RESPAWN, self.COST_GOLD)
	end,
	
	-- 花元宝复活
	OnCostRespawn = function (self, unitInfo)
		if not unitInfo:IsAlive() then
			-- 非野外地图不能使用复活
			local mapid = self:GetMapId()
			if tb_map[mapid].type ~= MAP_TYPE_FIELD then
				return
			end
			
			unitInfo:SetUseRespawnMapId(mapid)
			unitLib.Respawn(player, RESURRPCTION_HUANHUNDAN, 100)	--原地复活
		end
	end,
	
	OnRandomRespawn = function (self, unitInfo)

	end,
}
