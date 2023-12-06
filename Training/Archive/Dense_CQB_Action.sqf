// [Dense_1] execVM "Training\Dense_CQB_Action.sqf";
// Positions Course 1
Params["_Terminal"];
_Terminal addAction ["<t color='#FFA800'>Activate Qualification Course (Team)</t>",{ [_this select 0, 20] remoteExec ["Dense_CQB_Garrison",2]}];
_Terminal addAction ["<t color='#FF0000'>Activate Qualification Course (Squad)</t>",{ [_this select 0, 35] remoteExec ["Dense_CQB_Garrison",2]}];
_Terminal addAction ["<t color='#FDADFF'>Spectate</t>",{[true] call ace_spectator_fnc_setSpectator}];
_Terminal addAction ["<t color='#FDADFF'>Cancel All Spectate</t>",{[false] call ace_spectator_fnc_setSpectator}];