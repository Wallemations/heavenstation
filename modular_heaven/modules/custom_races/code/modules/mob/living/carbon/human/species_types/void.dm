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
	limbs_id = "void"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT

// so nothing is seen when the clothes are off this is so fucking jank i hate my life
// no species sound
// wallem if you read this your a homosexual
