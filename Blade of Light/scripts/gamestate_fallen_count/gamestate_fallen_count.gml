/// @function gamestate_fallen_count(faction)
/// @description Gets the number of fallen warriors from the given faction.
/// @param {string} faction

return ds_list_size(ctrl_overmind.gamestate[? "fallen_" + argument0]);
