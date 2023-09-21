
// [] execVM "Scripts\OKS_SpawnEnemyVehicle.sqf";
if(!isServer) exitWith {};

Params
[
	["_ActivateObject", objNull, [objNull]],
	["_Caller", objNull, [objNull]],
	["_SpawnArray", [], [[]]],
	["_ColorText", "Blue", [""]],
	["_Side", east, [sideUnknown]]
];

sleep 1;
if !(_Caller isKindOf "LandVehicle") exitWith {SystemChat "Not inside a vehicle.."};
if (_ActivateObject getVariable ["OKS_RangeActive", false]) exitWith {SystemChat format["%1 course already active..",_ColorText]};
OKS_DeleteVehicleAtPosition = {
	params ["_Position"];
	_VehiclesToBeDeleted = getPos _Position nearEntities ["LandVehicle", 25];
	{deleteVehicle _X} forEach _VehiclesToBeDeleted;
	{if(_X distance _Position < 25) then {deleteVehicle _X}} forEach allDead;
};
{[_X] spawn OKS_DeleteVehicleAtPosition} foreach _SpawnArray;
_ActivateObject setVariable ["OKS_RangeActive",true,true];
_Targets = [];
OKS_SpawnVehicleAndCrew = {
	Private _Debug_Variable = false;
	params["_PositionObject","_Side"];
	_VehicleArray = [
		"UK3CB_ADA_O_BMP1", 
		"UK3CB_ADA_O_BMP2", 
		"UK3CB_ADA_O_BTR80a", 
		"UK3CB_CW_SOV_O_EARLY_BMD1", 
		"UK3CB_CW_SOV_O_LATE_BMD2"
	];	
	_VehicleClass = selectRandom _VehicleArray;
	_Vehicle = createVehicle [_VehicleClass, getPosATL _PositionObject, [], 0, "CAN_COLLIDE"];
	if(_Debug_Variable) then {
		SystemChat format["Spawned %1 on %2",_VehicleClass,_PositionObject];
	};	
	_Vehicle setDir (getDir _PositionObject);
	[_Vehicle,_Side] call OKS_AddVehicleCrew;
	if(_Debug_Variable) then {
		SystemChat format["Crewed %1 for %2",_Vehicle,_Side];
	};
	{_X disableAI "PATH"} foreach crew _Vehicle;
	_Vehicle;
};

{
	_VehicleTarget = [_X,_Side] call OKS_SpawnVehicleAndCrew;
	sleep 1;
	_Targets pushBackUnique _VehicleTarget; sleep 0.1;
	{ 
		_X spawn {
			params ["_crew"];
			//systemChat str _crew;
			waitUntil{isNull objectParent _crew || !Alive _crew};
			deleteVehicle _crew
		};
	} foreach crew _VehicleTarget;
} forEach _SpawnArray;
playSound3D [MISSION_ROOT + "activated.wav", _Caller];
["HQ","side",format["%2 Course Active. %1 targets present",count _Targets,_ColorText]] remoteExec ["OKS_Chat",0];
waitUntil{ {!Alive _X || !CanMove _X || {Alive _X} count crew _X == 0} count _Targets == count _Targets};
_ActivateObject setVariable ["OKS_RangeActive",false,true];
["HQ","side",format["%2 Course Completed. %1 targets destroyed",count _Targets,_ColorText]] remoteExec ["OKS_Chat",0];
playSound3D [MISSION_ROOT + "victory.wav", _Caller];
