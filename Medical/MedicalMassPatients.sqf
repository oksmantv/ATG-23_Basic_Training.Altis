params ["_numOfPatients", "_object"];

playSound3D [MISSION_ROOT + "activated.wav", _object];

MED_MASS_READY = false;

_positions = [];

for "_i" from 1 to 10 do {
	_pos = format ["MassPSpawn_%1", _i];
	_positions pushBackUnique (missionNamespace getVariable _pos);
};

_tempArr = (-1 allObjects 0) inAreaArray ([getPos FoliageTrigger] + (triggerArea FoliageTrigger));
_triggerAreaContent = [];

{
	if ((typeOf _x) in ["GW_clutter_c_Grass_Dry","GW_clutter_c_Grass_Green","GW_Tree_t_OleaE1s_F","GW_Tree_t_FicusB2s_F","GW_Bush_b_ArundoD2s_F","GW_Bush_b_FicusC1s_F","GW_Bush_b_FicusC2s_F"]) then {
		_triggerAreaContent pushBackUnique _x;
	};
} forEach _tempArr;

switch (_numOfPatients) do {
	case -1: {
		// Enable Foliage
		if (isObjectHidden (_triggerAreaContent select 0)) then {
			{
				_x hideObjectGlobal false;
			} forEach _triggerAreaContent;
		} else {
			systemChat "Error: Foliage already Enabled";
		};
	};

	case -2: {
		// Disable Foliage
		if !(isObjectHidden (_triggerAreaContent select 0)) then {
			{
				_x hideObjectGlobal true;
			} forEach _triggerAreaContent;
		} else {
			systemChat "Error: Foliage already Disabled";
		};
	};

	default {
		_numArray = [];

		{
			_x setObjectTextureGlobal [0,"#(argb,8,8,3)color(1,0,0,1.0,ca)"];
		} forEach [IndicatorL_1,IndicatorL_2,IndicatorL_3,IndicatorL_4];
		
		_trigArr = ((entities "Man") select {!isPlayer _x}) inAreaArray ([getPos FoliageTrigger] + (triggerArea FoliageTrigger));

		{deleteVehicle _x} forEach _trigArr;

		// Including an attempt at only one casualty being created at any one position (Does not work for some reason)
		for "_j" from 1 to _numOfPatients do {
			_randNum = random [0, (floor (count _positions / 2)), (count _positions)];
			while {_randNum in _numArray} do {
				_randNum = random [0, (floor (count _positions / 2)), (count _positions)];
			};
			_numArray pushBackUnique _randNum;
			[_object, (_positions select _randNum), "fatal"] execVM "Medical\MedicalPatient.sqf";
		};
	};
};