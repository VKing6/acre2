/*
 * Author: ACRE2Team
 * Checks the availability of the infantry phone speaker action.
 *
 * Arguments:
 * 0: Vehicle with an intercom action <OBJECT>
 * 1: Unit to be checked <OBJECT>
 * 2: Intercom network <NUMBER>
 *
 * Return Value:
 * Speaker action is available <BOOL>
 *
 * Example:
 * [cursorTarget] call acre_sys_intercom_fnc_isInfantryPhoneSpeakerAvailable
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_unit", "_intercomNetwork"];

if (!alive _unit) exitWith {false};

private _intercomName = (_vehicle getVariable [QGVAR(intercomNames), []]) select _intercomNetwork;
private _intercomControl = _vehicle getVariable [QGVAR(infantryPhoneControlActions), []];

// For the moment only those in crew intercom are entitled to infantry phone actions
[_vehicle, _unit, _intercomNetwork] call FUNC(isIntercomAvailable) && (_intercomName in _intercomControl)
