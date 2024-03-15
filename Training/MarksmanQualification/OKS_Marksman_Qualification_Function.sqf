
params ["_Index","_Terminal","_Player","_SelectedWeapon"];

// Setup
_TargetOrder = [
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
	5, 2, 3, 7, 4, 5, 8, 1, 6, 10,
	6, 1, 9, 3, 5, 7, 8, 2, 4, 11,
	7, 8, 3, 5, 2, 6, 7, 10, 4, 9,
	2, 7, 9, 5, 6, 1, 10, 4, 8, 3,
	10, 8, 7, 6, 8, 9, 7, 10, 10, 9
];

// no-pop setup
nopop = true;
publicVariable "nopop";

// Add Player Shotcount
_Player setVariable ["OKS_Shot_Count",0,true];
_Player removeAllEventHandlers "Fired";
_Player addEventHandler ["Fired",{
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_Count = _unit getVariable ["OKS_Shot_Count",0];
	_Count = _Count + 1;
	_unit setVariable ["OKS_Shot_Count",_Count];
}];

// Reset Hit Array and Score
_Player setVariable ["OKS_Hit_Targets",[],true];
_Player setVariable ["OKS_Hit_Score",0,true];

// Reset Active Shooter
_Terminal setVariable ["OKS_Current_Shooter",_Player,true];

// Hide all targets
_TargetAllArray = _Terminal getVariable ["OKS_Targets_All_Array",[]];
{
	[_X, true] remoteExec ["hideObject",0];
} foreach _TargetAllArray;

// Reset Animation All Targets
{_X animateSource ["terc", 0]} foreach _TargetAllArray;

// Notify Player

["hq","side",format["%1 have started marksman course %2 for %3.",name _Player,_Index,_SelectedWeapon]] remoteExec ["OKS_Chat",0]; sleep 2;
format ["You have 2 Magazines, 60 rounds and you will receive %1 targets.",count _TargetOrder] remoteExec ["systemChat",_Player]; sleep 2;
format ["Rank 1: 35 - Rank 2: 45 - Rank 3: 55"] remoteExec ["systemChat",_Player]; sleep 2;

// Countdown
["OKS_CountDown"] remoteExec ["PlaySound",_Player];
{ 
	format["%1..",_X] remoteExec ["systemChat",_Player]; sleep 1;
} foreach [3,2,1];

// Start Qualification
{
	if(!(_Terminal getVariable ['OKS_Range_Active',false])) exitWith {
		["You have cancelled the qualification course prematurely."] remoteExec ["systemChat",_Player];
	};

	if(_Player getVariable ["OKS_Shot_Count",0] > 60) exitWith {
		["Qualification disqualified. Reason: Fired more than 60 rounds."] remoteExec ["systemChat",_Player];	
	};
	private _TimeDelay = 0;
	private _TimeMultiplier = 1.4;
	_SelectedRow = _X;
	switch (_SelectedRow) do {
		case 1: {
			_TimeDelay = 1.5 * _TimeMultiplier;
		};
		case 2: {
			_TimeDelay = 1.5 * _TimeMultiplier;
		};
		case 3: {
			_TimeDelay = 1.5 * _TimeMultiplier;
		};
		case 4: {
			_TimeDelay = 1.5 * _TimeMultiplier;
		};
		case 5: {
			_TimeDelay = 1.5 * _TimeMultiplier;
		};
		case 6: {
			_TimeDelay = 1.7 * _TimeMultiplier;
		};
		case 7: {
			_TimeDelay = 1.8 * _TimeMultiplier;
		};
		case 8: {
			_TimeDelay = 1.9 * _TimeMultiplier;
		};
		case 9: {
			_TimeDelay = 2 * _TimeMultiplier;
		};	
		case 10: {
			_TimeDelay = 2.1 * _TimeMultiplier;
		};
		case 11: {
			private _TimeMultiplier = 0.85;
			switch (primaryWeapon _Player) do {
				case "arifle_Katiba_F": { _TimeDelay = 5.4};
				case "arifle_Mk20_plain_F": { _TimeDelay = 4.7};
				case "arifle_CTAR_blk_F": { _TimeDelay = 4.8};
				case "arifle_TRG21_F": { _TimeDelay = 4.7};		
				case "rhs_weap_ak74mr": { _TimeDelay = 5.4};
				case "rhs_weap_m16a4_carryhandle": { _TimeDelay = 4.7};
				case "rhs_weap_ak103_zenitco01_b33": { _TimeDelay = 4.8};
				case "arifle_AK12_F": { _TimeDelay = 4.7};
				case "arifle_MX_Black_F": { _TimeDelay = 3.5};
				default { _TimeDelay = 5};
			};

			_SelectedRow = 5;
		};		
		default {
			_TimeDelay = 2;
		};
	};

	_SelectedRowArray = _Terminal getVariable (format ["OKS_Targets_Row_%1_Array",_SelectedRow]);
	_SelectedTarget = selectRandom _SelectedRowArray;

	_SelectedTarget enableSimulation true;
	[_SelectedTarget, false] remoteExec ["hideObject",0];
	sleep _TimeDelay;

	[_SelectedTarget, true] remoteExec ["hideObject",0];
	if((_SelectedTarget getVariable ["OKS_isHit",false]) == false) then {
		"OKS_FailBuzz" remoteExec ["playSound",_Player];
		_SelectedTarget setVariable ["OKS_isHit",false,true];
	};
	_SelectedTarget spawn {
		_this animateSource ["terc", 0];
		sleep 2;
		_this enableSimulation false;
	};
	sleep 0.5;
	if(_Player getVariable ["OKS_Shot_Count",0] == 60 && (_TargetOrder find _X) < (count _TargetOrder)) exitWith {}
} forEach _TargetOrder;

_PlayerScore = (_Player getVariable ["OKS_Hit_Score",0]);

private _ResultText = format["failed the marksman qualification course for the %1",_SelectedWeapon];
if(["invalid", _SelectedWeapon] call BIS_fnc_inString) then {
	_ResultText = format["with an %1",_SelectedWeapon];
} else {
	// Completed Course
	if(_PlayerScore >= 35) then {
		_ResultText = format["completed the rank 1 qualification for the %1",_SelectedWeapon];
		_Terminal setObjectTextureGlobal [0,"Training\MarksmanQualification\rank1.jpg"];
	};
	if(_PlayerScore >= 45) then {
		_ResultText = format["completed the rank 2 qualification for the %1",_SelectedWeapon];
		_Terminal setObjectTextureGlobal [0,"Training\MarksmanQualification\rank2.jpg"];
	};
	if(_PlayerScore >= 55) then {
		_ResultText = format["completed the rank 3 qualification for the %1",_SelectedWeapon];
		_Terminal setObjectTextureGlobal [0,"Training\MarksmanQualification\rank3.jpg"];
	};
};

_Terminal setVariable ['OKS_Range_Active',false,true];
"OKS_Buzzer" remoteExec ["PlaySound",_Player];
["hq","side",format["%1 scored %2 out of %3 and %4.",name _Player,_PlayerScore,(count _TargetOrder),_ResultText]] remoteExec ["OKS_Chat",0];
