///////////////
/////Jiggs/////
/obj/item/food/jiggdinner
	name = "jigg's dinner"
	desc = "A platter of salted and boiled food. You feel nostalgia and a twinge of sadness eminate from this dish. Its enough to make a certain someone cry."
	icon_state = "jiggdinner"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	trash_type = /obj/item/trash/plate
	list_reagents = list(/datum/reagent/consumable/nutriment = 25, /datum/reagent/consumable/nutriment/vitamin = 10,)
	tastes = list("boiled meat" = 1, "carrot" = 1, "potato" = 1, "cabbage" = 1, "onion" = 1)
	foodtypes = MEAT | VEGETABLES
	value = FOOD_RARE

/datum/crafting_recipe/food/jiggdinner
	name ="Jigg's Dinner"
	reqs = list(
		/obj/item/food/grown/carrot = 2,
		/obj/item/food/grown/potato = 2,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/meat/steak/plain = 1,
		/obj/item/food/grown/cabbage = 1,
	)
	result = /obj/item/food/jiggdinner
	subcategory = CAT_MISCFOOD
