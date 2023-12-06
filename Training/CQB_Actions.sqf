
// execVM "CQB_Actions.sqf"
waitUntil{!isNil "CQB_Garrison"};

/// Street Exercise
c_15 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(12+(random 8)),[H_6,H_7,H_8,H_9,H_10],independent,flag_15,true] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];

/// Street Exercise
c_14 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(12+(random 8)),[H_1,H_2,H_3,H_4,H_5],independent,flag_14,true] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];


/// large compound spawn
c_13 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(58+(random 20)),[h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16],independent,flag_13,true] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];


// Individual Houses
c_12 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(5+(random 3)),HOUSE_12,independent,flag_12,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_11 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(6+(random 4)),HOUSE_11,independent,flag_11,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_10 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(2+(random 2)),HOUSE_10,independent,flag_10,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_9 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(4+(random 3)),HOUSE_9,independent,flag_9,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_8 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(4+(random 3)),HOUSE_8,independent,flag_8,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_7 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [round(4+random 2),HOUSE_7,independent,flag_7,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_6 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(5+(random 3)),HOUSE_6,independent,flag_6,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_5 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(3),HOUSE_5,independent,flag_5,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_4 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [round(3+(random 2)),HOUSE_4,independent,flag_4,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_3 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(4+(random 2)),HOUSE_3,independent,flag_3,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_2 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [round(4+(random 3)),HOUSE_2,independent,flag_2,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];
c_1 AddAction ["<t color='#FF0000'>Garrison Building</t>",{
[[],{ [(3+(random 2)),HOUSE_1,independent,flag_1,false] spawn CQB_Garrison}] remoteExec ["BIS_FNC_SPAWN",2];},[],1,true,true,"","_target distance _this < 2"];

UrbanMovement_1 AddAction ["<t color='#07fc03'>Start Course - Level 1</t>",{[5] remoteExec ["GW_Fnc_spawnList",2]},[],1,true,true,"","_target distance _this < 2"];
UrbanMovement_1 AddAction ["<t color='#fcf003'>Start Course - Level 2</t>",{[6] remoteExec ["GW_Fnc_spawnList",2]},[],1,true,true,"","_target distance _this < 2"];
UrbanMovement_1 AddAction ["<t color='#d9980b'>Start Course - Level 3</t>",{[7] remoteExec ["GW_Fnc_spawnList",2]},[],1,true,true,"","_target distance _this < 2"];
UrbanMovement_1 AddAction ["<t color='#fc0b03'>Start Course - Level 4</t>",{[8] remoteExec ["GW_Fnc_spawnList",2]},[],1,true,true,"","_target distance _this < 2"];
