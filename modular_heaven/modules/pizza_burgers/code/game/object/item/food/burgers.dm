/obj/item/food/burger
	icon = 'modular_heaven/modules/pizza_burgers/icons/obj/burgers.dmi'

/obj/item/food/burger/bigmac
	name = "bigmac"
	desc = "Infused with the secret sauce of the ancients. Happy Meal toy not included."
	icon_state = "bigmac"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/protein = 7, /datum/reagent/consumable/nutriment/vitamin = 5)
	bite_consumption = 3
	eat_time = 3 SECONDS
	tastes = list("bun" = 4, "beef patty" = 4, "secret sauce" = 10, "lettuce" = 3)
	foodtypes = GRAIN | MEAT | DAIRY
	venue_value = FOOD_PRICE_EXOTIC

/datum/crafting_recipe/food/bigmac
	name = "Big Mac"
	reqs = list(
		/obj/item/food/patty/plain = 2,
		/obj/item/food/bun = 1,
		/obj/item/food/cheese = 2,
		/obj/item/food/grown/cabbage = 1 //Lettuce doesn't exist (yet). Change once lettuce comes back.
	)
	result = /obj/item/food/burger/bigmac
	subcategory = CAT_BURGER

/obj/item/storage/fancy/bigmacbox
	name = "big mac box"
	desc = "A cardboard box used for holding a big mac."
	icon = 'modular_heaven/modules/pizza_burgers/icons/obj/macbox.dmi'
	icon_state = "bigmacbox"
	base_icon_state = "bigmacbox"
	contents_tag = "bigmac"
	spawn_type = /obj/item/food/burger/bigmac

/obj/item/storage/fancy/bigmacbox/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.set_holdable(list(/obj/item/food/burger/bigmac))
	STR.max_combined_w_class = 30
	STR.max_w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/fancy/bigmacbox/AltClick(mob/user)
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY, FALSE, TRUE))
		return ..()
	if(!is_open)
		return
	var/obj/item/food/burger/bigmac/B = locate(/obj/item/food/burger/bigmac) in contents
	if(B && contents.len > 0)
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_TAKE, B, user)
		user.put_in_hands(B)
		contents -= B
		user.visible_message("<span class='notice'>[user] takes [B] out of [src].</span>", "<span class='notice'>You take [B] out of [src].</span>")
		update_icon()
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

/obj/item/storage/fancy/bigmacbox/update_icon_state()
	. = ..()
	if(!contents.len > 0)
		icon_state = is_open ? "[base_icon_state]" : "[base_icon_state]_open"
	else
		icon_state = is_open ? "[base_icon_state]" : "[base_icon_state]_open_full"
	return
