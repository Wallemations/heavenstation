#define WAIT_SPRAY 20
#define WAIT_INJECT 20
#define SELF_SPRAY 15
#define SELF_INJECT 15

#define DELUXE_WAIT_SPRAY 0
#define DELUXE_WAIT_INJECT 5
#define DELUXE_SELF_SPRAY 10
#define DELUXE_SELF_INJECT 10

#define COMBAT_WAIT_SPRAY 0
#define COMBAT_WAIT_INJECT 0
#define COMBAT_SELF_SPRAY 0
#define COMBAT_SELF_INJECT 0

#define STANDARD_WAIT_SPRAY 30
#define STANDARD_WAIT_INJECT 30
#define STANDARD_SELF_SPRAY 20
#define STANDARD_SELF_INJECT 20

/obj/item/hypospray/mkii
	name = "experimental hypospray mk.II"
	icon_state = "hypo2"
	icon = 'modular_heaven/modules/hypospray_2/icons/syringe.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	inhand_icon_state = "hypo"
	worn_icon_state = "hypo"
	desc = "Much faster than its standard counterpart, this hypospray takes 60-unit vials as the drug supply for easy swapping."
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	custom_price = 600
	var/list/allowed_containers = list(/obj/item/reagent_containers/glass/hypovial/small)
	var/obj/item/reagent_containers/glass/hypovial/vial
	var/start_vial = /obj/item/reagent_containers/glass/hypovial/small
	var/spawnwithvial = TRUE

	//Time taken to inject others
	var/inject_wait = WAIT_INJECT
	//Time taken to spray others
	var/spray_wait = WAIT_SPRAY
	//Time taken to inject self
	var/inject_self = SELF_INJECT
	//Time taken to spray self
	var/spray_self = SELF_SPRAY

	//Can you hotswap vials?
	var/quickload = FALSE
	//Does it go through hardsuits?
	var/penetrates = FALSE

/obj/item/hypospray/mkii/cmo
	name = "hypospray mk.II deluxe"
	allowed_containers = list(/obj/item/reagent_containers/glass/hypovial/small, /obj/item/reagent_containers/glass/hypovial/large)
	icon_state = "cmo2"
	desc = "The deluxe hypospray can take larger 120-unit vials. It also acts faster and can deliver more reagents per spray."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	start_vial = /obj/item/reagent_containers/glass/hypovial/large/deluxe
	inject_wait = DELUXE_WAIT_INJECT
	spray_wait = DELUXE_WAIT_SPRAY
	spray_self = DELUXE_SELF_SPRAY
	inject_self = DELUXE_SELF_INJECT
	quickload = TRUE
	penetrates = TRUE

/obj/item/hypospray/mkii/combat
	name = "combat hypospray mk.II"
	allowed_containers = list(/obj/item/reagent_containers/glass/hypovial/small, /obj/item/reagent_containers/glass/hypovial/large)
	icon_state = "combat2"
	inhand_icon_state = "combat_hypo"
	desc = "An air-needle autoinjector used by support operatives to quickly heal injuries in combat."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	start_vial = /obj/item/reagent_containers/glass/hypovial/large/combat
	inject_wait = COMBAT_WAIT_INJECT
	spray_wait = COMBAT_WAIT_SPRAY
	spray_self = COMBAT_SELF_SPRAY
	inject_self = COMBAT_SELF_INJECT
	quickload = TRUE
	penetrates = TRUE

/obj/item/hypospray/mkii/combat/nanite
	name = "nanite hypospray mk.II"
	icon_state = "nanite2"
	inhand_icon_state = "nanite_hypo"
	desc = "An air-needle autoinjector for use in combat situations. Vial prefilled with experimental medical nanites and a stimulant for rapid healing and a combat boost."
	start_vial = /obj/item/reagent_containers/glass/hypovial/large/combat/nanite
	quickload = FALSE
	penetrates = TRUE

/obj/item/hypospray/mkii/standard
	name = "standard hypospray mk.II"
	icon_state = "standard2"
	desc = "A new development from DeForest Medical, this hypospray takes 60-unit vials as the drug supply for easy swapping."
	start_vial = /obj/item/reagent_containers/glass/hypovial/small/epinephrine
	inject_wait = STANDARD_WAIT_INJECT
	spray_wait = STANDARD_WAIT_SPRAY
	spray_self = STANDARD_SELF_SPRAY
	inject_self = STANDARD_SELF_INJECT
	custom_price = 150

