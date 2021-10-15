///////////////
///Spag Taco///
/obj/item/food/taco/spaghetti
	name = "spaghetti taco"
	desc = "A taco with... spaghetti and meatballs in it. An odd clashing of cultures, but it brings crunch to a classic meal!"
	icon_state = "taco_spaghetti"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("taco shell" = 4, "meat" = 2, "cheese" = 2, "spaghetti sauce" = 1)
	foodtypes = MEAT | DAIRY | GRAIN

/datum/crafting_recipe/food/spagtaco
	name ="Spaghetti Taco"
	reqs = list(
		/obj/item/food/tortilla = 1,
		/obj/item/food/meat/cutlet = 1,
		/obj/item/food/spaghetti/pastatomato = 1,
	)
	result = /obj/item/food/taco/spaghetti
	subcategory = CAT_MEXICAN

///Spag Taco///
///////////////
////Tamales////

/obj/item/food/tamales
	name = "tamales"
	desc = "A beloved dish from Space Mexico!"
	icon_state = "tamales"
	bite_consumption = 4
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/capsaicin = 1)
	tastes = list("spice" = 1, "meat" = 3, "cheese" = 1, "masa" = 1)
	foodtypes = MEAT | GRAIN

/datum/crafting_recipe/food/tamales
	name = "Tamales"
	reqs = list(
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/dough = 1,
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/glass/bowl = 1,
	)
	result = /obj/item/food/tamales
	subcategory = CAT_MEXICAN
