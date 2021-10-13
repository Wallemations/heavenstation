////////////////
///Eggcellent///

#define EGGS_EASY 25
#define EGGS_NORMAL 10
#define EGGS_HARD 5
#define EGGS_TRUE_HERO 2

/obj/item/food/omelette/eggcellent_plate	//FUCK THIS
	name = "The Eggcellent"
	desc = "A hulking mass of eggs, cheese, and chili. It comes with two biscuits to 'help' make the experience easier. If you eat all of it in one sitting, you might win a prize!"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "eggcellent_plate"
	food_reagents = list(/datum/reagent/consumable/nutriment = 50, /datum/reagent/consumable/nutriment/vitamin = 5)
	bite_consumption = EGGS_TRUE_HERO
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("egg" = 1, "cheese" = 1, "biscuit" = 2, "obesity" = 10)
	foodtypes = MEAT | BREAKFAST | DAIRY | GRAIN
	/// Our challenger
	var/mob/living/carbon/human/current_challenger = null
	/// The time given to finish
	var/timerid
	/// The player's set time
	var/set_time = 10
	/// The upper limit on how many reagents are eaten per bite
	var/difficulty = EGGS_NORMAL
	var/list/difficulty_list = list(EGGS_EASY, EGGS_NORMAL, EGGS_HARD, EGGS_TRUE_HERO)

/obj/item/food/omelette/eggcellent_plate/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_FOOD_CONSUMED, .proc/On_Consume)

/obj/item/food/omelette/eggcellent_plate/attack(mob/living/M, mob/living/user)
	if(!current_challenger)
		current_challenger = M
		priority_announce("[current_challenger] has begun the Eggcellent Challenge! [current_challenger.p_they(TRUE)] [current_challenger.p_have()] [set_time] minutes to complete this task!", "Sacred Egg Enrichment Center")
	bite_consumption = rand(1, difficulty)
	timerid = addtimer(CALLBACK(src, .proc/failed_eggs), set_time MINUTES, TIMER_STOPPABLE)
	. = ..()

/obj/item/food/omelette/eggcellent_plate/AltClick(mob/user)
	. = ..()
	if(!current_challenger)
		set_time = input(user, "Input minutes allowed for challenge", "Eggcellent Challenge") as num|null

/obj/item/food/omelette/eggcellent_plate/CtrlShiftClick(mob/user)
	. = ..()
	amount_list_position = (amount_list_position % list_len) + 1
	difficulty = difficulty_list[amount_list_position]
	switch(difficulty)
		if(difficulty == EGGS_EASY)
			balloon_alert(user, "difficulty set to Easy")
		if(difficulty == EGGS_NORMAL)
			balloon_alert(user, "difficulty set to Normal")
		if(difficulty == EGGS_HARD)
			balloon_alert(user, "difficulty set to Hard")
		if(difficulty == EGGS_TRUE_HERO)
			balloon_alert(user, "difficulty set to TRUE HERO")

/obj/item/food/omelette/eggcellent_plate/examine(mob/user)
	. = ..()
	if(current_challenger && !(user == current_challenger))
		. += span_notice("It looks like [current_challenger] has already begun [current_challenger.p_their()] conquest of this dish. Attempting to assist [current_challenger.p_them()] would be an unimaginable sin.")
	else
		. += "The challenger will have [set_time] minutes to finish this dish."
		. += span_notice("Alt-Clicking this will allow you to change the amount of time that a challenger has to finish this dish.")

/obj/item/food/omelette/eggcellent_plate/proc/On_Consume(atom/eggs, mob/egg_eater, mob/egg_feeder)
	SIGNAL_HANDLER

	if(!isliving(usr))
		return
	if(usr == current_challenger)
		deltimer(timerid)
		priority_announce("[current_challenger] has completed the challenge! [current_challenger.p_their(TRUE)] rightful crown has been delivered unto [current_challenger.p_them()]!", "Sacred Egg Enrichment Center")
		UnregisterSignal(src, COMSIG_FOOD_CONSUMED)
		new /obj/item/clothing/head/eggcellent_hat(usr.loc)
	else
		deltimer(timerid)
		spawn_bomb(usr)
		priority_announce("[usr] has attempted to aid in [current_challenger]'s challenge, a sin which will not be forgiven. Measures have been taken to have [usr.p_them()] atone for this crime.", "Sacred Egg Enrichment Center")
		UnregisterSignal(src, COMSIG_FOOD_CONSUMED)

/obj/item/food/omelette/eggcellent_plate/proc/spawn_bomb(mob/user)
	var/obj/item/grenade/frag/P = new /obj/item/grenade/frag(user.loc)
	P.active = TRUE
	addtimer(CALLBACK(P, /obj/item/grenade/proc/detonate), rand(2,15))

/obj/item/food/omelette/eggcellent_plate/proc/failed_eggs()
	priority_announce("[current_challenger] has failed to finish [current_challenger.p_their()] quest in the given timeframe. Measures have been taken accordingly.", "Sacred Egg Enrichment Center")
	spawn_bomb(current_challenger)
	qdel(src)


#define EGGS_EASY
#define EGGS_NORMAL
#define EGGS_HARD
#define EGGS_TRUE_HERO


// Recipe
/datum/crafting_recipe/food/eggcellent_plate
	name = "The Eggcellent Challenge"
	reqs = list(
		/obj/item/food/omelette = 3,
		/obj/item/food/butterbiscuit = 2,
		/obj/item/food/meatball = 3,
	)
	result = /obj/item/food/omelette/eggcellent_plate
	subcategory = CAT_EGG

// Hat
/obj/item/clothing/head/eggcellent_hat
	name = "Eggcellent Hat"
	desc = "The text on the hat reads, 'I'm Eggcellent.' This hat is a symbol of your victory. Congrats, you Monster!"
	icon_state = "eggcellent_hat"
	inhand_icon_state = "eggcellent_hat"
	worn_icon_state = "eggcellent_hat"
	icon = 'modular_heaven/modules/custom_food/icons/hat.dmi'
	worn_icon = 'modular_heaven/modules/custom_food/icons/hathead.dmi'

///Eggcellent///
////////////////
