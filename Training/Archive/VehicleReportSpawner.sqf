Params ["_Object","_ArrowArray","_Target"];
playSound3D [MISSION_ROOT + "activated.wav", _Object];
// [[Arrow_1,Arrow_2,Arrow_3]] execVM "3DReportSpawner.sqf";

_Positions = [
	[661.752,1202.87,0],
	[731.007,1220.02,0],
	[768.889,1161.13,0],
	[694.426,1153.02,0],
	[694.556,1290.39,0],
	[778.896,1278.74,0],
	[920.656,1219.34,0],
	[770.128,1129.09,0],
	[647.35,1437.47,0]

];

_Vehicles = [
	"LOP_AA_M113_D",
	"B_APC_Wheeled_01_cannon_F",
	"rhsgref_cdf_b_t72ba_tv",
	"LOP_ISTS_OPF_BMP1",
	"LOP_ISTS_OPF_BMP2",
	"LOP_IA_BTR80",
	"rhsgref_BRDM2_msv",
	"rhsgref_cdf_b_btr80",
	"B_AFV_Wheeled_01_cannon_F",
	"I_LT_01_cannon_F",
	"I_LT_01_AT_F"
];

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

private ["_SelectedPosition","_Vehicle","_Position","_Positions"];
while{true} do {
	_SelectedPositions = _Positions select {_X NearEntities ["LandVehicle", 3] isEqualTo []};
	if(_SelectedPositions isNotEqualTo []) exitWith {
		_Position = selectRandom _SelectedPositions;
		SystemChat "No Vehicle Nearby Found - Spawning.."
	};
	sleep (0.5 + round(random 2));
};
Private ["_Vehicle"];
_Vehicle = createVehicle [selectRandom _Vehicles, [0,0,0], [], 0, "CAN_COLLIDE"];
_Vehicle setPosATL _Position;
_Player = selectRandom AllPlayers;
_Vehicle setDir (_Vehicle getDir _Player);

Private ["_Group"];
_Group = [_Vehicle,WEST] call OKS_AddVehicleCrew;

{
	_X setCombatMode "BLUE";
	_X setBehaviour "COMBAT";
	_X setUnitPos "UP";
	_X disableAI "AUTOTARGET";
	_X disableAI "PATH";
	_X setSkill 1;

} foreach units _Group;

if(!isNil "_Target") then {
	_Vehicle setSkill 1;
	_Vehicle doWatch _Target;
	_Vehicle doTarget _Target;
	_Vehicle reveal [_Target,4];
	sleep 2;
	[_Vehicle,_Target] spawn {

		Params ["_Vehicle","_Target"];
		while {Alive _Vehicle} do {
			_Vehicle doWatch _Target;
			_Vehicle doTarget _Target;
			_Vehicle reveal [_Target,4];
			if (needReload _Vehicle == 1) then { reload _Vehicle; sleep 3.5; };
			_Vehicle selectWeaponTurret [(weapons _Vehicle select 0),[0]];
			_Vehicle fire currentMuzzle (gunner _Vehicle);
			(sleep 0.15 + (random 0.85))
		}
	};
};

{_X setDir (_X getDir _Vehicle)} foreach _ArrowArray;
waitUntil {sleep 1; !Alive _Vehicle || getDammage _Vehicle > 0.5 || {Alive _X} count units _Group isEqualTo 0 || {_X getVariable ["ACE_isUnconscious", false]} count units _Group == count units _Group };
sleep 15;
deleteVehicle _Vehicle;
{deleteVehicle _X} foreach units _Group;