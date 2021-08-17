///////////////////////
////////Nar'sie////////

/obj/item/clothing/neck/collar
	name = "collar"
	desc = "Good thing Goat Butlers aren't real,right?"
	icon = 'modular_heaven/modules/players/Dor/icons/worn_clothes.dmi'
	icon_state = "collar"
	var/tagname = null

/obj/item/clothing/neck/collar/attack_self(mob/user)
	tagname = stripped_input(user, "Would you like to change the name on the tag?", "Name your new pet", "Spot", MAX_NAME_LEN)
	name = "[initial(name)] - [tagname]"

////////Nar'sie////////
///////////////////////
////////Reshia/////////



////////Reshia/////////
///////////////////////
/////////Jack//////////
