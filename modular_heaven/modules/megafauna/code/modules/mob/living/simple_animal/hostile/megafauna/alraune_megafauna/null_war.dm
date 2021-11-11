//mr.x megafauna
//no dead sprite because its basically invincible on its first encounter
//more attacks/sprites will be added way later on

/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war
	name = "null"
	desc = "genesis 1.02b_5II1A. Now the earth was formless and void, darkness was over the surface of the deep, and the UNDEFINED_VARIABLE was hovering over the waters."
	health = 15000
	maxHealth = 15000
	icon_state = "null_masked"
	icon_living = "null_masked"
	icon = 'modular_heaven/modules/megafauna/icons/mob/null_war.dmi'
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slashed"
	attack_sound = 'sound/weapons/sonic_jackhammer.ogg'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	light_color = COLOR_RED_LIGHT
	movement_type = GROUND
	weather_immunities = list(TRAIT_WEATHER_IMMUNE)
	speak_emote = list("states")
	armour_penetration = 100
	melee_damage_lower = 40
	melee_damage_upper = 40
	vision_range = 18 // large vision range so combat doesn't abruptly end when someone runs a bit away
	rapid_melee = 1
	speed = 2
	move_to_delay = 2
	gps_name = "NULL"
	ranged = TRUE
	wander = FALSE
	del_on_death = FALSE
	blood_volume = BLOOD_VOLUME_NORMAL
	deathmessage = "remains still, entering power save mode."
	deathsound = null
	footstep_type = FOOTSTEP_MOB_CLAW
	//unsure how to make this mob stop floating so you can actually hear it
	attack_action_types = list(/datum/action/innate/megafauna_attack/homing_missile,
							   /datum/action/innate/megafauna_attack/machine_gun,
							   /datum/action/innate/megafauna_attack/bulldog_shotgun)
	/// Modifies the speed of the projectiles the funny shoots out
	var/projectile_speed_multiplier = 1
	/// If the funny is in its enraged state
	var/enraged = FALSE
	/// If the funny is currently transforming to its enraged state
	var/enraging = FALSE


/datum/action/innate/megafauna_attack/homing_missile
	name = "Fire Homing Missiles"
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "sniper_zoom"
	chosen_message = "<span class='colossus'>You are now sending out homing missiles to track in on a target.</span>"
	chosen_attack_num = 1

/datum/action/innate/megafauna_attack/machine_gun
	name = "Fire Machine Gun"
	icon_icon = 'icons/obj/guns/energy.dmi'
	button_icon_state = "kineticgun"
	chosen_message = "<span class='colossus'>You are now firing a machine gun at a target.</span>"
	chosen_attack_num = 2

/datum/action/innate/megafauna_attack/bulldog_shotgun
	name = "Fire Bulldog Shotgun"
	icon_icon = 'icons/obj/guns/ballistic.dmi'
	button_icon_state = "shotgun"
	chosen_message = "<span class='colossus'>You are now firing bulldog shotgun blasts.</span>"
	chosen_attack_num = 3

/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/OpenFire()
	check_enraged()
	projectile_speed_multiplier = 1 - enraged * 0.5
	update_cooldowns(list(COOLDOWN_UPDATE_SET_MELEE = 10 SECONDS, COOLDOWN_UPDATE_SET_RANGED = 10 SECONDS))

	if(client)
		switch(chosen_attack)
			if(1)
				homing_missiles()
			if(2)
				machine_gun()
			if(3)
				bulldog_shotgun()
		return

	var/easy_attack = prob(80 - enraged * 40)
	chosen_attack = rand(1, 3)
	switch(chosen_attack)
		if(1)
			if(easy_attack)
				homing_missiles(10, 8)
			else
				homing_missiles(5, 16)
		if(2)
			if(easy_attack)
				machine_gun()
			else
				INVOKE_ASYNC(src, .proc/bulldog_shotgun, 5, list(list(-180, -140, -100, -60, -20, 20, 60, 100, 140), list(-160, -120, -80, -40, 0, 40, 80, 120, 160)))
				machine_gun(5 * 8, 5)
		if(3)
			if(easy_attack)
				bulldog_shotgun()
			else
				bulldog_shotgun(5, list(list(0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330), list(-30, -15, 0, 15, 30)))

/obj/projectile/colossus/homing_missiles
	name = "homing missile"
	icon = 'icons/obj/guns/projectiles.dmi'
	icon_state = "missile"
	damage = 20
	armour_penetration = 100
	speed = 10
	homing_turn_speed = 30
	damage_type = BURN

/obj/projectile/colossus/homing_missiles/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isturf(target) || isobj(target))
		target.ex_act(EXPLODE_HEAVY)

/obj/projectile/colossus/bullet
	name = "machine-gun bullet"
	icon = 'icons/obj/guns/projectiles.dmi'
	icon_state = "yellow_laser"
	damage = 15
	armour_penetration = 100
	speed = 3
	damage_type = BRUTE
	explode_hit_objects = FALSE

/obj/projectile/colossus/shotgun_blast
	name = "shotgun blast"
	icon = 'icons/obj/guns/projectiles.dmi'
	icon_state = "heavylaser"
	damage = 15
	armour_penetration = 100
	speed = 3
	damage_type = BRUTE

/obj/projectile/colossus/shotgun_blast/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isturf(target) || isobj(target))
		target.ex_act(EXPLODE_HEAVY)

