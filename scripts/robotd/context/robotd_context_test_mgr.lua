local ProtocolsFunc = {
	PlayerInfo.GmAddItem,
	PlayerInfo.Send_Bag_Exchange_Pos,
	PlayerInfo.Send_Bag_Destroy,
	PlayerInfo.Send_Use_Item,
	PlayerInfo.Send_Mall_Buy,
	PlayerInfo.Send_Strength,
	PlayerInfo.Send_Create_Faction,
	PlayerInfo.Send_Faction_Upgrade,
	PlayerInfo.Send_Faction_Join,
	PlayerInfo.Send_Raise_Base_Spell,
	PlayerInfo.Send_Upgrade_Anger_Spell,
	PlayerInfo.Send_Raise_Mount,
	PlayerInfo.Send_Upgrade_Mount,
	PlayerInfo.Send_Upgrade_Mount_One_Step,
	PlayerInfo.Send_Illusion_Mount_Active,
	PlayerInfo.Send_Illusion_Mount,
	PlayerInfo.Send_Gem,
	PlayerInfo.Send_Divine_Active,
	PlayerInfo.Send_Divine_Uplev,
	PlayerInfo.Send_Divine_Switch,
	PlayerInfo.Send_Sweep_Vip_Instance,
	PlayerInfo.Send_Hang_Up,
	PlayerInfo.Send_Hang_Up_Setting,
	PlayerInfo.Send_Sweep_Trial_Instance,
	PlayerInfo.Send_Reset_Trial_Instance,
	PlayerInfo.Send_Social_Add_Friend,
	PlayerInfo.Send_Social_Sureadd_Friend,
	PlayerInfo.Send_Social_Gift_Friend,
	PlayerInfo.Send_Social_Recommend_Friend,
	PlayerInfo.Send_Social_Revenge_Enemy,
	PlayerInfo.Send_Social_Del_Friend,
	PlayerInfo.Send_Social_Clear_Apply,
	PlayerInfo.Send_Social_Add_Friend_Byname,
	PlayerInfo.Send_Chat_By_Channel,
	PlayerInfo.Send_Msg_Decline,
	PlayerInfo.Send_Block_Chat,
	PlayerInfo.Send_Faction_Getlist,
	PlayerInfo.Send_Faction_Manager,
	PlayerInfo.Send_Faction_Member_Operate,
	PlayerInfo.Send_Faction_Fast_Join,
	PlayerInfo.Send_Read_Mail,
	PlayerInfo.Send_Pick_Mail,
	PlayerInfo.Send_Remove_Mail,
	PlayerInfo.Send_Pick_Mail_One_Step,
	PlayerInfo.Send_Remove_Mail_One_Step,
	PlayerInfo.Send_Cancel_Block_Chat,
	PlayerInfo.Send_World_Boss_Enroll,
	PlayerInfo.Send_Rank_Add_Like,
	PlayerInfo.Send_Res_Instance_Sweep,
	PlayerInfo.Send_Get_Activity_Reward,
	PlayerInfo.Send_Get_Achieve_Reward,
	PlayerInfo.Send_Get_Achieve_All_Reward,
	PlayerInfo.Send_Set_Title,
	PlayerInfo.Send_Init_Title,
	PlayerInfo.Send_Welfare_Shouchong_Reward,
	PlayerInfo.Send_Welfare_Checkin,
	PlayerInfo.Send_Welfare_Checkin_All,
	PlayerInfo.Send_Welfare_Checkin_Getback,
	PlayerInfo.Send_Welfare_Level,
	PlayerInfo.Send_Welfare_Active_Getback,
	PlayerInfo.Send_Welfare_Getalllist_Getback,
	PlayerInfo.Send_Welfare_Getall_Getback,
	PlayerInfo.Send_Pick_Quest_Reward,
	PlayerInfo.Send_Use_Virtual_Item,
	PlayerInfo.Send_Pick_Quest_Chapter_Reward,
	PlayerInfo.Send_Kuafu_3v3_Match,
	PlayerInfo.Send_Kuafu_3v3_Match_Oper,
	PlayerInfo.Send_Kuafu_3v3_Buytimes,
	PlayerInfo.Send_Kuafu_3v3_Dayreward,
	PlayerInfo.Send_Kuafu_3v3_Getranlist,
	PlayerInfo.Send_Kuafu_3v3_Getmyrank,
	PlayerInfo.Send_Kuafu_3v3_Cancel_Match,
	PlayerInfo.Send_Kuafu_Xianfu_Match,
	PlayerInfo.Send_Buy_Xianfu_Item,
	PlayerInfo.Send_Doujiantai_Fight,
	PlayerInfo.Send_Doujiantai_Buytime,
	PlayerInfo.Send_Doujiantai_Clearcd,
	PlayerInfo.Send_Doujiantai_First_Reward,
	PlayerInfo.Send_Doujiantai_Get_Enemys_Info,
	PlayerInfo.Send_Doujiantai_Get_Rank,
	PlayerInfo.Send_Doujiantai_Refresh_Enemys,
	PlayerInfo.Send_Doujiantai_Top3,
	PlayerInfo.Send_Submit_Quest_Daily2,
	PlayerInfo.Send_Change_Line,
	PlayerInfo.Send_Show_Map_Line,
	PlayerInfo.Send_Spell_Start,
	PlayerInfo.Send_Teleport,
	PlayerInfo.Send_Use_Gameobject,
	PlayerInfo.Send_Instance_Exit,
	PlayerInfo.Send_Ride_Mount,
	PlayerInfo.Send_Change_Battle_Mode,
	PlayerInfo.Send_Jump_Start,
	PlayerInfo.Send_Enter_Vip_Instance,
	PlayerInfo.Send_Enter_Trial_Instance,
	PlayerInfo.Send_Teleport_Main_City,
	PlayerInfo.Send_Use_Broadcast_Gameobject,
	PlayerInfo.Send_World_Boss_Fight,
	PlayerInfo.Send_Res_Instance_Enter,
	PlayerInfo.Send_Teleport_Map,
	PlayerInfo.Send_Teleport_Field_Boss,
	PlayerInfo.Send_Talk_With_Npc,
	PlayerInfo.Send_Loot_Select,
	PlayerInfo.Send_Gold_Respawn,
	PlayerInfo.Send_Clientsubscription,
	PlayerInfo.Send_Use_Jump_Point,
}

