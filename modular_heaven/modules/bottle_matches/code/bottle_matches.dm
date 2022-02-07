/obj/item/storage/box/matches
	icon = 'modular_heaven/modules/bottle_matches/icons/matches.dmi'

/obj/item/storage/box/matches/nanotrasen
	name = "\improper Nanotrasen matchbox"
	desc = "A small box of specialty Nanotrasen matches, perfect for relaxing after a hard day of bossing everyone around."
	icon_state = "matchbox-n"
	base_icon_state = "matchbox-n"

/obj/item/storage/box/matches/syndicate
	name = "\improper Syndicate matchbox"
	desc = "While they offer no tactical advantages over conventional matches, the red of the box goes perfectly with your eyes."
	icon_state = "matchbox-s"
	base_icon_state = "matchbox-s"

/////// Matches ////////
////////////////////////
// Drink Icon Changes //

/obj/item/reagent_containers/food/drinks/ale
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/obj/item/reagent_containers/food/drinks/beer
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/obj/item/reagent_containers/food/drinks/bottle/whiskey
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/obj/item/reagent_containers/food/drinks/bottle/gin
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/obj/item/reagent_containers/food/drinks/bottle/wine
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/obj/item/reagent_containers/food/drinks/bottle/fernet
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/obj/item/reagent_containers/food/drinks/drinkingglass
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass
	icon = 'modular_heaven/modules/bottle_matches/icons/drinks.dmi'

/datum/reagent
	// Used to divert specific reagents to our custom sprites
	var/has_custom_glass = FALSE

/datum/reagent/consumable/ethanol/moonshine
	has_custom_glass = TRUE

/datum/reagent/water
	has_custom_glass = TRUE

/datum/reagent/water/holywater
	has_custom_glass = TRUE

/datum/reagent/hydrogen_peroxide
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/creme_de_coconut
	has_custom_glass = TRUE

/datum/reagent/consumable/milk
	has_custom_glass = TRUE

/datum/reagent/consumable/soymilk
	has_custom_glass = TRUE

/datum/reagent/consumable/cream
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/eggnog
	has_custom_glass = TRUE

/datum/reagent/consumable/bungojuice
	has_custom_glass = TRUE

/datum/reagent/consumable/aloejuice
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/bilk
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/creme_de_cacao
	has_custom_glass = TRUE

/datum/reagent/consumable/potato_juice
	has_custom_glass = TRUE

/datum/reagent/consumable/coffee
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/wine
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/triple_sec
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/pruno
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/mushi_kombucha
	has_custom_glass = TRUE

/datum/reagent/consumable/orangejuice
	has_custom_glass = TRUE

/datum/reagent/consumable/prunomix
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/creme_de_menthe
	has_custom_glass = TRUE

/datum/reagent/consumable/limejuice
	has_custom_glass = TRUE

/datum/reagent/consumable/menthol
	has_custom_glass = TRUE

/datum/reagent/consumable/tomatojuice
	has_custom_glass = TRUE

/datum/reagent/consumable/watermelonjuice
	has_custom_glass = TRUE

/datum/reagent/blood
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/hooch
	has_custom_glass = TRUE

/datum/reagent/consumable/ethanol/bacchus_blessing
	has_custom_glass = TRUE

//////////////////////
// da custom drinks //
//////////////////////

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

/datum/reagent/consumable/whipcream/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
		. = 1
	..()

/datum/reagent/consumable/whipcream/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>You go into hyperglycaemic shock! Lay off the twinkies!</span>")
	M.AdjustSleeping(600, FALSE)
	. = 1

/datum/reagent/consumable/naenaecream
	name = "Nae Nae Cream"
	description = "Cream and Sugar, mixed along with some other... substances. Don't take too much!"
	color = "#F6B6A9" // rgb: 223, 215, 175
	taste_description = "awestruck dancers"
	glass_icon_state  = "glass_naenae"
	glass_name = "glass of nae nae cream"
	glass_desc = "Now watch me..."
	overdose_threshold = 50

/datum/reagent/consumable/naenaecream/on_mob_life(mob/living/carbon/M)
	if(prob(5))
		M.visible_message("<span class='warning'>nae naes!</span>", visible_message_flags = EMOTE_MESSAGE)
		M.Stun(2)
	..()

