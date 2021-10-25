/datum/species/goat
	name = "Goat"
	id = "goat"
	say_mod = "bleats"
	sexes = FALSE
	nojumpsuit = TRUE
	species_traits = list(AGENDER, NO_UNDERWEAR, NOEYESPRITES)
	use_skintones = FALSE
	flying_species = FALSE
	inherent_traits = list(TRAIT_RESISTCOLD)
	meat = /obj/item/food/meat/slab
	disliked_food = MEAT | DAIRY
	liked_food = VEGETABLES| FRUIT | GRAIN | RAW
	coldmod = 0.5
	heatmod = 6
	burnmod = 3
	damage_overlay_type = ""
	disliked_food = NONE
	payday_modifier = 1
	limbs_id = "goat"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	var/datum/component/rammer

// add species sound

/datum/species/goat/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	rammer = C.AddComponent(/datum/component/tackler, base_knockdown = 2 SECONDS, speed = 2, min_distance = 0)
	..()

/datum/species/goat/on_species_loss(mob/living/carbon/C)
	QDEL_NULL(rammer)
	..()