local FuncName = {
	"GmAddItem",
	"Send_Bag_Exchange_Pos",
	"Send_Bag_Destroy",
	"Send_Bag_Item_User",
	"Send_Mall_Buy",
	"Send_Strength",
	"Send_Create_Faction",
	"Send_Faction_Upgrade",
	"Send_Faction_Join",
	"Send_Raise_Base_Spell",
	"Send_Upgrade_Anger_Spell",
	"Send_Raise_Mount",
	"Send_Upgrade_Mount",
	"Send_Upgrade_Mount_One_Step",
	"Send_Illusion_Mount_Active",
	"Send_Illusion_Mount",
	"Send_Gem",
	"Send_Divine_Active",
	"Send_Divine_Uplev",
	"Send_Divine_Switch",
	"Send_Sweep_Vip_Instance",
	"Send_Hang_Up",
	"Send_Hang_Up_Setting",
	"Send_Sweep_Trial_Instance",
	"Send_Reset_Trial_Instance",
	"Send_Social_Add_Friend",
	"Send_Social_Sureadd_Friend",
	"Send_Social_Gift_Friend",
	"Send_Social_Recommend_Friend",
	"Send_Social_Revenge_Enemy",
	"Send_Social_Del_Friend",
	"Send_Social_Clear_Apply",
	"Send_Social_Add_Friend_Byname",
	"Send_Chat_By_Channel",
	"Send_Msg_Decline",
	"Send_Block_Chat",
	"Send_Faction_Getlist",
	"Send_Faction_Manager",
	"Send_Faction_Member_Operate",
	"Send_Faction_Fast_Join",
	"Send_Read_Mail",
	"Send_Pick_Mail",
	"Send_Remove_Mail",
	"Send_Pick_Mail_One_Step",
	"Send_Remove_Mail_One_Step",
	"Send_Cancel_Block_Chat",
	"Send_World_Boss_Enroll",
	"Send_Rank_Add_Like",
	"Send_Res_Instance_Sweep",
	"Send_Get_Activity_Reward",
	"Send_Get_Achieve_Reward",
	"Send_Get_Achieve_All_Reward",
	"Send_Set_Title",
	"Send_Init_Title",
	"Send_Welfare_Shouchong_Reward",
	"Send_Welfare_Checkin",
	"Send_Welfare_Checkin_All",
	"Send_Welfare_Checkin_Getback",
	"Send_Welfare_Level",
	"Send_Welfare_Active_Getback",
	"Send_Welfare_Getalllist_Getback",
	"Send_Welfare_Getall_Getback",
	"Send_Pick_Quest_Reward",
	"Send_Use_Virtual_Item",
	"Send_Pick_Quest_Chapter_Reward",
	"Send_Kuafu_3v3_Match",
	"Send_Kuafu_3v3_Match_Oper",
	"Send_Kuafu_3v3_Buytimes",
	"Send_Kuafu_3v3_Dayreward",
	"Send_Kuafu_3v3_Getranlist",
	"Send_Kuafu_3v3_Getmyrank",
	"Send_Kuafu_3v3_Cancel_Match",
	"Send_Kuafu_Xianfu_Match",
	"Send_Buy_Xianfu_Item",
	"Send_Doujiantai_Fight",
	"Send_Doujiantai_Buytime",
	"Send_Doujiantai_Clearcd",
	"Send_Doujiantai_First_Reward",
	"Send_Doujiantai_Get_Enemys_Info",
	"Send_Doujiantai_Get_Rank",
	"Send_Doujiantai_Refresh_Enemys",
	"Send_Doujiantai_Top3",
	"Send_Submit_Quest_Daily2",
	"Send_Change_Line",
	"Send_Show_Map_Line",
	"Send_Spell_Start",
	"Send_Teleport",
	"Send_Use_Gameobject",
	"Send_Instance_Exit",
	"Send_Ride_Mount",
	"Send_Change_Battle_Mode",
	"Send_Jump_Start",
	"Send_Enter_Vip_Instance",
	"Send_Enter_Trial_Instance",
	"Send_Teleport_Main_City",
	"Send_Use_Broadcast_Gameobject",
	"Send_World_Boss_Fight",
	"Send_Res_Instance_Enter",
	"Send_Teleport_Map",
	"Send_Teleport_Field_Boss",
	"Send_Talk_With_Npc",
	"Send_Loot_Select",
	"Send_Gold_Respawn",
	"Send_Clientsubscription",
	"Send_Use_Jump_Point",
}

function PlayerInfo:SendProtocol()
	local indice = GetRandomIndexTable(#ProtocolsFunc, 6)
	for _, index in ipairs(indice) do
		local callback = ProtocolsFunc[index]
		outFmtInfo("invoke %s", FuncName[index])
		doxpcall(callback, self)
	end
end