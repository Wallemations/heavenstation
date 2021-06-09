/obj/item/storage/box/matches
	icon = 'modular_heaven/modules/bottle_matches/icons/matches.dmi'

/obj/item/storage/box/matches/update_icon_state()
	switch(length(contents))
		if(10)
			icon_state = initial(icon_state)
		if(5 to 9)
			icon_state = "[initial(icon_state)]_almostfull"
		if(1 to 4)
			icon_state = "[initial(icon_state)]_almostempty"
		if(0)
			icon_state = "[initial(icon_state)]_e"

/obj/item/reagent_containers/food/drinks
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/obj/item/storage/box/matches/nanotrasen
	name = "\improper Nanotrasen matchbox"
	desc = "A small box of specialty Nanotrasen matches, perfect for relaxing after a hard day of bossing everyone around."
	icon_state = "matchbox-n"

/obj/item/storage/box/matches/syndicate
	name = "\improper Syndicate matchbox"
	desc = "While they offer no tactical advantages over conventional matches, the red of the box goes perfectly with your eyes."
	icon_state = "matchbox-s"
