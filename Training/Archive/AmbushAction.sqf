// [this,ConvoySpawn_4,ConvoyWP_4,ConvoyEnd_4,EAST] execVM "AmbushAction.sqf";

Params ["_Object","_Spawn","_Waypoint","_End","_Side"];
Private ["_Difficulty"];
_NameText = _Object GetVariable ["AMBUSH_TEXT","Unknown Ambush Site"];

_Object addAction ["<t color='#A2FF00'>Select Difficulty: Very Easy</t>", {
	["HQ","side",format["%1 set to difficulty: Very Easy",_this select 3]] remoteExec ["OKS_Chat",0];
	(_this select 0) setVariable ["DIFFICULTY","Very Easy",true]
}, _NameText];

_Object addAction ["<t color='#4EC10A'>Select Difficulty: Easy</t>", {
	["HQ","side",format["%1 set to difficulty: Easy",_this select 3]] remoteExec ["OKS_Chat",0];
	(_this select 0) setVariable ["DIFFICULTY","Easy",true]
}, _NameText];

_Object addAction ["<t color='#FFCC0A'>Select Difficulty: Medium</t>", {
	["HQ","side",format["%1 set to difficulty: Medium",_this select 3]] remoteExec ["OKS_Chat",0];
	(_this select 0) setVariable ["DIFFICULTY","Medium",true]
}, _NameText];

_Object addAction ["<t color='#FE9500'>Select Difficulty: Hard</t>", {
	["HQ","side",format["%1 set to difficulty: Hard",_this select 3]] remoteExec ["OKS_Chat",0];
	(_this select 0) setVariable ["DIFFICULTY","Hard",true]
}, _NameText];

_Object addAction ["<t color='#F01A09'>Select Difficulty: Very Hard</t>", {
	["HQ","side",format["%1 set to difficulty: Very Hard",_this select 3]] remoteExec ["OKS_Chat",0];
	(_this select 0) setVariable ["DIFFICULTY","Very Hard",true]
}, _NameText];

_Object addAction ["<t color='#B90000'>Select Difficulty: Extreme</t>", {
	["HQ","side",format["%1 set to difficulty: Extreme",_this select 3]] remoteExec ["OKS_Chat",0];
	(_this select 0) setVariable ["DIFFICULTY","Extreme",true]
}, _NameText];

_Object addAction ["<t color='#8903FF'>Select Difficulty: Impossible</t>", {
	["HQ","side",format["%1 set to difficulty: Impossible",_this select 3]] remoteExec ["OKS_Chat",0];
	(_this select 0) setVariable ["DIFFICULTY","Impossible",true]
}, _NameText];

_Object addAction ["<t color='#00C5FE'>Initiate Action</t>", {
	_Object = (_this select 0);
	//systemChat str (_Object getVariable ["DIFFICULTY","Easy"]);
	//systemChat str ((_this select 0) getVariable ["DIFFICULTY","Easy"]);
	(_this select 3) Params ["_Spawn","_Waypoint","_End","_Side","_NameText","_Difficulty"];
	(_this select 1) addAction ["<t color='#B90000'>Activate Convoy</t>",{ 
		(_this select 0) removeAction (_this select 2); 
		(_this select 3) Params ["_Spawn","_Waypoint","_End","_Side","_NameText","_Difficulty"];
		[_Spawn,_Waypoint,_End,_Side,_Difficulty,_NameText] remoteExec ["AmbushActivate",2]
	}, [_Spawn,_Waypoint,_End,_Side,_NameText,(_Object getVariable ["DIFFICULTY","Easy"])]]
}, [_Spawn,_Waypoint,_End,_Side,_NameText]];

/*
{ 
	if(leader group _X == _X) then {		
		_Id = _X addAction ["<t color='#F01A09'>Activate Ambush Course 4</t>", {(_This select 1) setVariable ["AMBUSH_DEACTIVATED",false,true]; (_This select 1) removeAction (_this select 2)Call Compile Format ["%1 = True; PublicVariable '%1'",((_this select 3) select 0)]},[_Variable,_Trigger], 0, false, true, "", format ["%1",_this getVariable ["AMBUSH_DEACTIVATED",true]]];
		_ArrayOfGroupLeaders pushBackUnique [_X,_Id];
	}
} foreach list _Trigger;
//(_Trigger) getVariable ["Ambush_Deactivated",true]
waitUntil {sleep 5; _Variable == true};
{ (_X select 0) removeAction (_X select 1) } foreach _ArrayOfGroupLeaders;
