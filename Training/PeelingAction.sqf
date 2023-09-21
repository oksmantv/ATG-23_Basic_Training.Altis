// [player,"VARIABLE1"] execVM "PeelingAction.sqf";
Params ["_Object","_Variable"];

_Object addAction ["Start Peeling Course",{ Call Compile Format ["%1 = True; PublicVariable '%1'",(_this select 3)]},_Variable];

