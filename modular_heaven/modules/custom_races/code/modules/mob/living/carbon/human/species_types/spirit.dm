/datum/species/spirit
	name = "Spirit"
	id = "spirit"
	say_mod = "echoes"
	sexes = FALSE
	nojumpsuit = TRUE
	species_traits = list(AGENDER, NO_UNDERWEAR, NOBLOOD, NOEYESPRITES)
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
		TRAIT_VENTCRAWLER_ALWAYS)
	use_skintones = FALSE
	flying_species = TRUE
	meat = null
	skinned_type = /obj/item/stack/sheet/animalhide/human
	liked_food = JUNKFOOD | FRIED | GROSS | RAW
	damage_overlay_type = ""
	bodytemp_heat_damage_limit = FIRE_MINIMUM_TEMPERATURE_TO_SPREAD
	disliked_food = NONE
	payday_modifier = 1
	limbs_id = "spirit"
	changesource_flags = MIRROR_BADMIN | WABBAJACK
//	species_speech_sounds = list('sound/voice/species/huff.ogg' = 120)
//	species_speech_sounds_exclaim = list('sound/voice/species/huff_ask.ogg' = 120)
//	species_speech_sounds_ask = list('sound/voice/species/huff_exclaim.ogg' = 120)

// species sounds commented out pls fix when voice module gets through
