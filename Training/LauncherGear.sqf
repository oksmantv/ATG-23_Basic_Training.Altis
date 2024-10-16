// [this] spawn LauncherGear;
// [this] execVM "Training\LauncherGear.sqf";

GetLauncherResetBackpack = {
	params ["_Player","_Weapon","_Magazine"];
	_Player removeWeapon (secondaryWeapon (_Player));
	removeBackpack _Player;
	_Player AddBackpack "B_Bergen_tna_F";
	_Player AddMagazines [_Magazine,4];
	_Player AddWeapon _Weapon;
};

Params ["_Box"];

_Box addAction ["<t color='#1afdfa' size='1.5'>Save and Switch Backpack</t>", {
	_Player = _this select 1;
	_BackpackHistory = _Player getVariable ["BackpackHistory",""];
	_BackpackItemsHistory = _Player getVariable ["BackpackItemsHistory",""];

	if(_BackpackHistory != "") then {
		removeBackpack _Player;
		_Player addBackpack _BackpackHistory;
		{_Player addItemToBackpack _X} foreach _BackpackItemsHistory;

		_Player setVariable ["BackpackHistory","",true];
		_Player setVariable ["BackpackItemsHistory","",true];
	} else {
		_Backpack = backpack _Player;
		_BackpackItems = backpackItems _Player;

		_Player setVariable ["BackpackHistory",_Backpack,true];
		_Player setVariable ["BackpackItemsHistory",_BackpackItems,true];

		removeBackpack _Player;
		_Player AddBackpack "B_Bergen_tna_F";
	};
}];
_Box addAction ["<t color='#9be888' size='1.5'>Light Anti-Tank</t>", { systemChat "This is a category dummy :)"}];
_Box addAction ["<t color='#A9E69A'>Request NLAW</t>", {
	(_this select 1) removeWeapon (secondaryWeapon (_this select 1));
	(_this select 1) addWeapon "launch_NLAW_F"
}];
_Box addAction ["<t color='#A9E69A'>Request AT-4 (HP)</t>", {
	(_this select 1) removeWeapon (secondaryWeapon (_this select 1));
	(_this select 1) addWeapon "rhs_weap_M136_hp"
}];
_Box addAction ["<t color='#A9E69A'>Request RPG-26</t>", {
	(_this select 1) removeWeapon (secondaryWeapon (_this select 1));
	(_this select 1) addWeapon "rhs_weap_rpg26"
}];
_Box addAction ["<t color='#A9E69A'>Request M72 LAW</t>", {
	(_this select 1) removeWeapon (secondaryWeapon (_this select 1));
	(_this select 1) addWeapon "rhs_weap_m72a7"
}];

_Box addAction ["<t color='#6a9fe8' size='1.5'>Medium Anti-Tank</t>", { systemChat "This is a category dummy :)"}];
_Box addAction ["<t color='#88b0e8'>Request MAAWS</t>", {
	[(_this select 1),"launch_MRAWS_green_rail_F","MRAWS_HEAT_F"] call GetLauncherResetBackpack;
}];
_Box addAction ["<t color='#88b0e8'>Request MAAWS (RHS)</t>", {
	[(_this select 1),"rhs_weap_maaws","MRAWS_HEAT_F"] call GetLauncherResetBackpack;
	(_this select 1) addSecondaryWeaponItem "rhs_optic_maaws";		
}];
_Box addAction ["<t color='#88b0e8'>Request SMAW</t>", {
	[(_this select 1),"rhs_weap_smaw_green","rhs_mag_smaw_HEAA"] call GetLauncherResetBackpack;
	(_this select 1) addMagazines ["rhs_mag_smaw_SR",4]; 
	(_this select 1) addSecondaryWeaponItem "rhs_weap_optic_smaw";	
}];
_Box addAction ["<t color='#88b0e8'>Request RPG-32</t>", {
	[(_this select 1),"launch_RPG32_F","RPG32_F"] call GetLauncherResetBackpack;
}];
_Box addAction ["<t color='#88b0e8'>Request RPG-7</t>", {
	[(_this select 1),"rhs_weap_rpg7","rhs_rpg7_PG7VM_mag"] call GetLauncherResetBackpack;
	(_this select 1) addSecondaryWeaponItem "rhs_acc_pgo7v3";
}];

_Box addAction ["<t color='#e1ea46' size='1.5'>Heavy Anti-Tank</t>", { systemChat "This is a category dummy :)"}];
_Box addAction ["<t color='#e8ef71'>Request Javelin</t>", {
	[(_this select 1),"rhs_weap_fgm148","rhs_fgm148_magazine_AT"] call GetLauncherResetBackpack;
}];
_Box addAction ["<t color='#e8ef71'>Request Metis-M</t>", {
	[(_this select 1),"launch_O_Vorona_green_F","Vorona_HEAT"] call GetLauncherResetBackpack;
}];
_Box addAction ["<t color='#e8ef71'>Request Titan</t>", {
	[(_this select 1),"launch_I_Titan_short_F","Titan_AT"] call GetLauncherResetBackpack;
}];

_Box addAction ["<t color='#F33737' size='1.5'>Anti-Air</t>", { systemChat "This is a category dummy :)"}];
_Box addAction ["<t color='#F96363'>Request Igla</t>", {
	[(_this select 1),"rhs_weap_igla","rhs_mag_9k38_rocket"] call GetLauncherResetBackpack;
}];
_Box addAction ["<t color='#F96363'>Request FIM-92F Stinger</t>", {
	[(_this select 1),"rhs_weap_fim92","rhs_fim92_mag"] call GetLauncherResetBackpack;
}];
_Box addAction ["<t color='#F96363'>Request Blowpipe</t>", {
	[(_this select 1),"UK3CB_Blowpipe","UK3CB_Blowpipe_Round"] call GetLauncherResetBackpack;
}];
_Box addAction ["<t color='#F96363'>Request Titan MPRL</t>", {
	[(_this select 1),"launch_B_Titan_F","Titan_AA"] call GetLauncherResetBackpack;
}];
