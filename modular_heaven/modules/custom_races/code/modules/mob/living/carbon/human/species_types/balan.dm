/datum/species/balan
	name = "Balan"
	id = "balan"
	say_mod = "announces"
	sexes = FALSE
	nojumpsuit = TRUE
	species_traits = list(NO_UNDERWEAR, NOBLOOD, NOEYESPRITES)
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
		)
	use_skintones = FALSE
	flying_species = TRUE
	liked_food = JUNKFOOD | FRIED | GROSS | RAW
	damage_overlay_type = ""
	bodytemp_heat_damage_limit = FIRE_MINIMUM_TEMPERATURE_TO_SPREAD
	disliked_food = NONE
	payday_modifier = 1
	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/balan,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/balan,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/balan,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/balan,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/balan,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/balan,
	)
	changesource_flags = MIRROR_BADMIN | WABBAJACK
	species_speech_sounds = list('modular_heaven/modules/text_and_speech_change/sounds/speak_2.ogg' = 120)
	species_speech_sounds_exclaim = list('modular_heaven/modules/text_and_speech_change/sounds/speak_2_exclaim.ogg' = 120)
	species_speech_sounds_ask = list('modular_heaven/modules/text_and_speech_change/sounds/speak_2_ask.ogg' = 120)

// the stupid fucking shit i do for a joke

/obj/item/bodypart/head/balan
	limb_id = SPECIES_BALAN
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/balan
	limb_id = SPECIES_BALAN
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/l_arm/balan
	limb_id = SPECIES_BALAN
	should_draw_greyscale = FALSE

/obj/item/bodypart/r_arm/balan
	limb_id = SPECIES_BALAN
	should_draw_greyscale = FALSE

/obj/item/bodypart/l_leg/balan
	limb_id = SPECIES_BALAN
	should_draw_greyscale = FALSE

/obj/item/bodypart/r_leg/balan
	limb_id = SPECIES_BALAN
	should_draw_greyscale = FALSE
