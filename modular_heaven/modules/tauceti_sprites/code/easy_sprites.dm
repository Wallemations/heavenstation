///////////////////
///   Medical   ///

/obj/item/stack/medical/bruise_pack
	icon = 'modular_heaven/modules/tauceti_sprites/icons/med_stacks.dmi'

/obj/item/stack/medical/ointment
	icon = 'modular_heaven/modules/tauceti_sprites/icons/med_stacks.dmi'

/obj/machinery/iv_drip
	icon = 'modular_heaven/modules/tauceti_sprites/icons/iv_drip.dmi'

///  Medical  ///
/////////////////
///   Razor   ///

/obj/item/razor
	icon = 'modular_heaven/modules/tauceti_sprites/icons/hair.dmi'

///   Razor   ///
///////////////////
///  Library  ///

/obj/machinery/libraryscanner
	icon = 'modular_heaven/modules/tauceti_sprites/icons/scanning.dmi'

///   Library   ///
///////////////////
/// Medipens ///

/obj/item/reagent_containers/hypospray/medipen/inject(mob/living/M, mob/user)
	. = ..()
	if(.)
		playsound(M, 'modular_heaven/modules/tauceti_sprites/sounds/medipen.ogg', 50, TRUE, -3)


///  Medipens   ///
///////////////////
///   Medbots   ///

/mob/living/simple_animal/bot/medbot
	icon = 'modular_heaven/modules/tauceti_sprites/icons/medbots.dmi'

