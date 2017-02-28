-- 3v3 匹配
function PlayerInfo:Handle_Kuafu_3v3_Match(pkt)
	
	local config = tb_kuafu3v3_base[1]
	
	--local lev = self:GetLevel()
	--outFmtDebug("Kuafu_3v3_----------------%d",lev)
	if self:GetLevel() < config.limlev then
		self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_NO_LEV,config.limlev)
		return
	end
	
	if self:GetForce() < config.limforce then
		self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_NO_FORCE,config.limforce)
		return
	end
	
	local curtime = os.time()
	local intime = false
	for _,v in ipairs(config.activetime) do
		local t1 = GetTodayHMSTimestamp(v[1],v[2],0)
		local t2 = GetTodayHMSTimestamp(v[3],v[4],0)
		if curtime >= t1 and curtime <= t2 then
			intime = true
			break
		end
	end
	if not intime then
		self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_NO_OPEN)
		return
	end
	
	
	local instMgr = self:getInstanceMgr()
	local curNum = instMgr:get3v3EnterTimes()
	local buyNum = instMgr:get3v3BuyTimes()
	
	outFmtDebug("--------curNum:%d,buyNum:%d,maxnum:%d,buyNum:%d",curNum,buyNum,config.daytimes,config.daybuytimes)
	
	if curNum >= (buyNum + config.daytimes) then
		
		if buyNum < config.daybuytimes then
			self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_NO_TIME_BUY)
		else
			self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_NO_TIME)
		end
	
		return
	end
	
	if app:IsInKuafuTypeMatching(self:GetGuid()) then
		self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_IN_MATCH)
		return
	end
	
	local tf = self:OnWorld3v3Match()
	
	if tf then
		self:call_kuafu_match_start(KUAFU_TYPE_FENGLIUZHEN)
		--instMgr:add3v3EnterTimes()
	end
	
end

function PlayerInfo:Gm3v3EnterTimes(num)
	outFmtDebug("Gm3v3EnterTimes %d",num)
	local instMgr = self:getInstanceMgr()	
	instMgr:set3v3EnterTimes(num)
end
--3v3购买次数
function PlayerInfo:Handle_Kuafu_3v3_BuyTimes(pkt)
	outFmtDebug("Handle_Kuafu_3v3_BuyTimes")
	local num = pkt.num
	
	if num < 0 then 
		return
	end
	
	local config = tb_kuafu3v3_base[1]
	
	local instMgr = self:getInstanceMgr()
	local buyNum = instMgr:get3v3BuyTimes()
	
	if (num + buyNum) > config.daybuytimes then
		self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_MAX_BUY)
		return
	end
	
	if not self:costMoneys(MONEY_CHANGE_WELF_ACTIVE_GETBACK, config.daybuycost,num) then
		self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_NO_MONEY)
		return
	end
	
	instMgr:add3v3BuyTimes(num)
	
end
-- 3v3 每日活跃奖励
function PlayerInfo:Handle_Kuafu_3v3Day_Reward(pkt)
	outFmtDebug("Handle_Kuafu_3v3Day_Reward")
	local id = pkt.id
	local config = tb_kuafu3v3_day_reward[id]
	
	if not config then
		return
	end
	
	outFmtDebug("Handle_Kuafu_3v3Day_Reward2222222222")
	
	local instMgr = self:getInstanceMgr()
	if instMgr:get3v3DayReward(id) == 1 then
		self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_HAS_DAY_REWARD)
		return
	end
	
	local curNum = instMgr:get3v3EnterTimes()
	if curNum < config.num then
		self:CallOptResult(OPRATE_TYPE_ATHLETICS, ATHLETICS_OPERATE_NO_DAY_REWARD,config.num)
		return
	end
	
	instMgr:set3v3DayReward(id)
	
	self:AppdAddItems(config.reward,MONEY_CHANGE_3V3KUAFU,LOG_ITEM_OPER_TYPE_3V3_KUAFU)
	
end
--3v3排行榜
function PlayerInfo:Handle_Kuafu_3v3_RankList(pkt)
	local ranklist = app.kuafu_rank
	
	local str = ""
	for i=1,10  do
		if ranklist[i] then
			local itemStr = ""
			for _,v in ipairs(ranklist[i]) do
				itemStr = itemStr .. v .. ";"
			end
			str = str .. itemStr .. "\n"
		end
	end
	
	self:call_kuafu_3v3_ranlist(str)
	
end

--3v3自己的名次
function PlayerInfo:Handle_Kuafu_3v3_My_Rank(pkt)
	local ranklist = app.kuafu_rank
	
	local name = self:GetName()
	local rank = 0
	for i,v in ipairs(ranklist) do
		if v[1] == name then
			rank = i
			break
		end
	end
	
	self:call_kuafu_3v3_myrank(rank)
	
end

function PlayerInfo:Handle_Kuafu_3v3_Match_Oper(pkt)
	local oper = pkt.oper
	if oper ~= 0 and oper ~= 1 then
		return
	end
	self:OnPrepareMatch(oper)
end

function PlayerInfo:Handle_Kuafu_3v3_Cancel_Match(pkt)
	local type = pkt.type
	if type == KUAFU_TYPE_FENGLIUZHEN then
		self:OnCancelWorld3v3MatchBeforeOffline()
	elseif type == KUAFU_TYPE_XIANFU then
		self:OnCancelWorldXianfuMatchBeforeOffline()
	end
end



function PlayerInfo:Handle_Kuafu_Xianfu_Match(pkt)
	local indx = pkt.indx
	-- index是否正确
	if indx < 1 or indx > #tb_kuafu_xianfu_condition then
		return
	end
	
	-- 等级是否满足
	local config = tb_kuafu_xianfu_condition[indx]
	local levelRange = config.levelrange
	local level = self:GetLevel()
	if not (levelRange[ 1 ] <= level and level <= levelRange[ 2 ]) then
		return
	end
	
	-- 判断进入次数
	local instMgr = self:getInstanceMgr()
	if not instMgr:CheckXianfuDayTimes() then
		return
	end
	
	-- 判断仙府进入券是否足够
	if not self:useMulItem(config.ticket) then
		outFmtDebug("SDFDSFDSFDSF")
		return
	end
	
	local rt = self:OnWorldXianfuMatch(indx)
	if rt then
		-- 开始匹配
		self:call_kuafu_match_start(KUAFU_TYPE_XIANFU)
	end
end

function PlayerInfo:Handle_Buy_Xianfu_Item(pkt)
	local type = pkt.type
	local indx = pkt.indx
	local count = pkt.count
	
	-- type是否正确
	if type < 1 or type > #tb_kuafu_xianfu_condition then
		return
	end
	
	self:OnBuyTicket(type, indx, count)
end