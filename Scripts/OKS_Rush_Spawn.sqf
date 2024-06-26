/*
	OKS_Rush_Spawn
	[ArrayOfSpawns,UnitsPerBase,Side,Range,ShouldDisableFSM,ShouldDefendSpawn,Interval] spawn OKS_Rush_Spawn;
	[Spawn,UnitsPerBase,Side,Range,ShouldDisableFSM,ShouldDefendSpawn,Interval] execVM "Scripts\OKS_Rush_Spawn.sqf";
*/

 	if(!isServer) exitWith {};

	Params ["_Spawn","_NumberInfantry","_Side","_Range","_disableFSM","_defend","_Interval"];
	private ["_Spawnpos","_RandomPos","_Center"];

	_Settings = [_Side] call OKS_Dynamic_Setting;
	_Settings Params ["_UnitArray","_SideMarker","_SideColor","_Vehicles","_Civilian","_Trigger"];
	_UnitArray Params ["_Leaders","_Units","_Officer"];
	
		if(!Alive _Spawn || getDammage _Spawn > 0.5) exitWith {false};
		if(_defend) then {
			_Center = getPos _Spawn;
		} else {
		 	_Center = [];
		};
		_Group = CreateGroup _Side;
		for "_i" from 1 to (_NumberInfantry) do
		{
			Private "_Unit";
			if ( (count (units _Group)) == 0 ) then
			{
				_Unit = _Group CreateUnit [(_Leaders call BIS_FNC_selectRandom), _Spawn getPos [5,(random 360)], [], 0, "NONE"];
				_Unit setRank "SERGEANT";
			} else {
				_Unit = _Group CreateUnit [(_Units call BIS_FNC_selectRandom), _Spawn getPos [5,(random 360)], [], 0, "NONE"];
				_Unit setRank "PRIVATE";
			};
			if(_disableFSM) then {
				_Unit disableAI "FSM";
			};
			sleep 1;
		};
		{[_x] remoteExec ["GW_SetDifficulty_fnc_setSkill",0]} foreach units _Group;
		waitUntil {sleep 5; !isNil "lambs_wp_fnc_moduleRush"};	
		[_Group,_Range,_Interval,[],_Center,true] remoteExec ["lambs_wp_fnc_taskRush",0];
	


