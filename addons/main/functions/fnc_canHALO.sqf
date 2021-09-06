#include "script_component.hpp"
/*
Author: Ampers
Check if unit can hook up parachute to static line

* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* -

* Example:
* [player] call ssl_main_fnc_canHookUp
*/

params ["_unit"];

(_unit getVariable ["ssl_state", SSL_SITTING] == SSL_STANDING) && {
    (!SSL_RequireParachute || {backpack _unit isKindOf "B_Parachute"}) && {
        private _aircraft = _unit getVariable ["ssl_aircraft", objNull];
        ((!isNull _aircraft) && (getPos _aircraft) select 2 > 1000) //minimum HALO height of 1000m/3000ft
    }
}
