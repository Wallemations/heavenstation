/obj/item/melee/baseball_bat
	icon = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/baseball.dmi'
	lefthand_file = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/bats_left.dmi'
	righthand_file = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/bats_right.dmi'
	var/belt_sprite = "-basic"

/obj/item/melee/baseball_bat/homerun
	icon_state = "baseball_bat_home"
	inhand_icon_state = "baseball_bat_home"
	light_power = 5
	light_color = "#ff4c4c"
	belt_sprite = "-home"

/obj/item/melee/baseball_bat/ablative
	belt_sprite = "-metal"

// Burn Bat
/obj/item/melee/baseball_bat/burn
	name = "Super Slugger"
	desc = "An eternal napalm flame ensures whatever is thrown at you is seared to a perfect medium-rare."
	icon_state = "baseball_bat_burn"
	inhand_icon_state = "baseball_bat_burn"
	attack_verb_simple = list("beat", "cooked")
	attack_verb_continuous = list("beats", "cooks")
	damtype = BURN
	hitsound = 'sound/weapons/genhit2.ogg'
	belt_sprite = "-burn"

// Barbed Bat
/obj/item/melee/baseball_bat/barbed
	name = "Barbara"
	desc = "A bat wrapped in hooked wires meant to dig into the flesh of the undead, although it works just as well on the living."
	icon_state = "baseball_bat_barbed"
	inhand_icon_state = "baseball_bat_barbed"
	attack_verb_simple = list("beat", "bashed", "tore into")
	attack_verb_continuous = list("beats", "bashes", "tears into")
	wound_bonus = 30
	bare_wound_bonus = 40
	belt_sprite = "-barbed"

//BuzzSaw
/obj/item/melee/baseball_bat/buzz
	name = "Buzzsaw Bat"
	desc = "A circular saw attatched to a baseball bat, perfect for surprise woodwork."
	icon_state = "baseball_bat_buzz"
	inhand_icon_state = "baseball_bat_buzz"
	attack_verb_simple = list("beat", "slashed", "eviscerated")
	attack_verb_continuous = list("beats", "slashes", "eviscerates")
	hitsound = 'sound/weapons/circsawhit.ogg'
	force = 16
	item_flags = SURGICAL_TOOL
	sharpness = SHARP_EDGED
	tool_behaviour = TOOL_SAW
	toolspeed = 1.5
	wound_bonus = 5
	bare_wound_bonus = 10
	belt_sprite = "-buzz"

//Bluespace Bat
/obj/item/melee/baseball_bat/bluespace
	name = "Bluespace Bat"
	desc = "Three bluespace crystals duct-taped to a baseball bat. Someone should be fired for this."
	icon_state = "baseball_bat_bluespace"
	inhand_icon_state = "baseball_bat_blue"
	attack_verb_simple = list("beat", "bashed")
	attack_verb_continuous = list("beats", "bashes")
	belt_sprite = "-bluespace"

