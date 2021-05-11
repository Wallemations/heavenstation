///Abstract class to allow us to easily create all the generic "normal" food without too much copy pasta of adding more components
/obj/item/food
	name = "food"
	desc = "you eat this"
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_NORMAL
	///List of reagents this food gets on creation
	var/list/food_reagents
	///Extra flags for things such as if the food is in a container or not
	var/food_flags
	///Bitflag of the types of food this food is
	var/foodtypes
	///Amount of volume the food can contain
	var/max_volume
	///How long it will take to eat this food without any other modifiers
	var/eat_time
	///Tastes to describe this food
	var/list/tastes
	///Verbs used when eating this food in the to_chat messages
	var/list/eatverbs
	///How much reagents per bite
	var/bite_consumption
	///What you get if you microwave the food, this should be replaced once I fully re-work cooking.
	var/microwaved_type
	///Type of atom thats spawned after eating this item
	var/trash_type
	///How decomposed a specific food item is. This will go rather high due to the 2 second process timer.
	var/decomposition_level = 0
	///If a food is unable to decompose
	var/preserved_food = FALSE

/obj/item/food/Initialize()
	. = ..()
	if(food_reagents)
		food_reagents = string_assoc_list(food_reagents)
	if(tastes)
		tastes = string_assoc_list(tastes)
	if(eatverbs)
		eatverbs = string_list(eatverbs)
	MakeEdible()
	MakeProcessable()
	MakeLeaveTrash()

///This proc adds the edible component, overwrite this if you for some reason want to change some specific args like callbacks.
/obj/item/food/proc/MakeEdible()
	AddComponent(/datum/component/edible,\
				initial_reagents = food_reagents,\
				food_flags = food_flags,\
				foodtypes = foodtypes,\
				volume = max_volume,\
				eat_time = eat_time,\
				tastes = tastes,\
				eatverbs = eatverbs,\
				bite_consumption = bite_consumption,\
				microwaved_type = microwaved_type)


///This proc handles processable elements, overwrite this if you want to add behavior such as slicing, forking, spooning, whatever, to turn the item into something else
/obj/item/food/proc/MakeProcessable()
	return

///This proc handles trash components, overwrite this if you want the object to spawn trash
/obj/item/food/proc/MakeLeaveTrash()
	if(trash_type)
		AddElement(/datum/element/food_trash, trash_type)
	return

/obj/item/food/dropped()
	.=..()
	if (locate(/obj/structure/table) in loc || preserved_food)
		return
	START_PROCESSING(SSobj, src)

/obj/item/food/pickup()
	.=..()
	STOP_PROCESSING(SSobj, src)

/obj/item/food/process(delta_time)
	decomposition_level += 1 //Gonna fire every 2 seconds, so to find specific values in minutes use (minutes*60)/2. Do NOT use the actual minutes proc, it will come out too large.
	if(decomposition_level == 150)
		qdel(src)
		return
	if(decomposition_level == 75)
		new /obj/effect/decal/cleanable/ants(get_turf(src))
