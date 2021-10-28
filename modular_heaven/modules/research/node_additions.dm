/datum/techweb_node
	var/module_designs = list()

/datum/techweb_node/Initialize()
	add_module_items()
	..()

/datum/techweb_node/proc/add_module_items()
	for(var/item in module_designs)
		if(design_ids[item])
			design_ids[item] += module_designs[item]
		else
			design_ids[item] = module_designs[item]

/*
	Code to take a list of IDs and add them to existing tech nodes.
	Simply input a specific techweb_node and make a list of design ID's in the module_design list.
*/
