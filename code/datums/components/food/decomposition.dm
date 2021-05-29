//"Don't leave food on the floor, that's how we get ants"
/datum/component/decomposition
	dupe_mode = COMPONENT_DUPE_UNIQUE
	///How decomposed a specific food item is. This will go rather high due to the 2 second process timer.
	var/decomposition_level = 0
	var/is_stored = FALSE

/datum/component/decomposition/Initialize()
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, .proc/table_check)
	RegisterSignal(parent, COMSIG_ITEM_PICKUP, .proc/picked_up)
	RegisterSignal(parent, COMSIG_STORAGE_ENTERED, .proc/storage_check) //Checks if you put it in storage
	RegisterSignal(parent, COMSIG_CLOSET_CONTENTS_EXPOSED, .proc/table_check)
	RegisterSignal(parent, COMSIG_CLOSET_CONTENTS_SEALED, .proc/picked_up) //Checks if it's in a closed closet
	RegisterSignal(parent, COMSIG_STORAGE_EXITED, .proc/table_check) //Checks if a storage object has been dumped
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, .proc/examine)

/datum/component/decomposition/Destroy()
	UnregisterSignal(parent, COMSIG_ITEM_DROPPED, .proc/table_check)
	UnregisterSignal(parent, COMSIG_ITEM_PICKUP, .proc/picked_up)
	UnregisterSignal(parent, COMSIG_STORAGE_ENTERED, .proc/storage_check)
	UnregisterSignal(parent, COMSIG_CLOSET_CONTENTS_EXPOSED, .proc/table_check)
	UnregisterSignal(parent, COMSIG_CLOSET_CONTENTS_SEALED, .proc/picked_up)
	UnregisterSignal(parent, COMSIG_STORAGE_EXITED, .proc/table_check)
	UnregisterSignal(parent, COMSIG_PARENT_EXAMINE, .proc/examine)
	STOP_PROCESSING(SSobj, src)
	return ..()

/datum/component/decomposition/proc/storage_check()
	SIGNAL_HANDLER
	is_stored = TRUE
	STOP_PROCESSING(SSobj, src)

/datum/component/decomposition/proc/table_check(obj/item/food/decomp)
	SIGNAL_HANDLER
	if(locate(/obj/structure/table) in decomp.loc || is_stored)
		is_stored = FALSE //Made false here so storage dumping will still be affected.
		return
	START_PROCESSING(SSobj, src)

/datum/component/decomposition/proc/picked_up()
	SIGNAL_HANDLER
	STOP_PROCESSING(SSobj, src)

/datum/component/decomposition/process(delta_time)
	var/obj/item/food/decomp = parent //Lets us spawn things at decomp
	decomposition_level += delta_time
	if(decomposition_level >= 600) //10 minutes
		new /obj/item/reagent_containers/food/snacks/badrecipe/rotten(decomp.loc)
		qdel(decomp)
		return
	if(decomposition_level == 300) //5 minutes
		new /obj/effect/decal/cleanable/ants(decomp.loc)

/datum/component/decomposition/proc/examine(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER
	switch(decomposition_level)
		if (0 to 149)
			return
		if(150 to 299)
			examine_list += "[parent] looks kinda stale."
		if(300 to 449)
			examine_list += "[parent] is starting to look pretty gross."
		if(450 to 600)
			examine_list += "[parent] looks barely edible."
