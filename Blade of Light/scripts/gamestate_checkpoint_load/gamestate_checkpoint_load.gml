/// @function gamestate_checkpoint_load()
/// @description Loads the last state saved at checkpoint.

ds_map_destroy(ctrl_overmind.gamestate);
ctrl_overmind.gamestate = json_load("gamestate.json");

var _room = asset_get_index(gamestate_get("shrine_room"));
var _spawn = gamestate_get("shrine_spawn");
var _ofx = gamestate_get("shrine_xoffset");
var _ofy = gamestate_get("shrine_yoffset");

navigation_set(_room, _spawn, _ofx, _ofy);
navigation_do();
