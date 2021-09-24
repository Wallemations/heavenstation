//Consider making all of these behaviours a smart component/element? Something that's only applied wherever it needs to be
//Could probably have the variables on the turf level, and the behaviours being activated/deactived on the component level as the vars are updated
/turf/open/CanPass(atom/movable/A, turf/T)
	if(isliving(A))
		var/turf/AT = get_turf(A)
		if(AT && AT.turf_height - turf_height <= -TURF_HEIGHT_BLOCK_THRESHOLD)
			return FALSE
	return ..()

/turf/open/Exit(atom/movable/mover, atom/newloc)
	. = ..()
	if(. && isliving(mover) && mover.has_gravity() && isturf(newloc))
		var/mob/living/L = mover
		var/turf/T = get_turf(newloc)
		if(T && T.turf_height - turf_height <= -TURF_HEIGHT_BLOCK_THRESHOLD)
			L.on_fall()
			L.onZImpact(T, 1)


/turf/open/MouseDrop_T(mob/living/M, mob/living/user)
	if(!isliving(M) || !isliving(user) || !M.has_gravity() || !Adjacent(user) || !M.Adjacent(user) || !(user.stat == CONSCIOUS) || user.body_position == LYING_DOWN)
		return
	if(!M.has_gravity())
		return
	var/turf/T = get_turf(M)
	if(!T)
		return
	if(T.turf_height - turf_height <= -TURF_HEIGHT_BLOCK_THRESHOLD)
		//Climb up
		if(user == M)
			M.visible_message("<span class='notice'>[user] is climbing onto [src]", \
								"<span class='notice'>You start climbing onto [src].</span>")
		else
			M.visible_message("<span class='notice'>[user] is pulling [M] onto [src]", \
								"<span class='notice'>You start pulling [M] onto [src].</span>")
		if(do_mob(user, M, 2 SECONDS))
			M.forceMove(src)
		return
	if(turf_height - T.turf_height <= -TURF_HEIGHT_BLOCK_THRESHOLD)
		//Climb down
		if(user == M)
			M.visible_message("<span class='notice'>[user] is descending down to [src]", \
								"<span class='notice'>You start lowering yourself to [src].</span>")
		else
			M.visible_message("<span class='notice'>[user] is lowering [M] down to [src]", \
								"<span class='notice'>You start lowering [M] down to [src].</span>")
		if(do_mob(user, M, 2 SECONDS))
			M.forceMove(src)
		return
