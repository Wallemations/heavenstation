///////////////////////
////////Nar'sie////////

/obj/item/clothing/neck/petcollar/narsie
	name = "collar"
	desc = "Good thing Goat Butlers aren't real,right?"
	icon = 'modular_heaven/modules/players/Dor/icons/worn_clothes.dmi'
	icon_state = "collar"

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

////////Nar'sie////////
///////////////////////
////////Reshia/////////

/obj/item/clothing/under/suit/nomura_designs
    name = "Refined Red Skirt"
    desc = "Extra accessories to keep yourself together. Literally."
    icon = 'modular_heaven/modules/players/Dor/icons/suits.dmi'
    worn_icon = 'modular_heaven/modules/players/Dor/icons/mobsuits.dmi'
    icon_state = "refined"
    inhand_icon_state = "refined"

/obj/item/clothing/shoes/nomura_designs
    name = "Baggy Cowboy Boots"
    desc = "The belts are essential. Probably."
    icon = 'modular_heaven/modules/players/Dor/icons/shoes.dmi'
    worn_icon = 'modular_heaven/modules/players/Dor/icons/worn_shoes.dmi'
    icon_state = "baggy_boots"
    inhand_icon_state = "baggy_boots"

/obj/item/clothing/under/suit/reshia
	name = "Red Ribbon"
	desc = "A red ribbon that uncomfortably constricts your neck."
	icon = 'modular_heaven/modules/players/Dor/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Dor/icons/mobsuits.dmi'
	icon_state = "reshia"
	inhand_icon_state = "reshia"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACE|HIDEFACIALHAIR
	var/datum/weakref/moff = null

/obj/item/clothing/under/suit/reshia/examine(mob/user)
	. = ..()
	if(in_range(src, user) || isobserver(user))
		. += "<span class='notice'>OOC: This item is only for Reshia, don't be cringe.</span.?>"

/obj/item/clothing/under/suit/reshia/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_ICLOTHING)
		return
	if(ismoth(user) && isnull(moff))
		moff = WEAKREF(user)
		user.set_species(/datum/species/void)
		to_chat(user, "<span class='notice'>Your body is overtaken by a dark force!</span.?>")

/obj/item/clothing/under/suit/reshia/dropped(mob/user)
	. = ..()
	if(IS_WEAKREF_OF(user, moff))
		user.set_species(/datum/species/moth)
		moff = null
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
