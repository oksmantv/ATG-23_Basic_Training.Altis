params ["_object","_spawn","_barrier"];

_object addAction ["<t color='#FF0000'>--Medical Qualification--</t>", {}];
_object addAction ["<t color='#04F51F'>Initiate Qualification</t>", {
		[(_this select 0),(_this select 1), (_this select 3 select 0),(_this select 3 select 1)] remoteExec ["MedicalQualificationPatients",2]
	},
	[_spawn,_barrier],
	1.5,
	true,
	true,
	"",
	"true", // _target, _this, _originalTarget
	1.5,
	false,
	"",
	""
];
// _object addAction ["<t color='#FB1A00'>Remove Casualty</t>", { 
// 	_nearAI = nearestObject [(_this select 3), "Man"];
// 	_nearCorpses = allDeadMen select {_X distance (_this select 3) < 6};
// 	_nearAI = _nearAI select {!isPlayer _X};
// 	_nearAI = (_nearAI + _nearCorpses);
// 	{
// 		deleteVehicle _X	
// 	} forEach _nearAI;
// },_spawn];
