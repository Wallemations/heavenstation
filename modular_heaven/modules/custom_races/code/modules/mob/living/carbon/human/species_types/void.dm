/datum/species/void
	name = "Voidperson"
	id = "void"
	sexes = FALSE
	nojumpsuit = TRUE
	species_traits = list(NO_UNDERWEAR, NOEYESPRITES)
	use_skintones = FALSE
	flying_species = FALSE
	inherent_biotypes = MOB_HUMANOID|MOB_UNDEAD
	inherent_traits = list(
		TRAIT_NOHUNGER,
		TRAIT_NOBREATH,
		TRAIT_GENELESS,
		TRAIT_NOMETABOLISM,
		TRAIT_TOXIMMUNE,
		TRAIT_RESISTHEAT,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RADIMMUNE,
		TRAIT_FAKEDEATH,
		TRAIT_XENO_IMMUNE,
		TRAIT_NODISMEMBER,
		TRAIT_NOLIMBDISABLE,
		TRAIT_NOSLIPALL,
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		)
	meat = null
	liked_food = JUNKFOOD | FRIED | GROSS | RAW
	damage_overlay_type = ""
	disliked_food = NONE
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/spirit,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/spirit,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/spirit,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/spirit,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/spirit,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/spirit,
	)

// They just borrow their sprite from the spirit since nobody's gonna see under that suit anyways
// no species sound