/obj/item/hypospray/mkii/Initialize()
	. = ..()
	if(!spawnwithvial)
		update_icon()
		return
	if(start_vial)
		vial = new start_vial
	update_icon()

/obj/item/hypospray/mkii/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/hypospray/mkii/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][vial ? "" : "-e"]"

/obj/item/hypospray/mkii/examine(mob/user)
	. = ..()
	if(vial)
		. += "[vial] has [vial.reagents.total_volume]u remaining."
		if(quickload)
			. += "[src] has a quickload mechanism!"
	else
		. += "It has no vial loaded in."

/obj/item/hypospray/mkii/add_item_context(obj/item/source, list/context, atom/target, mob/living/user)
	if (!isliving(target))
		return NONE
	context[SCREENTIP_CONTEXT_LMB] = "Inject"
	context[SCREENTIP_CONTEXT_RMB] = "Spray"
	return CONTEXTUAL_SCREENTIP_SET

/obj/item/hypospray/mkii/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = ..()
	context[SCREENTIP_CONTEXT_ALT_LMB] = "Change reagents per transfer."
	return CONTEXTUAL_SCREENTIP_SET

/obj/item/hypospray/mkii/proc/unload_hypo(obj/item/hypo, mob/user)
	if((istype(hypo, /obj/item/reagent_containers/glass/hypovial)))
		var/obj/item/reagent_containers/glass/hypovial/container = hypo
		container.forceMove(user.loc)
		user.put_in_hands(container)
		to_chat(user, span_notice("You remove [vial] from [src]."))
		vial = null
		update_icon()
		playsound(loc, 'sound/weapons/empty.ogg', 50, 1)
	else
		to_chat(user, span_notice("This hypo isn't loaded!"))
		return

/obj/item/hypospray/mkii/proc/insert_vial(obj/item/new_vial, mob/living/user, obj/item/current_vial)
	var/obj/item/reagent_containers/glass/hypovial/container = new_vial
	if(!is_type_in_list(container, allowed_containers))
		to_chat(user, span_notice("[src] doesn't accept this type of vial."))
		return FALSE
	if(current_vial)
		var/obj/item/reagent_containers/glass/hypovial/old_container = current_vial
		old_container.forceMove(drop_location())
	if(!user.transferItemToLoc(container, src))
		return FALSE
	vial = container
	user.visible_message(span_notice("[user] has loaded a vial into [src]."), span_notice("You have loaded [vial] into [src]."))
	playsound(loc, 'sound/weapons/autoguninsert.ogg', 35, 1)
	update_appearance()
	if(current_vial)
		user.put_in_hands(current_vial)

/obj/item/hypospray/mkii/attackby(obj/item/used_item, mob/living/user)
	if((istype(used_item, /obj/item/reagent_containers/glass/hypovial) && vial != null))
		if(!quickload)
			to_chat(user, span_warning("[src] needs its current vial ejected in order to insert a new one!"))
			return FALSE
		else
			insert_vial(used_item, user, vial)
			return TRUE

	if((istype(used_item, /obj/item/reagent_containers/glass/hypovial)))
		insert_vial(used_item, user)
		return TRUE

/obj/item/hypospray/mkii/AltClick(mob/user)
	. = ..()
	if(vial)
		vial.attack_self(user)
		return TRUE

/obj/item/hypospray/mkii/emag_act(mob/user)
	. = ..()
	if(obj_flags & EMAGGED)
		to_chat(user, "[src] happens to be already overcharged.")
		return
	//all these are 0
	inject_wait = COMBAT_WAIT_INJECT
	spray_wait = COMBAT_WAIT_SPRAY
	spray_self = COMBAT_SELF_INJECT
	inject_self = COMBAT_SELF_SPRAY
	penetrates = TRUE
	to_chat(user, "You overcharge [src]'s control circuit.")
	obj_flags |= EMAGGED
	return TRUE

/obj/item/hypospray/mkii/attack_hand(mob/user)
	. = ..() //Don't bother changing this or removing it from containers will break.

/obj/item/hypospray/mkii/attack(mob/living/victim, mob/user, params)
	if(!vial || !isliving(victim))
		return
	if(!hypo_checker(victim, user))
		return
	use_hypospray(victim, user, "inject")
	return

