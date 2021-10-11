//////////////////
///////Soups//////
/obj/item/food/soup/matzoballsoup
	name = "matzoball soup"
	desc = "A simple dumpling soup! It warms you up from the inside out, just the thing you need for those colder days on the job!"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "matzoballsoup"
	food_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("dumplings" = 1, "chicken broth" = 1, "carrot" = 1)
	foodtypes = VEGETABLES

/datum/crafting_recipe/food/matzoballsoup
	name = "Matzo ball soup"
	reqs = list(
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/food/meatball = 2,
		/obj/item/food/grown/carrot = 1,
	)
	result = /obj/item/food/soup/matzoballsoup
	subcategory = CAT_SOUP
