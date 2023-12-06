/*
	OKS_Attack_SpawnGroup
	[SpawnPosOrObject,ArrayOrObject,Side] spawn OKS_Attack_SpawnGroup;
	[SpawnPosOrObject,ArrayOrObject,Side] execVM "Training\Attack_DoMove.sqf";
*/

 	if(!isServer) exitWith {};

	Params [
		["_Spawn",objNull,[objNull,[]]],
		["_TargetWaypoint",objNull,[[],objNull]],
		["_Side",east,[sideUnknown]]
	];
	Private ["_Dir"];
	
	if(typeName _Spawn == "OBJECT") then {
		_Dir = getDir _Spawn;
		_Spawn = getPos _Spawn;
	} else {
		_Dir = random 360;
	};
	if(typeName _TargetWaypoint == "OBJECT") then {
		_TargetWaypoint = getPos _TargetWaypoint;
	};

	Private ["_Group"];
	_Settings = [_Side] call OKS_Dynamic_Setting;
	_Settings Params ["_UnitArray","_SideMarker","_SideColor","_Vehicles","_Civilian","_Trigger"];
	_UnitArray Params ["_Leaders","_Units","_Officer"];
	
	_Group = CreateGroup _Side;
	_Unit = _Group CreateUnit [(_Units call BIS_FNC_selectRandom), _Spawn getPos [3,(random 360)], [], 0, "NONE"];
	_Unit setRank "PRIVATE";
	{_Unit disableAI _x } foreach ["cover", "suppression", "fsm"];
	_Unit enableAttack false;

	_Group spawn {
		_Group = _this;
		_Group setVariable ["acex_headless_blacklist",true];
		_Group setVariable ["lambs_danger_disableAI", true];
		{[_x] remoteExec ["GW_SetDifficulty_fnc_setSkill",0]} foreach units _Group;
		if(isNil "_Group") exitWith {false};
	};
	
	/// Give Attack SAD Waypoint
	[_Unit,_TargetWaypoint] spawn {
		_Unit = _this#0;
		_TargetWaypoint = _this#1;
		{
			_Unit doMove (getPos _X);
			waitUntil{sleep 0.5; _Unit distance2d _X < 5};
			sleep 3;
		} foreach _TargetWaypoint;
	};

	_Unit;




