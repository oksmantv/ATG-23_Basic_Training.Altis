/*
	AUTHOR: Oksman
	Description:
		What case for compound spawns
	Usage:
		null = [1,true] spawn Compound_Hostage;
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

if(_LiveTargets) then {
	_code = {
		Params ["_TargetArray"];
		_Debug_Variable = false;

		{
			_NearUnits = _X nearEntities ["Man",5];
			{
				if(side _X == civilian && !isPlayer _X) then {
					deleteVehicle _X;
				};
			} forEach _NearUnits;
			[_X,true] remoteExec ["hideObject",0];
		} foreach _TargetArray;

		_Group = CreateGroup civilian;
		_Group setVariable ["acex_headless_blacklist",true,true];
		_Leaders = ["C_Man_casual_5_v2_F", "C_Man_casual_5_v2_F"];
		_Units = [
			"C_Man_casual_5_v2_F", 
			"C_Man_casual_4_v2_F", 
			"C_Man_casual_3_F", 
			"C_Man_casual_1_F", 
			"C_Man_casual_2_F", 
			"C_Man_casual_7_F", 
			"C_Man_casual_8_F"
		];
		
		_tempArray = [];
		{
			_tempArray pushBackUnique _X;
		} forEach _TargetArray;

		For "_i" from 1 to (count _TargetArray) do {
			
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
				[_Unit,"MOVE"] remoteExec ["disableAI",0];
				
				_Unit setPosATL (getPosATL _SelectedPosition);
				[_Unit,selectRandom["UP","MIDDLE"]] remoteExec ["setUnitPos",0];
				_Unit addMPEventHandler ["MPKilled",{[_this select 0] spawn AI_Death}];
				_Unit setBehaviour "CARELESS";
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
				if(side _X == civilian && !isPlayer _X) then {
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

	case 6: {
		[Compound_Index_6_Hostage] spawn _code;
	};		

	case 7: {
		[Compound_Index_7_Hostage] spawn _code;
	};	

	default {
		systemChat format["Case missing: %1", _case];
	};
};