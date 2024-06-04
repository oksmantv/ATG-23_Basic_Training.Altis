Params ["_Object","_Positions","_Target"];
playSound3D [MISSION_ROOT + "activated.wav", _Object];

// [this,[],FriendlyTarget_1] execVM "3DReportSpawner.sqf";
// [this,[[23062.3,19192.6,0.00171757],[23136.6,19140.6,2.21994],[23130,19138.8,3.59239],[23133,19140.8,3.79385],[23130,19140.4,0.322017],[23133.3,19140.1,1.09799],[23126,19141.6,0.449921],[23123.2,19141.4,0.420631],[23119.6,19141.5,1.14852],[23125.3,19141.5,4.05966],[23071.4,19092.1,0.0014267],[23068,19090.9,0.432314],[23064.7,19089,0.689011],[22967.8,19083.2,0.29025],[22968.3,19088.5,0.00175667],[22971.2,19094.6,1.07599],[22970.7,19092.1,0.503206],[22949.8,19161.9,3.59945],[22953.4,19165.8,3.37883],[22951.8,19163.2,3.29342],[22946.2,19161.9,0.00170803],[22954.7,19169.3,0.00167561],[22991.9,19171.8,0.00143623],[22997.2,19173.8,0.00136375],[23001,19177.6,0.0016489],[23004.3,19211.6,0.00182629],[23010.9,19214.8,0.00169468],[23078.6,19154,0.00181198],[23096.5,19153.3,0.00134087],[23002.2,19105.8,0.00174618],[23010.9,19111.9,0.0015316],[23073.5,19196.7,0.00162411],[23071.1,19197.1,0.602533],[23067.1,19196.6,0.308637],[23075.6,19197.6,0.00149536],[23082.6,19199.6,0.00150967],[23129.9,19210.3,0.00132084],[23126.6,19212.4,0.00132084],[23109.4,19227.8,0.00128746],[23091.9,19242.6,0.00144577],[23096.2,19272.9,3.31373],[23094.1,19269.5,3.88818],[23091.9,19270.6,3.25382]],FriendlyTarget_1] execVM "Training\3DReportSpawner.sqf";

_Units = [
	"O_Soldier_A_F",
	"O_Soldier_AR_F",
	"O_Soldier_AR_F",
	"O_medic_F",
	"O_medic_F",
	"O_Soldier_GL_F",
	"O_HeavyGunner_F",
	"O_soldier_M_F"
];
private ["_SelectedPosition","_Unit"];
while{true} do {
	_SelectedPosition = selectRandom _Positions;
	if(_SelectedPosition NearEntities ["Man", 2] isEqualTo []) exitWith { SystemChat "No Units Nearby Found - Spawning.."};
};
_Group = createGroup EAST;
_Unit = _Group CreateUnit [(_Units call BIS_FNC_selectRandom), [0,0,0], [], -1, "NONE"];
_Unit setCombatMode "BLUE";
_Unit setBehaviour "COMBAT";
_Unit setUnitPos "UP";
_Unit disableAI "TARGET";
_Unit disableAI "AUTOTARGET";
_Unit disableAI "PATH";
_Unit setSkill 1;
_Unit setPosATL _SelectedPosition;
_Player = selectRandom AllPlayers;
_Unit setDir (_Unit getDir _Player);
_Unit doWatch _Player;
_Unit doTarget _Player;

if(!isNil "_Target") then {
	_Unit doWatch _Target;
	_Unit doTarget _Target;
	_Unit spawn {
		while {Alive _this} do {
			if (needReload _this == 1) then { reload _this; sleep 3.5; };
			_this fire primaryWeapon _this;
			(sleep 0.5 + (random 1.5))
		}
	};
};

waitUntil {sleep 1; !Alive _Unit || !([_Unit] call ace_common_fnc_isAwake)};
_Unit setDamage 1;
[_Unit] spawn AI_Death;