// // Global Commands
// Compound_Spawns = compile preprocessFileLineNumbers "Training\CompoundBreach\Compound_Spawns.sqf";
// Compound_Actions = compile preprocessFileLineNumbers "Training\CompoundBreach\Compound_Actions.sqf";
// Compound_Hostage = compile preprocessFileLineNumbers "Training\CompoundBreach\Compound_Hostage.sqf";
// SafeZone_Player = compile preprocessFileLineNumbers "Training\CompoundBreach\SafeZone_Player.sqf";

// if(!isServer) exitWith {false};

// Compound_Index_1 = [];Compound_Index_2 = [];Compound_Index_3 = [];
// Compound_Index_4 = [];Compound_Index_5 = [];Compound_Index_6 = []; Compound_Index_6_Hostage = [];
// Compound_Index_7 = [];Compound_Index_8 = []; Compound_Index_7_Hostage = [];

// publicVariable "Compound_Index_1"; publicVariable "Compound_Index_2"; publicVariable "Compound_Index_3";
// publicVariable "Compound_Index_4"; publicVariable "Compound_Index_5"; publicVariable "Compound_Index_6";
// publicVariable "Compound_Index_7"; publicVariable "Compound_Index_8"; publicVariable "Compound_Index_6_Hostage";
// publicVariable "Compound_Index_7_Hostage";
// waitUntil {sleep 1; !isNil "Compound_Actions"};
// [Compound_2,2,Compound2Trigger] remoteExec ["Compound_Actions",0];
// [Compound_3,3,Compound3Trigger] remoteExec ["Compound_Actions",0];
// [Compound_4,4,Compound4Trigger] remoteExec ["Compound_Actions",0];
// [Compound_5,5,Compound5Trigger] remoteExec ["Compound_Actions",0];
// [Compound_6,6,Compound6Trigger] remoteExec ["Compound_Actions",0];
// [Compound_7,7,Compound7Trigger] remoteExec ["Compound_Actions",0];

// [Neochori_1_S,1,Compound_1] remoteExec ["Compound_Actions",0];
// [Neochori_1_W,1,Compound_1] remoteExec ["Compound_Actions",0];
// [Neochori_1_N,1,Compound_1] remoteExec ["Compound_Actions",0];

// waitUntil {sleep 1; !isNil "SafeZone_Player"};
// null = [SafeOnZone_6,true] spawn SafeZone_Player;
// null = [SafeOffZone_6,false] spawn SafeZone_Player;
// null = [SafeOnZone_7,true] spawn SafeZone_Player;
// null = [SafeOffZone_7,false] spawn SafeZone_Player;