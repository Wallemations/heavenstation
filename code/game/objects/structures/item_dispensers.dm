/obj/structure/item_dispenser
	name = "item dispenser"
	desc = "A small wall-mounted receptacle which dispenses a specific item."
	icon = 'icons/obj/wallmounts.dmi'
	icon_state = "dispenser_generic"
	anchored = TRUE
	density = FALSE
	max_integrity = 200
	integrity_failure = 0.25
	var/charges = 0 // How many of the item is in the dispenser
	var/stock //What item we want
	var/item_name = null //Otherwise we'd get full item names and that's clutter. Mainly used for pre-set dispensers.

/obj/structure/item_dispenser/examine(mob/user)
	. = ..()
	if(charges)
		. += "<span class='notice'>There are [charges] [item_name] remaining.</span>"
	if(!charges)
		. += "<span class='notice'>It's empty!</span>"

/obj/structure/item_dispenser/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WRENCH && !charges)
		to_chat(user, "<span class='notice'>You start unsecuring the [name]...</span>")
		I.play_tool_sound(src)
		if(I.use_tool(src, user, 1 SECONDS))
			playsound(loc, 'sound/items/deconstruct.ogg', 50, TRUE)
			to_chat(user, "<span class='notice'>You unsecure [name].</span>")
			new /obj/item/wallframe/item_dispenser(get_turf(src))
			qdel(src)
		return
	if(I.tool_behaviour == TOOL_WRENCH && charges)
		to_chat(user, "<span class='notice'>The [name] needs to be empty to be deconstructed!</span>")
	/*if(!I.w_class > 2 && !stock)
		stock = I
		item_name = I.name
		name = "[item_name] dispenser"
		desc = "A small wall-mounted receptacle which dispenses [item_name]."
		to_chat(user, "<span class='notice'>The dispenser will now accept [item_name]!</span>")
		icon_state = "[initial(icon_state)]0"
		return
	else if(I.w_class > 2)
		to_chat(user, "<span class='notice'>It's too large for the dispenser!</span>")
		return*/
	if(istype(I, stock))
		playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
		qdel(I)
		charges += 1
		to_chat(user, "<span class='notice'>You insert the [item_name] into the dispenser.</span>")
		if(charges == 1)
			icon_state = "[initial(icon_state)]"

/obj/structure/item_dispenser/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(!charges)
		to_chat(user, "<span class='notice'>It's empty!</span>")
		return
	if(iscyborg(user) || isalien(user))
		return
	if(charges)
		if(charges == 1)
			icon_state = "[initial(icon_state)]0"
		var/obj/item/O = new stock(get_turf(src))
		to_chat(user, "<span class='notice'>You take the [item_name] from the [name].</span>")
		user.put_in_hands(O)
		playsound(loc, 'sound/machines/click.ogg', 15, TRUE, -3)
		charges -= 1

//////////////////////////////////
//////  Pre-set Dispensers  //////

/obj/structure/item_dispenser/glasses
	name = "glasses dispenser"
	desc = "A small wall-mounted receptacle which dispenses glasses."
	icon_state = "dispenser_glasses"
	stock =	/obj/item/clothing/glasses/regular
	item_name = "glasses"
	charges = 7

/obj/structure/item_dispenser/handcuffs
	name = "handcuff dispenser"
	desc = "A small wall-mounted receptacle which dispenses handcuffs."
	icon_state = "dispenser_handcuffs"
	stock =	/obj/item/restraints/handcuffs
	item_name = "handcuffs"
	charges = 7

/obj/structure/item_dispenser/latex
	name = "latex glove dispenser"
	desc = "A small wall-mounted receptacle which dispenses latex gloves."
	icon_state = "dispenser_gloves"
	stock =	/obj/item/clothing/gloves/color/latex
	item_name = "latex gloves"
	charges = 7

/obj/structure/item_dispenser/mask
	name = "facemask dispenser"
	desc = "A small wall-mounted receptacle which dispenses facemasks."
	icon_state = "dispenser_mask"
	stock =	/obj/item/clothing/mask/surgical
	item_name = "facemask"
	charges = 7

/obj/structure/item_dispenser/id
	name = "id card dispenser"
	desc = "A small wall-mounted receptacle which dispenses id cards."
	icon_state = "dispenser_id"
	stock =	/obj/item/card/id
	item_name = "id card"
	charges = 7

/obj/structure/item_dispenser/radio
	name = "radio dispenser"
	desc = "A small wall-mounted receptacle which dispenses radios."
	icon_state = "dispenser_radio"
	stock =	/obj/item/radio
	item_name = "radio"
	charges = 3

/obj/structure/item_dispenser/bodybag
	name = "bodybag dispenser"
	desc = "A small wall-mounted receptacle which dispenses bodybags."
	icon_state = "dispenser_bodybag"
	stock =	/obj/item/bodybag
	item_name = "bodybag"
	charges = 7

////////  Pre-set Dispensers  /////////
///////////////////////////////////////
/// Wallframe for custom dispensers ///

/obj/item/wallframe/item_dispenser
	name = "item dispenser frame"
	desc = "An empty frame for an item dispenser."
	icon_state = "dispenser"
	custom_materials = list(/datum/material/plastic = 500, /datum/material/iron = 100)
	result_path = /obj/structure/item_dispenser
	pixel_shift = -27
