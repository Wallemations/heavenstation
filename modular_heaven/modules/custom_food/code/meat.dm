/////////////////
////Carpcakes////
/obj/item/food/pancakes/carpcakes
	name = "carpcakes"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	desc = "A flaky and crunchy fishcake. You can almost make out how crisp the cake is by tapping it with a fork."
	icon_state = "carpcakes_1"
	inhand_icon_state = "carpcakes"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("fish" = 1, "breadcrumbs" = 1)
	foodtypes = SEAFOOD | GRAIN

/datum/crafting_recipe/food/carpcakes
	name = "Carpcakes"
	reqs = list(
		/obj/item/food/grilled_carp = 1,
		/datum/reagent/consumable/flour = 10,
		/datum/reagent/consumable/eggyolk = 2,
	)
	result = /obj/item/food/pancakes/carpcakes
	subcategory = CAT_SEAFOOD

////Carpcakes////
/////////////////
//Grilled Fish///

/obj/item/food/fishmeat/carp/Initialize()
	. = ..()
	AddComponent(/datum/component/grillable, /obj/item/food/grilled_carp, rand(40 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/grilled_carp
	name = "grilled carp fillet"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	desc = "A lovingly prepared carp fillet, roasted tenderly over an industrial-grade flame."
	icon_state = "roasted_fish_fillet"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/consumable/nutriment/vitamin = 4)
	bite_consumption = 6
	tastes = list("fish" = 2, "anger" = 1)
	foodtypes = SEAFOOD
	eatverbs = list("bite","chew","gnaw","swallow","chomp")
	w_class = WEIGHT_CLASS_SMALL
