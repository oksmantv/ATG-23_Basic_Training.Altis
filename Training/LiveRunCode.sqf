// Setup
_Debug_Variable = true;
Params ["_Target","_Caller","_Trigger","_Targets",["_RandomSpawn",false,[false]]];
{if(!isPlayer _X && _X inArea _Trigger) then {deleteVehicle _X}} foreach allUnits;
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

/// Spawn Live Targets & Hide PopUp Targets
if(_RandomSpawn) then {
	_RandomCount = 8;
	_CopyArrayTarget = [];
	{
		[_X,true] remoteExec ["hideObject",0];
		[_X,false] remoteExec ["enableSimulation",0]; sleep 0.1;
	} foreach _Targets;

	{_CopyArrayTarget pushBackUnique _X} foreach _Targets;
	_RandomTargetPositions = [];
	For "_i" from 1 to _RandomCount do {
		_Selected = selectRandom _Targets;
		_RandomTargetPositions pushBackUnique _Selected;
		_Targets deleteAt (_Targets find _Selected);
	};

	{

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
	} foreach _RandomTargetPositions;
	[_LiveTargets] remoteExec ["OKS_SetStatic",0];
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
[_Caller,format["Live Run Complete. Time: %1 seconds",_Time]] remoteExec ["SideChat",0];