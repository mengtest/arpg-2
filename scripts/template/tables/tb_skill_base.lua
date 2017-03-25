---------------------------------------------------------------------------------
--------------------------以下代码为自动生成，请勿手工改动-----------------------
---------------------------------------------------------------------------------


tb_skill_base = {
	--  id:int	技能ID
	--  name:string	技能名称
	--  is_initiative:int	技能类型
	--  skill_type:int	技能种类
	--  skill_slot:int	技能槽位
	--  type:int	技能目标类型2
	--  target_type:int	施放范围类型
	--  pre:int	前置技能
	--  is_end:int	连招终结技
	--  follow:array	连招其它
	--  time_change:array	计时切换技能
	--  singleCD:int	冷却时间
	--  groupCD:int	公共CD
	--  self_cd:int	技能自身CD
	--  group:int	技能族
	--  skill_percent:int	技能触发概率万分比
	--  uplevel_id:array	升级ID
	--  magic_type:int	施放消耗类型
	--  nuqi_change:int	怒气变化
	--  attack_mast:array	技能范围掩码
	--  is_fix:int	固定施法方向
	--  isUnitBallistic:int	是否unit弹道
	--  condition_skill:int	激活前置技能
	--  lock_type:int	技能锁定类型
	--  need_save:int	技能CD保存
	[10001] = {id = 10001,name = "轻功",is_initiative = 9,skill_type = 1,skill_slot = 7,type = 0,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 958,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10002] = {id = 10002,name = "梯云纵",is_initiative = 9,skill_type = 1,skill_slot = 7,type = 0,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {2000,4},singleCD = 8000,groupCD = 1250,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 4,lock_type = 0,need_save = 0,},
	[10003] = {id = 10003,name = "骑乘",is_initiative = 9,skill_type = 1,skill_slot = 8,type = 0,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 3000,groupCD = 750,self_cd = 750,group = 0,skill_percent = 10000,uplevel_id = {},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10004] = {id = 10004,name = "打坐",is_initiative = 9,skill_type = 1,skill_slot = 9,type = 0,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 500,groupCD = 500,self_cd = 0,group = 0,skill_percent = 10000,uplevel_id = {},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10005] = {id = 10005,name = "武当剑法",is_initiative = 1,skill_type = 1,skill_slot = 1,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {10006,10007},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 1,skill_percent = 10000,uplevel_id = {1001,1100},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[10006] = {id = 10006,name = "武当剑法",is_initiative = 1,skill_type = 1,skill_slot = 1,type = 2,target_type = 0,pre = 10005,is_end = 0,follow = {10005,10007},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 1,skill_percent = 10000,uplevel_id = {1101,1200},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[10007] = {id = 10007,name = "武当剑法",is_initiative = 1,skill_type = 1,skill_slot = 1,type = 2,target_type = 1,pre = 10006,is_end = 1,follow = {10005,10006},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 1,skill_percent = 10000,uplevel_id = {1201,1300},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10008] = {id = 10008,name = "峨眉剑法",is_initiative = 1,skill_type = 1,skill_slot = 1,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {10009,10010},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 2,skill_percent = 10000,uplevel_id = {1301,1400},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[10009] = {id = 10009,name = "峨眉剑法",is_initiative = 1,skill_type = 1,skill_slot = 1,type = 2,target_type = 0,pre = 10008,is_end = 0,follow = {10008,10010},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 2,skill_percent = 10000,uplevel_id = {1401,1500},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[10010] = {id = 10010,name = "峨眉剑法",is_initiative = 1,skill_type = 1,skill_slot = 1,type = 2,target_type = 1,pre = 10009,is_end = 1,follow = {10008,10009},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 2,skill_percent = 10000,uplevel_id = {1501,1600},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10011] = {id = 10011,name = "太清气剑",is_initiative = 1,skill_type = 1,skill_slot = 2,type = 2,target_type = 2,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 5000,groupCD = 700,self_cd = 5000,group = 0,skill_percent = 10000,uplevel_id = {1701,1800},magic_type = 0,nuqi_change = 0,attack_mast = {114744,1879048206,2147483648,3,7168,3758096384,0,117440512,0,939524096,0,0,448},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10012] = {id = 10012,name = "太清气剑",is_initiative = 1,skill_type = 1,skill_slot = 2,type = 2,target_type = 2,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 5000,groupCD = 700,self_cd = 5000,group = 0,skill_percent = 10000,uplevel_id = {1801,1900},magic_type = 0,nuqi_change = 0,attack_mast = {114744,1879048206,2147483648,3,7168,3758096384,0,117440512,0,939524096,0,0,448},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10013] = {id = 10013,name = "万剑归宗一阶",is_initiative = 1,skill_type = 1,skill_slot = 6,type = 6,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 700,self_cd = 10000,group = 0,skill_percent = 10000,uplevel_id = {1601,1610},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 1,},
	[10014] = {id = 10014,name = "万剑归宗一阶",is_initiative = 1,skill_type = 1,skill_slot = 6,type = 6,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 700,self_cd = 10000,group = 0,skill_percent = 10000,uplevel_id = {1611,1620},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 1,},
	[10015] = {id = 10015,name = "万剑归宗二阶",is_initiative = 1,skill_type = 1,skill_slot = 6,type = 6,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 700,self_cd = 10000,group = 0,skill_percent = 10000,uplevel_id = {1621,1630},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 1,},
	[10016] = {id = 10016,name = "万剑归宗二阶",is_initiative = 1,skill_type = 1,skill_slot = 6,type = 6,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 700,self_cd = 10000,group = 0,skill_percent = 10000,uplevel_id = {1631,1640},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 1,},
	[10017] = {id = 10017,name = "万剑归宗三阶",is_initiative = 1,skill_type = 1,skill_slot = 6,type = 6,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 700,self_cd = 10000,group = 0,skill_percent = 10000,uplevel_id = {1641,1650},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 1,},
	[10018] = {id = 10018,name = "万剑归宗三阶",is_initiative = 1,skill_type = 1,skill_slot = 6,type = 6,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 700,self_cd = 10000,group = 0,skill_percent = 10000,uplevel_id = {1651,1660},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 1,},
	[10019] = {id = 10019,name = "天罡神掌",is_initiative = 1,skill_type = 1,skill_slot = 3,type = 2,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 8000,groupCD = 700,self_cd = 8000,group = 0,skill_percent = 10000,uplevel_id = {1901,2000},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10020] = {id = 10020,name = "天罡神掌",is_initiative = 1,skill_type = 1,skill_slot = 3,type = 2,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 8000,groupCD = 700,self_cd = 8000,group = 0,skill_percent = 10000,uplevel_id = {2001,2100},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10021] = {id = 10021,name = "玄天剑决",is_initiative = 1,skill_type = 1,skill_slot = 4,type = 2,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 700,self_cd = 5000,group = 0,skill_percent = 10000,uplevel_id = {2101,2200},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10022] = {id = 10022,name = "玄天剑决",is_initiative = 1,skill_type = 1,skill_slot = 4,type = 2,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 700,self_cd = 5000,group = 0,skill_percent = 10000,uplevel_id = {2201,2300},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10023] = {id = 10023,name = "真武七截剑",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 2,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 700,self_cd = 10000,group = 0,skill_percent = 10000,uplevel_id = {2301,2400},magic_type = 0,nuqi_change = 0,attack_mast = {114744,1879048206,2147483648,3,7168,3758096384,0,117440512,0,939524096,0,0,448},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10024] = {id = 10024,name = "真武七截剑",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 2,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 10000,groupCD = 700,self_cd = 10000,group = 0,skill_percent = 10000,uplevel_id = {2401,2500},magic_type = 0,nuqi_change = 0,attack_mast = {114744,1879048206,2147483648,3,7168,3758096384,0,117440512,0,939524096,0,0,448},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11001] = {id = 11001,name = "洪荒之力",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[11002] = {id = 11002,name = "龙象般若功",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 4,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 20000,groupCD = 1000,self_cd = 20000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11003] = {id = 11003,name = "无我心法",is_initiative = 0,skill_type = 1,skill_slot = 0,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 5,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[11004] = {id = 11004,name = "无我心法",is_initiative = 0,skill_type = 1,skill_slot = 0,type = 2,target_type = 0,pre = 5,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 5,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[11005] = {id = 11005,name = "长生诀",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11006] = {id = 11006,name = "长生诀",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11007] = {id = 11007,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11008] = {id = 11008,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11009] = {id = 11009,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11010] = {id = 11010,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11011] = {id = 11011,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11012] = {id = 11012,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11013] = {id = 11013,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11014] = {id = 11014,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11015] = {id = 11015,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11016] = {id = 11016,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11017] = {id = 11017,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11018] = {id = 11018,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11019] = {id = 11019,name = "凝神",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11020] = {id = 11020,name = "逆鳞",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11021] = {id = 11021,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11022] = {id = 11022,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11023] = {id = 11023,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11024] = {id = 11024,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11025] = {id = 11025,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11026] = {id = 11026,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11027] = {id = 11027,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11028] = {id = 11028,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11029] = {id = 11029,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[11030] = {id = 11030,name = "被动技能1",is_initiative = 8,skill_type = 1,skill_slot = 0,type = 0,target_type = 3,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10101] = {id = 10101,name = "真武剑影",is_initiative = 1,skill_type = 4,skill_slot = 5,type = 2,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 30000,groupCD = 1000,self_cd = 5000,group = 0,skill_percent = 10000,uplevel_id = {5000,5009},magic_type = 0,nuqi_change = 5,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10102] = {id = 10102,name = "谁与争锋",is_initiative = 8,skill_type = 4,skill_slot = 0,type = 0,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10103] = {id = 10103,name = "碧海潮生",is_initiative = 1,skill_type = 4,skill_slot = 5,type = 2,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 30000,groupCD = 1000,self_cd = 5000,group = 0,skill_percent = 10000,uplevel_id = {5010,5019},magic_type = 0,nuqi_change = 5,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[10104] = {id = 10104,name = "不动如山",is_initiative = 8,skill_type = 4,skill_slot = 0,type = 0,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10105] = {id = 10105,name = "龙象般若",is_initiative = 1,skill_type = 4,skill_slot = 5,type = 2,target_type = 4,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 30000,groupCD = 1000,self_cd = 5000,group = 0,skill_percent = 10000,uplevel_id = {5020,5029},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[10106] = {id = 10106,name = "武林至尊",is_initiative = 8,skill_type = 4,skill_slot = 0,type = 0,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 15000,groupCD = 1000,self_cd = 15000,group = 0,skill_percent = 10000,uplevel_id = {2501,2600},magic_type = 0,nuqi_change = 0,attack_mast = {2147737657,4261412927,4160749571,63,262112,4286578688,63,4294705152,1,4286578688,3,0,2032},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 1,},
	[13001] = {id = 13001,name = "怪物普通攻击1",is_initiative = 1,skill_type = 14,skill_slot = 0,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 1,skill_percent = 10000,uplevel_id = {1001,1100},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13002] = {id = 13002,name = "怪物普通攻击2",is_initiative = 1,skill_type = 14,skill_slot = 0,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 1,skill_percent = 10000,uplevel_id = {1001,1100},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13003] = {id = 13003,name = "怪物普通攻击3",is_initiative = 1,skill_type = 14,skill_slot = 0,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 1,skill_percent = 10000,uplevel_id = {1001,1100},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13004] = {id = 13004,name = "爪击",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 0,skill_percent = 10000,uplevel_id = {1001,1100},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13005] = {id = 13005,name = "幽冥鬼火",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 2,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 1000,groupCD = 1000,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {2301,2400},magic_type = 0,nuqi_change = 0,attack_mast = {114744,1879048206,2147483648,3,7168,3758096384,0,117440512,0,939524096,0,0,448},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13006] = {id = 13006,name = "白骨爪",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 4,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 1000,groupCD = 1000,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {2401,2500},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13007] = {id = 13007,name = "剑击",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 0,skill_percent = 10000,uplevel_id = {1001,1100},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13008] = {id = 13008,name = "重剑无锋",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 1000,groupCD = 1000,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {1201,1300},magic_type = 0,nuqi_change = 5,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[13009] = {id = 13009,name = "重剑撼地",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 4,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 1000,groupCD = 1000,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {2401,2500},magic_type = 0,nuqi_change = 0,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13010] = {id = 13010,name = "挥拳",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 0,skill_percent = 10000,uplevel_id = {1001,1100},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13011] = {id = 13011,name = "尖刺",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 2,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 1000,groupCD = 1000,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {2301,2400},magic_type = 0,nuqi_change = 0,attack_mast = {114744,1879048206,2147483648,3,7168,3758096384,0,117440512,0,939524096,0,0,448},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13012] = {id = 13012,name = "裂地",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 1000,groupCD = 1000,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {1201,1300},magic_type = 0,nuqi_change = 5,attack_mast = {4294967295,4294967295,4160618495,3791618015,65027587,62},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
	[13013] = {id = 13013,name = "十字斩",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 0,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 400,groupCD = 400,self_cd = 400,group = 0,skill_percent = 10000,uplevel_id = {1001,1100},magic_type = 0,nuqi_change = 0,attack_mast = {},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13014] = {id = 13014,name = "玄阴魔焰",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 2,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 1000,groupCD = 1000,self_cd = 1000,group = 0,skill_percent = 10000,uplevel_id = {2301,2400},magic_type = 0,nuqi_change = 0,attack_mast = {114744,1879048206,2147483648,3,7168,3758096384,0,117440512,0,939524096,0,0,448},is_fix = 0,isUnitBallistic = 0,condition_skill = 0,lock_type = 1,need_save = 0,},
	[13015] = {id = 13015,name = "血影神功",is_initiative = 1,skill_type = 1,skill_slot = 0,type = 2,target_type = 1,pre = 0,is_end = 0,follow = {},time_change = {},singleCD = 5000,groupCD = 1000,self_cd = 5000,group = 0,skill_percent = 10000,uplevel_id = {2301,2400},magic_type = 0,nuqi_change = 5,attack_mast = {4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4293132281,4265607055,33538303,4290781180,2096129,1065353470,1040384,1016},is_fix = 1,isUnitBallistic = 0,condition_skill = 0,lock_type = 0,need_save = 0,},
}
