// [1] execVM "Training\DangerZone.sqf";

if(!isServer) exitWith {false};

Params ["_Index"];

switch (_Index) do {

	case 1: {
		_Units = [];
		_Units pushBackUnique ([DZ_1_1,[DZ_1_2,DZ_1_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_1_3,[DZ_1_4,DZ_1_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_1_5,[DZ_1_6,DZ_1_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_1_1,[DZ_1_2,DZ_1_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_1_3,[DZ_1_4,DZ_1_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_1_5,[DZ_1_6,DZ_1_0]] call Attack_DoMove);

		systemChat str _Units;
		waitUntil {sleep 1; {Alive _X || [_X] call ace_common_fnc_isAwake} count _Units == 0};
		["HQ","side","Section cleared. Please continue."] remoteExec ["OKS_Chat",0];	
	};

	case 2: {
		_Units = [];		
		_Units pushBackUnique ([DZ_2_1,[DZ_2_2,DZ_2_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_2_3,[DZ_2_4,DZ_2_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_2_5,[DZ_2_6,DZ_2_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_2_1,[DZ_2_2,DZ_2_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_2_3,[DZ_2_4,DZ_2_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_2_5,[DZ_2_6,DZ_2_0]] call Attack_DoMove);

		waitUntil {sleep 1; {Alive _X || [_X] call ace_common_fnc_isAwake} count _Units == 0};
		["hq","side","Section cleared. Please continue."] remoteExec ["OKS_Chat",0];		
	};

	case 3: {
		_Units = [];		
		_Units pushBackUnique ([DZ_3_1,[DZ_3_2,DZ_3_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_3_3,[DZ_3_4,DZ_3_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_3_5,[DZ_3_6,DZ_3_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_3_1,[DZ_3_2,DZ_3_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_3_3,[DZ_3_4,DZ_3_0]] call Attack_DoMove); sleep 5;
		_Units pushBackUnique ([DZ_3_5,[DZ_3_6,DZ_3_0]] call Attack_DoMove);

		waitUntil {sleep 1; {Alive _X || [_X] call ace_common_fnc_isAwake} count _Units == 0};
		["hq","side","Section cleared. Please continue."] remoteExec ["OKS_Chat",0];	
	};
};
