//	[] execVM "Scripts\OKS_Vehicles\Init.sqf";
//
//	This initializes all the functions for OKS Ambience.
//
//	Made by Oksman

if (hasInterface && !isServer) exitWith {false};	// Ensures only server or HC runs this script

// Functions
//OKS_Tanker = compile preprocessFileLineNumbers "Scripts\OKS_Vehicles\OKS_Tanker.sqf";
//OKS_CreateCrew = compile preprocessFileLineNumbers "Scripts\OKS_Vehicles\OKS_CreateCrew.sqf";
OKS_Helicopter = compile preprocessFileLineNumbers "Scripts\OKS_Vehicles\OKS_Helicopter.sqf";
OKS_Mechanized = compile preprocessFileLineNumbers "Scripts\OKS_Vehicles\OKS_Mechanized.sqf";
OKS_ReduceDamage = compile preprocessFileLineNumbers "Scripts\OKS_Vehicles\OKS_ReduceDamage.sqf";




