//"Don't leave food on the floor, that's how we get ants"
/datum/component/decomposition
	dupe_mode = COMPONENT_DUPE_UNIQUE
	///How decomposed a specific food item is. This will go rather high due to the 2 second process timer.
	var/decomposition_level = 0

/datum/component/decomposition/Initialize()
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, .proc/table_check)
	RegisterSignal(parent, COMSIG_ITEM_PICKUP, .proc/picked_up)
	RegisterSignal(parent, COMSIG_CLOSET_CONTENTS_EXPOSED, .proc/table_check)
	RegisterSignal(parent, COMSIG_CLOSET_CONTENTS_SEALED, .proc/picked_up) //Checks if it's in a closed closet

/datum/component/decomposition/Destroy()
	UnregisterSignal(parent, COMSIG_ITEM_DROPPED, .proc/table_check)
	UnregisterSignal(parent, COMSIG_ITEM_PICKUP, .proc/picked_up)
	UnregisterSignal(parent, COMSIG_CLOSET_CONTENTS_EXPOSED, .proc/table_check)
	UnregisterSignal(parent, COMSIG_CLOSET_CONTENTS_SEALED, .proc/picked_up)
	STOP_PROCESSING(SSobj, src)
	return ..()

/datum/component/decomposition/proc/table_check(obj/item/food/decomp)
	SIGNAL_HANDLER
	if(locate(/obj/structure/table) in decomp.loc)
		return
	START_PROCESSING(SSobj, src)

/datum/component/decomposition/proc/picked_up()
	SIGNAL_HANDLER
	STOP_PROCESSING(SSobj, src)

/datum/component/decomposition/process(delta_time, obj/item/food/decomp)
	decomposition_level += 1 //Gonna fire every 2 seconds, so to find specific values in minutes use (minutes*60)/2.
	if(decomposition_level == 150)
		new /obj/item/reagent_containers/food/snacks/badrecipe/rotten(get_turf(parent))
		qdel(parent)
		return
	if(decomposition_level == 75 && prob(90))
		new /obj/effect/decal/cleanable/ants(get_turf(parent))
