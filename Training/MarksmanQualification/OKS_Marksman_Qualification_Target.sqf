
params ["_Target","_Row","_Index","_Terminal"];

_TargetRowArray = _Terminal getVariable [format["OKS_Targets_Row_%1_Array",_Row],[]];
_TargetAllArray = _Terminal getVariable ["OKS_Targets_All_Array",[]];
_TargetRowArray pushBackUnique _Target;
_TargetAllArray pushBackUnique _Target;

_Terminal setVariable [format["OKS_Targets_Row_%1_Array",_Row],_TargetRowArray,true];
_Terminal setVariable ["OKS_Targets_All_Array",_TargetAllArray,true];

_Target setVariable ["OKS_Target_Terminal",_Terminal,true];

_Target addEventHandler ["Hit", {
	params ["_Target", "_source", "_damage", "_Shooter"];

	_Terminal = _Target getVariable "OKS_Target_Terminal";
	_DesignatedShooter = _Terminal getVariable ["OKS_Current_Shooter",objNull];
	if(_DesignatedShooter isEqualTo _Shooter) then {

		if(stance _Shooter == "STAND" || isWeaponRested _Shooter || isWeaponDeployed _Shooter) then {
			if((primaryWeaponItems _Shooter) select 2 != "") exitWith {
				"Sights on weapon, not allowed. Hit does not count!" remoteExec ["SystemChat",_Shooter];
			};
			if(_Shooter distance (_Terminal getVariable ["OKS_Shooting_Platform",objNull]) >= 1.6) exitWith {
				"Not standing on platform. Hit does not count!" remoteExec ["SystemChat",_Shooter];
			};
			_HitArray = _Shooter getVariable ["OKS_Hit_Targets",[]];
			_HitScore = _Shooter getVariable ["OKS_Hit_Score",0];			
			if(!(_Target in _HitArray)) then {
				_HitArray pushBackUnique _Target;
				_Shooter setVariable ["OKS_Hit_Targets",_HitArray,true];
				_Shooter setVariable ["OKS_Hit_Score",(_HitScore + 1),true];
				_Target setVariable ["OKS_isHit",true,true];
				if(OKS_Marksman_Debug == true) then {
					format["Fired: %2 - Scored %1",(_Shooter getVariable ["OKS_Hit_Score",0]),(_Shooter getVariable ["OKS_Shot_Count",0])] remoteExec ["systemChat",0];
				};
			};

			[_Target,_Shooter] spawn {	
				Params ["_Target","_Shooter"];	
				sleep 2.2;
				_Shooter setVariable ["OKS_Hit_Targets",[],true];
			};
		} else {
			"Not standing, rested or deployed. Hit does not count!" remoteExec ["SystemChat",_Shooter];
		}
	} else {
		[player,format["%2 interrupted %1's qualification run by shooting at his target.",name _DesignatedShooter,name _Shooter]] remoteExec ["sideChat",0];
		
		_Target spawn {		
			sleep 2;
			[_this, true] remoteExec ["hideObject",0];
			_this animateSource ["terc", 0];
		};
	}
}];

[_Target, true] remoteExec ["hideObject",0];