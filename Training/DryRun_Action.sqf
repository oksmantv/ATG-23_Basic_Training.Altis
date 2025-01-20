
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