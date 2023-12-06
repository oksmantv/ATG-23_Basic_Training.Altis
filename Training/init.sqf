// Global Commands
execVM "Training\CompoundBreach\init.sqf";

// Marksman Course
OKS_Marksman_Debug = false;
publicVariable "OKS_Marksman_Debug";

OKS_Marksman_Qualification_Action = compile preprocessFileLineNumbers "Training\MarksmanQualification\OKS_Marksman_Qualification_Action.sqf";
OKS_Marksman_Qualification_Function = compile preprocessFileLineNumbers "Training\MarksmanQualification\OKS_Marksman_Qualification_Function.sqf";
OKS_Marksman_Qualification_Target = compile preprocessFileLineNumbers "Training\MarksmanQualification\OKS_Marksman_Qualification_Target.sqf";
OKS_Marksman_Qualification_WeaponSelect = compile preprocessFileLineNumbers "Training\MarksmanQualification\OKS_Marksman_Qualification_WeaponSelect.sqf";

//Dense_CQB_Garrison = compile preprocessFileLineNumbers "Training\Dense_CQB_Garrison.sqf";
//OKS_SpawnEnemyVehicle = compile preprocessFileLineNumbers "Scripts\OKS_SpawnEnemyVehicle.sqf";
MGSpawner = compile preprocessFileLineNumbers "Training\MGSpawner.sqf";

//3DReportSpawner = compile preprocessFileLineNumbers "Training\3DReportSpawner.sqf";
AT_Spawner = compile preprocessFileLineNumbers "Training\AT_Spawner.sqf";
AI_Death = compile preprocessFileLineNumbers "Training\AI_Death.sqf";
CQB_Garrison = compile preprocessFileLineNumbers "Training\CQB_Garrison.sqf";
OKS_PlaySound = compile preprocessFileLineNumbers "Training\OKS_PlaySound.sqf";
DryRunCode = compile preprocessFileLineNumbers "Training\DryRunCode.sqf";
LiveRunCode = compile preprocessFileLineNumbers "Training\LiveRunCode.sqf";
//Attack_DoMove = compile preprocessFileLineNumbers "Training\Attack_DoMove.sqf";
MedicalQualificationPatients = compile preprocessFileLineNumbers "Medical\MedicalQualificationPatients.sqf";
// AmbushActivate = compile preprocessFileLineNumbers "Training\AmbushActivate.sqf";
// AmbushAction = compile preprocessFileLineNumbers "Training\AmbushAction.sqf";
// ConvoySpawn = compile preprocessFileLineNumbers "Scripts\OKS_Spawn\OKS_Convoy_Spawn.sqf";


// AT Range
OKS_AT_Spawn_Active = false;
[AT_Range_PC,"Activate Range","OKS_AT_Spawn_Active",false,true,true] execVM "Scripts\NEKY_AddAction.sqf";
[AT_Range_PC,"Deactivate Range","OKS_AT_Spawn_Active",false,true,false] execVM "Scripts\NEKY_AddAction.sqf";

// // Ambush
// AmbushAction_0 setVariable ["AMBUSH_TEXT","Ambush 0",true];
// [AmbushAction_0,ConvoySpawn_0,ConvoyWP_0,ConvoyEnd_0,EAST] execVM "Training\AmbushAction.sqf";

// AmbushAction_1 setVariable ["AMBUSH_TEXT","Ambush 1",true];
// [AmbushAction_1,ConvoySpawn_1,ConvoyWP_1,ConvoyEnd_1,EAST] execVM "Training\AmbushAction.sqf";

// AmbushAction_2 setVariable ["AMBUSH_TEXT","Ambush 2",true];
// [AmbushAction_2,ConvoySpawn_2,ConvoyWP_2,ConvoyEnd_2,EAST] execVM "Training\AmbushAction.sqf";

// AmbushAction_3 setVariable ["AMBUSH_TEXT","Ambush 3",true];
// [AmbushAction_3,ConvoySpawn_3,ConvoyWP_3,ConvoyEnd_3,EAST] execVM "Training\AmbushAction.sqf";

// AmbushAction_4 setVariable ["AMBUSH_TEXT","Ambush 4",true];
// [AmbushAction_4,ConvoySpawn_4,ConvoyWP_4,ConvoyEnd_4,EAST] execVM "Training\AmbushAction.sqf";

// Global disable for Pop-Up Targets.
boundPopup = [];
nopop = true;

