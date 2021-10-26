/datum/species/goat
	name = "Goat"
	id = "goat"
	say_mod = "bleats"
	sexes = FALSE
	nojumpsuit = TRUE
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_BEAST
	species_traits = list(AGENDER, NO_UNDERWEAR, NOEYESPRITES, DIGITIGRADE, HAS_FLESH, HAS_BONE)
	use_skintones = FALSE
	flying_species = FALSE
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		DIGITIGRADE,
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
	limbs_id = "goat"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	var/datum/component/rammer
	//Goats are able to survive colder temps easier thanks to their fur
	bodytemp_heat_damage_limit = (BODYTEMP_HEAT_DAMAGE_LIMIT - 10)
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT + 20)

// add species sound

/datum/species/goat/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	rammer = C.AddComponent(/datum/component/tackler, base_knockdown = 2 SECONDS, speed = 2, min_distance = 0)
	..()

/datum/species/goat/on_species_loss(mob/living/carbon/C)
	QDEL_NULL(rammer)
	..()
