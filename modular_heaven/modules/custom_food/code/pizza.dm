///////////////
/////Pizza/////

/obj/item/food/pizza/abyssaldish
	name = "Abyssal Dish Pizza"
	desc = "A breadbowl with pizza filling. Ezel Malheur's infamous favorite food. ...Would you even call this a pizza anymore...? "
	icon = 'modular_heaven/modules/custom_food/icons/food.dmi'
	icon_state = "abyssaldishpizza"
	food_reagents = list(/datum/reagent/consumable/nutriment = 45, /datum/reagent/consumable/tomatojuice = 6, /datum/reagent/consumable/nutriment/vitamin = 8)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1, "satisfaction?" = 3)
	foodtypes = GRAIN | VEGETABLES | DAIRY | MEAT | JUNKFOOD
	boxtag = "Molar Pizza"

/datum/crafting_recipe/food/abyssalpizza
	name = "Abyssal Dish pizza"
	reqs = list(
		/obj/item/reagent_containers/food/breadbowl = 1,
		/obj/item/food/meat/rawcutlet = 4,
		/obj/item/food/cheese = 1,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/abyssaldish/raw
	subcategory = CAT_PIZZA

/obj/item/food/pizza/abyssaldish/raw
	name = "raw Abyssal Dish Pizza"
	icon_state = "abyssaldishpizza_raw"
	foodtypes =  GRAIN | DAIRY | VEGETABLES | RAW
	burns_in_oven = FALSE

/obj/item/food/pizza/abyssaldish/raw/MakeBakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/pizza/abyssaldish, rand(70 SECONDS, 80 SECONDS), TRUE, TRUE)
