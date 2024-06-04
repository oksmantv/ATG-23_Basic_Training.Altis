
// execVM "DryRunCode.sqf"
waitUntil{!isNil "DryRunCode"};

// Individual Houses
// House 1
Terminal_1 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	House_1_Trigger,
	[House_1_T1,House_1_T2,House_1_T3,House_1_T4,House_1_T5]
],1,true,true,"","_target distance _this < 4"];

Terminal_1 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount] remoteExec ["LiveRunCode",2];
},
[
	House_1_Trigger,
	[House_1_T1,House_1_T2,House_1_T3,House_1_T4,House_1_T5],
	4
],1,true,true,"","_target distance _this < 4"];

Terminal_1 AddAction ["<t color='#FFA500'>Activate Live Run (Hostage)</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount,true,true] remoteExec ["LiveRunCode",2];
},
[
	House_1_Trigger,
	[House_1_T1,House_1_T2,House_1_T3,House_1_T4,House_1_T5],
	4
],1,true,true,"","_target distance _this < 4"];


// House 2
Terminal_2 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	House_2_Trigger,
	[House_2_T1,House_2_T2,House_2_T3,House_2_T4,House_2_T5],
	3
],1,true,true,"","_target distance _this < 4"];
Terminal_2 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount] remoteExec ["LiveRunCode",2];
},
[
	House_2_Trigger,
	[House_2_T1,House_2_T2,House_2_T3,House_2_T4,House_2_T5],
	3
],1,true,true,"","_target distance _this < 4"];

Terminal_2 AddAction ["<t color='#FFA500'>Activate Live Run (Hostage)</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount,true,true] remoteExec ["LiveRunCode",2];
},
[
	House_2_Trigger,
	[House_2_T1,House_2_T2,House_2_T3,House_2_T4,House_2_T5],
	4
],1,true,true,"","_target distance _this < 4"];


// House 3
Terminal_3 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	House_3_Trigger,
	[House_3_T1,House_3_T2,House_3_T3,House_3_T4,House_3_T5]
],1,true,true,"","_target distance _this < 4"];
Terminal_3 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount] remoteExec ["LiveRunCode",2];
},
[
	House_3_Trigger,
	[House_3_T1,House_3_T2,House_3_T3,House_3_T4,House_3_T5],
	4
],1,true,true,"","_target distance _this < 4"];

Terminal_3 AddAction ["<t color='#FFA500'>Activate Live Run (Hostage)</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount,true,true] remoteExec ["LiveRunCode",2];
},
[
	House_3_Trigger,
	[House_3_T1,House_3_T2,House_3_T3,House_3_T4,House_3_T5],
	4
],1,true,true,"","_target distance _this < 4"];


// House 4
Terminal_4 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	House_4_Trigger,
	[House_4_T1,House_4_T2,House_4_T3,House_4_T4,House_4_T5]
],1,true,true,"","_target distance _this < 4"];
Terminal_4 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount] remoteExec ["LiveRunCode",2];
},
[
	House_4_Trigger,
	[House_4_T1,House_4_T2,House_4_T3,House_4_T4,House_4_T5],
	3
],1,true,true,"","_target distance _this < 4"];

Terminal_4 AddAction ["<t color='#FFA500'>Activate Live Run (Hostage)</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount,true,true] remoteExec ["LiveRunCode",2];
},
[
	House_4_Trigger,
	[House_4_T1,House_4_T2,House_4_T3,House_4_T4,House_4_T5],
	4
],1,true,true,"","_target distance _this < 4"];

// House 5
Terminal_5 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	House_5_Trigger,
	[House_5_T1,House_5_T2,House_5_T3,House_5_T4,House_5_T5]
],1,true,true,"","_target distance _this < 4"];
Terminal_5 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount] remoteExec ["LiveRunCode",2];
},
[
	House_5_Trigger,
	[House_5_T1,House_5_T2,House_5_T3,House_5_T4,House_5_T5],
	3
],1,true,true,"","_target distance _this < 4"];

Terminal_5 AddAction ["<t color='#FFA500'>Activate Live Run (Hostage)</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount,true,true] remoteExec ["LiveRunCode",2];
},
[
	House_5_Trigger,
	[House_5_T1,House_5_T2,House_5_T3,House_5_T4,House_5_T5],
	4
],1,true,true,"","_target distance _this < 4"];

