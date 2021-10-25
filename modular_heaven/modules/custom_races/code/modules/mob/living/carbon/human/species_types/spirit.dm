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
	skinned_type = null
	liked_food = JUNKFOOD | FRIED | GROSS | RAW
	disliked_food = NUTS
	damage_overlay_type = ""
	bodytemp_heat_damage_limit = FIRE_MINIMUM_TEMPERATURE_TO_SPREAD
	disliked_food = NONE
	payday_modifier = 1
	limbs_id = "spirit"
	changesource_flags = MIRROR_BADMIN | WABBAJACK
	species_language_holder = /datum/language_holder/spirit
	var/our_timer
//	species_speech_sounds = list('sound/voice/species/huff.ogg' = 120)
//	species_speech_sounds_exclaim = list('sound/voice/species/huff_ask.ogg' = 120)
//	species_speech_sounds_ask = list('sound/voice/species/huff_exclaim.ogg' = 120)

// species sounds commented out pls fix when voice module gets through

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
		to_chat(H, span_userdanger("Your soul begins to convulse as it rejects the holy water!"))
		our_timer += delta_time SECONDS
		if(our_timer >= (2 SECONDS)) // 10 units
			if(!H.stuttering)
				H.stuttering = 1
			H.stuttering = min(H.stuttering + (2 * delta_time), 10)
			H.Dizzy(5)
			H.adjustBruteLoss(round(0.5*delta_time, 0.1))
			if(prob(10))
				H.visible_message(span_danger("[H] begins to convulse!"), span_userdanger("Your body is faltering!"))
				H.Unconscious(12 SECONDS)
		if(our_timer >= (20 SECONDS)) // 24 units
			H.Unconscious(100)
			H.jitteriness = 0
			H.stuttering = 0
			H.adjustBruteLoss(round(1.665*delta_time, 0.1))
		return TRUE
	..()
