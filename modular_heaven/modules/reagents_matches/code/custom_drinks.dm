
/datum/reagent/consumable/whipcream //Just like real whipped cream, made of sugar and milk.
	name = "Whipped Cream"
	description = "Cream and Sugar, mixed together to create stiff peaks. Peaks not to be confused for other similarly stiff peaks."
	color = "#FAF7EF" // rgb: 223, 215, 175
	taste_description = "thick, sugary milk"
	glass_icon_state  = "glass_white"
	glass_name = "glass of whipped cream"
	glass_desc = "A glass of whipped cream. Just barely in a drinkable state."
	nutriment_factor = 2 * REAGENTS_METABOLISM
	metabolization_rate = 2 * REAGENTS_METABOLISM
	overdose_threshold = 300 // Hyperglycaemic shock. Still got sugar in it!
	has_custom_glass = TRUE
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_EASY

/datum/reagent/consumable/whipcream/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
		. = 1
	return ..()

/datum/reagent/consumable/whipcream/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>You go into hyperglycaemic shock! Lay off the twinkies!</span>")
	M.AdjustSleeping(600, FALSE)
	return ..()

/datum/reagent/consumable/naenaecream
	name = "Nae Nae Cream"
	description = "Cream and Sugar, mixed along with some other... substances. Don't take too much!"
	color = "#F6B6A9" // rgb: 223, 215, 175
	taste_description = "awestruck dancers"
	glass_icon_state  = "glass_naenae"
	glass_name = "glass of nae nae cream"
	glass_desc = "Now watch me..."
	overdose_threshold = 50
	has_custom_glass = TRUE

/datum/reagent/consumable/naenaecream/on_mob_life(mob/living/carbon/M)
	if(prob(5))
		M.visible_message("<span class='warning'>nae naes!</span>", visible_message_flags = EMOTE_MESSAGE)
		M.Stun(2)
	return ..()

/datum/reagent/consumable/naenaecream/proc/picklimb()
	return (pick(TRAIT_PARALYSIS_L_ARM,TRAIT_PARALYSIS_R_ARM,TRAIT_PARALYSIS_R_LEG,TRAIT_PARALYSIS_L_LEG))

/datum/reagent/consumable/naenaecream/overdose_process(mob/living/carbon/M, delta_time)
	M.set_timed_status_effect(25 SECONDS * REM * delta_time, /datum/status_effect/drugginess)
	M.set_timed_status_effect(4 SECONDS * REM * delta_time, /datum/status_effect/dizziness)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1*REM, 150)
	if(prob(35))
		M.adjustStaminaLoss(20)
		var/empty_indexes = M.get_empty_held_indexes()
		if(!length(empty_indexes) == 2)
			M.drop_all_held_items()
			M.visible_message("<span class='warning'>nae naes with extra force!</span>", visible_message_flags = EMOTE_MESSAGE)
	if(current_cycle > 5)
		if(prob(35))
			var/t = picklimb()
			ADD_TRAIT(M, t, type)
			M.adjustStaminaLoss(10)
		if(current_cycle > 30)
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2*REM)
			if(current_cycle > 50 && prob(15))
				if(!M.undergoing_cardiac_arrest() && M.can_heartattack())
					M.set_heartattack(TRUE)
					if(M.stat == CONSCIOUS)
						M.visible_message("<span class='userdanger'>holds [M.p_their()] hand above [M.p_their()] head, ready for one last nae nae!</span>", visible_message_flags = EMOTE_MESSAGE)
						if(HAS_TRAIT(M, TRAIT_NODISMEMBER))
							return
						var/list/parts = list()
						for(var/X in M.bodyparts)
							var/obj/item/bodypart/bodypart = X
							if(bodypart.body_part != HEAD && bodypart.body_part != CHEST && bodypart.body_part != LEG_LEFT && bodypart.body_part != LEG_RIGHT)
								if(bodypart.dismemberable)
									parts += bodypart
						if(length(parts))
							var/obj/item/bodypart/bodypart = pick(parts)
							bodypart.dismember()
	return ..()

/datum/reagent/consumable/tea
	name = "Black Tea"
	glass_name = "black tea"
	glass_desc = "A warm glass of black tea. Shouldn't you drink this from something else?"

/datum/reagent/consumable/greentea
	name = "Green Tea"
	description = "You fucking weeaboo."
	color = "#2D7C36"
	nutriment_factor = 0
	taste_description = "soothing green tea"
	glass_icon_state = "greentea"
	glass_name = "green tea"
	glass_desc = "Green Tea served in a traditional Japanese tea cup, just like in your Chinese cartoons!"
	has_custom_glass = TRUE
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_STOCK

/datum/reagent/consumable/greentea/on_mob_life(mob/living/carbon/M, delta_time)
	M.adjust_timed_status_effect(-1 SECONDS * REM * delta_time, /datum/status_effect/dizziness)
	M.adjust_drowsyness(-3 * REM * delta_time)
	M.adjust_timed_status_effect(-2 SECONDS * REM * delta_time, /datum/status_effect/jitter)
	M.AdjustSleeping(-20 * REM * delta_time)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	return ..()

/datum/reagent/consumable/redtea
	name = "Red Tea"
	description = "THIS SHIT'S RED!"
	color = "#A01818"
	nutriment_factor = 0
	taste_description = "sweet red tea"
	glass_icon_state = "redtea"
	glass_name = "redtea"
	glass_desc = "Red Tea served in a traditional Chinese tea cup, just like in your Malaysian movies!"
	has_custom_glass = TRUE
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_STOCK

