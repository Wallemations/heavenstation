/////////////
////Bread////
// Breadbowl
/obj/item/reagent_containers/food/breadbowl
	name = "bread bowl"
	desc = "A bowl! Made out of, bread."
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "breadbowl"
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	foodtype = GRAIN

/datum/crafting_recipe/food/breadbowl
	name = "Breadbowl"
	reqs = list(
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/food/bread/plain = 1,
		)
	result = /obj/item/reagent_containers/food/breadbowl
	subcategory = CAT_BREAD
