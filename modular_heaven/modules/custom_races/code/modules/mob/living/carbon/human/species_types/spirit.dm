/datum/species/spirit
	name = "Spirit"
	id = "spirit"
	say_mod = "echoes"
	sexes = FALSE
	nojumpsuit = TRUE
	species_traits = list(AGENDER, NO_UNDERWEAR, NOBLOOD, NOEYESPRITES, NOAUGMENTS, NOBLOODOVERLAY)
	inherent_biotypes = MOB_HUMANOID|MOB_SPIRIT
	mutantheart = /obj/item/organ/heart/ethereal
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
	skinned_type = null
	liked_food = JUNKFOOD | FRIED | GROSS | RAW
	disliked_food = NUTS
	damage_overlay_type = ""
	bodytemp_heat_damage_limit = FIRE_MINIMUM_TEMPERATURE_TO_SPREAD
	payday_modifier = 1
	limbs_id = "spirit"
	changesource_flags = MIRROR_BADMIN | WABBAJACK
	species_language_holder = /datum/language_holder/spirit
	var/our_timer
	species_speech_sounds = list('modular_heaven/modules/text_and_speech_change/sounds/huff.ogg' = 120)
	species_speech_sounds_exclaim = list('modular_heaven/modules/text_and_speech_change/sounds/huff_ask.ogg' = 120)
	species_speech_sounds_ask = list('modular_heaven/modules/text_and_speech_change/sounds/huff_exclaim.ogg' = 120)

/datum/language_holder/spirit
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/spiritual = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/spiritual = list(LANGUAGE_ATOM))

/datum/species/spirit/check_species_weakness(obj/item/weapon, mob/living/attacker)
	if(istype(weapon, /obj/item/nullrod) || istype(weapon, /obj/item/storage/book/bible))
		return 25 //Nullrods & Bibles deal 25x damage to spirits.
	return 1

/datum/species/spirit/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H, delta_time, times_fired)
	if(chem.type == /datum/reagent/water/holywater)
		H.visible_message(span_danger("[H]'s body shudders and crackles!") ,span_userdanger("Your soul begins to convulse as it rejects the holy water!"))
		our_timer += delta_time
		if(our_timer >= (2 SECONDS))
			if(!H.stuttering)
				H.stuttering = 1
			H.stuttering = min(H.stuttering + (2 * delta_time), 10)
			H.Dizzy(5)
			H.adjustBruteLoss(round(0.5*delta_time, 0.1))
			if(DT_PROB(10, delta_time))
				H.visible_message(span_danger("[H] begins to convulse!"), span_userdanger("Your body is faltering!"))
				H.Unconscious(12 SECONDS)
		if(our_timer >= (20 SECONDS))
			H.Unconscious(100)
			H.jitteriness = 0
			H.stuttering = 0
			H.adjustBruteLoss(round(1.665*delta_time, 0.1))
		return TRUE
	..()

/datum/species/spirit/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	C.gain_trauma(/datum/brain_trauma/special/death_whispers, TRAUMA_RESILIENCE_MAGIC)
	var/obj/item/organ/eyes/E = C.getorganslot(ORGAN_SLOT_EYES)
	E.flash_protect = FLASH_PROTECTION_SENSITIVE // Call us DBD 'cause we've got lightburn now
	..()

/datum/species/spirit/on_species_loss(mob/living/carbon/C)
	C.cure_trauma_type(/datum/brain_trauma/special/death_whispers, TRAUMA_RESILIENCE_MAGIC)
	var/obj/item/organ/eyes/E = C.getorganslot(ORGAN_SLOT_EYES)
	E.flash_protect = FLASH_PROTECTION_NONE
	..()
