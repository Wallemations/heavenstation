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

/obj/item/clothing/under/suit/redlady
	name = "Her Gift"
	desc = "A new form, courtesy of Her. How nice!"
	icon = 'modular_heaven/modules/players/Dor/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Dor/icons/mobsuits.dmi'
	icon_state = "redlady"
	inhand_icon_state = "redlady"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACE|HIDEFACIALHAIR
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/handled = FALSE

/obj/item/clothing/under/suit/redlady/equipped(mob/user, slot)
	if(slot != ITEM_SLOT_ICLOTHING)
		return
	if(iscarbon(user) && !handled)
		handled = TRUE
		ADD_TRAIT(user, TRAIT_HOLY, "suit")
		to_chat(user, "<span class='notice'>Your skin seems to glow.</span.?>")
		user.AddElement(/datum/element/holy_light)

/obj/item/clothing/under/suit/redlady/dropped(mob/user)
	if(handled)
		handled = FALSE
		REMOVE_TRAIT(user, TRAIT_HOLY, "suit")
		user.RemoveElement(/datum/element/holy_light)

////////Nar'sie////////
///////////////////////
////////Reshia/////////

/obj/item/clothing/under/suit/reshia
	name = "Red Ribbon"
	desc = "A red ribbon that uncomfortably constricts your neck."
	icon = 'modular_heaven/modules/players/Dor/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Dor/icons/mobsuits.dmi'
	icon_state = "reshia"
	inhand_icon_state = "reshia"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACE|HIDEFACIALHAIR
	var/handled = FALSE

/obj/item/clothing/under/suit/reshia/examine(mob/user)
	. = ..()
	if(in_range(src, user) || isobserver(user))
		. += "<span class='notice'>OOC: This item is only for Reshia, don't be cringe.</span.?>"

/obj/item/clothing/under/suit/reshia/equipped(mob/user, slot)
	if(slot != ITEM_SLOT_ICLOTHING)
		return
	if(ismoth(user))
		handled = TRUE
		user.set_species(/datum/species/void)
		to_chat(user, "<span class='notice'>Your body is overtaken by a dark force!</span.?>")

/obj/item/clothing/under/suit/reshia/dropped(mob/user)
	. = ..()
	if(handled)
		if(ishuman(user)) //same as above
			user.set_species(/datum/species/moth)
			handled = FALSE
			to_chat(user, "<span class='notice'>You feel a wave of light wash over you!</span.?>")

////////Reshia/////////
///////////////////////
/////////Jack//////////

/obj/item/clothing/under/suit/valor_suit
	name = "Valor's Suit"
	desc = "A peculiar suit, made from an unknown material. Are they hiding something?"
	icon = 'modular_heaven/modules/players/Dor/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Dor/icons/mobsuits.dmi'
	icon_state = "valor_suit"
	inhand_icon_state = "black_suit"
	resistance_flags = FIRE_PROOF | ACID_PROOF
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS

/////////Jack//////////
///////////////////////
