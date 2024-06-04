Params ["_Object","_Positions","_Target"];

_Object addAction
[
	"<t color='#C82B09'>Spawn Random Contact</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		_arguments params ["_Positions","_Target"];

		[_target,_Positions,_Target] remoteExec ["3DReportSpawner",2];

	},
	[_Positions,_Target],		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_Object addAction
[
	"<t color='#3FC809'>Setup Players</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		_players = allPlayers select {_X distance _target < 50};
		{_X setCaptive true; "You were set to captive." remoteExec ["systemChat",_X]} foreach _players;

	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_Object addAction
[
	"<t color='#ECE516'>Reset Players</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		_players = allPlayers select {_X distance _target < 50};
		{_X setCaptive false; "You were set to enemy." remoteExec ["systemChat",_X]} foreach _players;

	},
	nil,		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	5,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];
