//Fluff structures serve no purpose and exist only for enriching the environment. They can be destroyed with a wrench.

/obj/structure/fluff
	name = "fluff structure"
	desc = "Fluffier than a sheep. This shouldn't exist."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "minibar"
	anchored = TRUE
	density = FALSE
	opacity = FALSE
	var/deconstructible = TRUE

/obj/structure/fluff/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_WRENCH && deconstructible)
		user.visible_message("<span class='notice'>[user] starts disassembling [src]...</span>", "<span class='notice'>You start disassembling [src]...</span>")
		I.play_tool_sound(src)
		if(I.use_tool(src, user, 50))
			user.visible_message("<span class='notice'>[user] disassembles [src]!</span>", "<span class='notice'>You break down [src] into scrap metal.</span>")
			playsound(user, 'sound/items/deconstruct.ogg', 50, TRUE)
			new/obj/item/stack/sheet/metal(drop_location())
			qdel(src)
		return
	..()

/obj/structure/fluff/empty_terrarium //Empty terrariums are created when a preserved terrarium in a lavaland seed vault is activated.
	name = "empty terrarium"
	desc = "An ancient machine that seems to be used for storing plant matter. Its hatch is ajar."
	icon = 'icons/obj/lavaland/spawners.dmi'
	icon_state = "terrarium_open"
	density = TRUE

/obj/structure/fluff/empty_sleeper //Empty sleepers are created by a good few ghost roles in lavaland.
	name = "empty sleeper"
	desc = "An open sleeper. It looks as though it would be awaiting another patient, were it not broken."
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper-open"

/obj/structure/fluff/empty_sleeper/nanotrasen
	name = "broken hypersleep chamber"
	desc = "A Nanotrasen hypersleep chamber - this one appears broken. \
		There are exposed bolts for easy disassembly using a wrench."
	icon_state = "sleeper-o"

/obj/structure/fluff/empty_sleeper/syndicate
	icon_state = "sleeper_s-open"

/obj/structure/fluff/empty_cryostasis_sleeper //Empty cryostasis sleepers are created when a malfunctioning cryostasis sleeper in a lavaland shelter is activated
	name = "empty cryostasis sleeper"
	desc = "Although comfortable, this sleeper won't function as anything but a bed ever again."
	icon = 'icons/obj/lavaland/spawners.dmi'
	icon_state = "cryostasis_sleeper_open"

/obj/structure/fluff/broken_flooring
	name = "broken tiling"
	desc = "A segment of broken flooring."
	icon = 'icons/obj/brokentiling.dmi'
	icon_state = "corner"

/obj/structure/fluff/drake_statue //Ash drake status spawn on either side of the necropolis gate in lavaland.
	name = "drake statue"
	desc = "A towering basalt sculpture of a proud and regal drake. Its eyes are six glowing gemstones."
	icon = 'icons/effects/64x64.dmi'
	icon_state = "drake_statue"
	pixel_x = -16
	density = TRUE
	deconstructible = FALSE
	layer = EDGED_TURF_LAYER

/obj/structure/fluff/drake_statue/falling //A variety of statue in disrepair; parts are broken off and a gemstone is missing
	desc = "A towering basalt sculpture of a drake. Cracks run down its surface and parts of it have fallen off."
	icon_state = "drake_statue_falling"


/obj/structure/fluff/bus
	name = "bus"
	desc = "GO TO SCHOOL. READ A BOOK."
	icon = 'icons/obj/bus.dmi'
	density = TRUE
	anchored = TRUE
	deconstructible = FALSE

/obj/structure/fluff/bus/dense
	name = "bus"
	icon_state = "backwall"

/obj/structure/fluff/bus/passable
	name = "bus"
	icon_state = "frontwalltop"
	density = FALSE
	layer = ABOVE_ALL_MOB_LAYER //except for the stairs tile, which should be set to OBJ_LAYER aka 3.


