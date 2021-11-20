//Tay//

//Sabre replacement
/obj/item/melee/sabre
	icon = 'modular_heaven/modules/players/Tay/icons/obj/melee.dmi'

//Rapier code
/obj/item/melee/rapier
	name = "officer's rapier"
	desc = "A thin, somewhat flexible blade, trading brute force for armor-defeating precision. Somehow even flashier than the officer's sabre, showoff."
	icon_state = "rapier"
	inhand_icon_state = "sabre"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	flags_1 = CONDUCT_1
	obj_flags = UNIQUE_RENAME
	force = 12
	throwforce = 10
	w_class = WEIGHT_CLASS_BULKY
	block_chance = 65
	armour_penetration = 90
	sharpness = SHARP_EDGED
	attack_verb_continuous = list("stabs", "slashes")
	attack_verb_simple = list("stabs", "slashes")
	hitsound = 'sound/weapons/rapierhit.ogg'
	custom_materials = list(/datum/material/iron = 1000)
	wound_bonus = 10
	bare_wound_bonus = 32

/obj/item/melee/rapier/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 30, 95, 5) //fast and effective, but as a sword, it might damage the results.

/obj/item/melee/rapier/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == PROJECTILE_ATTACK)
		final_block_chance = 0 //Don't bring a sword to a gunfight
	return ..()

/obj/item/nullrod/spear/captain
	name = "spear of longinus"
	desc = "The weapon of an angelic captain. Due to the difficulty in acquiring these weapons, throwing it isn't recommended- but you're gonna do it anyway, right?"
	icon_state = "longinus"
	icon = 'modular_heaven/modules/players/Tay/icons/obj/melee.dmi'
	inhand_icon_state = "longinus"
	lefthand_file = 'modular_heaven/modules/players/Tay/icons/mob/inhands/melee_lefthand.dmi'
	righthand_file = 'modular_heaven/modules/players/Tay/icons/mob/inhands/melee_righthand.dmi'
	worn_icon_state = "longinus"
	worn_icon = 'modular_heaven/modules/players/Tay/icons/mob/clothing/belts_worn.dmi'
	slot_flags = ITEM_SLOT_BELT
	force = 16
	throwforce = 50
	throw_speed = 5
	throw_range = 7
	bare_wound_bonus = 7
	armour_penetration = 20
	sharpness = SHARP_POINTY
	w_class = WEIGHT_CLASS_HUGE
	attack_verb_continuous = list("stabs", "pierces", "slashes")
	attack_verb_simple = list("stab", "pierces", "slash")
	hitsound = 'sound/weapons/bladeslice.ogg'
	embedding = list("embed_chance" = 100, "fall_chance" = 0)
	max_integrity = 200
	chaplain_spawnable = FALSE

/obj/item/katana/captain
	name = "captain's katana"
	desc = "Long and unwieldy to swing but incredibly powerful, it's something of a statement for an officer to carry a weapon like this."
	armour_penetration = 10
//Tay//
