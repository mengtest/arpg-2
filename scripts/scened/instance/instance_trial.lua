InstanceTrial = class("InstanceTrial", InstanceInstBase)

InstanceTrial.Name = "InstanceTrial"
InstanceTrial.exit_time = 10
InstanceTrial.broadcast_nogrid = 1

function InstanceTrial:ctor(  )
	
end

--初始化脚本函数
function InstanceTrial:OnInitScript(  )
	InstanceInstBase.OnInitScript(self) --调用基类
	
	if self:GetMapQuestEndTime() > 0 then
		return
	end
	
	self:parseGeneralId()

	-- 加结束时间
	local timestamp = os.time() + 180
	self:SetMapEndTime(timestamp)
end


function InstanceTrial:parseGeneralId()
	local generalId = self:GetMapGeneralId()
	local params = string.split(generalId, '#')
	self:SetUInt32(TRIAL_INSTANCE_FIELD_SECTION_ID, tonumber(params[ 2 ]))
end


function InstanceTrial:getSectionId()
	return self:GetUInt32(TRIAL_INSTANCE_FIELD_SECTION_ID)
end


--当副本状态发生变化时间触发
function InstanceTrial:OnSetState(fromstate,tostate)
	if tostate == self.STATE_FINISH then
		--10s后结束副本
		local timestamp = os.time() + InstanceTrial.exit_time
		self:AddTimeOutCallback(self.Leave_Callback, timestamp)
		self:SetMapEndTime(timestamp)
	end
end

-- 判断是否能退出副本
function InstanceTrial:DoPlayerExitInstance(player)
	return 0
end

--玩家加入地图
function InstanceTrial:OnJoinPlayer(player)
	InstanceInstBase.OnJoinPlayer(self, player)
	local playerInfo = UnitInfo:new{ptr = player}
	if not playerInfo:IsAlive() then
		unitLib.Respawn(player, RESURRECTION_SPAWNPOINT, 100)
	end

	-- 刷新怪物
	self:OnRefreshMonsterInit(player)
end

function InstanceTrial:hasNextMonster()
	local seciontId = self:getSectionId()
	local count = #tb_risk_data[seciontId].monsters
	return self:getRefreshCount() < count
end

function InstanceTrial:nextMonsterInfoIndx()
	local cursor = self:getRefreshCount()
	self:oneRefreshed()
	return self:GetByte(TRIAL_INSTANCE_FIELD_ORDER, cursor)
end

function InstanceTrial:oneRefreshed()
	self:AddUInt32(TRIAL_INSTANCE_FIELD_CURSOR, 1)
end

function InstanceTrial:getRefreshCount()
	return self:GetUInt32(TRIAL_INSTANCE_FIELD_CURSOR)
end

function InstanceTrial:oneRefreshed()
	self:AddUInt32(TRIAL_INSTANCE_FIELD_CURSOR, 1)
end

function InstanceTrial:isSettedOrder()
	return self:GetByte(TRIAL_INSTANCE_FIELD_ORDER, 0) > 0
end

function InstanceTrial:onSetOrder(player_ptr)
	if not self:isSettedOrder() then
		local seciontId = self:getSectionId()
		local count = #tb_risk_data[seciontId].monsters
		local order = GetRandomIndexTable(count, count)
		for i = 1, #order do
			self:SetByte(TRIAL_INSTANCE_FIELD_ORDER, i-1, order[ i ])
		end
		
		if tb_risk_data[seciontId].is_boss_section == 0 then
			local playerInfo = UnitInfo:new {ptr = player_ptr}
			playerInfo:SetRiskMonsterCount(tb_risk_data[seciontId].count)
		end
	end
end

--刷怪
function InstanceTrial:OnRefreshMonsterInit(player)
	self:onSetOrder(player)
	self:refresh()
end

function InstanceTrial:refresh()
	local curr = mapLib.GetCreatureEntryCount(self.ptr)
	local offs = tb_risk_base[ 1 ].pos_offset
	
	for i = curr + 1, 2 do
		if self:hasNextMonster() then
			local indx = self:nextMonsterInfoIndx()
			local seciontId = self:getSectionId()
			local monsters = tb_risk_data[seciontId].monsters
			local info = monsters[indx]
			
			local cx = info[ 3 ]
			local cy = info[ 4 ]
			
			local entry = info[ 1 ]
			local num = info[ 2 ]

			local width = offs * 2 + 1
			local grids = width * width
			
			-- 左上角点的坐标
			local lx = cx - offs
			local ly = cy - offs
			
			
			local idTable = GetRandomIndexTable(grids, num)
			for _, indx in pairs(idTable) do
				local id = indx - 1
				local offx = id % width
				local offy = id / width
				local bornX = lx + offx
				local bornY = ly + offy
				
				local creature = mapLib.AddCreature(self.ptr, {
					templateid = entry, x = bornX, y = bornY,
					active_grid = true, ainame = tb_creature_template[entry].ainame, npcflag = {}
				})
			end	
		end
	end