/obj/structure/fluff/bus/passable/seat
	name = "seat"
	desc = "Buckle up! ...What do you mean, there's no seatbelts?!"
	icon_state = "backseat"
	pixel_y = 17
	layer = OBJ_LAYER


/obj/structure/fluff/bus/passable/seat/driver
	name = "driver's seat"
	desc = "Space Jesus is my copilot."
	icon_state = "driverseat"

/obj/structure/fluff/bus/passable/seat/driver/attack_hand(mob/user)
	playsound(src, 'sound/items/carhorn.ogg', 50, TRUE)
	. = ..()

/obj/structure/fluff/paper
	name = "dense lining of papers"
	desc = "A lining of paper scattered across the bottom of a wall."
	icon = 'icons/obj/fluff.dmi'
	icon_state = "paper"
	deconstructible = FALSE

/obj/structure/fluff/paper/corner
	icon_state = "papercorner"

/obj/structure/fluff/paper/stack
	name = "dense stack of papers"
	desc = "A stack of various papers, childish scribbles scattered across each page."
	icon_state = "paperstack"


/obj/structure/fluff/divine
	name = "Miracle"
	icon = 'icons/obj/hand_of_god_structures.dmi'
	anchored = TRUE
	density = TRUE

/obj/structure/fluff/divine/nexus
	name = "nexus"
	desc = "It anchors a deity to this world. It radiates an unusual aura. It looks well protected from explosive shock."
	icon_state = "nexus"

/obj/structure/fluff/divine/conduit
	name = "conduit"
	desc = "It allows a deity to extend their reach.  Their powers are just as potent near a conduit as a nexus."
	icon_state = "conduit"

/obj/structure/fluff/divine/convertaltar
	name = "conversion altar"
	desc = "An altar dedicated to a deity."
	icon_state = "convertaltar"
	density = FALSE
	can_buckle = 1

/obj/structure/fluff/divine/powerpylon
	name = "power pylon"
	desc = "A pylon which increases the deity's rate it can influence the world."
	icon_state = "powerpylon"
	can_buckle = 1

/obj/structure/fluff/divine/defensepylon
	name = "defense pylon"
	desc = "A pylon which is blessed to withstand many blows, and fire strong bolts at nonbelievers. A god can toggle it."
	icon_state = "defensepylon"

/obj/structure/fluff/divine/shrine
	name = "shrine"
	desc = "A shrine dedicated to a deity."
	icon_state = "shrine"

/obj/structure/fluff/fokoff_sign
	name = "crude sign"
	desc = "A crudely-made sign with the words 'fok of' written in some sort of red paint."
	icon = 'icons/obj/fluff.dmi'
	icon_state = "fokof"

/obj/structure/fluff/big_chain
	name = "giant chain"
	desc = "A towering link of chains leading up to the ceiling."
	icon = 'icons/effects/32x96.dmi'
	icon_state = "chain"
	layer = ABOVE_OBJ_LAYER
	anchored = TRUE
	density = TRUE
	deconstructible = FALSE

/obj/structure/fluff/lightbulb
	name = "red lightbulb"
	desc = "Its warm light and soft buzzing calms your nerves."
	icon = 'icons/effects/bulb.dmi'
	icon_state = "bulb"
	layer = MOB_LAYER
	anchored = TRUE
	density = FALSE
	deconstructible = FALSE
	var/replaced_light = FALSE