// House 6
Terminal_6 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	House_6_Trigger,
	[House_6_T1,House_6_T2,House_6_T3,House_6_T4,House_6_T5]
],1,true,true,"","_target distance _this < 4"];
Terminal_6 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount] remoteExec ["LiveRunCode",2];
},
[
	House_6_Trigger,
	[House_6_T1,House_6_T2,House_6_T3,House_6_T4,House_6_T5],
	3
],1,true,true,"","_target distance _this < 4"];

Terminal_6 AddAction ["<t color='#FFA500'>Activate Live Run (Hostage)</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,_RandomCount,true,true] remoteExec ["LiveRunCode",2];
},
[
	House_6_Trigger,
	[House_6_T1,House_6_T2,House_6_T3,House_6_T4,House_6_T5],
	4
],1,true,true,"","_target distance _this < 4"];


// Large Buildings
// House 1
BigHouseTerminal_1 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	BigHouse_1_Trigger,
	[BigHouse_1_1,BigHouse_1_2,BigHouse_1_3,BigHouse_1_4,BigHouse_1_5,BigHouse_1_6,BigHouse_1_7,BigHouse_1_8,BigHouse_1_9,BigHouse_1_10,
	BigHouse_1_11,BigHouse_1_12,BigHouse_1_13,BigHouse_1_14,BigHouse_1_15,BigHouse_1_16]
],1,true,true,"","_target distance _this < 4"];
BigHouseTerminal_1 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,true] remoteExec ["LiveRunCode",2];
},
[
	BigHouse_1_Trigger,
	[BigHouse_1_1,BigHouse_1_2,BigHouse_1_3,BigHouse_1_4,BigHouse_1_5,BigHouse_1_6,BigHouse_1_7,BigHouse_1_8,BigHouse_1_9,BigHouse_1_10,
	BigHouse_1_11,BigHouse_1_12,BigHouse_1_13,BigHouse_1_14,BigHouse_1_15,BigHouse_1_16],
	8
],1,true,true,"","_target distance _this < 4"];


// House 2
BigHouseTerminal_2 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	BigHouse_2_Trigger,
	[BigHouse_2_1,BigHouse_2_2,BigHouse_2_3,BigHouse_2_4,BigHouse_2_5,BigHouse_2_6,BigHouse_2_7,BigHouse_2_8,BigHouse_2_9,BigHouse_2_10,
	BigHouse_2_11,BigHouse_2_12,BigHouse_2_13,BigHouse_2_14,BigHouse_2_15,BigHouse_2_16]
],1,true,true,"","_target distance _this < 4"];
BigHouseTerminal_2 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,true] remoteExec ["LiveRunCode",2];
},
[
	BigHouse_2_Trigger,
	[BigHouse_2_1,BigHouse_2_2,BigHouse_2_3,BigHouse_2_4,BigHouse_2_5,BigHouse_2_6,BigHouse_2_7,BigHouse_2_8,BigHouse_2_9,BigHouse_2_10,
	BigHouse_2_11,BigHouse_2_12,BigHouse_2_13,BigHouse_2_14,BigHouse_2_15,BigHouse_2_16],
	8
],1,true,true,"","_target distance _this < 4"];

// House 3
BigHouseTerminal_3 AddAction ["<t color='#26FF88'>Activate Dry Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets"];
	[(_this select 0),(_this select 1),_Trigger,_Targets] remoteExec ["DryRunCode",2];
},
[
	BigHouse_3_Trigger,
	[BigHouse_3_1,BigHouse_3_2,BigHouse_3_3,BigHouse_3_4,BigHouse_3_5,BigHouse_3_6,BigHouse_3_7,BigHouse_3_8,BigHouse_3_9,BigHouse_3_10,
	BigHouse_3_11,BigHouse_3_12,BigHouse_3_13,BigHouse_3_14,BigHouse_3_15,BigHouse_3_16]
],1,true,true,"","_target distance _this < 4"];
BigHouseTerminal_3 AddAction ["<t color='#FF0000'>Activate Live Run</t>",{
	(_this select 3) Params ["_Trigger","_Targets","_RandomCount"];
	[(_this select 0),(_this select 1),_Trigger,_Targets,true] remoteExec ["LiveRunCode",2];
},
[
	BigHouse_3_Trigger,
	[BigHouse_3_1,BigHouse_3_2,BigHouse_3_3,BigHouse_3_4,BigHouse_3_5,BigHouse_3_6,BigHouse_3_7,BigHouse_3_8,BigHouse_3_9,BigHouse_3_10,
	BigHouse_3_11,BigHouse_3_12,BigHouse_3_13,BigHouse_3_14,BigHouse_3_15,BigHouse_3_16],
	8
],1,true,true,"","_target distance _this < 4"];