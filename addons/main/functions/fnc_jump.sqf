#include "script_component.hpp"
/*
Author: Ampers
Perform static line jump

* Arguments:
* 0: Unit <OBJECT>
* 1: Static Jump <BOOLEAN>
*
* Return Value:
* -

* Example:
* [ACE_player] call ssl_main_fnc_jump
*/
params ["_unit", ["_static", true]];

private _aircraft = _unit getVariable ["ssl_aircraft", objNull];
if (isNull _aircraft) exitwith {};

private _velocity = velocity _aircraft;
private _anchorCableEnd = _unit getVariable ["ssl_anchorCableEnd", _aircraft];
private _anchorCableLength = 10 max (boundingBox _anchorCableEnd # 2);

if (_static) then {
    ["ssl_unhook", [_aircraft, _unit], _aircraft] call CBA_fnc_targetEvent;
    if (_anchorCableEnd != _aircraft) then {
        private _pack = _unit getVariable ["ssl_pack", objNull];
        if (!isNull _pack) then {
            deletevehicle _pack;
        };
        private _hook = _unit getVariable ["ssl_hook", objNull];
        if (!isNull _hook) then {
            _hook attachto [_aircraft, _aircraft worldToModel (getPos _anchorCableEnd)];
        };
    };
    
    // open parachute when static line is taut
    [{
        params ["_unit", "_anchorCableEnd", "_anchorCableLength"];
        (vehicle _unit == _unit) && {
            (_anchorCableEnd distance _unit) > _anchorCableLength
        }
    }, {
        params ["_unit"];
        if (backpack _unit isKindOf "B_Parachute") then {
            _unit action ["OpenParachute", _unit];
        } else {
            private _parachute = if (gettext (configFile >> "Cfgvehicles" >> SSL_defaultParachute >> "simulation") == "parachute") then {
                SSL_defaultParachute createvehicle [0, 0, 1000];
            } else {
                "NonSteerable_Parachute_F" createvehicle [0, 0, 1000];
            };
            _parachute setDir (getDir _unit);
            _parachute setPos (getPos _unit);
            _unit moveInAny _parachute;
        };
        // systemChat format ["%1 opened parachute", _unit];
    }, [_unit, _anchorCableEnd, _anchorCableLength]] call CBA_fnc_waitUntilandexecute;
    /*
    // unit match velocity with Aircraft
    [{
        params ["", "_unit"];
        (vehicle _unit == _unit)
    }, {
        params ["_velocity", "_unit"];
        _unit setvelocity _velocity;
        systemChat format ["%1 left aircraft", _unit];
    }, [_velocity, _unit]] call CBA_fnc_waitUntilandexecute;
    */
    
    // parachute match velocity with unit
    [{
        params ["", "_unit"];
        (vehicle _unit != _unit) && {
            vehicle _unit isKindOf "ParachuteBase"
        }
    }, {
        params ["_velocity", "_unit"];
        vehicle _unit setvelocity _velocity;
        // systemChat format ["%1 is in parachute", _unit];
    }, [_velocity, _unit]] call CBA_fnc_waitUntilandexecute;
} else {
    // create new proxy, accelerate to aircraft speed, eject player
    [{
        params ["", "_unit"];
        (vehicle _unit == _unit)
    }, {
        params ["_velocity", "_unit"];
        vehicle _unit setvelocity _velocity;
    }, [_velocity, _unit]] call CBA_fnc_waitUntilandexecute;
};
_unit setVariable ["ssl_state", SSL_SITTinG, true];
_unit setVariable ["ssl_aircraft", objNull];
if (vehicle _unit != _unit) then {
    _unit action ["getout", vehicle _unit];
};