/obj/structure/fluff/lightbulb/attack_hand(mob/living/carbon/human/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(istype(H))
		var/obj/item/bodypart/affecting = H.get_bodypart("[(user.active_hand_index % 2 == 0) ? "r" : "l" ]_arm")
		if(affecting?.receive_damage( 0, 5 ))			// 5 burn damage
			H.update_damage_overlays()
		else
			to_chat(user, "<span class='warning'>You try to remove the light, but your hand passes through it, burning it in the process! You swear you feel something inside the bulb.</span>")
			return

/obj/structure/fluff/lightbulb/attackby(obj/item/O, mob/user)
	var/turf/T = get_turf(src)
	if(istype(O, /obj/item/light/bulb) && !replaced_light)
		to_chat(user, "<span class='notice'>You start trying to push the new bulb into the old one.</span>")
		if(!do_after(user, 2.5 SECONDS, TRUE))
			to_chat(user, "<span class='notice'>The new bulb passes through the old one. You'll probably need to focus to line them up.</span>")
			return
		else
			to_chat(user, "<span class='warning'>The red bulb shatters as you place the new bulb into the space it occupied. A key falls among the shards.</span>")
			qdel(O)
			playsound(loc, 'sound/effects/glassbr1.ogg', 50, TRUE)
			desc = "Its harsh light and hard buzzing makes you anxious."
			name = "lightbulb"
			icon_state = "bulb_y"
			var/obj/structure/fluff/lightbulb_light/floorlight = locate(/obj/structure/fluff/lightbulb_light, T)
			floorlight.burnt = TRUE
			floorlight.name = "glow"
			floorlight.desc = "The room's walls are bleached by the light."
			floorlight.light_power = 10
			floorlight.light_range = 5
			floorlight.light_color = "#d6d188"
			floorlight.update_light()
			floorlight.icon_state = "yellow_bulb_light"
			new /obj/effect/decal/cleanable/glass(loc)
			new /obj/item/britevidence/blue_key(loc)
			replaced_light = TRUE
			return 1

	else
		return ..()

/obj/structure/fluff/lightbulb_light
	name = "red glow"
	desc = "The room's walls flicker with shadows from the light."
	light_power = 5
	light_range = 2
	light_color = "#bd3827"
	icon = 'icons/obj/fluff.dmi'
	icon_state = "red_bulb_light"
	layer = TURF_LAYER
	anchored = TRUE
	density = FALSE
	deconstructible = FALSE
	var/antispam = FALSE
	var/burnt = FALSE
	var/sizzle = null

/obj/structure/fluff/lightbulb_light/Initialize()
	. = ..()
	START_PROCESSING(SSfastprocess, src)

/obj/structure/fluff/lightbulb_light/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	. = ..()

/obj/structure/fluff/lightbulb_light/process(delta_time)
	for(var/mob/living/L in range(2, src))
		if(!burnt)
			if(DT_PROB(15, delta_time) && (L.health != L.maxHealth))
				L.adjustBruteLoss(-3, 0, forced = TRUE)
				L.adjustFireLoss(-3, 0, forced = TRUE)
				L.adjustToxLoss(-3, 0, forced = TRUE)
				L.adjustOxyLoss(-3, 0, forced = TRUE)
				L.updatehealth()
				new /obj/effect/temp_visual/heal(get_turf(L), "#bd3827")
				if(!antispam)
					to_chat(L, "<span class='notice'>You feel safe under the light.</span>")
					antispam = TRUE
					addtimer(CALLBACK(src, /obj/structure/fluff/lightbulb_light/proc/spam_check), 10 SECONDS)
		if(burnt)
			if(DT_PROB(30, delta_time))
				L.adjustBruteLoss(3, 0)
				L.adjustFireLoss(3, 0)
				L.updatehealth()
				sizzle = pick(1,2)
				switch(sizzle)
					if(1)
						playsound(loc, 'sound/effects/wounds/sizzle1.ogg', 40, TRUE)
					if(2)
						playsound(loc, 'sound/effects/wounds/sizzle2.ogg', 40, TRUE)
				if(!antispam)
					to_chat(L, "<span class='notice'>You can't stand being in this light!</span>")
					antispam = TRUE
					addtimer(CALLBACK(src, /obj/structure/fluff/lightbulb_light/proc/spam_check), 10 SECONDS)

//Would be annoying if the game kept telling you it on repeat
/obj/structure/fluff/lightbulb_light/proc/spam_check()
	antispam = FALSE

/obj/structure/fluff/mannequin
	name = "mannequin"
	desc = "It's staring directly at you."
	icon = 'icons/obj/fluff.dmi'
	icon_state = "mannequin"
	layer = MOB_LAYER
	anchored = FALSE
	density = TRUE
	deconstructible = FALSE

/obj/structure/fluff/palacechest
	name = "scratched chest"
	desc = "A heavy steel chest, covered in deep scratches. You see something moving inside of it through the keyhole."
	icon = 'icons/obj/fluff.dmi'
	icon_state = "palacechest"
	layer = TURF_LAYER
	anchored = TRUE
	density = TRUE
	deconstructible = FALSE
	var/opened = FALSE

/obj/structure/fluff/palacechest/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/britevidence/blue_key) && !opened)
		if(do_after(user, 2.5 SECONDS, TRUE))
			to_chat(user, "<span class='notice'>The key falls apart in the slot as you lift the lid off the chest. There's a single ribbon inside.</span>")
			qdel(O)
			playsound(loc, 'sound/machines/wooden_closet_open.ogg', 50, TRUE)
			opened = TRUE
			icon_state = "palacechest_open"
			desc = "An empty chest, smelling vaguely of rotting meat. There are small patches of white fur scattered through it."
			new /obj/item/britevidence/ribbon(loc)
			for(var/obj/structure/fluff/mannequin/hallucinations in range(7, src))
				hallucinations.say("We're sorry you're leaving so soon...")
			return 1
		else
			to_chat(user, "<span class='notice'>You struggle to get the key in the hole. Maybe focusing a little more...?</span>")
	else
		return ..()

