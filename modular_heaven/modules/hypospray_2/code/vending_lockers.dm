/obj/machinery/vending/medical
	added_products = list(/obj/item/hypospray/mkii/standard = 2,
						/obj/item/reagent_containers/glass/hypovial/small/libital = 2,
						/obj/item/reagent_containers/glass/hypovial/small/aiuri = 2,
						/obj/item/reagent_containers/glass/hypovial/small/sterilizine = 1
						)
	added_premium = list(/obj/item/reagent_containers/glass/hypovial/small/synthflesh = 2)

/obj/machinery/vending/wallmed
	added_premium = list(/obj/item/reagent_containers/glass/hypovial/small/libital = 2,
						/obj/item/reagent_containers/glass/hypovial/small/aiuri = 2,
						/obj/item/reagent_containers/glass/hypovial/small/sterilizine = 1
						)

/obj/structure/closet/secure_closet/medical3/PopulateContents()
	new /obj/item/storage/hypospraykit/regular(src)
	. = ..()

/obj/structure/closet/secure_closet/chief_medical/PopulateContents()
	new /obj/item/storage/hypospraykit/cmo(src)
	. = ..()

/obj/item/storage/belt/medical/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(
		/obj/item/reagent_containers/glass/hypovial,
		/obj/item/hypospray/mkii,
	))

/obj/item/storage/belt/mining/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.set_holdable(list(
		/obj/item/reagent_containers/glass/hypovial,
		/obj/item/hypospray/mkii,
	))

/datum/objective_item/steal/hypo
	targetitem = /obj/item/hypospray/mkii/cmo
