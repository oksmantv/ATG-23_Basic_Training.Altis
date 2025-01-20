// [spawn_1,waypoint_1,end_1,east,[6, 25]]] spawn AT_Spawner;
// [spawnpos_1,waypoint_1,end_1,east,[6, 30]]] execVM "AT_Spawner.sqf";


if(!isServer) exitWith {};

Params ["_Spawn","_Waypoint","_End","_Side","_VehicleArray"];
_VehicleArray Params ["_SpeedMeterPerSecond","_DispersionInMeters"];

Private ["_crewClass","_Units","_Leader","_Vehicles","_DismountCode","_Classname"];
Private _ConvoyArray = [];
private _Debug_Variable = false;

	Switch (_Side) do
	{
		case blufor:	// BLUFOR settings
		{
			_crewClass = "B_crew_F";
			_Leader = "B_soldier_TL_F";
			_Units = [
				"B_Soldier_A_F",
				"B_Soldier_AR_F",
				"B_Soldier_AR_F",
				"B_medic_F",
				"B_medic_F",
				"B_Soldier_GL_F",
				"B_HeavyGunner_F",
				"B_soldier_M_F",
				"B_Soldier_F",
				"B_Soldier_F",
				"B_Soldier_F",
				"B_Soldier_LAT_F"
			];
			_Vehicles = [

			];
		};
		case opfor:	// BLUFOR settings
		{
			_crewClass = "O_crew_F";
			_Leader = "O_soldier_TL_F";
			_Units = [
				"O_Soldier_A_F",
				"O_Soldier_AR_F",
				"O_Soldier_AR_F",
				"O_medic_F",
				"O_medic_F",
				"O_Soldier_GL_F",
				"O_HeavyGunner_F",
				"O_soldier_M_F",
				"O_Soldier_F",
				"O_Soldier_F",
				"O_Soldier_F",
				"O_Soldier_LAT_F"
			];
			_Vehicles = [
				"UK3CB_TKA_O_ZsuTank", "UK3CB_TKA_O_BMP1", "UK3CB_TKA_O_BMP2", "UK3CB_TKA_O_BTR70", "UK3CB_TKA_O_BTR80a", "UK3CB_TKA_O_BTR80", "UK3CB_TKA_O_M113_M2", 
				"UK3CB_TKA_O_MTLB_PKT", "UK3CB_TKA_O_BRDM2", "UK3CB_TKA_O_Tigr_STS", "UK3CB_TKA_O_GAZ_Vodnik_Cannon", "UK3CB_TKA_O_GAZ_Vodnik_KVPT", 
				"UK3CB_TKA_O_T55", "UK3CB_TKA_O_T72A", "UK3CB_TKA_O_T72B", "UK3CB_TKA_O_T72BM"
			];			
		};
		case independent:	// BLUFOR settings
		{
			_crewClass = "I_crew_F";
			_Leader = "I_soldier_TL_F";
			_Units = [
				"I_Soldier_A_F",
				"I_Soldier_AR_F",
				"I_Soldier_AR_F",
				"I_medic_F",
				"I_medic_F",
				"I_Soldier_GL_F",
				"I_HeavyGunner_F",
				"I_soldier_M_F",
				"I_Soldier_F",
				"I_Soldier_F",
				"I_Soldier_F",
				"I_Soldier_LAT_F"
			];
			_Vehicles = [

			];			
		};
		// DO NOT EDIT ANYTHING BELOW \\
		default
		{
			_Units = "";
		};
	};

while {true} do {

	waitUntil{sleep 1; OKS_AT_Spawn_Active == true};

	while {OKS_AT_Spawn_Active} do {
		waitUntil {sleep 1; if(_Debug_Variable) then {systemChat "Waiting for clearance near _Spawn"}; (getPos _Spawn nearEntities ["LandVehicle", _DispersionInMeters]) isEqualTo []};
		if(_Debug_Variable) then {systemChat format ["Spawning Vehicle.."]};
		_Classname = selectRandom _Vehicles;
		_Vehicle = CreateVehicle [_Classname,getPos _Spawn];
		_Vehicle setDir (getDir _Spawn);
		_Vehicle setVehicleLock "LOCKED";

		_Group = createGroup _Side;
		_Group setVariable ["acex_headless_blacklist",true];
		_Group setVariable ["lambs_danger_disableAI", true];

		if(_Debug_Variable) then {systemChat format ["Group: %3 Side: %2 - %1 Class Selected",_crewClass,_Side,_Group]};
		if(_Vehicle emptyPositions "commander" > 0) then {
			if(_Debug_Variable) then { systemChat "Creating Commander"};
			_Commander = _Group CreateUnit [_crewClass, [0,0,0], [], 5, "NONE"];
			_Commander setRank "SERGEANT";
			_Commander moveinCommander _Vehicle;
		};
		if(_Vehicle emptyPositions "gunner" > 0) then {
			if(_Debug_Variable) then { systemChat "Creating Gunner"};
			_Gunner = _Group CreateUnit [_crewClass, [0,0,0], [], 5, "NONE"];
			_Gunner setRank "CORPORAL";
			_Gunner moveinGunner _Vehicle;
		};
		if(_Vehicle emptyPositions "driver" > 0) then {
			if(_Debug_Variable) then { systemChat "Creating Driver"};
			_Driver = _Group CreateUnit [_crewClass, [0,0,0], [], 5, "NONE"];
			_Driver setRank "PRIVATE";
			_Driver moveinDriver _Vehicle;
		};
		_Vehicle forceSpeed _SpeedMeterPerSecond;
		_Group setBehaviour "CARELESS";
		_Group setCombatMode "BLUE";
		_WP = _Group addWaypoint [getPos _Waypoint,0];
		_WP setWaypointType "MOVE";
		
		_EndWP = _Group addWaypoint [_End,1];
		_EndWP setWaypointType "MOVE";

		[_Vehicle,_Group,_End] spawn {
			Params["_Vehicle","_Group","_End"];
			waitUntil {sleep 1; !Alive _Vehicle || getDammage _Vehicle > 0.5 || !canMove _Vehicle || {!Alive _X || !([_X] call ace_common_fnc_isAwake)} count units _Group == count units _Group || _Vehicle distance2D (getPos _End) < 25};
			sleep 3;
			{deleteVehicle _X} foreach units _Group; deleteVehicle _Vehicle;
		};
	};
};

