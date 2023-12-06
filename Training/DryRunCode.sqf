

Params ["_Target","_Caller","_Trigger","_Targets"];
SystemChat str _this;
_CountOfTargets = count _Targets;

{(nearestBuilding _Trigger) animate [_X, 0]} foreach (animationNames nearestBuilding _Trigger);
{if(!isPlayer _X && _X inArea _Trigger) then {deleteVehicle _X}} foreach allUnits;

// Reset Target and Variables
nopop = true;
publicVariable "nopop";
{[_X,true] remoteExec ["enableSimulation",0]; _X setVariable ["TargetDown",false,true]; [_X,false] remoteExec ["hideObject",0]; _X addEventHandler ["Hit",{systemChat "Fired EventHandler"; (_this select 0) setVariable ["TargetDown",true,true]; (_this select 0) removeEventHandler [_thisEvent,_thisEventHandler]}]} foreach _Targets;
playSound3D [MISSION_ROOT + "activated.wav", _Target, false, _Target, 5, 1, 25];
{_X animateSource ["terc", 0]} foreach _Targets;

waitUntil{triggerActivated _Trigger};
_Time = 0;
waitUntil{sleep 0.01; _Time = _Time + 0.01; {_X getVariable ["TargetDown",false]} count _Targets isEqualTo _CountOfTargets};
[_Caller,format["Dry Run Complete. Time: %1 seconds",_Time]] remoteExec ["SideChat",0];