/obj/item/melee/baseball_bat/bluespace/attack(mob/living/carbon/M, mob/living/carbon/user)//handles making things teleport when hit
	..()
	if(HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		user.visible_message("<span class='danger'>[user] accidentally hits [user.p_them()]self with [src]!</span>", \
							"<span class='userdanger'>You accidentally hit yourself with [src]!</span>")
		if(do_teleport(user, get_turf(user), 50, channel = TELEPORT_CHANNEL_BLUESPACE))//honk honk
			SEND_SIGNAL(user, COMSIG_LIVING_MINOR_SHOCK)
		else
			SEND_SIGNAL(user, COMSIG_LIVING_MINOR_SHOCK)
		return
	else
		if(!istype(M) && M.anchored)
			return .
		else
			SEND_SIGNAL(M, COMSIG_LIVING_MINOR_SHOCK)
			do_teleport(M, get_turf(M), 15, channel = TELEPORT_CHANNEL_BLUESPACE)

//Knife Bat
/obj/item/melee/baseball_bat/knife
	name = "Knife Bat"
	desc = "Useful in case your ingredients are ever hurled at you at incredibly high speeds."
	icon_state = "baseball_bat_knife"
	inhand_icon_state = "baseball_bat_knife"
	attack_verb_simple = list("beat", "bashed", "slashed", "sliced")
	attack_verb_continuous = list("beats", "bashes", "slashes", "slices")
	hitsound = 'sound/weapons/bladeslice.ogg'
	wound_bonus = -5
	bare_wound_bonus = 10
	sharpness = SHARP_POINTY
	tool_behaviour = TOOL_KNIFE
	toolspeed = 2
	force = 11
	throwforce = 14
	belt_sprite = "-knife"

/obj/item/melee/baseball_bat/knife/Initialize()
	. = ..()
	AddElement(/datum/element/eyestab)
	AddComponent(/datum/component/butchering, 80 - force, 100, force - 10)

//Magical Girl Bat
/obj/item/melee/baseball_bat/magic
	name = "Enchanted Bat"
	desc = "Knock a witches' head right off! Soul gem sold separately."
	icon_state = "baseball_bat_magic"
	inhand_icon_state = "baseball_bat_magic"
	attack_verb_simple = list("beat", "bashed", "smacked")
	attack_verb_continuous = list("beats", "bashes", "smacks")
	belt_sprite = "-magic"

/obj/item/melee/baseball_bat/magic/attack(mob/living/target, mob/living/user)
	. = ..()
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(!target.anchored)
		var/whack_speed = (prob(90) ? 3 : 6)
		target.throw_at(throw_target, rand(25, 50), whack_speed, user)

//Affront to God
/obj/item/melee/baseball_bat/kitty
	name = "Hello Kitty Bat"
	desc = "'Now I am become Death, the destroyer of worlds.' -J. Robert Oppenheimer"
	icon_state = "baseball_bat_kitty"
	inhand_icon_state = "baseball_bat_kitty"
	attack_verb_simple = list("beat")
	attack_verb_continuous = list("beats")
	force = 10
	wound_bonus = -10
	bare_wound_bonus = 0
	throwforce = 12
	belt_sprite = "-kitty"
	var/effect = 1
	var/stun_sound = 'sound/weapons/egloves.ogg'
	var/confusion_amt = 0
	var/stamina_loss_amt = 0
	var/apply_stun_delay = 0 SECONDS
	var/stun_time = 0 SECONDS

/obj/item/melee/baseball_bat/kitty/pickup()
	.=..()
	START_PROCESSING(SSfastprocess, src)

/obj/item/melee/baseball_bat/kitty/dropped()
	.=..()
	STOP_PROCESSING(SSfastprocess, src)

/obj/item/melee/baseball_bat/kitty/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	set_light(0, 0)
	. = ..()

/obj/item/melee/baseball_bat/kitty/process(delta_time)
	var/last_effect = effect
	set_light(rand(2, 3), 15)
	effect = rand(1, 9)
	if(effect == last_effect)
		return
	switch(effect)
		if(1) //High-Wound
			light_color = LIGHT_COLOR_PURPLE
			force = 10
			confusion_amt = 0
			stamina_loss_amt = 0
			apply_stun_delay = 0 SECONDS
			stun_time = 0 SECONDS
			wound_bonus = 100
			bare_wound_bonus = 200
			attack_verb_simple = list("crushed")
			attack_verb_continuous = list("crushes")
		if(2) //Dismember
			light_color = LIGHT_COLOR_BLOOD_MAGIC
			force = 10
			wound_bonus = -10
			bare_wound_bonus = 0
			confusion_amt = 0
			stamina_loss_amt = 0
			apply_stun_delay = 0 SECONDS
			stun_time = 0 SECONDS
			attack_verb_simple = list("slashed")
			attack_verb_continuous = list("slashes")
		if(3) //Disarm
			light_color = LIGHT_COLOR_DARK_BLUE
			force = 10
			wound_bonus = -10
			bare_wound_bonus = 0
			confusion_amt = 0
			stamina_loss_amt = 0
			apply_stun_delay = 0 SECONDS
			stun_time = 0 SECONDS
			attack_verb_simple = list("pummeled")
			attack_verb_continuous = list("pummels")
		if(4) //Stun Baton
			force = 10
			light_color = LIGHT_COLOR_ELECTRIC_GREEN
			wound_bonus = -10
			bare_wound_bonus = 0
			confusion_amt = 10
			stamina_loss_amt = 60
			apply_stun_delay = 2 SECONDS
			stun_time = 5 SECONDS
			attack_verb_simple = list("battered")
			attack_verb_continuous = list("batters")
		if(5) //Double Damage
			force = 20
			light_color = LIGHT_COLOR_PINK
			wound_bonus = -10
			bare_wound_bonus = 0
			confusion_amt = 0
			stamina_loss_amt = 0
			apply_stun_delay = 0 SECONDS
			stun_time = 0 SECONDS
			attack_verb_simple = list("trashed")
			attack_verb_continuous = list("thrashes")
		if(6) //Half Damage
			force = 5
			light_color = LIGHT_COLOR_ORANGE
			wound_bonus = -10
			bare_wound_bonus = 0
			confusion_amt = 0
			stamina_loss_amt = 0
			apply_stun_delay = 0 SECONDS
			stun_time = 0 SECONDS
			attack_verb_simple = list("poked")
			attack_verb_continuous = list("pokes")
		if(7) //ARE THESE FUCKING ANTS?!
			force = 10
			light_color = LIGHT_COLOR_YELLOW
			wound_bonus = -10
			bare_wound_bonus = 0
			confusion_amt = 0
			stamina_loss_amt = 0
			apply_stun_delay = 0 SECONDS
			stun_time = 0 SECONDS
			attack_verb_simple = list("hammered")
			attack_verb_continuous = list("hammers")
		if(8) //HOMERUN!!
			force = 2
			light_color = LIGHT_COLOR_CYAN
			wound_bonus = -30
			bare_wound_bonus = 0
			confusion_amt = 0
			stamina_loss_amt = 0
			apply_stun_delay = 0 SECONDS
			stun_time = 0 SECONDS
			attack_verb_simple = list("striked")
			attack_verb_continuous = list("strikes")
		if(9) //Standard
			force = 10
			light_color = LIGHT_COLOR_HALOGEN
			wound_bonus = -10
			bare_wound_bonus = 0
			confusion_amt = 0
			stamina_loss_amt = 0
			apply_stun_delay = 0 SECONDS
			stun_time = 0 SECONDS
			attack_verb_simple = list("beat")
			attack_verb_continuous = list("beats")

/obj/item/melee/baseball_bat/kitty/attack(mob/living/target, mob/living/user)
	. = ..()
	set_light(rand(2, 3))
	light_power = 10
	switch(effect)
		if(2)
			if(iscarbon(target))
				var/mob/living/carbon/C = target
				if(HAS_TRAIT(C, TRAIT_NODISMEMBER))
					return
				var/list/parts = list()
				for(var/X in C.bodyparts)
					var/obj/item/bodypart/bodypart = X
					if(bodypart.body_part != HEAD && bodypart.body_part != CHEST && bodypart.body_part != LEG_LEFT && bodypart.body_part != LEG_RIGHT)
						if(bodypart.dismemberable)
							parts += bodypart
				if(length(parts))
					var/obj/item/bodypart/bodypart = pick(parts)
					bodypart.dismember()
		if(3)
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				H.drop_all_held_items()
				H.visible_message("<span class='danger'>[user] disarms [H]!</span>", "<span class='userdanger'>[user] disarmed you!</span>")
		if(4)
			var/mob/living/carbon/human/L = target
			L.apply_damage(stamina_loss_amt, STAMINA, BODY_ZONE_CHEST)
			SEND_SIGNAL(L, COMSIG_LIVING_MINOR_SHOCK)
			addtimer(CALLBACK(src, .proc/apply_stun_effect_end, L), apply_stun_delay)
			L.visible_message("<span class='danger'>[user] stuns [L]!</span>", "<span class='userdanger'>[user] stunned you!</span>")
		/*if(7)
			var/mob/living/carbon/human/L = target
			var/amount_left = 5
			L.apply_status_effect(STATUS_EFFECT_ANTS, amount_left)
			L.visible_message("<span class='danger'>[L] is covered in ants!</span>", "<span class='userdanger'>JESUS CHRIST YOU'RE COVERED IN ANTS!!!</span>")*/ //Ant module not done
		if(8)
			var/atom/throw_target = get_edge_target_turf(target, user.dir)
			if(!target.anchored)
				var/whack_speed = (prob(90) ? 3 : 6)
				target.throw_at(throw_target, rand(3, 6), whack_speed, user)

	return ..()

/obj/item/melee/baseball_bat/kitty/proc/apply_stun_effect_end(mob/living/target)
	var/trait_check = HAS_TRAIT(target, TRAIT_STUNRESISTANCE) //var since we check it in out to_chat as well as determine stun duration
	if(!target.IsKnockdown())
		to_chat(target, "<span class='warning'>Your muscles seize, making you collapse[trait_check ? ", but your body quickly recovers..." : "!"]</span>")

	if(trait_check)
		target.Knockdown(stun_time * 0.1)
	else
		target.Knockdown(stun_time)

/obj/item/melee/baseball_bat/kitty/cursed
	desc = "Just looking at it makes you want to hurl."
	var/handled = FALSE

/obj/item/melee/baseball_bat/kitty/cursed/pickup(mob/living/carbon/user)
	.=..()
	if(!handled)
		user.gain_trauma(/datum/brain_trauma/magic/stalker)//I told you about the shrines bro!!!!!!!!!
		handled = TRUE //Thinking about it, I'd prefer if people weren't ALL assaulted for picking it up. A death in exchange for this item is enough.

//Baton Bat
/obj/item/melee/baton/baseball
	name = "Stun Bat"
	desc = "A stun baton taped to a baseball bat, just in case you wanted a ball that didn't move."
	icon_state = "baseball_bat_stun"
	inhand_icon_state = "baseball_bat_baton"
	icon = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/baseball.dmi'
	lefthand_file = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/bats_left.dmi'
	righthand_file = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/bats_right.dmi'
	w_class = WEIGHT_CLASS_HUGE
	throwforce = 5
	stun_time = 5 SECONDS
	cell_hit_cost = 1000
	throw_stun_chance = 10
	slot_flags = ITEM_SLOT_BACK
	convertible = FALSE
	var/obj/item/assembly/igniter/sparkler = 0
	force = 10
	attack_verb_simple = list("beat", "smacked")
	attack_verb_continuous = list("beats", "smacks")
	hitsound = 'sound/weapons/genhit2.ogg'

/obj/item/melee/baton/baseball/Initialize()
	. = ..()
	sparkler = new (src)

/obj/item/melee/baton/baseball/baton_effect()
	if(sparkler.activate())
		..()

/obj/item/melee/baton/baseball/Destroy()
	if(sparkler)
		QDEL_NULL(sparkler)
	return ..()

/obj/item/melee/baton/baseball/attack(mob/living/target, mob/living/user)
	. = ..()
	hitsound = 'sound/weapons/genhit2.ogg'
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(!target.anchored)
		var/whack_speed = (prob(60) ? 1 : 4)
		target.throw_at(throw_target, rand(1, 2), whack_speed, user)

// Baseball Axe

/obj/item/fireaxe/baseball
	name = "Executioner's Bat"
	desc = "Die the Death."
	icon_state = "baseball_bat_exec0"
	icon = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/baseball.dmi'
	lefthand_file = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/bats_left.dmi'
	righthand_file = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/bats_right.dmi'
	throwforce = 8
	w_class = WEIGHT_CLASS_HUGE

/obj/item/fireaxe/baseball/ComponentInitialize()
	AddComponent(/datum/component/two_handed, force_unwielded=2, force_wielded=13, icon_wielded="baseball_bat_exec1", dismemberment_unwielded = 0, dismemberment_wielded = 100)


/obj/item/fireaxe/baseball/update_icon_state()
	icon_state = "baseball_bat_exec0"
	if(wielded)
		icon_state = "baseball_bat_exec1"
	else
		icon_state = "baseball_bat_exec0"

/obj/item/fireaxe/baseball/attack(mob/living/target, mob/living/user)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		if(HAS_TRAIT(C, TRAIT_NODISMEMBER))
			return
		var/list/parts = list()
		for(var/X in C.bodyparts)
			var/obj/item/bodypart/bodypart = X
			if(bodypart.body_part != HEAD && bodypart.body_part != CHEST && bodypart.body_part != LEG_LEFT && bodypart.body_part != LEG_RIGHT)
				if(bodypart.dismemberable)
					parts += bodypart
		if(length(parts) && prob(30))
			var/obj/item/bodypart/bodypart = pick(parts)
			bodypart.dismember()
	if(wielded)
		force = 13
	else
		force = 2
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(!target.anchored && wielded)
		var/whack_speed = (prob(60) ? 1 : 4)
		target.throw_at(throw_target, rand(1, 2), whack_speed, user)

/obj/item/fireaxe/baseball/afterattack(atom/A, mob/user, proximity)
	return //Overrides the window destruction

//////////////////// BATS ///////////////////////
/////////////////////////////////////////////////
//////////////////// BELT ///////////////////////

/obj/item/storage/belt/baseball
	icon = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/beltobject.dmi'
	lefthand_file = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/beltleft.dmi'
	righthand_file = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/beltright.dmi'
	worn_icon = 'modular_heaven/modules/heaven_weaponry/baseball_bats/icons/belt.dmi'
	name = "Bat Sheath"
	desc = "A modified archery quiver meant to make offhand carrying of bats quick and easy."
	icon_state = "baseball_pack"
	inhand_icon_state = "baseball_pack"
	worn_icon_state = "baseball_pack"
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE

/obj/item/storage/belt/baseball/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.rustle_sound = FALSE
	STR.max_w_class = WEIGHT_CLASS_HUGE
	STR.set_holdable(list(
		/obj/item/melee/baseball_bat,
		/obj/item/melee/baseball_bat/homerun,
		/obj/item/melee/baseball_bat/burn,
		/obj/item/melee/baseball_bat/barbed,
		/obj/item/melee/baseball_bat/buzz,
		/obj/item/melee/baseball_bat/bluespace,
		/obj/item/melee/baseball_bat/knife,
		/obj/item/melee/baseball_bat/magic,
		/obj/item/melee/baseball_bat/kitty,
		/obj/item/melee/baton/baseball,
		/obj/item/melee/baseball_bat/ablative,
		/obj/item/fireaxe/baseball
		))

/obj/item/storage/belt/baseball/examine(mob/user)
	. = ..()
	if(length(contents))
		. += "<span class='notice'>Alt-click it to quickly draw the bat.</span>"

/obj/item/storage/belt/baseball/update_icon_state()
	worn_icon_state = initial(worn_icon_state)
	for(var/obj/item/melee/baseball_bat/B in contents)
		worn_icon_state += "[B.belt_sprite]"
	for(var/obj/item/melee/baton/baseball/STUN in contents)
		worn_icon_state += "-baton"
	for(var/obj/item/fireaxe/baseball/EXEC in contents)
		worn_icon_state += "-exec"


/obj/item/storage/belt/baseball/AltClick(mob/user)
	if(!iscarbon(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(length(contents))
		var/obj/item/I = contents[1]
		user.visible_message("<span class='notice'>[user] takes [I] out of [src].</span>", "<span class='notice'>You take [I] out of [src].</span>")
		user.put_in_hands(I)
		update_icon()
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

//////////////////// BELT ///////////////////////
/////////////////////////////////////////////////
