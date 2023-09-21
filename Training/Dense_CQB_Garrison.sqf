// [count] execVM "Training\Dense_CQB_Garrison.sqf";
// Positions Course 1
Params["_Terminal","_UnitCount"];
[_Terminal,2] call BIS_fnc_dataTerminalAnimate;

{if(!isPlayer _X && _X inArea DenseTrigger_1) then {deleteVehicle _X}} foreach allUnits;
{if(_X inArea DenseTrigger_1) then {deleteVehicle _X}} foreach allDeadMen;

_Positions = [
	[[9343.88,11904.3,0.215602],9.35013],[[9458.05,11922.9,0.343989],74.3019],
	[[9451.37,11902.6,0.691014],311.62],[[9446.52,11900.7,0.608493],38.6438],
	[[9452.07,11904.5,4.13106],344.673],[[9425.75,11922.4,4.09637],79.3721],
	[[9420.65,11923.8,4.12838],318.624],[[9439.35,11866.4,4.20647],27.005],
	[[9427.41,11935,0.00147724],312.136],[[9429.4,11891.8,0.00145435],51.9251],
	[[9422.32,11903.5,3.96178],328.74],[[9410.15,11918.6,0.2677],77.1666],
	[[9422.89,11902.8,0.550846],343.899],[[9405.16,11901.8,0.278626],77.9954],
	[[9412.81,11899.9,5.20295],329.023],[[9346.09,11844.9,0.00133133],81.3789],
	[[9368.02,11852.3,0.00186443],351.147],[[9327.34,11874.5,4.09801],57.0375],
	[[9392.73,11923.3,0.00151539],334.205],[[9368.72,12000.1,0.00149632],71.9455],
	[[9367.25,11956.6,0.00142574],322.019],[[9326.92,11936.7,3.89224],63.7243],
	[[9357.52,11905.7,0.372116],346.406],[[9332.93,11906.1,0.236674],24.3501],
	[[9348.9,11930,0.244414],302.72],[[9339.38,11937.9,0.00143147],66.0952],
	[[9328.3,11909.5,0.230404],342.924],[[9327.02,11936.9,0.474008],74.1126],
	[[9323.2,11932.6,3.88843],313.667],[[9320.38,11910.3,0.207224],34.311],
	[[9306.33,11940.2,0.0281115],335.384],[[9317.05,11881,4.72668],42.8853],
	[[9291.45,11894.4,0.00143528],344.586],[[9312.09,11935.3,3.50044],71.5132],
	[[9454.27,11920.9,0.297851],317.399],
	[[9418.93,11922,0.0014267],343.293],[[9396.57,11920.3,0.00148964],69.7355],
	[[9411.31,11902,0.243876],347.989],[[9438.79,11894.6,0.00162411],28.9451],
	[[9419,11903.2,3.96562],354.35],[[9351.14,11906.9,0.393772],48.1825],
	[[9364.62,11947.7,0.00153542],317.791],[[9360.99,11927.6,0.556634],59.2058],
	[[9346.89,11902.6,0.00146103],322.431],[[9327.71,11946.3,0.0014267],49.8714],
	[[9283.97,11893,5.05206],349.926],[[9320.75,11936,0.496996],45.9906],
	[[9314.92,11934.2,0.508977],336.541]
];

_Units = [
	"O_Soldier_A_F",
	"O_Soldier_AR_F",
	"O_Soldier_AR_F",
	"O_medic_F",
	"O_medic_F",
	"O_Soldier_GL_F",
	"O_HeavyGunner_F",
	"O_soldier_M_F",
	"O_Soldier_F",
	"O_Soldier_F",
	"O_Soldier_F",
	"O_Soldier_LAT_F"
];
private ["_Unit"];

_Group = createGroup EAST;
for "_i" from 0 to _UnitCount do {
	_Array = selectRandom _Positions;	
	_Pos = _Array#0;
	_Dir = _Array#1;
	_Positions deleteAt (_Positions find _Array); 

	//systemChat str [_Pos,_Dir];
	_Unit = _Group CreateUnit [(_Units call BIS_FNC_selectRandom), _Pos, [], -1, "CAN_COLLIDE"];
	_Unit setCombatMode "RED";
	_Unit setUnitPos "UP";
	_Unit disableAI "FSM";
	_Unit disableAI "PATH";
	_Unit setDir _Dir;
};
sleep 10;

playSound3D [MISSION_ROOT + "activated.wav", _Terminal, false, _Terminal, 5, 1, 25];
[_Terminal,0] call BIS_fnc_dataTerminalAnimate;
_Timer = 0;
waitUntil{sleep 1; _Timer = _Timer + 1; triggerActivated Dense_1_End};

_Minutes = floor (_Timer / 60);
_Seconds = _Timer % 60;
_Padding = "0";
_KilledCount = _UnitCount - {Alive _X && [_X] call ace_common_fnc_isAwake} count units _Group;
if(_Minutes > 10) then {
	_Padding = "";
};

["HQ","side",format["Qualification Completed in %1%2:%3, %2 targets killed",_Padding,_Minutes,_Seconds,_KilledCount]] remoteExec ["OKS_Chat",0];
playSound3D [MISSION_ROOT + "victory.wav", EndPost, false, getPosASL EndPost, 5, 1, 150];

{if(!isPlayer _X && _X inArea DenseTrigger_1) then {deleteVehicle _X}} foreach allUnits;
{if(_X inArea DenseTrigger_1) then {deleteVehicle _X}} foreach allDeadMen;

