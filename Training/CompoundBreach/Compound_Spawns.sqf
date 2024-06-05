/*
	AUTHOR: Oksman
	Description:
		What case for compound spawns
	Usage:
		null = [1,true] spawn Compound_Spawns;
	Parameters:
		#0: Number:	Activate zone
	Returning Value:
		None
*/

if !(isServer) then {false};

params [
	"_case",
	"_LiveTargets",
	"_ProcentageOfTargets",
	"_Trigger"
];

private ["_code"];

_Buildings = (nearestObjects [_Trigger, ["House"], 100]) select {_X inArea _Trigger};
{_Building = _X; {(_Building) animate [_X, 0]} foreach (animationNames _Building)} foreach _Buildings;

if(_LiveTargets) then {
	_code = {
		Params ["_TargetArray","_ProcentageOfTargets"];
		_Debug_Variable = false;

		{
			_NearUnits = _X nearEntities ["Man",5];
			{
				if(side _X == independent && !isPlayer _X) then {
					deleteVehicle _X;
				};
			} forEach _NearUnits;
			[_X,true] remoteExec ["hideObject",0];
		} foreach _TargetArray;

		_Group = CreateGroup independent;
		_Group setVariable ["acex_headless_blacklist",true,true];
		
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
		
		_tempArray = [];
		{
			_tempArray pushBackUnique _X;
		} forEach _TargetArray;

		For "_i" from 1 to (round((count _TargetArray) * _ProcentageOfTargets)) do {
			
			_SelectedPosition = selectRandom _tempArray;

			if(!isNil "_SelectedPosition") then {			
				_tempArray deleteAt (_tempArray find _SelectedPosition);
				Private "_Unit";
				if ( (count (units _Group)) == 0 ) then
				{
					_Class = (_Leaders call BIS_FNC_selectRandom);
					if(_Debug_Variable) then { SystemChat format ["Class: %1",_Class]};
					_Unit = _Group CreateUnit [_Class, [0,0,0], [], 0, "CAN_COLLIDE"];
					_Unit setRank "SERGEANT";
				} else {
					_Class = (_Units call BIS_FNC_selectRandom);
					if(_Debug_Variable) then { SystemChat format ["Class: %1",_Class]};
					_Unit = _Group CreateUnit [_Class, [0,0,0], [], 0, "CAN_COLLIDE"];
					_Unit setRank "PRIVATE";
				};
				if(_Debug_Variable) then {SystemChat format ["%1 Pos %2",group _unit,getPos _Unit]};
				[_Unit,"PATH"] remoteExec ["disableAI",0];
				
				_Unit setPosATL (getPosATL _SelectedPosition);
				[_Unit,selectRandom["UP","MIDDLE"]] remoteExec ["setUnitPos",0];
				_Unit addMPEventHandler ["MPKilled",{[_this select 0] spawn AI_Death}];
				_Unit setBehaviour "COMBAT";
				_Unit setDir (getDir _SelectedPosition - 180);		
			}
		};
	};
} else {
	_code = {
		Params ["_TargetArray"];

		{
			_NearUnits = _X nearEntities ["Man",5];
			{
				if(side _X == independent && !isPlayer _X) then {
					deleteVehicle _X;
				};
			} forEach _NearUnits;
			[_X,false] remoteExec ["hideObject",0];
			_X animateSource ["terc", 0];

			_X addEventHandler ["Hit",{[_this select 0] spawn AI_Death}];
		} foreach _TargetArray;
	}
};

switch (_case) do {

	case 1: {
		[Compound_Index_1,_ProcentageOfTargets] spawn _code;
	};

	case 2: {
		[Compound_Index_2,_ProcentageOfTargets] spawn _code;
	};

	case 3: {
		[Compound_Index_3,_ProcentageOfTargets] spawn _code;
	};	

	case 4: {
		[Compound_Index_4,_ProcentageOfTargets] spawn _code;
	};

	case 5: {
		[Compound_Index_5,_ProcentageOfTargets] spawn _code;
	};	

	case 6: {
		[Compound_Index_6,_ProcentageOfTargets] spawn _code;
	};	

	case 7: {
		[Compound_Index_7,_ProcentageOfTargets] spawn _code;
	};		

	default {
		systemChat format["Case missing: %1", _case];
	};
};

waitUntil {sleep 5; count list _Trigger > 0};
waitUntil {sleep 5; {Alive _X || [_X] call ace_common_fnc_isAwake} count list _Trigger == 0};

_Buildings = (nearestObjects [_Trigger, ["House"], 100]) select {_X inArea _Trigger};
{_Building = _X; {(_Building) animate [_X, 1]} foreach (animationNames _Building)} foreach _Buildings;
_PlayerGroups = (allGroups select {isPlayer (leader _X) && (leader _X) inArea _Trigger});
{
	[(leader _X),"side",format["Compound %1: Exercise complete.", _case]] remoteExec ["OKS_Chat",0];
} forEach _PlayerGroups;
playSound3D [MISSION_ROOT + "Training\MarksmanQualification\oks_buzzer.ogg", _Trigger, false, _Trigger, 5, 1, 50]; sleep 1;
playSound3D [MISSION_ROOT + "evacuate_area.wav", _Trigger, false, _Trigger, 5, 1, 50];