/obj/structure/fluff/vent
	name = "wall vent"
	desc = "An old wall vent from the station's previous atmospherics system. The space behind it has been filled in."
	icon = 'icons/obj/fluff.dmi'
	icon_state = "vent"
	anchored = TRUE
	density = FALSE
	deconstructible = TRUE

/obj/structure/fluff/vent/north //Pixel offsets get overwritten on New()
	dir = NORTH
	pixel_y = 25

/obj/structure/fluff/vent/north/palace
	desc = "An old wall vent. You see something behind it, but it's too far for you to grab with your bare hands. Maybe something longer...?"
	var/soap_present = TRUE

/obj/structure/fluff/vent/north/palace/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/crowbar) && soap_present)
		if(do_after(user, 3.5 SECONDS, TRUE))
			to_chat(user, "<span class='notice'>You carefully use the crowbar to drag the object close enough to grab.</span>")
			desc = "An old wall vent."
			new /obj/item/soap/homemade/palace(loc)
			soap_present = FALSE
			return 1
		else
			to_chat(user, "<span class='notice'>You fumble with the crowbar, failing to retrieve the object.</span>")
	else
		return ..()

/obj/structure/fluff/vent/south
	dir = SOUTH
	pixel_y = -25

/obj/structure/fluff/vent/east
	dir = EAST
	pixel_x = 25

/obj/structure/fluff/vent/west
	dir = WEST
	pixel_x = -25


/obj/structure/fluff/beach_towel
	name = "beach towel"
	desc = "A towel decorated in various beach-themed designs."
	icon = 'icons/obj/fluff.dmi'
	icon_state = "railing"
	density = FALSE
	anchored = TRUE
	deconstructible = FALSE

/obj/structure/fluff/beach_umbrella
	name = "beach umbrella"
	desc = "A fancy umbrella designed to keep the sun off beach-goers."
	icon = 'icons/obj/fluff.dmi'
	icon_state = "brella"
	density = FALSE
	anchored = TRUE
	deconstructible = FALSE

/obj/structure/fluff/beach_umbrella/security
	icon_state = "hos_brella"

/obj/structure/fluff/beach_umbrella/science
	icon_state = "rd_brella"

