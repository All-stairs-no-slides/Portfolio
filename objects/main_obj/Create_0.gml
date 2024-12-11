var _collections = [This_portfolio, For_our_continuation]
selected_node = false
more_details = false
current_nodes = []

for(var _i = 0; _i < array_length(_collections); _i++)
{
	current_nodes[_i] = instance_create_depth(player_inst.x, player_inst.y, depth, _collections[_i])
}


