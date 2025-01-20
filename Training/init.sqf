// [] execVM "Training\init.sqf";

// Global Commands
execVM "Training\CompoundBreach\init.sqf";

// Marksman Course
OKS_Marksman_Debug = false;
publicVariable "OKS_Marksman_Debug";

OKS_Marksman_Qualification_Action = compile preprocessFileLineNumbers "Training\MarksmanQualification\OKS_Marksman_Qualification_Action.sqf";
OKS_Marksman_Qualification_Function = compile preprocessFileLineNumbers "Training\MarksmanQualification\OKS_Marksman_Qualification_Function.sqf";
OKS_Marksman_Qualification_Target = compile preprocessFileLineNumbers "Training\MarksmanQualification\OKS_Marksman_Qualification_Target.sqf";
OKS_Marksman_Qualification_WeaponSelect = compile preprocessFileLineNumbers "Training\MarksmanQualification\OKS_Marksman_Qualification_WeaponSelect.sqf";
AI_Death = compile preprocessFileLineNumbers "Training\AI_Death.sqf";
CQB_Garrison = compile preprocessFileLineNumbers "Training\CQB_Garrison.sqf";
OKS_PlaySound = compile preprocessFileLineNumbers "Training\OKS_PlaySound.sqf";
DryRunCode = compile preprocessFileLineNumbers "Training\DryRunCode.sqf";
LiveRunCode = compile preprocessFileLineNumbers "Training\LiveRunCode.sqf";
CQB_Garrison = compile preprocessFileLineNumbers "Training\CQB_Garrison.sqf";
VehicleRequest = compile preprocessFileLineNumbers "Training\VehicleRequest.sqf";

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

sleep 5;

[helo_1, getPos helospawn_1, getDir helospawn_1, ["helicopter"]] remoteExec ["VehicleRequest",0];
[helo_2, getPos helospawn_2, getDir helospawn_2, ["helicopter"]] remoteExec ["VehicleRequest",0];
[plane_1, getPos planespawn_1, getDir planespawn_1, ["plane"]] remoteExec ["VehicleRequest",0];
[plane_2, getPos planespawn_2, getDir planespawn_2, ["plane"]] remoteExec ["VehicleRequest",0];
[plane_3, getPos planespawn_3, getDir planespawn_3, ["plane"]] remoteExec ["VehicleRequest",0];