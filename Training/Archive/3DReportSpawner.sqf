Params ["_Object","_ArrowArray"];
SystemChat str _ArrowArray;
playSound3D [MISSION_ROOT + "activated.wav", _Object];
// [[Arrow_1,Arrow_2,Arrow_3]] execVM "3DReportSpawner.sqf";

_Positions = [
	[15877.8,18120.3,0],
	[15875.6,18125.5,0],
	[15856.1,18165,0],
	[15857,18162.2,0],
	[15819,18143.8,0],
	[15818.4,18140.5,0],
	[15981.4,18171.1,0],
	[15939.4,18160.2,0],
	[15962.3,18298,0],
	[15951.9,18291.7,0],
	[15840.6,18190.6,0],
	[15833.6,18214.7,0],
	[15817.2,18195.5,0],
	[15989.9,18334.1,0],
	[15873.5,18282,0],
	[15893.2,18307.7,0],
	[15526,18008.3,0],
	[15813.6,18004.8,0],
	[15720.6,18306,0],
	[15744.2,18355.8,0]
];

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
private ["_SelectedPosition","_Unit"];
while{true} do {
	_SelectedPosition = selectRandom _Positions;
	if(_SelectedPosition NearEntities ["Man", 2] isEqualTo []) exitWith { SystemChat "No Units Nearby Found - Spawning.."};
};
_Group = createGroup EAST;
_Unit = _Group CreateUnit [(_Units call BIS_FNC_selectRandom), [0,0,0], [], -1, "NONE"];
_Unit setCombatMode "BLUE";
_Unit setUnitPos "UP";
_Unit disableAI "PATH";
_Unit setPosATL _SelectedPosition;
_Player = selectRandom AllPlayers;
_Unit setDir (_Unit getDir _Player);
_Unit doWatch _Player;
_Unit doTarget _Player;

SystemChat str _ArrowArray;
{_X setDir (_X getDir _Unit)} foreach _ArrowArray;
waitUntil {sleep 5; !Alive _Unit};
deleteVehicle _Unit;