/datum/crafting_recipe/burn_bat
	name = "Super Slugger"
	result = /obj/item/melee/baseball_bat/burn
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/reagent_containers/glass/rag = 1,
				/datum/reagent/napalm = 10)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/barb_bat
	name = "Barbara"
	result = /obj/item/melee/baseball_bat/barbed
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/stack/rods = 10,)
	tool_behaviors = list(TOOL_WELDER, TOOL_WIRECUTTER)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/buzz_bat
	name = "Buzzsaw Bat"
	result = /obj/item/melee/baseball_bat/buzz
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/stack/sheet/iron = 5,
				/obj/item/circular_saw = 1,
				/obj/item/stack/cable_coil = 1,)
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER)
	time = 20
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/blue_bat
	name = "Bluespace Bat"
	result = /obj/item/melee/baseball_bat/bluespace
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/stack/ore/bluespace_crystal = 3,
				/obj/item/stack/sticky_tape = 1,) //what the fuck is wrong with you
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/knife_bat
	name = "Knife Bat"
	result = /obj/item/melee/baseball_bat/knife
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/kitchen/knife = 1,
				/obj/item/stack/sticky_tape = 1,)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/stun_bat
	name = "Stun Bat"
	result = /obj/item/melee/baton/baseball
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/melee/baton = 1,
				/obj/item/stack/sticky_tape = 1,)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/axe_bat
	name = "Executioner's Bat"
	result = /obj/item/fireaxe/baseball
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/stack/sheet/mineral/plastitanium = 3,
				)
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH)
	time = 30
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/home_bat
	name = "Homerun Bat"
	result = /obj/item/melee/baseball_bat/homerun
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/toy/crayon/red = 1,
				/datum/reagent/silicon = 25,
				/datum/reagent/nitrogen = 50,
				)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/magic_bat
	name = "Enchanted Bat"
	result = /obj/item/melee/baseball_bat/magic
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/melee/sabre = 1,
				/datum/reagent/water/holywater = 50,
				)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/god_bat
	name = "Affront To God"
	result = /obj/item/melee/baseball_bat/kitty
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/organ/vocal_cords/colossus = 1,
				/obj/item/storage/book/bible = 1,
				/obj/item/lighter = 1,
				)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/crafting_recipe/metal_bat
	name = "Metal Bat"
	result = /obj/item/melee/baseball_bat/ablative
	reqs = list(/obj/item/melee/baseball_bat = 1,
				/obj/item/stack/sheet/plasteel = 20,
				)
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
