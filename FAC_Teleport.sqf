if (hasInterface) then {
    _condition = {player getVariable ["GOL_SelectedRole",""] select 0 == "fac"}; //<only works MP
	// NEKY EDIT START
	_code =
	{
		openMap true;
		[Side Player, systemChat "Teleport: Select coordinates"] onMapSingleClick
		{
			player setPos _pos;
			systemChat format["You have moved to grids: %1",mapGridPosition _pos]
		};
	};

	_action = ["Teleport", "Teleport","a3\ui_f\data\gui\cfg\cursors\move_gs.paa", _code, _condition] call ace_interact_menu_fnc_createAction;
	[typeOf player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

};

//_condition = {leader (group player) isEqualTo (leader player)};
// Thanks to Neko & Guzzman for the scripts and helping fixing errors.
// Here I have made nekos scripts and functions compatabile to the ace UI,
//only thing you can edit really is [blufor,"","drop",["spawn",_pos,"despawn"] so this means/ change side,"","unload or drop", ["markername","mouse click","markername"]
// By Luke.


