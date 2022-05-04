/obj/item/storage/hypospraykit
	name = "hypospray kit"
	desc = "It's a kit containing a hypospray and specific treatment chemical-filled vials."
	icon_state = "firstaid-mini"
	icon = 'modular_heaven/modules/hypospray_2/icons/storage.dmi'
	inhand_icon_state = "firstaid"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	throw_speed = 3
	throw_range = 7
	var/empty = FALSE

/obj/item/storage/hypospraykit/Initialize()
	. = ..()
	var/datum/component/storage/stored = GetComponent(/datum/component/storage)
	stored.max_items = 12
	stored.can_hold = typecacheof(list(
		/obj/item/hypospray/mkii,
		/obj/item/reagent_containers/glass/hypovial
	))
	update_icon_state()
	update_icon()

//END OF HYPOSPRAY CASE MENU CODE

/obj/item/storage/hypospraykit/empty
	desc = "A hypospray kit with general use vials."

/obj/item/storage/hypospraykit/empty/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii(src)
	new /obj/item/reagent_containers/glass/hypovial/small(src)
	new /obj/item/reagent_containers/glass/hypovial/small(src)
	new /obj/item/reagent_containers/glass/hypovial/small(src)

/obj/item/storage/hypospraykit/cmo
	name = "deluxe hypospray kit"
	desc = "A kit containing a deluxe hypospray and vials."
	icon_state = "rad-mini"
	inhand_icon_state = "firstaid-rad"

/obj/item/storage/hypospraykit/cmo/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/cmo(src)
	new /obj/item/reagent_containers/glass/hypovial/large/multiver(src)
	new /obj/item/reagent_containers/glass/hypovial/large/salglu(src)
	new /obj/item/reagent_containers/glass/hypovial/large/synthflesh(src)
	new /obj/item/reagent_containers/glass/hypovial/large/omnizine(src)

/obj/item/storage/box/hypovials
	name = "box of hypovials"

/obj/item/storage/box/hypovials/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/glass/hypovial/small( src )

/obj/item/storage/box/hypospray
	name = "box of hypospray kits"

/obj/item/storage/box/hypospray/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/storage/hypospraykit/empty(src)

/obj/item/storage/hypospraykit/regular
	icon_state = "firstaid-mini"
	desc = "A hypospray kit with general use vials."

/obj/item/storage/hypospraykit/regular/PopulateContents()
	if(empty)
		return
	new /obj/item/hypospray/mkii/standard(src)
	new /obj/item/reagent_containers/glass/hypovial/small/formaldehyde(src)
	new /obj/item/reagent_containers/glass/hypovial/small(src)

/obj/item/storage/hypospraykit/brute
	name = "brute hypovial kit"
	icon_state = "brute-mini"
	desc = "A hypovial kit with vials to help with brute damage."

/obj/item/storage/hypospraykit/brute/PopulateContents()
	if(empty)
		return
	new /obj/item/reagent_containers/glass/hypovial/small/libital(src)
	new /obj/item/reagent_containers/glass/hypovial/small/libital(src)

/obj/item/storage/hypospraykit/burn
	name = "burn hypovial kit"
	icon_state = "burn-mini"
	desc = "A hypovial kit with vials to help with burn damage."

/obj/item/storage/hypospraykit/burn/PopulateContents()
	if(empty)
		return
	new /obj/item/reagent_containers/glass/hypovial/small/aiuri(src)
	new /obj/item/reagent_containers/glass/hypovial/small/aiuri(src)

/obj/item/storage/hypospraykit/o2
	name = "oxygen deprivation hypovial kit"
	icon_state = "oxy-mini"
	desc = "A hypovial kit with vials to help with oxygen deprivation."

/obj/item/storage/hypospraykit/o2/PopulateContents()
	if(empty)
		return
	new /obj/item/reagent_containers/glass/hypovial/small/convermol(src)
	new /obj/item/reagent_containers/glass/hypovial/small/convermol(src)

/obj/item/storage/hypospraykit/tox
	name = "toxins hypovial kit"
	icon_state = "toxin-mini"
	desc = "A hypovial kit with vials to help with toxin damage."

/obj/item/storage/hypospraykit/tox/PopulateContents()
	if(empty)
		return
	new /obj/item/reagent_containers/glass/hypovial/small/multiver(src)
	new /obj/item/reagent_containers/glass/hypovial/small/multiver(src)
