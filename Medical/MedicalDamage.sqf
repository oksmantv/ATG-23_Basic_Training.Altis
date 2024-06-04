params ["_Unit", "_Severe", ["_Terminal", ""]];
removeHeadgear _Unit;
removeVest _Unit;
removeBackpack _Unit;
removeAllWeapons _Unit;
_NoOfWounds = (round ((random [0.1, 0.25, 0.4])* 10));
_BodyPart = selectRandom ["RightLeg", "LeftLeg", "Body", "RightArm", "LeftArm"];
_Severe = toLower _Severe;

switch (_Severe) do {
	case "easy":{
		[_Unit, selectRandom[0, Random[0.4, 0.6, 1]], "RightLeg", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0, Random[0.4, 0.6, 1]], "LeftLeg", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0, Random[0.4, 0.6, 1]], "Body", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0, 0.3], "head", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0, Random[0.4, 0.6, 1]], "RightArm", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0, Random[0.4, 0.6, 1]], "LeftArm", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];

		For "_i" from 0 to _NoOfWounds do {
			[_unit, Random[0.1, 0.4, 0.6], _BodyPart, selectrandom ["stab", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			sleep 0.1;
		};
		_Unit setUnitPos "DOWN";
		[_unit, true] call ace_medical_fnc_setUnconscious;
	};

	case "medium":{
		[_Unit, selectRandom[0.2, Random[0.6, 1, 1.5]], "RightLeg", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0.2, Random[0.6, 1, 1.5]], "LeftLeg", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0.4, Random[0.6, 1, 1.5]], "Body", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0, 0.3], "head", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0.6, Random[0.6, 1, 1.5]], "RightArm", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0.6, Random[0.6, 1, 1.5]], "LeftArm", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];

		if (_BodyPart == "Body" && _NoOfWounds > 2) then {
			_NoOfWounds = 2
		};
		For "_i" from 0 to _NoOfWounds do {
			[_unit, Random[0.5, 0.75, 1.5], _BodyPart, selectrandom ["stab", "bullet", "falling"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			sleep 0.1;
		};
		_Unit setUnitPos "DOWN";
		[_unit, true] call ace_medical_fnc_setUnconscious;
	};

	case "heavy":{
		[_Unit, selectRandom[0.5, Random[2.1, 2.4, 3]], "RightLeg", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0.5, Random[2.1, 2.4, 3]], "LeftLeg", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0, Random[1.5, 1.6, 2.5]], "Body", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0, 0.3], "head", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0.5, Random[2.1, 2.4, 3]], "RightArm", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, selectRandom[0.5, Random[2.1, 2.4, 3]], "LeftArm", selectrandom ["stab", "bullet", "grenade"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];

		if (_BodyPart == "Body" && _NoOfWounds > 2) then {
			_NoOfWounds = 2
		} else {
			_NoOfWounds = _NoOfWounds + 2
		};
		For "_i" from 0 to _NoOfWounds do {
			[_unit, Random[1, 2.1, 3], _BodyPart, selectrandom ["stab", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			sleep 0.1;
		};
		_Unit setUnitPos "DOWN";
		[_unit, true] call ace_medical_fnc_setUnconscious;
	};

	case "lot": {
		_Unit setUnitPos "DOWN";
		_unit setVariable ["ace_medical_bloodVolume", 5.1, true];
		[_unit, true] call ace_medical_fnc_setUnconscious;
		for "_j" from 0 to 2 do {
			[_Unit, selectRandom [0.25,0.5,0.75], selectRandom ["LeftLeg", "RightLeg"], selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			[_Unit, selectRandom [0.25,0.5,0.75], selectRandom ["LeftArm", "RightArm"], selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			sleep 0.1;
		};
		[_Unit, 0.4, "Body", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, 0.2, "Head", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
	};

	case "large": {
		_unit setVariable ["ace_medical_bloodVolume", 4.2, true];
		_Unit setUnitPos "DOWN";
		[_unit, true] call ace_medical_fnc_setUnconscious;
		for "_j" from 0 to 2 do {
			[_Unit, selectRandom [0.25,0.5,0.75], selectRandom ["LeftLeg", "RightLeg"], selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			[_Unit, selectRandom [0.25,0.5,0.75], selectRandom ["LeftArm", "RightArm"], selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			sleep 0.1;
		};
		[_Unit, 0.4, "Body", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, 0.2, "Head", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
	};

	case "fatal": {
		_Unit setUnitPos "DOWN";
		[_unit, true] call ace_medical_fnc_setUnconscious;
		_unit setVariable ["ace_medical_bloodVolume", 3.6, true];
		sleep 1;

		for "_j" from 0 to 2 do {
			[_Unit, selectRandom [0.25,0.5,0.75], selectRandom ["LeftLeg", "RightLeg"], selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			[_Unit, selectRandom [0.25,0.5,0.75], selectRandom ["LeftArm", "RightArm"], selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			sleep 0.1;
		};
		[_Unit, 0.4, "Body", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, 0.2, "Head", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];

		if ((typeOf _Terminal) isEqualTo "Land_InfoStand_V2_F") then {
			MED_MASS_READY = true;
		};
	};

	case "qualification": {
		_unit setVariable ["ace_medical_bloodVolume", 3.5, true];
		_Unit setUnitPos "DOWN";

		[_unit, true] call ace_medical_fnc_setUnconscious;

		for "_j" from 0 to 2 do {
			[_Unit, selectRandom [0.25,0.5,0.75], selectRandom ["LeftLeg", "RightLeg"], selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			[_Unit, selectRandom [0.25,0.5,0.75], selectRandom ["LeftArm", "RightArm"], selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			sleep 0.1;
		};
		[_Unit, 0.4, "Body", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, 0.2, "Head", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
	};

	case "dead": {
		_Unit setUnitPos "DOWN";
		[_unit, true] call ace_medical_fnc_setUnconscious;
		_Unit setVariable ["ace_medical_bloodVolume", (selectRandom [3.6, 4.2])];

		_Unit setDamage 1;
		for "_j" from 0 to 6 do {
			_arm = selectRandom ["LeftArm", "RightArm"];
			_leg = selectRandom ["LeftLeg", "RightLeg"];
			[_Unit, 2, _leg, selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			[_Unit, 2, _arm, selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
			sleep 0.1;
		};
		[_Unit, 0.2, "Body", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
		[_Unit, 0.2, "Head", selectRandom ["avulsion", "bullet"]] remoteExec ["ace_medical_fnc_addDamageToUnit", 2];
	};
};
if (_Severe isEqualTo "dead") then {
	sleep 3;
};

sleep 3;
_Unit setVariable ["GOL_Qualification_Ready", true, true];
if (_Severe in ["easy", "medium", "heavy", "lot", "large", "fatal", "dead"]) then {
	// playSound3D [MISSION_ROOT + "blood_loss.wav", _Unit];
};