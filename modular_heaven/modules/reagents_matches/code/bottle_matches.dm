/obj/item/storage/box/matches
	icon = 'modular_heaven/modules/reagents_matches/icons/matches.dmi'

/obj/item/storage/box/matches/nanotrasen
	name = "\improper Nanotrasen matchbox"
	desc = "A small box of specialty Nanotrasen matches, perfect for relaxing after a hard day of bossing everyone around."
	icon_state = "matchbox-n"
	base_icon_state = "matchbox-n"

/obj/item/storage/box/matches/syndicate
	name = "\improper Syndicate matchbox"
	desc = "While they offer no tactical advantages over conventional matches, the red of the box goes perfectly with your eyes."
	icon_state = "matchbox-s"
	base_icon_state = "matchbox-s"

/////// Matches ////////
////////////////////////

/datum/reagent
	// Used to divert specific reagents to our custom sprites
	var/has_custom_glass = FALSE