/datum/reagent/consumable/redtea/on_mob_life(mob/living/carbon/M, delta_time)
	M.adjust_timed_status_effect(-3 SECONDS * REM * delta_time, /datum/status_effect/dizziness)
	M.adjust_drowsyness(-2 * REM * delta_time)
	M.adjust_timed_status_effect(-1 SECONDS * REM * delta_time, /datum/status_effect/jitter)
	M.AdjustSleeping(-20 * REM * delta_time)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	return ..()

/datum/reagent/consumable/chifir
	name = "Chifir"
	description = "For when you're indecisive!"
	nutriment_factor = 0
	color = "#432208"
	taste_description = "bitter chifir"
	glass_icon_state = "chifir"
	glass_name = "chifir"
	glass_desc = "A Russian kind of tea. Not for those with weak stomachs."
	has_custom_glass = TRUE
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_EASY

/datum/reagent/consumable/chifir/on_mob_life(mob/living/carbon/M, delta_time)
	M.adjust_timed_status_effect(-2 SECONDS * REM * delta_time, /datum/status_effect/dizziness)
	M.adjust_drowsyness(-2 * REM * delta_time)
	M.adjust_timed_status_effect(-2 SECONDS * REM * delta_time, /datum/status_effect/jitter)
	M.AdjustSleeping(-20 * REM * delta_time)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	return ..()

/datum/reagent/consumable/chamomile
	name = "Chamomile"
	description = "this shits FLOWERS"
	nutriment_factor = 0
	color = "#D09A28"
	taste_description = "floral chamomile"
	glass_icon_state = "chamomile"
	glass_name = "chamomile"
	glass_desc = "A smooth, herbal tea. Refreshing!"
	has_custom_glass = TRUE
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	glass_price = DRINK_PRICE_EASY

/datum/reagent/consumable/chamomile/on_mob_life(mob/living/carbon/M, delta_time)
	M.adjust_timed_status_effect(-2 SECONDS * REM * delta_time, /datum/status_effect/dizziness)
	M.adjust_drowsyness(-1 * REM * delta_time)
	M.adjust_timed_status_effect(-3 SECONDS * REM * delta_time, /datum/status_effect/jitter)
	M.AdjustSleeping(-20 * REM * delta_time)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-2, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	return ..()

/datum/reagent/consumable/schrodinger
	name = "Schrodinger's Love"
	description = "A tea in a state of constant flux. It shifts constantly between sweet and sour."
	color = "#AE59B9" // rgb: 16, 16, 0
	nutriment_factor = 0
	taste_description = "a tea of fluxuating taste"
	glass_icon_state = "schrodinger"
	glass_name = "Schrodinger's Love"
	glass_desc = "A glass of tea in a state of constant flux."

/datum/reagent/consumable/schrodinger/on_mob_life(mob/living/carbon/M, delta_time)
	M.adjust_timed_status_effect(-2 SECONDS * REM * delta_time, /datum/status_effect/dizziness)
	M.adjust_drowsyness(-1 * REM * delta_time)
	M.adjust_timed_status_effect(-3 SECONDS * REM * delta_time, /datum/status_effect/jitter)
	M.AdjustSleeping(-20 * REM * delta_time)
	if(prob(30))
		switch(pick(1,2))
			if(1)
				if(M.getToxLoss())
					M.adjustToxLoss(-5, 0)
			if(2)
				M.adjustToxLoss(2, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	return ..()

////////////////
// da recipes //
////////////////

/datum/chemical_reaction/drink/whipcream
	results = list(/datum/reagent/consumable/whipcream = 4)
	required_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/consumable/cream = 3)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY

/datum/chemical_reaction/drink/naenaecream
	results = list(/datum/reagent/consumable/naenaecream = 8)
	required_reagents = list(/datum/reagent/consumable/whipcream = 4, /datum/reagent/consumable/ethanol/neurotoxin = 8, /datum/reagent/drug/krokodil = 1) //Krokodil was literally the only way to make this even close to balanced.
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_MODERATE | REACTION_TAG_DAMAGING | REACTION_TAG_OXY

/datum/chemical_reaction/drink/chamomile
	results = list(/datum/reagent/consumable/chamomile = 3)
	required_reagents = list(/datum/reagent/consumable/tea = 1, /datum/reagent/consumable/lemonjuice = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY | REACTION_TAG_TOXIN | REACTION_TAG_HEALING

/datum/chemical_reaction/drink/chifir
	results = list(/datum/reagent/consumable/chifir = 3)
	required_reagents = list(/datum/reagent/consumable/tea = 1, /datum/reagent/consumable/greentea = 1, /datum/reagent/consumable/redtea = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY | REACTION_TAG_TOXIN | REACTION_TAG_HEALING

/datum/chemical_reaction/drink/schrodinger
	results = list(/datum/reagent/consumable/schrodinger = 3)
	required_reagents = list(/datum/reagent/water = 1, /datum/reagent/toxin/glovepowder = 1, /datum/reagent/consumable/sugar = 1)
	reaction_tags = REACTION_TAG_DRINK | REACTION_TAG_EASY | REACTION_TAG_TOXIN
