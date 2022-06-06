/datum/species/spirit
	name = "Spirit"
	id = "spirit"
	say_mod = "echoes"
	sexes = FALSE
	nojumpsuit = TRUE
	species_traits = list(AGENDER, NO_UNDERWEAR, NOBLOOD, NOEYESPRITES, NOAUGMENTS, NOBLOODOVERLAY)
	inherent_biotypes = MOB_HUMANOID|MOB_SPIRIT
	mutantheart = /obj/item/organ/internal/heart/freedom // Replace with a custom heart later. Make spirit revival cool or something
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
		TRAIT_VENTCRAWLER_ALWAYS,
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_NOMOBSWAP,
		TRAIT_FLASH_SENSITIVE,
		TRAIT_SILENT_FOOTSTEPS,
		)
	use_skintones = FALSE
	flying_species = TRUE
	meat = null
	liked_food = JUNKFOOD | FRIED | GROSS | RAW
	disliked_food = NUTS
	damage_overlay_type = ""
	bodytemp_heat_damage_limit = FIRE_MINIMUM_TEMPERATURE_TO_SPREAD
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | WABBAJACK
	species_language_holder = /datum/language_holder/spirit
	// Used for handling our chem reaction
	var/our_timer
	species_speech_sounds = list('modular_heaven/modules/text_and_speech_change/sounds/huff.ogg' = 120)
	species_speech_sounds_exclaim = list('modular_heaven/modules/text_and_speech_change/sounds/huff_ask.ogg' = 120)
	species_speech_sounds_ask = list('modular_heaven/modules/text_and_speech_change/sounds/huff_exclaim.ogg' = 120)

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/spirit,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/spirit,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/spirit,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/spirit,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/spirit,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/spirit,
	)



/datum/language_holder/spirit
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/spiritual = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/spiritual = list(LANGUAGE_ATOM))

/datum/species/spirit/check_species_weakness(obj/item/weapon, mob/living/attacker)
	if(istype(weapon, /obj/item/nullrod) || istype(weapon, /obj/item/storage/book/bible))
		return 10 // Nullrods & Bibles deal 10x damage, they'll pretty much fuck you over instantly
	if(HAS_TRAIT(attacker, TRAIT_HOLY))
		return 2 // Holy people deal 2x damage. Try not to get punched.
	return 1

/datum/species/spirit/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H, delta_time, times_fired)
	if(chem.type == /datum/reagent/water/holywater)
		H.visible_message(span_danger("[H]'s body shudders and crackles!") ,span_userdanger("Your soul begins to convulse as it rejects the holy water!"))
		our_timer += delta_time
		if(our_timer >= (2 SECONDS))
			H.adjust_timed_status_effect(min((2 * delta_time), 10), /datum/status_effect/speech/stutter)
			H.adjust_timed_status_effect(5 * delta_time, /datum/status_effect/dizziness)
			H.adjustBruteLoss(round(0.5*delta_time, 0.1))
			if(DT_PROB(10, delta_time))
				H.visible_message(span_danger("[H] begins to convulse!"), span_userdanger("Your body is faltering!"))
				H.Unconscious(12 SECONDS)
		if(our_timer >= (20 SECONDS))
			H.Unconscious(3 SECONDS * delta_time)
			H.adjust_timed_status_effect(5 * delta_time, /datum/status_effect/jitter)
			H.set_timed_status_effect(0, /datum/status_effect/speech/stutter)
			H.adjustBruteLoss(round(1.665*delta_time, 0.1))
		return TRUE
	..()

/datum/species/spirit/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	C.gain_trauma(/datum/brain_trauma/special/death_whispers, TRAUMA_RESILIENCE_MAGIC)
	var/obj/item/organ/internal/eyes/E = C.getorganslot(ORGAN_SLOT_EYES)
	E.flash_protect = FLASH_PROTECTION_SENSITIVE // Call us DBD 'cause we've got lightburn now
	..()

/datum/species/spirit/on_species_loss(mob/living/carbon/C)
	C.cure_trauma_type(/datum/brain_trauma/special/death_whispers, TRAUMA_RESILIENCE_MAGIC)
	var/obj/item/organ/internal/eyes/E = C.getorganslot(ORGAN_SLOT_EYES)
	E.flash_protect = FLASH_PROTECTION_NONE
	..()

/datum/species/spirit/get_species_description()
	return "Ghosts kept alive by a single purpose. Generally friendly, \
	except for the part where they go insane and turn into monsters"

/datum/species/spirit/get_species_lore()
	return list(
		"Spirits can only come about through strange circumstance or the intervention of a higher power, as most ghosts will pass on within hours to a few days after death.",
    "Their unnatural continued existence causes them to be extremely volatile, becoming hypersensitive to emotions and reaching a 'feral' state if not dispatched, where they'll become destructive forces influenced by what emotion they felt was the strongest.",
    "Not much research has been done on spirits, as the leading researcher has since gone missing, but it is believed spirits are simple, goal-oriented beings who will pass on naturally after achieving said goals."
	)

/datum/species/spirit/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "shield-alt",
			SPECIES_PERK_NAME = "Nearly Indestructable",
			SPECIES_PERK_DESC = "The fact that you're mostly incoporeal makes you immune to most \
      							dangerous environments, though a good punch will still hurt.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "ghost",
			SPECIES_PERK_NAME = "Incoporeal",
			SPECIES_PERK_DESC = "Your semi-incoporeal form allows you to crawl through vents with relative ease.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "feather-alt",
			SPECIES_PERK_NAME = "Hover",
			SPECIES_PERK_DESC = "You're technically always floating, though you can choose not to hide it.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = "assistive-listening-systems",
			SPECIES_PERK_NAME = "Friends on The Other Side",
			SPECIES_PERK_DESC = "You can occasionally hear the voices of those who've passed on. \
      							This is often extremely annoying.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "cross",
			SPECIES_PERK_NAME = "Tainted Soul",
			SPECIES_PERK_DESC = "You're highly susceptible to attacks from holy objects and people.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "shoe-prints",
			SPECIES_PERK_NAME = "Hallowed Grounds",
			SPECIES_PERK_DESC = "You're incapable of moving over piles of salt or blessed \
      							floorings. Try to stay on the chaplain's good side, alright?",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "lightbulb",
			SPECIES_PERK_NAME = "Blinded by The Light",
			SPECIES_PERK_DESC = "Since your body is held together by your mind, you're much more \
			susceptible to being incapacitated by sudden flashes of light.",
		),
	)

	return to_add

/obj/item/bodypart/head/spirit
	limb_id = SPECIES_SPIRIT
	is_dimorphic = FALSE
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/spirit
	limb_id = SPECIES_SPIRIT
	is_dimorphic = FALSE
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/l_arm/spirit
	limb_id = SPECIES_SPIRIT
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/r_arm/spirit
	limb_id = SPECIES_SPIRIT
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/l_leg/spirit
	limb_id = SPECIES_SPIRIT
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE

/obj/item/bodypart/r_leg/spirit
	limb_id = SPECIES_SPIRIT
	icon_static = 'modular_heaven/modules/custom_races/icons/mob/human_parts.dmi'
	should_draw_greyscale = FALSE
