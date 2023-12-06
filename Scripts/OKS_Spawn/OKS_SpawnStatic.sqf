/* 

	spawn OKS_SpawnStatic;
 */

Params ["_UnitArray"];

Private ["_NewGroup","_Units","_Spawned"];

if(isNil "GOL_MaxUnits") then {
	GOL_MaxUnits = 1;
};

_EnemySide = EAST;
Switch (_EnemySide) do
{
	case BLUFOR:	// BLUFOR settings
	{
		_Units = [
			"B_Soldier_AR_F",
			"B_medic_F",
			"B_Soldier_GL_F",
			"B_HeavyGunner_F",
			"B_soldier_M_F",
			"B_Soldier_F",
			"B_Soldier_F",
			"B_Soldier_F",
			"B_Soldier_LAT_F"
		]; // Class names for infantry units.
	};
	case OPFOR:		// OPFOR settings
	{
		_Units = [
			"O_Soldier_AR_F",
			"O_medic_F",
			"O_Soldier_GL_F",
			"O_HeavyGunner_F",
			"O_soldier_M_F",
			"O_Soldier_F",
			"O_Soldier_F",
			"O_Soldier_F",
			"O_Soldier_LAT_F"
		];
	};
	case INDEPENDENT:	// INDEPENDENT Settings
	{
		_Units = [
			"I_Soldier_AR_F",
			"I_medic_F",
			"I_Soldier_GL_F",
			"I_soldier_M_F",
			"I_Soldier_F",
			"I_Soldier_F",
			"I_Soldier_F",
			"I_Soldier_LAT_F"
		];
	};
};

_NewGroup = CreateGroup _EnemySide;
_OriginalCount = count _UnitArray;
_ExpectedCount = (count _UnitArray) * GOL_MaxUnits;

while {(count _UnitArray) > _ExpectedCount} do {
	_randomUnit = selectRandom _UnitArray;
	_UnitArray DeleteAt (_UnitArray Find _randomUnit);
	sleep 0.2;
};

{
	_X Params ["_PosATL","_Direction","_Stance"];

	_Unit = _NewGroup CreateUnit [(selectRandom _Units), [0,0,0], [], 0, "CAN_COLLIDE"];
	_Unit setPosATL _PosATL;
	_Unit setDir _Direction;

	_Unit setRank "PRIVATE";
	[_Unit,"PATH"] remoteExec ["disableAI",0];
	[_Unit,_Stance] remoteExec ["setUnitPos",0];
	sleep 1;

} forEach _UnitArray;