// Live Targets
OKS_LiveTargets = {
	Params ["_TargetArray"];
	{
		_Pos = [getPosATL _X select 0,getPosATL _X select 1,(getPosATL _X select 2 + 0.5)];		
		_Dir = ((getDir _X) - 180);
		_Group = createGroup east;
		_Group setVariable ["hc_blacklist",true];
		_Group setVariable ["lambs_danger_disableAI", true];
		_Unit = _Group createUnit ["O_Soldier_F", [0,0,0], [], 0, "CAN_COLLIDE"];
		_Unit setPosATL _Pos;
		_Unit setDir _Dir;
		_Unit disableAI "PATH";
		_Unit setUnitPos "UP";
		_X hideObjectGlobal true
	} foreach _TargetArray;
};

OKS_CourseReset = {
	Params ["_Input"];
	//SystemChat str _Input;
	_Input Params ["_TargetArray","_Trigger"];
	
	{_X hideObject false} foreach _TargetArray;
	{_x animate ["Terc",0];} forEach _TargetArray;
	{_x addEventHandler ["HIT",
		{
			(_this select 0) animate ["Terc",1];
			(_this select 0) RemoveEventHandler ["HIT",0]
		}
	]} forEach _TargetArray;

	{ if(!isPlayer _X) then { deleteVehicle _X} } foreach list _Trigger;
	{ if(_X inArea _Trigger) then { deleteVehicle _X} } foreach allDeadMen;
};

// CQB Exercise
// [Dense_1] execVM "Training\Dense_CQB_Action.sqf";
execVM "Training\DryRun_Action.sqf";
execVM "Training\CQB_Actions.sqf";

