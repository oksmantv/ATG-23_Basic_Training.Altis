/*
	AUTHOR: Oksman
	Description:
		What case for compound spawns
	Usage:
		null = [thisTrigger,true] spawn SafeZoneArea;
	Parameters:
		#0: Number:	Activate zone
	Returning Value:
		None
*/

if !(isServer) then {false};

params [
	"_Trigger",
	"_SetCaptive"
];

while {true} do {
	{
		_Player = _X;
		if(_Player inArea _Trigger) then {
			if(_SetCaptive && !(captive _Player)) then {
				[_Player,true] remoteExec ["setCaptive",0];
				"You are now set to captive." remoteExec ["systemChat",_Player];
			};
			
			if(!_SetCaptive && (captive _Player)) then {
				[_Player,false] remoteExec ["setCaptive",0];
				"You are now set to combatant." remoteExec ["systemChat",_Player];
			}
		};
	} foreach (list _Trigger);

	sleep 0.5;
};