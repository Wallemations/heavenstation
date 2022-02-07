//////////////////////////
/////// Cheesecakes //////
// Royal
/obj/item/food/cake/royalcheese
	name = "royal cheese cake"
	desc = "Food fit for a god, you can almost experience what ascension is like."
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "royalcheesecake"
	food_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 10)
	tastes = list("heaven" = 4, "divinity" = 3)
	foodtypes = GRAIN | DAIRY
	burns_in_oven = TRUE

/obj/item/food/cake/royalcheese/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/cakeslice/royalcheese, 5, 3)

/obj/item/food/cakeslice/royalcheese
	name = "royal cheese cake slice"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	desc = "A slice of heaven."
	icon_state = "royalcheesecake_slice"
	tastes = list("heaven" = 4, "divinity" = 3 )
	foodtypes = GRAIN | DAIRY

/datum/crafting_recipe/food/royalcheesecake
	name = "Royal Cheese cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/cheese/royal = 1
	)
	result = /obj/item/food/cake/royalcheese
	subcategory = CAT_CAKE

// Lemon

/obj/item/food/cake/lemoncheese
	name = "lemon cheese cake"
	desc = "Same old classic cheesecake, but with a bit of lemon in there for some zest!"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "lemoncheese"
	food_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 10)
	tastes = list("cake" = 4, "cream cheese" = 3, "lemon" = 2)
	foodtypes = GRAIN | DAIRY | FRUIT | SUGAR

/obj/item/food/cake/lemoncheese/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/cakeslice/lemoncheese, 5, 3)

/obj/item/food/cakeslice/lemoncheese
	name = "lemon cheese cake slice"
	desc = "Slice of zesty goodness."
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "lemoncheese_slice"
	tastes = list("cake" = 4, "cream cheese" = 3, "lemon" = 2)
	foodtypes = GRAIN | DAIRY | FRUIT | SUGAR

/datum/crafting_recipe/food/lemoncheesecake
	name = "Lemon Cheese cake"
	reqs = list(
		/obj/item/food/cake/plain = 1,
		/obj/item/food/cheese = 2,
		/obj/item/food/grown/citrus/lemon = 1
	)
	result = /obj/item/food/cake/lemoncheese
	subcategory = CAT_CAKE


/////// Cheesecakes //////
//////////////////////////
