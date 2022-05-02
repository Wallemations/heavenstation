/mob/living/simple_animal/pet/cat/bolty
	name = "Bolty"
	desc = "You have an extreme urge to punt it."
	icon = 'modular_heaven/modules/mobs/icons/pets.dmi'
	icon_state = "bolt"
	gender = MALE
	icon_living = "bolt"
	icon_dead = "bolt_dead"
	unsuitable_atmos_damage = 0
	minbodytemp = TCMB
	maxbodytemp = T0C + 40
	held_state = "cat2"
	response_harm_continuous = "punts"
	response_harm_simple = "punt"
	speak_chance = 5

/mob/living/simple_animal/pet/cat/bolty/Initialize(mapload)
	. = ..()
	speak = GLOB.boltyspeak

/mob/living/simple_animal/pet/cat/clockwork
	name = "Hairspring"
	desc = "A fully mechanical cat. It would be fully indestringuishable from a cat if it weren't for its bronze coat."
	icon = 'modular_heaven/modules/mobs/icons/pets.dmi'
	gender = NEUTER
	icon_state = "clockcat"
	icon_living = "clockcat"
	icon_dead = "clockcat_dead"
	speak_emote = list("purrs", "meows", "ticks")
	emote_hear = list("meows.", "mews.", "chimes.")
	mob_biotypes = MOB_ROBOTIC|MOB_BEAST
	unsuitable_atmos_damage = 0
	minbodytemp = TCMB
	maxbodytemp = T0C + 40
	held_state = "clockcat"
	speech_span = SPAN_ROBOT
	speak = list("Meow!", "Purr...", "Tick. Tick. Tick.", "Mrrrow!", "Mrrrp!!", "YOWWWWW", "CUCKOO! CUCKOO!", "Mew?")
	emote_see = list("shakes its head.", "shivers.", "rolls over and shows its belly.", "rubs against the nearest object.", "kneads the floor.", "plays with its tail.")
