////////////////////
// Reddit Cookies //
// Sprites made by u/appenem
/obj/item/food/cookie/sugar/cringe //I found these sprites and I wanted to make cookies out of them.
	name = "cringe cookie" //Couldn't think of a better name. I know this name is ass.
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "cringecookie"
	desc = "Teeming with toxicity, just the way you like it."
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sugar = 6, /datum/reagent/toxin = 1)
	tastes = list("sweetness" = 3, "toxicity" = 1, "static" = 1)
	foodtypes = GRAIN | JUNKFOOD | SUGAR

/obj/item/food/cookie/sugar/cringe/Initialize()
	. = ..()
	icon_state = "[icon_state][rand(1,9)]"

/datum/crafting_recipe/food/cringecookie
	time = 15
	name = "Cringe cookie"
	reqs = list(
		/datum/reagent/consumable/sugar = 5,
		/obj/item/food/pastrybase = 1,
		/datum/reagent/toxin = 6
	)
	result = /obj/item/food/cookie/sugar/cringe
	subcategory = CAT_PASTRY


// Reddit Cookies //
////////////////////
/////// Oreos //////
//Normal
/obj/item/food/cookie/oreo
	name = "oreo"
	desc = "A tasty cookie with cream filling!"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "oreo"
	food_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 2)
	tastes = list("cookies" = 1, "cream" = 1)
	foodtypes = SUGAR | JUNKFOOD

/datum/crafting_recipe/food/oreo
	name = "Oreos"
	reqs = list(
		/datum/reagent/consumable/flour = 1,
		/obj/item/food/chocolatebar = 1,
		/datum/reagent/consumable/cream = 1,
	)
	result = /obj/item/food/cookie/oreo
	subcategory = CAT_PASTRY

// Double
/obj/item/food/cookie/oreo/double
	name = "double stuf oreo"
	desc = "A tasty cookie with <i>twice</i> the cream filling!"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "oreo_double"
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 4)

/datum/crafting_recipe/food/oreodouble
	name = "Double Stuf Oreo"
	reqs = list(
		/datum/reagent/consumable/flour = 2,
		/obj/item/food/chocolatebar = 1,
		/datum/reagent/consumable/cream = 2,
	)
	result = /obj/item/food/cookie/oreo/double
	subcategory = CAT_PASTRY

// Mega
/obj/item/food/cookie/oreo/mega
	name = "mega stuf oreo"
	desc = "A tasty cookie with <i>quadruple</i> the cream filling!"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "oreo_mega"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sugar = 8)

/datum/crafting_recipe/food/oreomega
	name = "Mega Stuf Oreo"
	reqs = list(
		/datum/reagent/consumable/flour = 4,
		/obj/item/food/chocolatebar = 1,
		/datum/reagent/consumable/cream = 4,
	)
	result = /obj/item/food/cookie/oreo/mega
	subcategory = CAT_PASTRY

// Most
/obj/item/food/cookie/oreo/most
	name = "most stuf oreo"
	desc = "A tasty cookie with <i>octuple</i> the cream filling!"
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "oreo_most"
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/sugar = 16)

/datum/crafting_recipe/food/oreomost
	name = "Most Stuf Oreo"
	reqs = list(
		/datum/reagent/consumable/flour = 8,
		/obj/item/food/chocolatebar = 2,
		/datum/reagent/consumable/cream = 8,
	)
	result = /obj/item/food/cookie/oreo/most
	subcategory = CAT_PASTRY


////////////// Boxes ///////////////

/obj/item/storage/fancy/oreobox
	name = "oreo box"
	desc = "A cardboard box used for holding a ton of oreos."
	icon = 'modular_heaven/modules/custom_food/icons/containers.dmi'
	icon_state = "oreobox"
	base_icon_state = "oreobox"
	contents_tag = "oreo"

/obj/item/storage/fancy/oreobox/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.set_holdable(list(/obj/item/food/cookie/oreo))
	STR.max_combined_w_class = 40

/obj/item/storage/fancy/oreobox/full
	spawn_type = /obj/item/food/cookie/oreo

// Double
/obj/item/storage/fancy/oreobox/double
	name = "double stuf oreo box"
	desc = "A cardboard box used for holding lots of double stuf oreos."
	icon_state = "oreobox_double"
	base_icon_state = "oreobox_double"
	contents_tag = "double stuf oreo"

/obj/item/storage/fancy/oreobox/double/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8
	STR.set_holdable(list(/obj/item/food/cookie/oreo/double))
	STR.max_combined_w_class = 40

/obj/item/storage/fancy/oreobox/double/full
	spawn_type = /obj/item/food/cookie/oreo/double

// Mega
/obj/item/storage/fancy/oreobox/mega
	name = "mega stuf oreo box"
	desc = "A cardboard box used for holding some mega stuf oreos."
	icon_state = "oreobox_mega"
	base_icon_state = "oreobox_mega"
	contents_tag = "mega stuf oreo"

/obj/item/storage/fancy/oreobox/mega/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6
	STR.set_holdable(list(/obj/item/food/cookie/oreo/mega))
	STR.max_combined_w_class = 40

/obj/item/storage/fancy/oreobox/mega/full
	spawn_type = /obj/item/food/cookie/oreo/mega

// Most
/obj/item/storage/fancy/oreobox/most
	name = "most stuf oreo box"
	desc = "A cardboard box used for holding a couple most stuf oreos."
	icon_state = "oreobox_most"
	base_icon_state = "oreobox_most"
	contents_tag = "most stuf oreo"

/obj/item/storage/fancy/oreobox/most/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 4
	STR.set_holdable(list(/obj/item/food/cookie/oreo/most))
	STR.max_combined_w_class = 40

/obj/item/storage/fancy/oreobox/most/full
	spawn_type = /obj/item/food/cookie/oreo/most

// Omni
/*
/obj/item/storage/fancy/oreobox/omni
	name = "omni stuf oreo box"
	desc = "A cardboard box used for holding an omni stuf oreos."
	icon_state = "oreobox_omni"
	base_icon_state = "oreobox_omni"
	contents_tag = "omni stuf oreo"

/obj/item/storage/fancy/oreobox/omni/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.set_holdable(list(/obj/item/food/cookie/oreo/omni))
	STR.max_combined_w_class = 40

/obj/item/storage/fancy/oreobox/omni/full
	spawn_type = /obj/item/food/cookie/oreo/omni
*/

/////// Oreos //////
////////////////////
///// Rugelach /////

/obj/item/food/rugelach
	name = "Rugelach"
	desc = "A treat originating all the way back from old world Poland! Its cream chese filling and dark chocolate accents on a flaky crust all make it feel heavenly."
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "rugelach"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("pastry" = 1, "dark_chocolate" = 1, "cream cheese" = 1)
	foodtypes = GRAIN | DAIRY | SUGAR


/datum/crafting_recipe/food/rugelach
	name = "Rugelach"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/datum/reagent/consumable/cream = 1,
		/obj/item/food/cheese = 1,
		/obj/item/food/chocolatebar = 1,
		/datum/reagent/consumable/sugar = 3,
	)
	result = /obj/item/food/rugelach
	subcategory = CAT_PASTRY
