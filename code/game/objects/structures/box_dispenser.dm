/obj/structure/box_dispenser
	name = "box dispenser"
	desc = "A wall-mounted cage of iron rods perfectly shaped for the average box."
	icon_state = "dispenser_empty"
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
	density = FALSE
	resistance_flags = FIRE_PROOF
	/// The box that we are currently hoding
	var/obj/item/storage/box/current_box
	/// If we're pre-loaded with a box, then this is that box.
	var/obj/item/storage/box/pre_loaded


/obj/structure/box_dispenser/Initialize(mapload)
	. = ..()
	if(pre_loaded)
		current_box = new pre_loaded()


/obj/structure/box_dispenser/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!current_box)
		balloon_alert(user, "no box")
		return
