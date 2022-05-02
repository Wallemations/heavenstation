/mob/living/simple_animal/pet/raphael
	name = "Raphael"
	desc = "And to think you wanted to kill him 2 times, in this timeloop he has become your friend.. We love you Raphael"
	icon = 'modular_heaven/modules/mobs/icons/pets.dmi'
	icon_state = "raphael"
	icon_living = "raphael"
	icon_dead = "raphael_dead"
	health = 30
	maxHealth = 30
	armour_penetration = 0
	melee_damage_lower = 0
	melee_damage_upper = 5
	weather_immunities = list("lava","ash")
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = TCMB
	maxbodytemp = INFINITY
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	mob_size = MOB_SIZE_SMALL
	deathmessage = "seizes and curls up, lifeless..."
	butcher_results = list(/obj/item/food/meat/slab/xeno = 2)
	faction = list("neutral","silicon","turret","sabbatziege")
	can_be_held = TRUE
	held_state = "raphael"
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	speak = list("eugh!", "hhgh!", "eeggrh", "hh")
	speak_emote = list("bubbles", "pops")
	emote_hear = list("sizzles.", "bubbles.")
	emote_see = list("shudders.", "shivers.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	// randomizes hunting intervals, minimum 5 turns
	var/time_to_hunt = 5

/mob/living/simple_animal/pet/raphael/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
	AddElement(/datum/element/pet_bonus, "purrs!")

/mob/living/simple_animal/pet/raphael/attackby(obj/item/O, mob/user) //its either i made a list of every single fucking food item or i made him work like a christmas tree
	if(istype(O, /obj/item/food/deadmouse))
		to_chat(user, span_notice("[src] devours the offering and has given you something in return! Thank the LORD!"))
		qdel(O)
		var/given_food = pick(subtypesof(/obj/item/food))
		new given_food(loc)
		return 1
	else
		return ..()

/mob/living/simple_animal/pet/raphael/Life()
	. = ..()
	turns_since_scan++
	if(turns_since_scan > time_to_hunt)
		turns_since_scan = 0
		var/list/target_types = list(/mob/living/simple_animal/mouse)
		for(var/mob/living/simple_animal/mouse/potential_target in view(3, get_turf(src)))
			if(potential_target.type in target_types)
				hunt(potential_target)
				return
