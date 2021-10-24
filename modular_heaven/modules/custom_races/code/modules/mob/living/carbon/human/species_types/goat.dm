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
	liked_food = VEGETABLES| FRUIT | GRAIN | RAW
	disliked_food = MEAT | DAIRY
	coldmod = 0.5 // = 1/4x heat damage
	heatmod = 3   // = 3x cold damage
	burnmod = 2 // = 1/2x generic burn damage
	damage_overlay_type = ""
	disliked_food = NONE
	payday_modifier = 1
	limbs_id = "goat"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT


// add species sound
