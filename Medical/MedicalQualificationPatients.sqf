params ["_Terminal", "_Qualifier", "_SpawnPos","_Barrier"];

	[_Barrier,false] remoteExec ["hideObjectGlobal",2];
    if(!isNull _Terminal) then {
        [_Terminal,3] call BIS_fnc_dataTerminalAnimate;
        playSound3D [MISSION_ROOT + "activated.wav", _Terminal];
        sleep 3.5;
    };
    { if(!isPlayer _X) then {deleteVehicle _X}} foreach (_SpawnPos nearEntities 5);
    { if(_X distance _SpawnPos < 5) then {deleteVehicle _x }} forEach allDeadMen;
    sleep 0.5;
    _Group = createGroup west;
    _Unit1 = _Group createUnit ["B_Soldier_F",[15385.4,17445.8,0], [], 15, "NONE"];
	_Unit2 = _Group createUnit ["B_Soldier_F",[15385.4,17445.8,0], [], 15, "NONE"];
	_Unit3 = _Group createUnit ["B_Soldier_F",[15385.4,17445.8,0], [], 15, "NONE"];

	GOL_PatientSetup = {

		Params ["_Unit","_SpawnPos","_Terminal","_Direction"];

		For "_i" from 0 to 30 do {
			_Unit addItemToUniform "ACE_ElasticBandage"
		};

		[_Unit,true] remoteExec ["hideObjectGlobal",2];
		[_Unit,"CARELESS"] remoteExec ["setBehaviour",0]; [_Unit,"MOVE"]remoteExec ["disableAI",0];
		_Unit remoteExec ["DoStop",0];

		if(!isNull _Terminal) then {
			_Unit setDir (_Unit getDir _Terminal);
		} else {
			_Unit setDir (random 360);
		};

		waitUntil{PrimaryWeapon _Unit != ""};
		removeAllWeapons _Unit;
		[_Unit,"qualification"] execVM "Medical\MedicalDamage.sqf";
		waitUntil{_Unit getVariable ["GOL_Qualification_Ready",false]};
		_Pos = (getPosATL _SpawnPos) getPos [2,_Direction];
		_Unit setPosATL _Pos;
	};
	private _Dir = (random 360);
	{
		[_X,_SpawnPos,_Terminal,_Dir] spawn GOL_PatientSetup;
		_Dir = _Dir + 120;
	} forEach units _Group;

    if(!isNull _Terminal) then {
        [_Terminal,0] call BIS_fnc_dataTerminalAnimate;
    };
	sleep 3;
	waitUntil { {_X getVariable ["GOL_Qualification_Ready",false]} count units _Group == count units _Group};
	
	// Timer
	[_Qualifier,_Group] spawn {
		Params ["_Qualifier","_Group"];
		_Time = 0;
		waitUntil {
			sleep 1;
			_Time = _Time + 1;
			_Qualifier setVariable ["GOL_Qualification_Time",_Time,true];
			{	
				_Casualty = _X;
				(([_Casualty] call ace_medical_status_fnc_getCardiacOutput > 0.07) &&
				[_Casualty] call ace_medical_status_fnc_getBloodLoss < 0.001 &&
				{[_Casualty, _X] call ace_medical_treatment_fnc_hasTourniquetAppliedTo} count ["LeftLeg","RightLeg","LeftArm","RightArm"] == 0)
				|| !Alive _Casualty
			} count units _Group == count units _Group
		};
	};

	//
	{
		[_Unit,false] remoteExec ["hideObjectGlobal",2];
		_X spawn {	
			_Casualty = _this;		 
			waitUntil{
				
				(([_Casualty] call ace_medical_status_fnc_getCardiacOutput > 0.07) &&
				[_Casualty] call ace_medical_status_fnc_getBloodLoss < 0.001 &&
				{[_Casualty, _X] call ace_medical_treatment_fnc_hasTourniquetAppliedTo} count ["LeftLeg","RightLeg","LeftArm","RightArm"] == 0)
				|| !Alive _Casualty
			};
			_Casualty setVariable ["GOL_Qualification_Complete",true,true];
		}		
	} forEach units _Group;
	[_Barrier,true] remoteExec ["hideObjectGlobal",2];
	playSound3D [MISSION_ROOT + "tier1.wav", _Terminal];
	waitUntil{sleep 0.1; {_X getVariable ["GOL_Qualification_Complete",false]} count units _Group == count units _Group || {!Alive _X} count units _Group > 0};
	if({!Alive _X} count units _Group > 0) then {
		["HQ","side",format["%2: Failed Qualification - Casualty Died",(_Qualifier getVariable ["GOL_Qualification_Time",0]),name _Qualifier]] remoteExec ["OKS_Chat",0];
		playSound3D [MISSION_ROOT + "failure.wav", _Terminal];
	} else {
		_Time = (_Qualifier getVariable ["GOL_Qualification_Time",0]);
		if(_Time > 300) then {
			["HQ","side",format["%2: Failed Qualification by %1 seconds",(_Time - 300),name _Qualifier]] remoteExec ["OKS_Chat",0];
			playSound3D [MISSION_ROOT + "failure.wav", _Terminal];
		} else {
			// if({(_X getVariable ["GOL_CPR_COMPLETED",0]) < 2} count units _Group == count units _Group) then {
			// 	["HQ","side",format["%2: Failed Qualification in %1 seconds - Did not apply CPR at least 2 times per casualty",_Time,name _Qualifier]] remoteExec ["OKS_Chat",0];	
			// } else {
				["HQ","side",format["%2: Succeeded Qualification in %1 seconds",_Time,name _Qualifier]] remoteExec ["OKS_Chat",0];
				playSound3D [MISSION_ROOT + "victory.wav", _Terminal];
			//}			
		};		
	};
	
	sleep 3;
	{
		deleteVehicle _X;
	} forEach units _Group;
	_Qualifier setPosATL (_Terminal getPos [2,(_SpawnPos getDir _Terminal)]);
	_Qualifier setDir (_Qualifier getDir _Terminal);
	[_Barrier,false] remoteExec ["hideObjectGlobal",2];




