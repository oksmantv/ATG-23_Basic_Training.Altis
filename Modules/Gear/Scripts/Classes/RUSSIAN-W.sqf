_useMineDetector = false;
_allowedNightStuff = true;

_glHE = "rhs_VOG25";
_glHEDP = "rhs_VOG25";
_glsmokeW = "rhs_GRD40_White";
_glsmokeB = "";
_glsmokeG = "rhs_GRD40_Green";
_glsmokeO = "";
_glsmokeP = "";
_glsmokeR = "rhs_GRD40_Red";
_glsmokeY = "";

_glflareG = "rhs_VG40OP_green";
_glflareR = "rhs_VG40OP_red";
_glflareW = "rhs_VG40OP_white";

_insignia = "";
_goggles = "";
_helmet = ["rhs_6b27m_digi"];
_OfficerHelmet = "rhs_ushanka";
_uniform = "rhs_uniform_emr_patchless";
_vest = ["rhs_6b2_chicom","rhs_6b2_lifchik","rhs_6b2_RPK"];
_backpack = "rhs_rd54_emr1";
_backpackRadio = _backpack;

if (GVARMAIN(mod_TFAR)) then {
	_backpackRadio = "UK3CB_B_O_Tactical_Backpack_Radio";
};

if(_role in ["ag","ammg"]) then {
	_backpack = "rhs_tortila_olive";
};
if (_role isEqualTo "p") then {
	_helmet = "rhs_altyn_novisor_ess_bala";
};

if (_role isEqualTo "uav") then {
	_backpack = "O_UAV_01_backpack_F";
	_gps = "O_UAVTerminal";

};
if (_role isEqualTo "jetp") then {
	_goggles = "G_Aviator";
	_helmet = "H_PilotHelmetFighter_B";
	_uniform = "U_B_PilotCoveralls";
	_vest = "V_Rangemaster_belt";
	_backpack = "B_Parachute";
};


_silencer = "rhs_acc_dtk2";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["arifle_AKS_F", _silencer, _pointer, _sight, _bipod];
_rifleC = ["SMG_02_F", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["UK3CB_Sten", _silencer, _pointer, _sight, _bipod];
_rifleL = ["rhs_weap_savz61", _silencer, _pointer, _sight, _bipod];
_rifle_mag = "30Rnd_545x39_Mag_Tracer_Green_F";
_rifleC_mag = "30Rnd_9x21_Mag_SMG_02";
_rifleGL_mag = "UK3CB_Sten_34Rnd_Magazine";
_rifleL_mag = "rhsgref_20rnd_765x17_vz61";

_LMG = ["rhs_weap_aks74un", _silencer, _pointer, _sight, _bipod];
_LMG_mag = "UK3CB_RPK74_60rnd_545x39_GM";

_MMG = ["rhs_weap_rpk74m", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "UK3CB_RPK74_60rnd_545x39_GT";

_LAT = ["rhs_weap_rpg26", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "rhs_rpg26_mag";
_LAT_ReUsable = false;

_MAT = ["launch_RPG7_F", _silencer, _pointer, _sight, _bipod];
_MAT_mag = "RPG7_F";

_HAT = ["launch_O_Vorona_green_F", _silencer, _pointer, _sight, _bipod];
_HAT_mag = "Vorona_HEAT";

_AA = ["rhs_weap_igla", _silencer, _pointer, _sight, _bipod];
_AA_mag = "rhs_mag_9k38_rocket";

_pistol = ["rhs_weap_makarov_pm", _silencer, _pointer, _sight, _bipod];
_pistol_mag = "rhs_mag_9x18_8_57N181S";

_pdw = ["rhs_weap_pp2000", _silencer, _pointer, _sight, _bipod];
_pdw_mag = "rhs_mag_9x19mm_7n31_44";

_silencer = "";
_pointer = "";
_sight = "rhs_acc_pso1m21";
_bipod = "";

_rifleMarksman = ["rhs_weap_svdp_wd", _silencer, _pointer, _sight, _bipod];
_rifleMarksman_mag = "rhs_10Rnd_762x54mmR_7N1";
_rifleMarksman_mag_tr = "rhs_10Rnd_762x54mmR_7N14";