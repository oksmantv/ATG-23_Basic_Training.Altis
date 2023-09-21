// [this,[BCT_1_1, BCT_1_10, BCT_1_11, BCT_1_12, BCT_1_2, BCT_1_3, BCT_1_4, BCT_1_5, BCT_1_6, BCT_1_7, BCT_1_8, BCT_1_9],TriggerName] execVM "BuddyCQBScript.sqf";
// 
//
//
Params ["_Object","_TargetArray","_Trigger"];
[_TargetArray] remoteExec ["OKS_PopUpTargets",2];

_Object addAction ["<t color='#0AE422'>Spawn Live-Targets</t>",{[_this select 3] remoteExec ["OKS_LiveTargets",2]},_TargetArray];
_Object addAction ["<t color='#E40A0A'>Reset Course</t>",{[_this select 3] remoteExec ["OKS_CourseReset",2]},[_TargetArray,_Trigger]];