object_1 addAction ["<t color='#eb4034'>Initiate Targets</t>",{
		 [_this select 0,Target_1,[
		 	[20748.5,18028.2,0],[20922,18098.1,0],[20745.4,18180.5,0],[21054.9,18114.8,0],[20828.1,17963.7,0],[21124.1,18340.3,0],[21374.5,18247.1,0],[21173,18329.6,0],[21377.7,18116.8,0],
			[21376,18248.4,0],[21079,18298.5,0],[20761.7,18222.5,0],[20844.2,17944.7,0],[20927.1,17970.2,0],[20898.4,18445.8,0.815596],[21001.4,18438.8,-0.0275116],
		 	[20754.2,18199.9,0.000110626],[20854.6,18382.6,0],[21169.1,18343.3,0],[21181.5,18329.5,0.299025],[21193.4,18342.4,3.44091],[20750.3,18459.1,0.249716]
		 ],5,true] remoteExec ["MGSpawner",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"_this distance _target < 10", // _target, _this, _originalTarget
	15,
	false,
	"",
	""];

	object_2 addAction ["<t color='#eb4034'>Initiate Targets</t>",{
		 [_this select 0,Target_2,[
		 	[21073,17624.4,0],[21063,17397.4,0],[21000.3,17445.8,0],[21230.6,17480.5,0],[21330.9,17705.4,0],[21321.4,17650.1,0],[21395.4,17571.3,0],[21098.4,17344.3,0],[21120.3,17559.5,0],[21150.7,17638.3,0],[21331.6,17700.7,0],[21239.9,17683.4,0],[21083,17655.3,0],[21031.6,17554.5,-0.0271988],[21258.4,17706.3,-0.0274105],[21260.4,17686.6,-0.027401],[21326.1,17621.8,-0.0274143],[21004.8,17605.9,4.78285]
		 	,[21107.8,17425,0.65163],[21134.3,17225,0.343945],[21002,17603.7,0.299953],[21118.3,17154.2,1.24575],[21142.7,17204.6,0.309029],[21356,17315.4,-1.90735e-006],[21326.8,17622.1,0],[21262.3,17678.9,0.435457]
		 ],5,true] remoteExec ["MGSpawner",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"_this distance _target < 10", // _target, _this, _originalTarget
	15,
	false,
	"",
	""];

	object_3 addAction ["<t color='#eb4034'>Initiate Targets</t>",{
		 [_this select 0,Target_3,[
		 	[21163.8,16620.6,-0.0274353],[21266.4,16583,-0.0273838],[21260,16492.4,-0.0275173],[21145.7,16461.8,-0.0274677],[21079.4,16438.4,-0.0274887],[21077.3,16398.8,-0.0274982],[21014.5,16388.1,-0.0274982],[20970.7,16374,-0.0275192],[21096.2,16363.1,-0.0274601],[20922.3,16381.2,-0.0275078],[20946.5,16369,3.39099],[20948.6,16368.6,3.4]
		 	,[21293.1,16473.2,3.4086],[20804.2,16220.5,-3.8147e-006],[20870.9,16393.5,0],[21261.4,16343.7,4.38082],[21435.7,16434.2,3.79191],[21294.2,16340.5,3.94782]
		 	
		 ],5,true] remoteExec ["MGSpawner",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"_this distance _target < 10", // _target, _this, _originalTarget
	15,
	false,
	"",
	""];

	object_4 addAction ["<t color='#eb4034'>Initiate Targets</t>",{
		 [_this select 0,Target_4,[
		 	[19833.9,16439.2,-0.0274639],[19890.6,16447.7,-0.0275211],[19957.3,16422.6,-0.0274925],[19926.8,16331.9,-0.0274715],[19917.7,16233.1,-0.0274601],[20035.7,16647.4,-0.0274696],[20062.3,16634.6,-0.0273743],[19773.5,16320.5,-0.0275173],[19765,16328.5,-0.0275192],[19762.5,16365.4,-0.0274868]
		 	,[20490.7,16179.8,0],[20632.7,16163.9,0],[20136.7,16322.2,3.31079],[20144.1,16323.3,0.800449],[20300.4,16305.4,0],[19903.4,16362.2,1.90735e-006], [19933.1,16264.8,0], [19939.8,16073.6,0]
		 ],5,true] remoteExec ["MGSpawner",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"_this distance _target < 10", // _target, _this, _originalTarget
	15,
	false,
	"",
	""
	];

	object_5 addAction ["<t color='#eb4034'>Initiate Targets</t>",{
		 [_this select 0,Target_5,[
		 	[19319,17140.8,-0.0273876],[19317,17208.9,-0.027359],[19062.7,17149.5,-0.0267715],[19303.1,17348.1,-0.0274963],[19315.2,17407.4,-0.027504],[19519.2,17411.1,-0.0273666],[19509.6,17369.2,-0.0274582],[19637.7,17492.4,-0.0273857],[19734,17514.6,-0.0272636],[19714.9,17481.5,-0.0274544],[19627.9,17442.9,-0.0274887],[19698.5,17394.3,-0.0274315],[19123.9,17490.4,-0.0275078]
		 	,[19324.5,17065.4,-5.72205e-006], [19325.3,17009.8,3.05063], [19352.3,16985.4,-5.72205e-006], [19182.3,17058.4,9.53674e-006],[19069.8,17098.8,0]
		 ],5,true] remoteExec ["MGSpawner",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"_this distance _target < 10", // _target, _this, _originalTarget
	15,
	false,
	"",
	""
	];

	object_6 addAction ["<t color='#eb4034'>Initiate Targets</t>",{
		 [_this select 0,Target_6,[
		 	[19669.2,18804.6,-0.0268478],[19611.4,18925,-0.027092],[19686.3,18759,-0.0273705],[19742.9,18788.4,-0.0258503],[19798.1,18758,-0.0272694],[19914.1,18508.3,-0.0274582],[19883.3,18593.9,-0.0255241],[19886.1,18481.3,-0.0273666],[19981.6,18501.1,-0.0274048],[19985.9,18403.3,-0.0272331],[20019.9,18749.1,-0.0266685],[20024.2,18500,-0.026886],[20040.4,18498.2,-0.0274086]
		 	,[19782.3,18613.2,8.58307e-005], [20011.9,18757.7,1.51037], [20072.1,18707.4,8.39233e-005], [20320.5,18657.5,0.522205], [20392.3,18647,8.7738e-005], [20347.8,18759.5,4.32052], [20332.8,18774.4,8.39233e-005]
		 ],5,true] remoteExec ["MGSpawner",2];
	},
	nil,
	1.5,
	true,
	true,
	"",
	"_this distance _target < 10", // _target, _this, _originalTarget
	15,
	false,
	"",
	""];

if(isServer) then {
	[ATSpawn_1,ATWP_1,ATEnd_1,east,[6,60]] spawn AT_Spawner;
	[ATSpawn_2,ATWP_2,ATEnd_2,east,[6,60]] spawn AT_Spawner;
};