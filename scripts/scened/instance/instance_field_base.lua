InstanceFieldBase = class("InstanceFieldBase", Instance_base)

InstanceFieldBase.Name = "InstanceFieldBase"
InstanceFieldBase.player_auto_respan = 10

function InstanceFieldBase:ctor(  )
	
end

--初始化脚本函数
function InstanceFieldBase:OnInitScript(  )
	Instance_base.OnInitScript(self) --调用基类
end

function InstanceFieldBase:DoIsFriendly(killer_ptr, target_ptr)
	local killerInfo = UnitInfo:new{ptr = killer_ptr}
	local targetInfo = UnitInfo:new{ptr = target_ptr}

	-- 先判断
	local ret = true
	if killerInfo:GetTypeID() == TYPEID_PLAYER then
		if targetInfo:GetTypeID() == TYPEID_PLAYER then
			local killerMode = killerInfo:GetBattleMode()
			local targetMode = targetInfo:GetBattleMode()
			
			local mask = tb_battle_mode[killerMode+1].mask
			local battleMask = targetInfo:generateBattleMask(killerInfo)
	
			ret = bit.band(mask, battleMask) == 0
			
			-- 如果都是友好的 且 我是自卫反击模式
			if ret then
				if killerMode == SELF_DEFENSE_MODE and killerInfo:GetSelfProtectedUIntGuid() == targetInfo:GetIntGuid() and targetMode ~= PEACE_MODE and targetMode ~= SELF_DEFENSE_MODE then
					ret = false
				end
			end
		elseif targetInfo:GetTypeID() == TYPEID_UNIT then
			ret = false
		end
	elseif killerInfo:GetTypeID() == TYPEID_UNIT then
		ret = targetInfo:GetTypeID() ~= TYPEID_PLAYER
	end
	
	if ret then
		return 1
	end
	return 0
end

--当玩家死亡后触发()
function InstanceFieldBase:OnPlayerDeath(player)
	local playerInfo = UnitInfo:new{ptr = player}
	
	-- 发送野外死亡回城倒计时
	playerInfo:call_field_death_cooldown(self.player_auto_respan)
end

-- 回程
function InstanceFieldBase:DoAfterRespawn(unit_ptr)
	local unitInfo = UnitInfo:new{ptr = unit_ptr}
	if unitInfo:GetTypeID() == TYPEID_PLAYER then
		mapLib.ExitInstance(self.ptr, unit_ptr)
	end
end

return InstanceFieldBase