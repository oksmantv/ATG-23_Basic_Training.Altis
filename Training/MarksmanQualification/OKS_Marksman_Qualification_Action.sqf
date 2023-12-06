
params ["_Terminal", "_Index","_Platform"];
_Terminal setObjectTextureGlobal [0,"Training\MarksmanQualification\rank0.jpg"];
_Terminal setVariable ["OKS_Shooting_Platform",_Platform,true];
_Terminal addAction [format["<t color='#FF2900'>Initiate Marksman Course %1</t>",_Index],
	{
		Params ["_target","_caller","_actionId","_arguments"];
		_arguments params ["_Index"];
		_target setVariable ['OKS_Range_Active',true,true];
		_target setObjectTextureGlobal [0,"Training\MarksmanQualification\rank0.jpg"];

		private _SelectedWeapon = "";
		switch (primaryWeapon _caller) do {
			case "arifle_Mk20_plain_F": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };
			case "arifle_Katiba_F": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };
			case "arifle_CTAR_blk_F": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };
			case "arifle_TRG21_F": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };
			case "rhs_weap_ak74mr": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };
			case "rhs_weap_m16a4_carryhandle": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };
			case "rhs_weap_ak103_zenitco01_b33": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };
			case "arifle_AK12_F": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };
			case "arifle_MX_Black_F": { _SelectedWeapon = getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName") };		
			default { _SelectedWeapon = ""};
		};

		if(_SelectedWeapon != "") then {

		} else {
			_SelectedWeapon = format["invalid weapon: %1",getText (configFile >> "CfgWeapons" >> (primaryWeapon _caller) >> "DisplayName")];
			systemChat "You have selected a custom weapon. The score will not be valid.";
		};
		[_Index,_Target,_caller,_SelectedWeapon] remoteExec ["OKS_Marksman_Qualification_Function",2];
	},
	[
		_Index
	],
	10,
	true,
	true,
	"",
	"!(_target getVariable ['OKS_Range_Active',false])"
];
_Terminal addAction [format["<t color='#FF2900'>Cancel Marksman Course %1</t>",_Index],
	{
		Params ["_target","_caller","_actionId","_arguments"];
		_arguments params ["_Index"];
		if(_caller == _target getVariable ["OKS_Current_Shooter",objNull]) then {
			_target setVariable ['OKS_Range_Active',false,true];
			_target setObjectTextureGlobal [0,"Training\MarksmanQualification\rank0.jpg"];	
		} else {
			"You cannot cancel another shooters qualification. Dont be a dick." remoteExec ["systemChat",_caller];
			[_caller, true, _caller] remoteExec ["ACE_captives_fnc_setHandcuffed",0];
		};		
	},
	[],
	9,
	true,
	true,
	"",
	"(_target getVariable ['OKS_Range_Active',false])"
];
