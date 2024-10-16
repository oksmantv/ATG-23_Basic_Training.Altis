// [spawn_1,waypoint_1,east]] spawn AT_Spawner;
// [spawnpos_1,waypoint_1,east]] execVM "AT_Spawner.sqf";


if(!isServer) exitWith {};

Params ["_Spawn","_Waypoint","_Side"];

Private ["_pilotClass","_Units","_Leader","_Vehicles","_DismountCode","_Classname"];
Private _ConvoyArray = [];
private _Debug_Variable = true;

	Switch (_Side) do
	{
		case blufor:	// BLUFOR settings
		{
			_pilotClass = "B_pilot_F";
			_Vehicles = [
				"UK3CB_TKA_O_Bell412_Utility", 
				"UK3CB_TKA_O_Mi_24G", 
				"UK3CB_TKA_O_Mi_24P", 
				"UK3CB_TKA_O_Mi_24V", 
				"UK3CB_TKA_O_Mi8", 
				"UK3CB_TKA_O_UH1H_M240"
			];			
		};
		case opfor:	// BLUFOR settings
		{
			_pilotClass = "O_pilot_F";	
			_Vehicles = [
				"UK3CB_TKA_O_Bell412_Utility", 
				"UK3CB_TKA_O_Mi_24G", 
				"UK3CB_TKA_O_Mi_24P", 
				"UK3CB_TKA_O_Mi_24V", 
				"UK3CB_TKA_O_Mi8", 
				"UK3CB_TKA_O_UH1H_M240"
			];
		};
		case independent:	// BLUFOR settings
		{
			_pilotClass = "I_pilot_F";	
			_Vehicles = [
				"UK3CB_TKA_O_Bell412_Utility", 
				"UK3CB_TKA_O_Mi_24G", 
				"UK3CB_TKA_O_Mi_24P", 
				"UK3CB_TKA_O_Mi_24V", 
				"UK3CB_TKA_O_Mi8", 
				"UK3CB_TKA_O_UH1H_M240"
			];			
		};
		// DO NOT EDIT ANYTHING BELOW \\
		default
		{
			_Units = "";
		};
	};

while {true} do {

	waitUntil{sleep 1; OKS_AA_Spawn_Active == true};

	while {OKS_AA_Spawn_Active} do {
		waitUntil {sleep 1; if(_Debug_Variable) then {systemChat "Waiting for clearance near _Spawn"}; (getPos _Spawn nearEntities ["Air", 300]) isEqualTo []};
		if(_Debug_Variable) then {systemChat format ["Spawning Helicopter.."]};
		_Classname = selectRandom _Vehicles;
		_Vehicle = createVehicle [_Classname,getPos _Spawn, [], 0, "FLY"];
		_Vehicle setDir (getDir _Waypoint);
		_Vehicle setVehicleLock "LOCKED";

		_Group = createGroup _Side;
		_Group setBehaviour "CARELESS";
		_Group setVariable ["acex_headless_blacklist",true];
		_Group setVariable ["lambs_danger_disableAI", true];
		if(_Vehicle emptyPositions "driver" > 0) then {
			if(_Debug_Variable) then { systemChat "Creating Driver"};
			_Driver = _Group CreateUnit [_pilotClass, [0,0,0], [], 5, "NONE"];
			_Driver setRank "PRIVATE";
			_Driver setBehaviour "CARELESS";
			_Driver moveinDriver _Vehicle;
		};
		
		_EndWP = _Group addWaypoint [_Waypoint,1];
		_EndWP setWaypointType "MOVE";

		[_Vehicle,_Group,_Waypoint] spawn {
			Params["_Vehicle","_Group","_Waypoint"];
			waitUntil {sleep 1; !Alive _Vehicle || getDammage _Vehicle > 0.5 || !canMove _Vehicle || {!Alive _X || !([_X] call ace_common_fnc_isAwake)} count units _Group == count units _Group || _Vehicle distance2D (getPos _Waypoint) < 500};
			
			if(_Vehicle distance2D (getPos _Waypoint) >= 500) then {
				_Vehicle setDamage 1;
				sleep 5;
			};
			{deleteVehicle _X} foreach units _Group; deleteVehicle _Vehicle;
		};

		sleep 10;
	};
};

