/// @function gamestate_fallen_get(faction,name)
/// @description Checks whether a given warrior from the given faction is fallen or not.
/// @param {string} faction
/// @param {string} name

return ds_list_find_index(ctrl_overmind.gamestate[? "fallen_" + argument0], argument1) >= 0;