/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/ex_act(severity, target)
	adjustBruteLoss(-30 * severity)
	visible_message(span_danger("[src] absorbs the explosion!"), span_userdanger("You absorb the explosion!"))

/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/Goto(target, delay, minimum_distance)
	if(enraging)
		return
	return ..()

/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/MoveToTarget(list/possible_targets)
	if(enraging)
		return
	return ..()

/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/Move()
	if(enraging)
		return
	return ..()

/// Shoots out homing missiles that explode into blast projectiles after a couple seconds
/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/proc/homing_missiles(added_delay = 10, shoot_times = 8)
	for(var/i in 1 to shoot_times)
		var/turf/startloc = get_turf(src)
		var/turf/endloc = get_turf(target)
		if(!endloc)
			break
		var/obj/projectile/colossus/homing_missiles/P = new(startloc)
		P.preparePixelProjectile(endloc, startloc)
		P.firer = src
		if(target)
			P.original = target
		P.set_homing_target(target)
		P.fire(rand(0, 360))
		addtimer(CALLBACK(P, /obj/projectile/colossus/homing_missiles/proc/missile_explosion, projectile_speed_multiplier), 20) // make the orbs home in after a second
		SLEEP_CHECK_DEATH(added_delay)
	update_cooldowns(list(COOLDOWN_UPDATE_SET_MELEE = 4 SECONDS, COOLDOWN_UPDATE_SET_RANGED = 6 SECONDS))

/// Called when the missile is exploding, shoots out projectiles
/obj/projectile/colossus/homing_missiles/proc/missile_explosion(projectile_speed_multiplier)
	for(var/i in 0 to 5)
		var/angle = i * 60
		var/turf/startloc = get_turf(src)
		var/turf/endloc = get_turf(original)
		if(!startloc || !endloc)
			break
		var/obj/projectile/colossus/shotgun_blast/P = new(startloc)
		P.speed *= projectile_speed_multiplier
		P.preparePixelProjectile(endloc, startloc, null, angle + rand(-10, 10))
		P.firer = firer
		if(original)
			P.original = original
		P.fire()
	qdel(src)

/// Shoots out bullets with a random spread
/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/proc/machine_gun(shots = 60, spread = 45)
	for(var/i in 1 to shots)
		var/turf/startloc = get_turf(src)
		var/turf/endloc = get_turf(target)
		if(!endloc)
			break
		var/obj/projectile/P = new /obj/projectile/colossus/bullet(startloc)
		P.speed *= projectile_speed_multiplier
		P.preparePixelProjectile(endloc, startloc, null, rand(-spread, spread))
		P.firer = src
		if(target)
			P.original = target
		P.fire()
		SLEEP_CHECK_DEATH(1)
	update_cooldowns(list(COOLDOWN_UPDATE_SET_MELEE = 1.5 SECONDS, COOLDOWN_UPDATE_SET_RANGED = 1.5 SECONDS))

/// bang bang shotgun pattern
/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/proc/bulldog_shotgun(shots = 5, list/patterns = list(list(-40, -20, 0, 20, 40), list(-30, -10, 10, 30)))
	for(var/i in 1 to shots)
		var/list/pattern = patterns[i % length(patterns) + 1] // alternating patterns
		for(var/spread in pattern)
			var/turf/startloc = get_turf(src)
			var/turf/endloc = get_turf(target)
			if(!endloc)
				break
			var/obj/projectile/P = new /obj/projectile/colossus/shotgun_blast(startloc)
			P.speed *= projectile_speed_multiplier
			P.preparePixelProjectile(endloc, startloc, null, spread)
			P.firer = src
			if(target)
				P.original = target
			P.fire()
		SLEEP_CHECK_DEATH(8)
	update_cooldowns(list(COOLDOWN_UPDATE_SET_MELEE = 1.5 SECONDS, COOLDOWN_UPDATE_SET_RANGED = 2 SECONDS))

/// Checks if the funny is ready to be enraged
/mob/living/simple_animal/hostile/megafauna/alraune_megafauna/null_war/proc/check_enraged()
	if(enraged)
		return
	if(health > maxHealth*0.25)
		return
	update_cooldowns(list(COOLDOWN_UPDATE_SET_MELEE = 8 SECONDS, COOLDOWN_UPDATE_SET_RANGED = 8 SECONDS))
	adjustHealth(-maxHealth)
	enraged = TRUE
	enraging = TRUE
	animate(src, pixel_y = pixel_y + 96, time = 100, easing = ELASTIC_EASING)
	spin(100, 10)
	SLEEP_CHECK_DEATH(60)
	playsound(src, 'sound/effects/explosion3.ogg', 100, TRUE)
	icon_state = "null_masked"
	animate(src, pixel_y = pixel_y - 96, time = 8, flags = ANIMATION_END_NOW)
	spin(8, 2)
	for(var/obj/structure/frost_miner_prism/prism_to_set in GLOB.frost_miner_prisms)
		prism_to_set.set_prism_light(LIGHT_COLOR_PURPLE, 5)
	SLEEP_CHECK_DEATH(8)
	for(var/mob/living/L in viewers(src))
		shake_camera(L, 3, 2)
	playsound(src, 'sound/effects/meteorimpact.ogg', 100, TRUE)
	ADD_TRAIT(src, TRAIT_MOVE_FLYING, FROSTMINER_ENRAGE_TRAIT)
	enraging = FALSE
	adjustHealth(-maxHealth)


//the things i do for love
