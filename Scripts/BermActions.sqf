/// execVM "Scripts\BermActions.sqf";

/// Blue Berm Actions
blueBermActivate addAction ["<t color='#fc2403'>Teleport to Red Berm Course</t>",{ 
	if(getPos RedBermTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos redBermTeleport;
		vehicle (_this select 1) setDir getDir redBermTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on teleport site"
	}
}];
blueBermActivate addAction ["<t color='#39fc03'>Teleport to Green Berm Course</t>",{ 
	if(getPos greenBermTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos greenBermTeleport;
		vehicle (_this select 1) setDir getDir greenBermTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on Green Teleport Site"
	}
}];
blueBermActivate addAction ["<t color='#0345fc'>Activate Blue Berm Course</t>",{ 
	[
		(_this select 0),
		objectParent (_this select 1),
		[bermtarget_1,bermtarget_2,bermtarget_3,bermtarget_4,bermtarget_5,bermtarget_6,bermtarget_7,bermtarget_8,bermtarget_9],
		"Blue"
	] remoteExec ["OKS_SpawnEnemyVehicle",2]
}];

/// Red Berm Actions
redBermActivate addAction ["<t color='#0345fc'>Teleport to Blue Berm Course</t>",{ 
	if(getPos blueBermTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos blueBermTeleport;
		vehicle (_this select 1) setDir getDir blueBermTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on Blue Teleport Site"
	}
}];
redBermActivate addAction ["<t color='#39fc03'>Teleport to Green Berm Course</t>",{ 
	if(getPos greenBermTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos greenBermTeleport;
		vehicle (_this select 1) setDir getDir greenBermTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on Green Teleport Site"
	}
}];
redBermActivate addAction ["<t color='#fce703'>Teleport to Keyhole Course</t>",{ 
	if(getPos KeyholeTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos KeyholeTeleport;
		vehicle (_this select 1) setDir getDir KeyholeTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on Keyhole Teleport Site"
	}
}];
redBermActivate addAction ["<t color='#eeeee4'>Teleport to Contact Recon Course</t>",{ 
	if(getPos ContactReconTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos ContactReconTeleport;
		vehicle (_this select 1) setDir getDir ContactReconTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on teleport site"
	}
}];
redBermActivate addAction ["<t color='#fc2403'>Activate Red Berm Course</t>",{ 
	[
		(_this select 0),
		objectParent (_this select 1),
		[bermtarget_10,bermtarget_11,bermtarget_12,bermtarget_13,bermtarget_14,bermtarget_15,bermtarget_16,bermtarget_17],
		"Red"
	] remoteExec ["OKS_SpawnEnemyVehicle",2]
}];

/// Green Berm Actions
GreenBermActivate addAction ["<t color='#0345fc'>Teleport to Blue Berm Course</t>",{ 
	if(getPos blueBermTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos blueBermTeleport;
		vehicle (_this select 1) setDir getDir blueBermTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on Blue Teleport Site"
	}
}];
GreenBermActivate addAction ["<t color='#fc2403'>Teleport to Red Berm Course</t>",{ 
	if(getPos RedBermTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos redBermTeleport;
		vehicle (_this select 1) setDir getDir redBermTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on teleport site"
	}
}];
GreenBermActivate addAction ["<t color='#39fc03'>Activate Green Berm Course</t>",{ 
	[
		(_this select 0),
		objectParent (_this select 1),
		[bermtarget_18,bermtarget_19,bermtarget_20,bermtarget_21,bermtarget_22,bermtarget_23,bermtarget_24,bermtarget_25,bermtarget_26,bermtarget_27,bermtarget_28],
		"Green"
	] remoteExec ["OKS_SpawnEnemyVehicle",2]
}];

//// Keyhole Actions
KeyholeActivate addAction ["<t color='#fc2403'>Teleport to Red Berm Course</t>",{ 
	if(getPos RedBermTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos redBermTeleport;
		vehicle (_this select 1) setDir getDir redBermTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on teleport site"
	}
}];
KeyholeActivate addAction ["<t color='#fce703'>Activate Keyhole Course</t>",{ 
	[
		(_this select 0),
		objectParent (_this select 1),
		[KeyholeTarget_1,KeyholeTarget_2,KeyholeTarget_3,KeyholeTarget_4,KeyholeTarget_5,KeyholeTarget_6,KeyholeTarget_7],
		"Keyhole"
	] remoteExec ["OKS_SpawnEnemyVehicle",2]
}];
KeyholeActivate_2 addAction ["<t color='#fce703'>Activate Keyhole Course</t>",{ 
	[
		(_this select 0),
		objectParent (_this select 1),
		[KeyholeTarget_11,KeyholeTarget_12,KeyholeTarget_13,KeyholeTarget_14,KeyholeTarget_15,KeyholeTarget_16,KeyholeTarget_17],
		"Keyhole"
	] remoteExec ["OKS_SpawnEnemyVehicle",2]
}];

/// Contact Recon Actions
//// Keyhole Actions
ContactReconActivate addAction ["<t color='#fc2403'>Teleport to Red Berm Course</t>",{ 
	if(getPos RedBermTeleport nearEntities ["LandVehicle", 15] isEqualTo []) then {
		vehicle (_this select 1) setPos getPos redBermTeleport;
		vehicle (_this select 1) setDir getDir redBermTeleport;
	}
	else 
	{
		systemChat "Unable to teleport, vehicle on teleport site"
	}
}];