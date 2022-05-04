/datum/species/goat
	name = "Goat"
	id = "goat"
	say_mod = "bleats"
	sexes = FALSE
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_BEAST
	species_traits = list(AGENDER, NO_UNDERWEAR, NOEYESPRITES, HAS_FLESH, HAS_BONE)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CHUNKYFINGERS,
		)
	meat = /obj/item/food/meat/slab
	disliked_food = MEAT | DAIRY
	liked_food = VEGETABLES| FRUIT | GRAIN | RAW | CLOTH
	coldmod = 0.35
	heatmod = 2.5
	burnmod = 1.5
	damage_overlay_type = ""
	payday_modifier = 1
	no_equip = list(ITEM_SLOT_GLOVES, ITEM_SLOT_FEET)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	var/datum/component/rammer
	//Goats are able to survive colder temps easier thanks to their fur
	bodytemp_heat_damage_limit = (BODYTEMP_HEAT_DAMAGE_LIMIT - 10)
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT + 20)

	// All taken from minecraft //
	species_speech_sounds = list('modular_heaven/modules/text_and_speech_change/sounds/goat_say1.ogg' = 60, \
						'modular_heaven/modules/text_and_speech_change/sounds/goat_say2.ogg' = 60, \
						'modular_heaven/modules/text_and_speech_change/sounds/goat_say3.ogg' = 60)
	species_speech_sounds_ask = list('modular_heaven/modules/text_and_speech_change/sounds/goat_ask1.ogg' = 80, \
						'modular_heaven/modules/text_and_speech_change/sounds/goat_ask2.ogg' = 80)
	species_speech_sounds_exclaim = list('modular_heaven/modules/text_and_speech_change/sounds/goat_yell1.ogg' = 60, \
						'modular_heaven/modules/text_and_speech_change/sounds/goat_yell2.ogg' = 60)


	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/goat,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/goat,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/goat,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/goat,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/goat,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/goat,
	)


/datum/species/goat/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	rammer = C.AddComponent(/datum/component/tackler, base_knockdown = 2 SECONDS, speed = 2, min_distance = 0)
	..()

/datum/species/goat/on_species_loss(mob/living/carbon/C)
	QDEL_NULL(rammer)
	..()

/datum/species/goat/get_species_description()
	return "This common friend in the cold room is actually sentient! \
		They watch over society with that familiar glint in their eye, \
		serving under a common, golden deity."

/datum/species/goat/get_species_lore()
	return list(
		"Serving under their deity the Goat King, Goats disguise themselves as common livestock to observe and watch over other sentient races as sentries. Whatever circumstances lead to a goat to revealing its sentience are left up them.",
    	"Goats tend to keep to themselves whether by themselves or amongst massive groups. Few if any have any real fighting capabilities, though goats are known to be somewhat aggressive and short tempered at times.",
    	"Goats who have revealed their sentience will try to blend into normal society by wearing clothes and standing on two legs.",
	)



/datum/species/goat/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "temperature-low",
			SPECIES_PERK_NAME = "Insulation",
			SPECIES_PERK_DESC = "The goat's fur helps to insulate it from colder temperatures.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "horse-head",
			SPECIES_PERK_NAME = "Ramming Speed",
			SPECIES_PERK_DESC = "Goats can ram people with their large horns.\
      							Try not to miss!",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "temperature-high",
			SPECIES_PERK_NAME = "Too Hot to Handle",
			SPECIES_PERK_DESC = "The goat's fur is a little TOO good at insulating it, \
      		causing them to be more susceptible to warmer temperatures.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "socks",
			SPECIES_PERK_NAME = "Behooved",
			SPECIES_PERK_DESC = "Your hooves remove your ability to wear shoes, gloves, or shoot unmodified guns. \
      		No fun toys or sick kicks for you!",
		),
	)

	return to_add


/obj/item/bodypart/head/goat
	limb_id = SPECIES_GOAT
	is_dimorphic = FALSE
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/goat
	limb_id = SPECIES_GOAT
	is_dimorphic = FALSE
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/l_arm/goat
	limb_id = SPECIES_GOAT
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/r_arm/goat
	limb_id = SPECIES_GOAT
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/l_leg/goat
	limb_id = SPECIES_GOAT
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/r_leg/goat
	limb_id = SPECIES_GOAT
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE
