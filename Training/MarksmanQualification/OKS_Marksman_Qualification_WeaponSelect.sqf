/*
	this spawn {
		waitUntil {sleep 5; !isNil "OKS_Marksman_Qualification_WeaponSelect"};
		[_this,"rhs_weap_ak74","30Rnd_545x39_Mag_Tracer_Green_F"] spawn OKS_Marksman_Qualification_WeaponSelect;
	};
	

*/

params ["_Object","_WeaponClassname","_MagazineClassname",["_Sight","",[""]]];
addToRemainsCollector [_Object];
_Object addAction [
	format["<t color='#0A83F8'>Select Qualification: %1</t>",getText (configFile >> "CfgWeapons" >> _WeaponClassname >> "DisplayName")],
	{
		Params ["_target","_caller","_actionId","_arguments"];
		_arguments params ["_WeaponClassname","_MagazineClassname","_Sight"];

		removeAllWeapons _caller;
		_caller addMagazines [_MagazineClassname,2];
		_caller addWeapon _WeaponClassname;

		if(!isNil "_Sight") then {
			_caller addPrimaryWeaponItem _Sight;
		};	
		[_caller, primaryWeapon _caller, "Single"] call CBA_fnc_selectWeapon;
	},
	[_WeaponClassname,_MagazineClassname,_Sight],
	10,
	true,
	true,
	"",
	"true"
];