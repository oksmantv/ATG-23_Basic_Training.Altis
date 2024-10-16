params ["_Terminal","_SpawnPos","_Severe"];

    if(!isNull _Terminal) then {
        if ((typeOf _Terminal) isEqualTo "Land_DataTerminal_01_F") then {
            [_Terminal,3] call BIS_fnc_dataTerminalAnimate;
            playSound3D [MISSION_ROOT + "activated.wav", _Terminal];
            sleep 3.5;
        };
    };
    { if(!isPlayer _X) then {deleteVehicle _X}} foreach (_SpawnPos nearEntities 5);
    { if(_X distance _SpawnPos < 5) then {deleteVehicle _x }} forEach allDeadMen;
    sleep 0.5;
    _Group = createGroup west;
    _Group setVariable ["acex_headless_blacklist",true,true];
    _Unit = _Group createUnit ["B_Soldier_F",[15385.4,17445.8,0], [], 15, "CAN_COLLIDE"];

    For "_i" from 0 to 30 do {
        _Unit addItemToUniform "ACE_ElasticBandage"
    };
    _Unit setBehaviour "CARELESS"; _Unit disableAI "MOVE";
    doStop _Unit;
    if(!isNull _Terminal) then {
            _Unit setDir (_Unit getDir _Terminal);
    } else {
        _Unit setDir (random 360);
    };
    [_Unit,_Severe,_Terminal] spawn MedicalDamage;
    if(!isNull _Terminal) then {
        if (typeOf _Terminal == "Land_DataTerminal_01_F") then {
            [_Terminal,0] call BIS_fnc_dataTerminalAnimate;
            sleep 3;
        };
    };
    _Unit setPosATL (getPosATL _SpawnPos);
    [_Unit,false] remoteExec ["hideObjectGlobal",2];
    waitUntil{PrimaryWeapon _Unit != ""};
    removeAllWeapons _Unit;
    
    if !(isNil "MED_MASS_READY") then {
        waitUntil {MED_MASS_READY};
        if ((typeOf _Terminal) isEqualTo "Land_InfoStand_V2_F") then {
            playSound3D [MISSION_ROOT + "whistle.wav", MedicalMass_1];
            {
                    _x setObjectTextureGlobal [0,"#(argb,8,8,3)color(0,1,0,1.0,ca)"];
            } forEach [IndicatorL_1,IndicatorL_2,IndicatorL_3,IndicatorL_4];
        };
    };