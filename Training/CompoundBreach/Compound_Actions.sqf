params ["_terminal","_index","_Trigger"];

_terminal AddAction ["<t color='#027AED'>Reset Popup Targets</t>",{_index = (_this select 3 select 0); _Trigger = (_this select 3 select 1); [_index,false,1,_Trigger] remoteExec ["Compound_Spawns",2]},[_index,_Trigger],1,true,true,"","_target distance _this < 2"];
_terminal AddAction ["<t color='#3EED02'>Initiate Live Targets - Level 1</t>",{_index = (_this select 3 select 0); _Trigger = (_this select 3 select 1); [_index,true,0.5,_Trigger] remoteExec ["Compound_Spawns",2]},[_index,_Trigger],1,true,true,"","_target distance _this < 2"];
_terminal AddAction ["<t color='#EDC302'>Initiate Live Targets - Level 2</t>",{_index = (_this select 3 select 0); _Trigger = (_this select 3 select 1); [_index,true,0.7,_Trigger] remoteExec ["Compound_Spawns",2]},[_index,_Trigger],1,true,true,"","_target distance _this < 2"];
_terminal AddAction ["<t color='#ED0202'>Initiate Live Targets - Level 3</t>",{_index = (_this select 3 select 0); _Trigger = (_this select 3 select 1); [_index,true,1,_Trigger] remoteExec ["Compound_Spawns",2]},[_index,_Trigger],1,true,true,"","_target distance _this < 2"];

if(_terminal in [Compound_6,Compound_7]) then {
	_terminal AddAction ["<t color='#a440e3'>Initiate Pop-Up Hostages</t>",{_index = (_this select 3 select 0); _Trigger = (_this select 3 select 1); [_index,false,1,_Trigger] remoteExec ["Compound_Hostage",2]},[_index,_Trigger],1,true,true,"","_target distance _this < 2"];
	_terminal AddAction ["<t color='#a440e3'>Initiate Live Hostages</t>",{_index = (_this select 3 select 0); _Trigger = (_this select 3 select 1); [_index,true,1,_Trigger] remoteExec ["Compound_Hostage",2]},[_index,_Trigger],1,true,true,"","_target distance _this < 2"];
};