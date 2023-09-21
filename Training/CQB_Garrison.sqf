	// OKS_Garrison_Compound
	// [5,getPos player,east,flag,true] spawn CQB_Garrison;
	// [5,getPos player,east,flag,true] execVM "CQB_Garrison.sqf";

	if(HasInterface && !isServer) exitWith {};

	//Params ["_NumberInfantry","_Position","_Side","_Flag","_RandomMove"];
	Params
	[
		["_NumberInfantry", 0, [0]],
		["_Position", objNull, [objNull,[]]],
		["_Side", sideEmpty, [sideUnknown]],
		["_Flag", objNull, [objNull]],
		["_RandomMove", false, [true]]
	];
	Private ["_UnitArray"];
	[_Flag,1] call BIS_fnc_dataTerminalAnimate;
	Switch (_Side) do
	{
		case BLUFOR:	// BLUFOR settings
		{
			// Unit classes are compatible with multiple class names, will select randomly. Example: ["B_Pilot_F","B_Crewman_F"];
			_Leaders = ["B_Soldier_SL_F","B_Soldier_TL_F"];	// Squad/Team leader classes.
			_Units = [
				"B_Soldier_A_F",
				"B_Soldier_AR_F",
				"B_Soldier_AR_F",
				"B_medic_F",
				"B_medic_F",
				"B_crew_F",
				"B_Soldier_GL_F",
				"B_HeavyGunner_F",
				"B_soldier_M_F",
				"B_Soldier_F",
				"B_Soldier_F",
				"B_Soldier_F",
				"B_Soldier_LAT_F"
			]; // Class names for infantry units.
			_UnitArray = [_Leaders,_Units];
		};
		case OPFOR:		// OPFOR settings
		{
			_Leaders = ["O_Soldier_SL_F","O_Soldier_TL_F"];
			_Units = [
				"O_Soldier_A_F",
				"O_Soldier_AR_F",
				"O_Soldier_AR_F",
				"O_medic_F",
				"O_medic_F",
				"O_crew_F",
				"O_Soldier_GL_F",
				"O_HeavyGunner_F",
				"O_soldier_M_F",
				"O_Soldier_F",
				"O_Soldier_F",
				"O_Soldier_F",
				"O_Soldier_LAT_F"
			];
			_UnitArray = [_Leaders,_Units];
		};
		case independent:	// INDEPENDENT Settings
		{
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
			_UnitArray = [_Leaders,_Units];
		};

		// DO NOT EDIT ANYTHING BELOW \\
		default
		{
			_SkillVariables = "";
			_Skill = "";
			_Leaders = "";
			_Units = "";
			_UnitArray = "";
		};
	};
	_UnitArray Params ["_Leaders","_Units","_Officer"];

	Private ["_Unit","_House","_Houses"];
	Private _Debug_Variable = true;


		 /* Arguments:
			 * 0: The building(s) nearest this position are used <POSITION>
			 * 1: Limit the building search to those type of building <ARRAY>
			 * 2: Units that will be garrisoned <ARRAY>
			 * 3: Radius to fill building(s) <SCALAR> (default: 50)
			 * 4: 0: even filling, 1: building by building, 2: random filling <SCALAR> (default: 0)
			 * 5: True to fill building(s) from top to bottom <BOOL> (default: false) (note: only works with filling mode 0 and 1)
			 * 6: Teleport units <BOOL> (default: false)
		 */
		//private _type = typeOf nearestBuilding (getPos (leader _group));

		switch (typeName _Position) do {
			case "OBJECT":{
				_House = _Position;
				_Houses = [_House];
			};
			case "ARRAY":{
				_House = _Position select 0;
				_Houses = _Position;
			}
		};
		_NumberInfantry = round(_NumberInfantry);
		Private _Infantry = round(_NumberInfantry / (count _Houses));
		Private _AllUnits = [];
		if(_Debug_Variable) then {SystemChat format ["Total %1 - Each Building %2",_NumberInfantry,_Infantry]};
		waitUntil {sleep 1; !(isNil "ace_ai_fnc_garrison")};
		{

			waitUntil {sleep 1; !(isNil "AI_Death")};
			private _MaxPositions = count ([_X] call BIS_fnc_buildingPositions);
			private _InfantryThisBuilding = _Infantry;

			if(_InfantryThisBuilding > _MaxPositions) then {
				private _Difference = _Infantry - _MaxPositions;
 				_InfantryThisBuilding = _MaxPositions;
				_NumberInfantry = _NumberInfantry - _Difference;
				if(_Debug_Variable) then {SystemChat format ["Building Size: %1 - Spawning %2",_MaxPositions,_InfantryThisBuilding]};
			};
			_Group = CreateGroup _Side;
			for "_i" from 1 to _InfantryThisBuilding do
			{
				Private "_Unit";
				if ( (count (units _Group)) == 0 ) then
				{
					_Class = (_Leaders call BIS_FNC_selectRandom);
					if(_Debug_Variable) then { SystemChat format ["Class: %1",_Class]};
					_Unit = _Group CreateUnit [_Class, getPos _X, [], 0, "CAN_COLLIDE"];
					_Unit setRank "SERGEANT";
				} else {
					_Class = (_Units call BIS_FNC_selectRandom);
					if(_Debug_Variable) then { SystemChat format ["Class: %1",_Class]};
					_Unit = _Group CreateUnit [_Class, _X getPos [(random 2),(random 360)], [], 0, "CAN_COLLIDE"];
					_Unit setRank "PRIVATE";

				};
				if(_Debug_Variable) then {SystemChat format ["%1 Pos %2",group _unit,getPos _Unit]};
				_Unit disableAI "PATH";
				_Unit setUnitPos (selectRandom ["UP","MIDDLE"]);
				_Unit addMPEventHandler ["MPKilled",{[_this select 0] spawn AI_Death}];
				_Unit setBehaviour "COMBAT";
				_AllUnits pushBackUnique _Unit;
				sleep 0.2;
			};

			[getPos _X, [typeof _X], units _Group, 5, 2, false, true] remoteExec  ["ace_ai_fnc_garrison",0];
			sleep 2;
			[_Group] remoteExec ["OKS_SetStatic",0];
			if(_RandomMove) then { [_Group,0.25,45] spawn OKS_EnablePath; };
		} foreach _Houses;


		sleep (0.8*_NumberInfantry);
		_Flag setObjectTextureGlobal [0,"image\notready.jpg"];
		//[_Flag,"activated.wav"] remoteExec ["OKS_PlaySound",0];
		playSound3D [MISSION_ROOT + "activated.wav", _Flag, false, _Flag, 5, 1, 25];
		[_Flag,0] call BIS_fnc_dataTerminalAnimate;
		waitUntil{sleep 5; if(false) then {SystemChat format["%1 Alive",{Alive _X} count _AllUnits]}; {Alive _X} count _AllUnits == 0};
		sleep 5;
		_Flag setObjectTextureGlobal [0,"image\ready.jpg"];
		playSound3D [MISSION_ROOT + "evacuate_area.wav", _House, false, _House, 5, 1, 25];
		//[_House,"evacuate_area.wav"] remoteExec ["OKS_PlaySound",0];