end

function InstanceTrial:oneMonsterKilled(player_ptr)
	local playerInfo = UnitInfo:new {ptr = player_ptr}
	playerInfo:AddRiskMonsterKilledCount()
	-- 判断是否需要刷下一波
	self:refresh()
end

function InstanceTrial:onBossLoot(player_ptr, dict)
	local playerInfo = UnitInfo:new {ptr = player_ptr}
	local seciontId = self:getSectionId()
	playerInfo:passSection(seciontId)

	PlayerAddRewards(player_ptr, dict, MONEY_CHANGE_TRIAL_INSTANCE_REWARD, LOG_ITEM_OPER_TYPE_TRIAL_INSTANCE_REWARD)

	-- 扫荡的结果发送
	local list = Change_To_Item_Reward_Info(dict, true)
	playerInfo:call_sweep_instance_reward (INSTANCE_SUB_TYPE_TRIAL, 0, 0, 0, list)
	
	-- 设置完成
	self:SetMapState(self.STATE_FINISH)
end

--当玩家加入后触发
function InstanceTrial:OnAfterJoinPlayer(player)
	InstanceInstBase.OnAfterJoinPlayer(self, player)
end

-- 获得单人的复活时间
function InstanceTrial:GetSingleRespawnTime(player)
	return 5
end

--当玩家离开时触发
function InstanceTrial:OnLeavePlayer( player, is_offline)
	if not is_offline then
		self:RemoveTimeOutCallback(self.Leave_Callback)
	end
end

--当玩家死亡后触发()
function InstanceTrial:OnPlayerDeath(player)
	
end

-- 当进度更新时调用
function InstanceTrial:AfterProcessUpdate(player)
	
end

-------------------------------- BOSS
AI_trialboss = class("AI_trialboss", AI_Base)
AI_trialboss.ainame = "AI_trialboss"
--[[
--死亡
function AI_trialboss:JustDied( map_ptr,owner,killer_ptr )	

	AI_Base.JustDied(self,map_ptr,owner,killer_ptr)
	local mapid = mapLib.GetMapID(map_ptr)
	local instanceInfo = Select_Instance_Script(mapid):new{ptr = map_ptr}
	
	--instanceInfo:onBossDied(killer_ptr)
	
	return 0
end
--]]

--生成战利品
function AI_trialboss:LootAllot(owner, player, killer, drop_rate_multiples, boss_type, fcm)
	local mapid = mapLib.GetMapID(map_ptr)
	local map_ptr = unitLib.GetMap(owner)
	local instanceInfo = InstanceKuafuXianfu:new{ptr = map_ptr}
	
	local entry = binLogLib.GetUInt16(owner, UNIT_FIELD_UINT16_0, 0)
	local info = tb_creature_template[entry]
	local drop_ids = info.reward_id
	local dict = {}
	if #drop_ids > 0 then
		for i = 1, #drop_ids do
			local dropId = drop_ids[i]
			DoRandomDrop(dropId, dict)
		end	
	end
	
	instanceInfo:onBossLoot(player, dict)
end


----------------------------- 小怪----------------------------
AI_trial = class("AI_trial", AI_Base)
AI_trial.ainame = "AI_trial"
--死亡
function AI_trial:JustDied( map_ptr,owner,killer_ptr )	
	
	AI_Base.JustDied(self,map_ptr,owner,killer_ptr)
	
	local mapid = mapLib.GetMapID(map_ptr)
	local instanceInfo = Select_Instance_Script(mapid):new{ptr = map_ptr}
	instanceInfo:oneMonsterKilled(killer_ptr)
	
	return 0
end

--生成战利品
function AI_trial:LootAllot(owner, player, killer, drop_rate_multiples, boss_type, fcm)
	local mapid = mapLib.GetMapID(map_ptr)
	local map_ptr = unitLib.GetMap(owner)
	local instanceInfo = InstanceKuafuXianfu:new{ptr = map_ptr}
	
	local entry = binLogLib.GetUInt16(owner, UNIT_FIELD_UINT16_0, 0)
	local info = tb_creature_template[entry]
	local drop_ids = info.reward_id
	local dict = {}
	if #drop_ids > 0 then
		for i = 1, #drop_ids do
			local dropId = drop_ids[i]
			DoRandomDrop(dropId, dict)
		end	
	end
	
	PlayerAddRewards(player, dict, MONEY_CHANGE_TRIAL_INSTANCE_REWARD, LOG_ITEM_OPER_TYPE_TRIAL_INSTANCE_REWARD)
end

return InstanceTrial