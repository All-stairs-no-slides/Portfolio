var _collections = [machine_learning_col_obj, gam_jams_col_obj]
current_nodes = []

for(var _i = 0; _i < array_length(_collections); _i++)
{
	current_nodes[_i] = instance_create_depth(player_inst.x, player_inst.y, depth, _collections[_i])
}