/obj/structure/fluff/beach_umbrella/engine
	icon_state = "ce_brella"

/obj/structure/fluff/beach_umbrella/cap
	icon_state = "cap_brella"

/obj/structure/fluff/beach_umbrella/syndi
	icon_state = "syndi_brella"

/obj/structure/fluff/clockwork
	name = "Clockwork Fluff"
	icon = 'icons/obj/clockwork_objects.dmi'
	deconstructible = FALSE

/obj/structure/fluff/clockwork/alloy_shards
	name = "replicant alloy shards"
	desc = "Broken shards of some oddly malleable metal. They occasionally move and seem to glow."
	icon_state = "alloy_shards"

/obj/structure/fluff/clockwork/alloy_shards/small
	icon_state = "shard_small1"

/obj/structure/fluff/clockwork/alloy_shards/medium
	icon_state = "shard_medium1"

/obj/structure/fluff/clockwork/alloy_shards/medium_gearbit
	icon_state = "gear_bit1"

/obj/structure/fluff/clockwork/alloy_shards/large
	icon_state = "shard_large1"

/obj/structure/fluff/clockwork/blind_eye
	name = "blind eye"
	desc = "A heavy brass eye, its red iris fallen dark."
	icon_state = "blind_eye"

/obj/structure/fluff/clockwork/fallen_armor
	name = "fallen armor"
	desc = "Lifeless chunks of armor. They're designed in a strange way and won't fit on you."
	icon_state = "fallen_armor"

/obj/structure/fluff/clockwork/clockgolem_remains
	name = "clockwork golem scrap"
	desc = "A pile of scrap metal. It seems damaged beyond repair."
	icon_state = "clockgolem_dead"

/obj/structure/fluff/hedge
	name = "hedge"
	desc = "A large bushy hedge."
	icon = 'icons/obj/smooth_structures/hedge.dmi'
	icon_state = "hedge"
	smoothing_flags = SMOOTH_CORNERS
	smoothing_groups = list(SMOOTH_GROUP_HEDGE_FLUFF)
	canSmoothWith = list(SMOOTH_GROUP_HEDGE_FLUFF)
	density = TRUE
	anchored = TRUE
	deconstructible = FALSE

/obj/structure/fluff/hedge/opaque //useful for mazes and such
	opacity = TRUE

/obj/structure/fluff/people_pad
	name = "Nanotrasen Official People-Pad"
	desc = "A cheaper variant of existing quantum technology which is incapable of being modified by anyone but the manufacturer."
	icon = 'icons/obj/objects.dmi'
	icon_state = "bounty_trap_on" // Temporary icon
	layer = HIGH_SIGIL_LAYER
	anchored = TRUE
	density = FALSE
	deconstructible = TRUE

	var/teleport_cooldown = 15 SECONDS
	var/teleport_speed = 1 SECONDS
	var/last_teleport
	var/id = null //what's my name
	var/obj/structure/fluff/people_pad/my_friend //my friend
	var/paused = FALSE
	var/teleporting = FALSE
	var/area/area
	var/scan_attempts = 0
	var/max_attempts = 5

/obj/structure/fluff/people_pad/Initialize()
	. = ..()
	area = get_area(src)
	name = "\improper [get_area_name(area, TRUE)] People-Pad"
	GLOB.people_pads += src
	addtimer(CALLBACK(src, /obj/structure/fluff/people_pad/proc/friend_check), 3 SECONDS)

/obj/structure/fluff/people_pad/examine(mob/user)
	. = ..()
	. += "Some small text on the side reads \"We garuntee that this transporter is probably safe, as long as you click to teleport!\""
	if(!my_friend)
		. += "<span class='warning'>It is not linked to a pad. Click to have it search for linked pads!</span>"
	else
		. += "<span class='notice'>It is currently linked to [my_friend.name].</span>"