/datum/reagent/consumable/naenaecream/proc/picklimb()
	return (pick(TRAIT_PARALYSIS_L_ARM,TRAIT_PARALYSIS_R_ARM,TRAIT_PARALYSIS_R_LEG,TRAIT_PARALYSIS_L_LEG))

/datum/reagent/consumable/naenaecream/overdose_process(mob/living/carbon/M)
	M.set_drugginess(50)
	M.dizziness +=2
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
	. = 1
	..()

/datum/reagent/consumable/tea
	name = "Black Tea"
	description = "Tasty black tea, it has antioxidants, it's good for you!"
	color = "#101000" // rgb: 16, 16, 0
	nutriment_factor = 0
	taste_description = "tart black tea"
	glass_icon_state = "teaglass"
	glass_name = "black tea"
	glass_desc = "A warm glass of black tea. Shouldn't you drink this from something else?"

/datum/reagent/consumable/tea/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/greentea
	name = "Green Tea"
	description = "You fucking weeaboo."
	color = "#2D7C36"
	nutriment_factor = 0
	taste_description = "soothing green tea"
	glass_icon_state = "greentea"
	glass_name = "green tea"
	glass_desc = "Green Tea served in a traditional Japanese tea cup, just like in your Chinese cartoons!"

/datum/reagent/consumable/greentea/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-1)
	M.drowsyness = max(0,M.drowsyness-3)
	M.jitteriness = max(0,M.jitteriness-2)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/redtea
	name = "Red Tea"
	description = "THIS SHIT'S RED!"
	color = "#A01818"
	nutriment_factor = 0
	taste_description = "sweet red tea"
	glass_icon_state = "redtea"
	glass_name = "redtea"
	glass_desc = "Red Tea served in a traditional Chinese tea cup, just like in your Malaysian movies!"

/datum/reagent/consumable/redtea/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-3)
	M.drowsyness = max(0,M.drowsyness-2)
	M.jitteriness = max(0,M.jitteriness-1)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/chifir
	name = "Chifir"
	description = "For when you're indecisive!"
	nutriment_factor = 0
	color = "#432208"
	taste_description = "bitter chifir"
	glass_icon_state = "chifir"
	glass_name = "chifir"
	glass_desc = "A Russian kind of tea. Not for those with weak stomachs."

/datum/reagent/consumable/chifir/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-2)
	M.jitteriness = max(0,M.jitteriness-2)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/chamomile
	name = "Chamomile"
	description = "this shits FLOWERS"
	nutriment_factor = 0
	color = "#D09A28"
	taste_description = "floral chamomile"
	glass_icon_state = "chamomile"
	glass_name = "chamomile"
	glass_desc = "A smooth, herbal tea. Refreshing!"

/datum/reagent/consumable/chamomile/on_mob_life(mob/living/carbon/M)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-2, 0)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()
	. = 1


////////////////
// da recipes //
////////////////

/datum/chemical_reaction/whipcream
	results = list(/datum/reagent/consumable/whipcream = 4)
	required_reagents = list(/datum/reagent/consumable/sugar = 1, /datum/reagent/consumable/cream = 3)

/datum/chemical_reaction/naenaecream
	results = list(/datum/reagent/consumable/naenaecream = 8)
	required_reagents = list(/datum/reagent/consumable/whipcream = 4, /datum/reagent/consumable/ethanol/neurotoxin = 8, /datum/reagent/drug/krokodil = 1) //Krokodil was literally the only way to make this even close to balanced.

/datum/chemical_reaction/chamomile
	results = list(/datum/reagent/consumable/chamomile = 3)
	required_reagents = list(/datum/reagent/consumable/tea = 1, /datum/reagent/consumable/lemonjuice = 1)

/datum/chemical_reaction/chifir
	results = list(/datum/reagent/consumable/chifir = 3)
	required_reagents = list(/datum/reagent/consumable/tea = 1, /datum/reagent/consumable/greentea = 1, /datum/reagent/consumable/redtea = 1)

//////////////////////
// soda dispenser stuffs //
//////////////////////

/obj/machinery/chem_dispenser
/// Reagents added by custom modules
     var/list/modular_reagents

/obj/machinery/chem_dispenser/Initialize(mapload)
     . = ..()
     dispensable_reagents |= modular_reagents

/obj/machinery/chem_dispenser/drinks
     modular_reagents = list(
        /datum/reagent/consumable/greentea,
		/datum/reagent/consumable/tea,
        /datum/reagent/consumable/redtea)
