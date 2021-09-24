///////////////////
//////Medical//////

/obj/item/stack/medical/bruise_pack
	icon = 'modular_heaven/modules/tauceti_sprites/med_stacks.dmi'

/obj/item/stack/medical/ointment
	icon = 'modular_heaven/modules/tauceti_sprites/med_stacks.dmi'

/obj/machinery/iv_drip
	icon = 'modular_heaven/modules/tauceti_sprites/iv_drip.dmi'

//////Medical//////
///////////////////
///////Razor///////

/obj/item/razor
	icon = 'modular_heaven/modules/tauceti_sprites/hair.dmi'

///////Razor///////
///////////////////
//////Library//////

/obj/machinery/libraryscanner
	icon = 'modular_heaven/modules/tauceti_sprites/scanning.dmi'

//////Library//////
///////////////////
/////Medipens//////

/obj/item/reagent_containers/hypospray/medipen
	icon = 'modular_heaven/modules/tauceti_sprites/syringes.dmi'

/obj/item/reagent_containers/hypospray/medipen/inject(mob/living/M, mob/user)
	. = ..()
	if(.)
		playsound(M, 'modular_heaven/modules/tauceti_sprites/medipen.ogg', 20, TRUE, -3)
