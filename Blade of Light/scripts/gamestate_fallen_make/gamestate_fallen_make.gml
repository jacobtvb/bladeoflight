/// @function gamestate_fallen_make(faction,name)
/// @description Registers a given warrior from the given faction as fallen.
/// @param {string} faction
/// @param {string} name

if (!gamestate_fallen_get(argument0, argument1))
    ds_list_add(ctrl_overmind.gamestate[? "fallen_" + argument0], argument1);
