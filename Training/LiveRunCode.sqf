// Setup
_Debug_Variable = true;
// [Terminal_1,player,House_1_Trigger,[House_1_T1,House_1_T2,House_1_T3,House_1_T4,House_1_T5],4,true,true] execVM "Training\LiveRunCode.sqf"

Params ["_Target","_Caller","_Trigger","_Targets","_RandomCount",["_RandomSpawn",true,[false]],["_Hostage",false,[true]]];
Private ["_Class","_LiveTargets","_Hostages","_HostageGroup","_Unit"];

{if(!isPlayer _X && _X inArea _Trigger) then {deleteVehicle _X}} foreach allUnits;
{(nearestBuilding _Trigger) animate [_X, 0]} foreach (animationNames nearestBuilding _Trigger);
[_Target,1] call BIS_fnc_dataTerminalAnimate;
_LiveTargets = CreateGroup independent;
_Leaders = ["I_Soldier_SL_F","I_Soldier_TL_F"];
_Units = [
	"I_Soldier_A_F",
	"I_Soldier_AR_F",
	"I_Soldier_AR_F",
	"I_medic_F",
	"I_crew_F",
	"I_Soldier_GL_F",
	"I_soldier_M_F",
	"I_Soldier_F",
	"I_Soldier_F",
	"I_Soldier_F",
	"I_Soldier_LAT_F"
];
_Hostages = [
	"UK3CB_TKC_C_CIV"
];

/// Spawn Live Targets & Hide PopUp Targets
if(_RandomSpawn) then {
	_CopyArrayTarget = [];
	{
		[_X,true] remoteExec ["hideObject",0];
		[_X,false] remoteExec ["enableSimulation",0]; sleep 0.1;
	} foreach _Targets;

	{_CopyArrayTarget pushBackUnique _X} foreach _Targets;
	_RandomTargetPositions = [];
	For "_i" from 1 to _RandomCount do {
		_Selected = selectRandom _CopyArrayTarget;
		_RandomTargetPositions pushBackUnique _Selected;
		_CopyArrayTarget deleteAt (_CopyArrayTarget find _Selected);
	};

	_LiveTargets = createGroup independent;
	_HostageGroup = createGroup civilian;
	{
		systemChat str _X;
		if(_Hostage && (_RandomTargetPositions find _X == 1)) then {	
			// Spawn Hostage
			_Class = selectRandom _Hostages;
			_Unit = _HostageGroup CreateUnit [_Class, _X, [], 0, "CAN_COLLIDE"];
		} else {
			// Spawn Unit	
			_Class = (selectRandom _Units);
			_Unit = _LiveTargets CreateUnit [_Class, _X, [], 0, "CAN_COLLIDE"];
		};

		if(_Debug_Variable) then { SystemChat format ["Class: %1",_Class]};
		_Unit setPosATL (getPosATL _X);
		_Unit setDir (getDir _X - 180);
		_Unit setRank "PRIVATE";
		
		//systemChat str (_RandomTargetPositions find _X);
		if(_Hostage && (_RandomTargetPositions find _X == 1)) then {
			[_Unit, true] call ACE_captives_fnc_setHandcuffed;
		};

		// Setup Unit
		if(_Debug_Variable) then {SystemChat format ["%1 Pos %2",group _unit,getPos _Unit]};
		_Unit disableAI "PATH";
		_Unit setUnitPos (selectRandom ["UP","MIDDLE"]);
		_Unit addMPEventHandler ["MPKilled",{[_this select 0] spawn AI_Death}];
		_Unit setBehaviour "COMBAT";
		sleep 0.1;
	} foreach _RandomTargetPositions;
	[_LiveTargets] remoteExec ["OKS_SetStatic",0];
	[_HostageGroup] remoteExec ["OKS_SetStatic",0];
} else {
	{
		[_X,true] remoteExec ["hideObject",0];
		[_X,false] remoteExec ["enableSimulation",0];

		sleep 0.2;

		// Spawn Unit
		_Class = (_Units call BIS_FNC_selectRandom);
		if(_Debug_Variable) then { SystemChat format ["Class: %1",_Class]};
		_Unit = _LiveTargets CreateUnit [_Class, _X, [], 0, "CAN_COLLIDE"];
		_Unit setPosATL (getPosATL _X);
		_Unit setRank "PRIVATE";

		// Setup Unit
		if(_Debug_Variable) then {SystemChat format ["%1 Pos %2",group _unit,getPos _Unit]};
		_Unit disableAI "PATH";
		_Unit setUnitPos (selectRandom ["UP","MIDDLE"]);
		_Unit addMPEventHandler ["MPKilled",{[_this select 0] spawn AI_Death}];
		_Unit setBehaviour "COMBAT";
		sleep 0.1;
	} foreach _Targets;
	[_LiveTargets] remoteExec ["OKS_SetStatic",0];
	{_X doWatch getPos _Target} foreach units _LiveTargets;
};


// Delay and then Ready
sleep 2;
playSound3D [MISSION_ROOT + "activated.wav", _Target, false, _Target, 5, 1, 25];
[_Target,0] call BIS_fnc_dataTerminalAnimate;
waitUntil{triggerActivated _Trigger};
_Time = 0;
waitUntil{sleep 0.01; _Time = _Time + 0.01; {!Alive _X || !([_X] call ace_common_fnc_isAwake)} count units _LiveTargets isEqualTo (count units _LiveTargets)};

if({!Alive _X || !([_X] call ace_common_fnc_isAwake)} count units _HostageGroup isEqualTo (count units _HostageGroup) && _Hostage) then {
	[_Caller,format["Live Run Failed. Time: %1 seconds",_Time]] remoteExec ["SideChat",0];
} else {
	[_Caller,format["Live Run Complete. Time: %1 seconds",_Time]] remoteExec ["SideChat",0];
}
