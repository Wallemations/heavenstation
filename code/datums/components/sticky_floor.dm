/datum/component/sticky_floor
	var/time_remaining = 0
	var/static/mutable_appearance/water_overlay = mutable_appearance('icons/effects/water.dmi', "glue_floor")
	var/static/mutable_appearance/generic_turf_overlay = mutable_appearance('icons/effects/water.dmi', "glue_other")
	var/datum/callback/callback
	var/current_overlay
	var/permanent = FALSE

/datum/component/sticky_floor/Initialize(minimum_duration, duration, _permanent)
	time_remaining += max(minimum_duration, duration)
	permanent = _permanent
	RegisterSignal(parent, list(COMSIG_MOVABLE_CROSSED, COMSIG_ATOM_ENTERED), .proc/Stick)
	RegisterSignal(parent, COMSIG_ITEM_WEARERCROSSED, .proc/Stick_on_wearer)
	update_overlay()
	if(!permanent)
		START_PROCESSING(SSobj, src)

/datum/component/sticky_floor/Destroy()
	UnregisterSignal(parent, list(COMSIG_MOVABLE_CROSSED, COMSIG_ATOM_ENTERED), .proc/Stick)
	UnregisterSignal(parent, COMSIG_ITEM_WEARERCROSSED, .proc/Stick_on_wearer)
	STOP_PROCESSING(SSobj, src)

/datum/component/sticky_floor/proc/Stick(datum/source, atom/movable/AM)
	SIGNAL_HANDLER

	var/mob/living/victim = AM
	if(istype(victim) && !victim.is_flying() && !victim.glued)
		victim.update_glue_movespeed()
		to_chat(victim,"<span class='warning'>You step in a glob of glue!</span>")


/datum/component/sticky_floor/process(delta_time)
	time_remaining -= delta_time
	if(time_remaining <= 0)
		Cleanse()

/datum/component/sticky_floor/proc/Cleanse(datum/source)
	var/turf/O = parent
	O.cut_overlay(current_overlay)
	//Turf is no longer sticky.
	qdel(O.GetComponent(/datum/component/sticky_floor))

/datum/component/sticky_floor/proc/Stick_on_wearer(datum/source, atom/movable/AM, mob/living/crossed)
	SIGNAL_HANDLER

	if(!(crossed.mobility_flags & MOBILITY_STAND) && !crossed.buckle_lying)
		Stick(source, AM)

/datum/component/sticky_floor/proc/update_overlay()
	var/intended
	if(!istype(parent, /turf/open/floor))
		intended = generic_turf_overlay
	else
		intended = water_overlay
	if(current_overlay != intended)
		var/turf/T = parent
		T.cut_overlay(current_overlay)
		T.add_overlay(intended)
		current_overlay = intended
