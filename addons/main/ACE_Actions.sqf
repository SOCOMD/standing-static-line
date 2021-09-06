///////////////////////////////////////////////////////////////////////////////
// Air
///////////////////////////////////////////////////////////////////////////////
private _displayName = localize "STR_SSL_Main_StandingStaticLine";
private _icon = "\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa";
private _statement = {};
private _condition = ssl_main_fnc_canAccessStaticLineOut;
private _action = ["ssl_main_StandingStaticLine", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["Air", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
/*
_displayName = localize "STR_SSL_Main_RigAnchorCables";
_icon = "\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa";
_statement = ssl_main_fnc_RigAnchorCables;
_condition = ssl_main_fnc_canRigAnchorCables;
_action = ["ssl_main_RigAnchorCables", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["Air", 0, ["ACE_MainActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 1, ["ACE_SelfActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_StowAnchorCables";
_icon = "\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa";
_statement = ssl_main_fnc_StowAnchorCables;
_condition = ssl_main_fnc_canStowAnchorCables;
_action = ["ssl_main_StowAnchorCables", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["Air", 0, ["ACE_MainActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 1, ["ACE_SelfActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;
*/
_displayName = localize "STR_SSL_Main_GetInStanding";
_icon = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\getin_ca.paa";
_statement = ssl_main_fnc_getInStanding;
_condition = ssl_main_fnc_canGetInStanding;
_action = ["ssl_main_getInStanding", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["Air", 0, ["ACE_MainActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_StandUp";
_icon = "\z\ssl\addons\main\ui\stand_ca.paa";
_statement = {[_player] call ssl_main_fnc_standUp};
_condition = {[_player] call ssl_main_fnc_canStandUp};
_action = ["ssl_main_standUp", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["Air", 1, ["ACE_SelfActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;

///////////////////////////////////////////////////////////////////////////////
// ssl_proxy_stand
///////////////////////////////////////////////////////////////////////////////
["ssl_proxy_stand", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_HookUp";
_icon = "\a3\3den\Data\CfgWaypoints\hook_ca.paa";
_statement = {[_player] call ssl_main_fnc_HookUp};
_condition = {[_player] call ssl_main_fnc_canHookUp};
_action = ["ssl_main_HookUp", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["ssl_proxy_stand", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_SitDown";
_icon = "\z\ssl\addons\main\ui\sit_ca.paa";
_statement = {[_player] call ssl_main_fnc_SitDown};
_condition = {[_player] call ssl_main_fnc_canSitDown};
_action = ["ssl_main_SitDown", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["ssl_proxy_stand", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_Jump";
_icon = "\a3\air_f_beta\Parachute_01\Data\UI\Map_Parachute_01_CA.paa";
_statement = {[_player] call ssl_main_fnc_Jump};
_condition = {[_player] call ssl_main_fnc_canJump};
_action = ["ssl_main_Jump", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["ssl_proxy_stand", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;


_displayName = localize "STR_SSL_Main_Jump";
_icon = "\a3\air_f_beta\Parachute_01\Data\UI\Map_Parachute_01_CA.paa";
_statement = {[_player, false] call ssl_main_fnc_Jump};
_condition = {[_player] call ssl_main_fnc_canHALO};
_action = ["ssl_main_Jump", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["ssl_proxy_stand", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;


_displayName = localize "STR_SSL_Main_Unhook";
_icon = "\a3\3den\Data\CfgWaypoints\unhook_ca.paa";
_statement = {[_player] call ssl_main_fnc_Unhook};
_condition = {[_player] call ssl_main_fnc_canUnhook};
_action = ["ssl_main_Unhook", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["ssl_proxy_stand", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

///////////////////////////////////////////////////////////////////////////////
// CAManBase
///////////////////////////////////////////////////////////////////////////////
_displayName = localize "STR_SSL_Main_StandingStaticLine";
_icon = "\a3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa";
_statement = {};
_condition = ssl_main_fnc_canAccessStaticLine;
_action = ["ssl_main_StandingStaticLine", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_StandUp";
_icon = "\z\ssl\addons\main\ui\stand_ca.paa";
_statement = ssl_main_fnc_standUp;
_condition = ssl_main_fnc_canStandUp;
_action = ["ssl_main_standUp", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_HookUp";
_icon = "\a3\3den\Data\CfgWaypoints\hook_ca.paa";
_statement = ssl_main_fnc_HookUp;
_condition = ssl_main_fnc_canHookUp;
_action = ["ssl_main_HookUp", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_SitDown";
_icon = "\z\ssl\addons\main\ui\sit_ca.paa";
_statement = ssl_main_fnc_SitDown;
_condition = ssl_main_fnc_canSitDown;
_action = ["ssl_main_SitDown", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_Jump";
_icon = "\a3\air_f_beta\Parachute_01\Data\UI\Map_Parachute_01_CA.paa";
_statement = ssl_main_fnc_Jump;
_condition = ssl_main_fnc_canJump;
_action = ["ssl_main_Jump", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize "STR_SSL_Main_Unhook";
_icon = "\a3\3den\Data\CfgWaypoints\unhook_ca.paa";
_statement = ssl_main_fnc_Unhook;
_condition = ssl_main_fnc_canUnhook;
_action = ["ssl_main_Unhook", _displayName, _icon, _statement, _condition, {}, []] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ssl_main_StandingStaticLine"], _action, true] call ace_interact_menu_fnc_addActionToClass;
