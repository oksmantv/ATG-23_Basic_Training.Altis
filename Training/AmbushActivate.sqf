Params ["_Spawn","_Waypoint","_End","_Side","_Difficulty","_NameText"];
Private ["_VehicleArray","_TroopArray"];

switch(toLower _Difficulty) do {
	case "very easy":{
		_VehicleArray = [6,["UK3CB_ARD_O_Ural", "UK3CB_ARD_O_Ural_Fuel", "UK3CB_ARD_O_Ural_Open", "UK3CB_ARD_O_Ural_Ammo", "UK3CB_ARD_O_Ural_Repair", "UK3CB_ARD_O_Ural_Recovery"],8,25];
		_TroopArray = [true,6];
	};	
	case "easy":{
		_VehicleArray = [6,["UK3CB_ARD_O_BTR40_MG", "UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR40_MG","UK3CB_ARD_O_BTR40"],8,25];
		_TroopArray = [true,4];
	};
	case "medium":{
		_VehicleArray = [6,["UK3CB_ARD_O_BTR70", "UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR40_MG","UK3CB_ARD_O_BTR40"],8,25];
		_TroopArray = [true,5];		
	};
	case "hard":{
		_VehicleArray = [7,["UK3CB_ARD_O_BTR80a","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR80","UK3CB_ARD_O_BTR40"],8,25];
		_TroopArray = [true,6];				
	};
	case "very hard":{
		_VehicleArray = [7,["UK3CB_ARD_O_BTR80a","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR80","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR80","UK3CB_ARD_O_BTR40"],8,25];
		_TroopArray = [true,6];				
	};
	case "extreme":{
		_VehicleArray = [8,["UK3CB_ARD_O_BTR80a","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR80","UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR80a","UK3CB_ARD_O_BTR40_MG"],8,25];
		_TroopArray = [true,6];				
	};
	case "impossible":{
		_VehicleArray = [7,["UK3CB_ARD_O_BMP1", "UK3CB_ARD_O_BMP2", "UK3CB_ARD_O_BRM1K", "UK3CB_ARD_O_BMP2K", "UK3CB_ARD_O_MTLB_PKT", "UK3CB_ARD_O_T55"],8,30];
		_TroopArray = [true,6];				
	};	
	case default{
		_VehicleArray = [5,["UK3CB_ARD_O_BTR40_MG", "UK3CB_ARD_O_BTR40","UK3CB_ARD_O_BTR40"],8,25];
		_TroopArray = [true,4];			
	};
};
["HQ","side",format["%1 Activated: Difficulty - %2",_NameText,_Difficulty]] remoteExec ["OKS_Chat",0];
[_Spawn,_Waypoint,_End,_Side,_VehicleArray,_TroopArray] remoteExec ["ConvoySpawn",2];