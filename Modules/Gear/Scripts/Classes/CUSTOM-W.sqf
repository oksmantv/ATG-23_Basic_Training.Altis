_useMineDetector = false;
_allowedNightStuff = true;

_insignia = "";
_goggles = ["rhsusf_shemagh_od","rhsusf_shemagh2_od",""];
_helmet = ["UK3CB_FIA_B_H_HSAT_MKIII_01","UK3CB_FIA_B_H_HSAT_MKIII_02","UK3CB_FIA_B_H_HSAT_MKIII_03","UK3CB_FIA_B_H_HSAT_PTYPE_01","UK3CB_FIA_B_H_HSAT_PTYPE_02","UK3CB_FIA_B_H_HSAT_PTYPE_03"];
_OfficerHelmet = "UK3CB_FIA_B_H_Off_Beret";
_uniform = ["rhs_uniform_6sh122_gloves_v2","rhs_uniform_6sh122_v2"];
_vest = ["UK3CB_MD12_VEST_OLI"];
_backpack = "UK3CB_UN_B_B_ASS";
_backpackRadio = _backpack;

if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "FRXA_tf_rt1523g_big_Ranger_Green";
};
if (_role in ["ag","ammg","lr","ab"]) then {
	_backpack = "UK3CB_B_Alice_Bedroll_K";
};
if (_role isEqualTo "crew") then {
	_helmet = "UK3CB_ARD_B_H_Crew_Cap";
	_vest = "UK3CB_MD98_VEST_OLI";
};
if (_role isEqualTo "p") then {
	_helmet = "UK3CB_H_Crew_Helmet";
	_uniform = "rhs_uniform_6sh122_v2";
	_vest = "UK3CB_MD98_VEST_OLI";
};
if (_role isEqualTo "uav") then {
	_backpack = "B_UAV_01_backpack_F";
	_gps = "B_UAVTerminal";

};
if (_role isEqualTo "jetp") then {
	_goggles = "G_Aviator";
	_helmet = "H_PilotHelmetFighter_B";
	_uniform = "U_B_PilotCoveralls";
	_vest = "V_Rangemaster_belt";
	_backpack = "B_Parachute";
};

// Attachments
_silencer = "rhsgref_acc_zendl";
_pointer = "ACE_DBAL_A3_Green";
_sight = "rhsusf_acc_T1_low_fwd";
_bipod = "rhsusf_acc_grip1";

// Primary Weapons
_rifle = ["rhs_weap_savz58v_ris", _silencer, _pointer, _sight, _bipod];
_rifleC = ["rhs_weap_savz58v_ris", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["rhs_weap_savz58v_ris", _silencer, _pointer, _sight, _bipod];
_rifleL = ["rhs_weap_savz58v_ris", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "rhs_30Rnd_762x39mm_Savz58";
_rifle_mag_tr = "rhs_30Rnd_762x39mm_Savz58_tracer";
_rifleC_mag = "rhs_30Rnd_762x39mm_Savz58";
_rifleC_mag_tr = "rhs_30Rnd_762x39mm_Savz58_tracer";
_rifleGL_mag = "rhs_30Rnd_762x39mm_Savz58";
_rifleGL_mag_tr = "rhs_30Rnd_762x39mm_Savz58_tracer";
_rifleL_mag = "rhs_30Rnd_762x39mm_Savz58";
_rifleL_mag_tr = "rhs_30Rnd_762x39mm_Savz58_tracer";

_LMG = ["rhs_weap_rpk74m", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "UK3CB_RPK74_60rnd_545x39_RT";

_MMG = ["rhs_weap_fnmag", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "hlc_200Rnd_762x51_M_M60E4";

// Launchers
_LAT = ["rhs_weap_m72a7", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "rhs_m72a7_mag";
_LAT_ReUsable = false;

_MAT = ["rhs_weap_maaws", _silencer, _pointer, "rhs_optic_maaws", _bipod];
_MAT_mag = "MRAWS_HEAT_F";
_MAT_mag_HE = "MRAWS_HE_F";

_HAT = ["rhs_weap_fgm148", _silencer, _pointer, _sight, _bipod];
_HAT_mag = "rhs_fgm148_magazine_AT";

_AA = ["rhs_weap_fim92", _silencer, _pointer, _sight, _bipod];
_AA_mag = "Titan_AA";

// Pistol
if(_role in ["sl","tl","g","fac"]) then {
	_pistol = ["rhs_weap_M320", _silencer, _pointer, _sight, _bipod];
	_pistol_mag = "rhs_mag_M433_HEDP";
} else {
	_pistol = ["rhs_weap_pya", _silencer, _pointer, _sight, _bipod];
	_pistol_mag = "rhs_mag_9x19_7n31_17";
};

// PDW
_pdw = ["UK3CB_Sten", _silencer, _pointer, _sight, _bipod];
_pdw_mag = "UK3CB_Sten_34Rnd_Magazine_R";
_pdw_mag_tr = "UK3CB_Sten_34Rnd_Magazine_RT";

_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifleMarksman = ["rhs_weap_m76", _silencer, _pointer, "rhs_acc_pso1m21", _bipod];
_rifleMarksman_mag = "rhsgref_10Rnd_792x57_m76";
_rifleMarksman_mag_tr = "rhssaf_10Rnd_792x57_m76_tracer";

