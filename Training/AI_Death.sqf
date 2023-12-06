 /* [_this] execVM "AI_Death.sqf"; */

 Params ["_Unit"];

sleep 1;
For "_i" from 0 to 2 do {
	_Unit hideObject true; sleep 0.15; _Unit hideObject false; sleep 0.15;
};
For "_i" from 0 to 2 do {
	_Unit hideObject true; sleep 0.10; _Unit hideObject false; sleep 0.10;
};
For "_i" from 0 to 3 do {
	_Unit hideObject true; sleep 0.05; _Unit hideObject false; sleep 0.05;
};
_Unit hideObject true;
if(_unit isKindOf "Man") then {
	deleteVehicle _Unit;
};
