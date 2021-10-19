
/obj/machinery/vending/medical/Initialize()
	products[/obj/item/hypospray/mkii/standard] = 2
	products[/obj/item/reagent_containers/glass/hypovial/small/libital] = 2
	products[/obj/item/reagent_containers/glass/hypovial/small/aiuri] = 2
	products[/obj/item/reagent_containers/glass/hypovial/small/sterilizine] = 1
	. = ..()

/obj/machinery/vending/wallmed/Initialize()
	premium[/obj/item/reagent_containers/glass/hypovial/small/libital] = 2
	premium[/obj/item/reagent_containers/glass/hypovial/small/aiuri] = 2
	premium[/obj/item/reagent_containers/glass/hypovial/small/sterilizine] = 1
	. = ..()