/obj/item/hypospray/mkii/attack_secondary(mob/living/victim, mob/living/user, params)
	if(!vial || !isliving(victim))
		return
	if(!hypo_checker(victim, user))
		return
	use_hypospray(victim, user, "spray")
	return

/obj/item/hypospray/mkii/attack_self(mob/living/user)
	if(user)
		if(user.incapacitated())
			return
		else if(!vial)
			to_chat(user, "This Hypo needs to be loaded first!")
			return
		else
			unload_hypo(vial,user)

/obj/item/hypospray/mkii/proc/use_hypospray(mob/living/injectee, mob/user, mode)
	if(injectee != user)
		injectee.visible_message(span_danger("[user] is trying to [mode] [injectee] with [src]!"), \
						span_userdanger("[user] is trying to [mode] you with [src]!"))
	if(!do_mob(user, injectee, inject_wait, extra_checks = CALLBACK(injectee, /mob/living/proc/can_inject, user, user.zone_selected, penetrates)))
		return
	if(!vial.reagents.total_volume)
		return
	log_attack("<font color='red'>[user.name] ([user.ckey]) applied [src] to [injectee.name] ([injectee.ckey]), which had [hypo_log_list(injectee, user)] (MODE: [mode])</font>")
	if(injectee != user)
		injectee.visible_message(span_danger("[user] uses the [src] on [injectee]!"), \
						span_userdanger("[user] uses the [src] on you!"))
	else
		injectee.log_message("<font color='orange'>applied [src] to themselves ([hypo_log_list(injectee, user)]).</font>", LOG_ATTACK)

	switch(mode)
		if("inject")
			vial.reagents.trans_to(injectee, vial.amount_per_transfer_from_this)
		if("spray")
			vial.reagents.trans_to(injectee, vial.amount_per_transfer_from_this, methods = PATCH)

	var/long_sound = vial.amount_per_transfer_from_this >= 15
	playsound(loc, long_sound ? 'modular_heaven/modules/hypospray_2/sound/hypospray_long.ogg' : pick('modular_heaven/modules/hypospray_2/sound/hypospray.ogg','modular_heaven/modules/hypospray_2/sound/hypospray2.ogg'), 50, 1, -1)
	to_chat(user, span_notice("You [mode] [vial.amount_per_transfer_from_this] units of the solution. The hypospray's cartridge now contains [vial.reagents.total_volume] units."))
	update_appearance()

/obj/item/hypospray/mkii/proc/hypo_checker(mob/living/injectee, mob/user)
	if(!injectee.reagents || !injectee.can_inject(user, user.zone_selected, penetrates))
		return FALSE

	if(iscarbon(injectee))
		var/obj/item/bodypart/affecting = injectee.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			to_chat(user, span_warning("The limb is missing!"))
			return FALSE
	//Always log attemped injects for admins
	log_combat(user, injectee, "attemped to inject", src, addition="which had [hypo_log_list(injectee, user)]")
	if(!vial)
		to_chat(user, span_notice("[src] doesn't have any vial installed!"))
		return FALSE
	if(!vial.reagents.total_volume)
		to_chat(user, span_notice("[src]'s vial is empty!"))
		return FALSE
	return TRUE

/obj/item/hypospray/mkii/proc/hypo_log_list(mob/living/injectee, mob/user)
	var/list/injected = list()
	for(var/datum/reagent/injected_reagent in vial.reagents.reagent_list)
		injected += injected_reagent.name
	var/contained = english_list(injected)
	return contained

#undef WAIT_SPRAY
#undef WAIT_INJECT
#undef SELF_SPRAY
#undef SELF_INJECT
#undef DELUXE_WAIT_SPRAY
#undef DELUXE_WAIT_INJECT
#undef DELUXE_SELF_SPRAY
#undef DELUXE_SELF_INJECT
#undef COMBAT_WAIT_SPRAY
#undef COMBAT_WAIT_INJECT
#undef COMBAT_SELF_SPRAY
#undef COMBAT_SELF_INJECT
#undef STANDARD_WAIT_SPRAY
#undef STANDARD_WAIT_INJECT
#undef STANDARD_SELF_SPRAY
#undef STANDARD_SELF_INJECT