/obj/structure/fluff/people_pad/proc/friend_check()
	for(var/obj/structure/fluff/people_pad/pad in GLOB.people_pads)
		if(is_eligible(pad) && (pad.id == id) && !(pad == src))
			my_friend = pad
	if(!my_friend)
		if(scan_attempts <= max_attempts)
			visible_message("<span class='notice'>[src] failed to find a linked pad after [max_attempts] scans.</span>")
			scan_attempts = 0
			return
		scan_attempts++
		friend_check()


/obj/structure/fluff/people_pad/interact(mob/user, obj/structure/fluff/people_pad/target_pad = my_friend)
	. = ..()
	if(!target_pad || QDELETED(target_pad))
		to_chat(user, "<span class='notice'>You force [src] to search for linked pads.</span>")
		friend_check()
		return

	if(paused)
		return

	if(world.time < last_teleport + teleport_cooldown)
		to_chat(user, "<span class='warning'>[src] is recharging power. Please wait [DisplayTimeText(last_teleport + teleport_cooldown - world.time)].</span>")
		return

	if(teleporting)
		to_chat(user, "<span class='warning'>[src] is charging up. Please wait.</span>")
		return

	if(target_pad.teleporting)
		to_chat(user, "<span class='warning'>Target pad is busy. Please wait.</span>")
		return
	doteleport(user, target_pad)

/obj/structure/fluff/people_pad/proc/is_eligible(atom/movable/AM)
	var/turf/T = get_turf(AM)
	if(!T)
		return FALSE
	if(is_centcom_level(T.z) || is_away_level(T.z))
		return FALSE
	var/area/A = get_area(T)
	if(!A ||(A.area_flags & NOTELEPORT))
		return FALSE
	return TRUE

/obj/structure/fluff/people_pad/proc/pause() // To make sure you don't teleport as soon as you appear in a pad
	paused = TRUE
	addtimer(CALLBACK(src, /obj/structure/fluff/people_pad/proc/unpause), 1 SECONDS)

/obj/structure/fluff/people_pad/proc/unpause()
	paused = FALSE

/obj/structure/fluff/people_pad/proc/doteleport(mob/user, obj/structure/fluff/people_pad/target_pad = my_friend)
	if(target_pad)
		playsound(get_turf(src), 'sound/weapons/flash.ogg', 25, TRUE)
		teleporting = TRUE

		spawn(teleport_speed)
			if(!src || QDELETED(src))
				teleporting = FALSE
				return
			if(!target_pad || QDELETED(target_pad))
				to_chat(user, "<span class='warning'>Linked pad is not responding to ping. Teleport aborted.</span>")
				teleporting = FALSE
				return

			target_pad.pause()
			teleporting = FALSE
			last_teleport = world.time

			sparks()
			target_pad.sparks()

			flick("qpad-beam", src)
			playsound(get_turf(src), 'sound/weapons/emitter2.ogg', 25, TRUE)
			flick("qpad-beam", target_pad)
			playsound(get_turf(target_pad), 'sound/weapons/emitter2.ogg', 25, TRUE)
			for(var/atom/movable/ROI in get_turf(src))
				if(QDELETED(ROI))
					continue //sleeps in CHECK_TICK

				// if is anchored, don't let through
				if(ROI.anchored)
					if(isliving(ROI))
						var/mob/living/L = ROI
						//only TP living mobs buckled to non anchored items
						if(!L.buckled || L.buckled.anchored)
							continue
					//Don't TP ghosts
					else if(!isobserver(ROI))
						continue

				do_teleport(ROI, get_turf(target_pad),null,TRUE,null,null,null,null,TRUE, channel = TELEPORT_CHANNEL_FREE)
				CHECK_TICK

/obj/structure/fluff/people_pad/proc/sparks()
	var/datum/effect_system/spark_spread/quantum/s = new /datum/effect_system/spark_spread/quantum
	s.set_up(5, 1, get_turf(src))
	s.start()
