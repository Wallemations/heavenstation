/obj/item/britnotes
	name = "RD's Personal Tablet"
	desc = "It smells vaguely of plasma-burned hay."
	icon = 'icons/obj/modular_tablet.dmi'
	var/icon_state_unpowered = null
	var/icon_state_powered = null
	icon_state_unpowered = "tablet-blue"
	icon_state_powered = "tablet-secret"
	w_class = WEIGHT_CLASS_SMALL
	force = 0.1
	var/has_light = TRUE
	light_on = FALSE						//If that light is enabled
	var/comp_light_luminosity = 2.3				//The brightness of that light
	var/enabled = 0
	attack_verb_simple = list("tapped", "slapped", "hit")
	attack_verb_continuous = list("taps", "slaps", "hits")
	var/password = "Rose"


/obj/item/britnotes/Initialize()
	. = ..()
	ask_for_pass()
	update_icon()
	update_icon_state()

/obj/item/britnotes/update_icon_state()
	if(!enabled)
		icon_state = icon_state_unpowered
	else
		icon_state = icon_state_powered

/obj/item/britnotes/attack_self(mob/user)
	add_fingerprint(user)
	. = ..()
	if(enabled)
		if(ask_for_pass(user))
			open()
	else
		to_chat(user, "<span class='notice'>You press the power button, the screen shining with a dim grey light.</span>")
		enabled = 1
	update_icon()
	update_icon_state()

/obj/item/britnotes/proc/ask_for_pass(mob/user)
	var/guess = stripped_input(user,"Please insert password:", "Password", "")
	if(guess == password)
		return TRUE
	return FALSE

/obj/item/britnotes/proc/open(mob/user)
	var/rulesurl = CONFIG_GET(string/rulesurl)
	if(rulesurl)
		if(alert("You are about to open a new window.",,"Ok","No")!="Ok")
			return
		usr << link(rulesurl)
	else
		to_chat(src, "<span class='danger'>The notes URL is not set in the server configuration.</span>")
	return

/obj/item/britevidence
	icon = 'icons/obj/britevidence.dmi'
	w_class = WEIGHT_CLASS_SMALL
	force = 0.1
	attack_verb_simple = list("hit", "smashed")
	attack_verb_continuous = list("hits", "smashes")


/obj/item/britevidence/suit
	name = "damaged HEV suit"
	desc = "Covered in green and red goop, it has holes in its left arm and abdomen. Half of it appears charred. Its helmet is retracted."
	icon_state = "HEV"
	inhand_icon_state = "HEVRD"
	lefthand_file = 'icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing_righthand.dmi'
	var/handled = FALSE

/obj/item/britevidence/suit/attack_self(mob/user)
	add_fingerprint(user)
	. = ..()
	if(!handled)
		src.visible_message("<span class='warning'>Its helmet uncollapses, revealing a giant charred hole which takes up a quarter of its surface area.</span.?>")
		playsound(src, 'sound/effects/servostep.ogg', 75, 6)
		icon_state = "HEV_open"
		desc = "Covered in green and red goop, it has holes in its left arm and abdomen. Half of it appears charred. Its helmet has a massive hole in the side."
		handled = TRUE
	update_icon()

/obj/item/britevidence/flamethrower
	name = "decommissioned flamethrower"
	desc = "A makeshift flamethrower, rendered unusable from three large claw marks running across its barrel."
	icon_state = "flamethrower"
	inhand_icon_state = "flamethrower_0"
	lefthand_file = 'icons/mob/inhands/weapons/flamethrower_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/flamethrower_righthand.dmi'

/obj/item/britevidence/flamethrower/attack_self(mob/user)
	add_fingerprint(user)
	. = ..()
	playsound(src, 'sound/items/change_drill.ogg', 50, 6)

/obj/item/britevidence/contract
	name = "cursed manilla envelope"
	desc = "A manilla envelope, slightly larger than a standard piece of printer paper. Its seal glows blood red."
	icon_state = "folder"
	var/opened = FALSE

/obj/item/britevidence/contract/attackby(obj/item/I,mob/living/user,params)
	if(istype(I, /obj/item/britevidence/key) && !opened)
		user.visible_message("<span class='notice'>The envelope is opened through hard work, allowing a piece of paper to be taken out. The envelope promptly turns to ashes.</span>", "<span class='notice'>[src] is no match for your relentless onslaught of cuts, as it turns to ash in your hands, revealing a piece of paper inside.</span>")
		playsound(src, 'sound/spookoween/hellscream.ogg', 75, 6)
		opened = TRUE
		name = "infernal contract"
		desc = "A contract which promises \"a second chance\", it is covered in splotches of eternally fresh blood."
		icon_state = "paper"

/obj/item/britevidence/key
	name = "letter opener of eternal torment"
	desc = "Named by an intern that was thusly thrown into the pits of despair. Used to open cursed manilla envelopes."
	icon_state = "boxcutter"

/obj/item/britevidence/scan
	name = "CT scan"
	desc = "A scan of a brain. An object is lodged into its right hemisphere."
	icon_state = "CT"

/obj/item/britevidence/card
	name = "broken ID card"
	desc = "An ID card, half of it is snapped off, with the other half covered in dried blood, rendering it nearly unreadable."
	icon_state = "id"

/obj/item/britevidence/gun
	name = "outdated laser gun"
	desc = "An empty grey laser gun, stained two shades of red. It looks ancient."
	icon_state = "oldlaser"

/obj/item/britevidence/gun/attack_self(mob/user)
	add_fingerprint(user)
	. = ..()
	playsound(src, 'sound/effects/sparks3.ogg', 75, 6)

/obj/item/britevidence/photo
	name = "grainy polaroid"
	desc = "A photo of a security camera's view in what appears to be a loungue of some sort. A supermatter crystal is visible in the center, surrounded by a red glow."
	icon_state = "photo"

/obj/item/britevidence/soul
	name = "soul jar"
	desc = "A jar with a soul submerged in liquid. It pulsates quietly."
	icon_state = "soul1"

/obj/item/britevidence/soul/botanist
	name = "green soul jar"
	desc = "A jar with a soul submerged in green liquid. It writhes against its glass casing."
	icon_state = "soul1"

/obj/item/britevidence/soul/hos
	name = "orange soul jar"
	desc = "A jar with a soul submerged in orange liquid. It shudders under its own weight."
	icon_state = "soul2"

/obj/item/britevidence/soul/scientist
	name = "blue soul jar"
	desc = "A jar with a soul submerged in blue liquid. It recoils from the bright lights."
	icon_state = "soul4"

/obj/item/britevidence/soul/brown
	name = "brown soul jar"
	desc = "A jar with a soul submerged in brown liquid. It has sprung a continuous leak."
	icon_state = "soul3"

/obj/item/britevidence/soul/yellow
	name = "yellow soul jar"
	desc = "A jar with a soul submerged in yellow liquid. It looks oddly familiar."
	icon_state = "soul5"

/obj/item/britevidence/foxglove
	name = "potted foxglove"
	desc = "The bell-like petals are poisonous to anything that hasn't evolved to interact with them. They remind you of someone you used to know."
	icon_state = "flower"
	damtype = BURN
	force = 15
	throwforce = 5
	w_class = WEIGHT_CLASS_BULKY
	throw_speed = 1
	throw_range = 3
	attack_verb_continuous = list("stings")
	attack_verb_simple = list("sting")
	var/pruned = FALSE

/obj/item/britevidence/foxglove/pickup(mob/living/carbon/user)
	..()
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.gloves)
		return FALSE
	if(HAS_TRAIT(C, TRAIT_PIERCEIMMUNE))
		return FALSE
	var/hit_zone = (C.held_index_to_dir(C.active_hand_index) == "l" ? "l_":"r_") + "arm"
	var/obj/item/bodypart/affecting = C.get_bodypart(hit_zone)
	if(affecting)
		if(affecting.receive_damage(0, force))
			C.update_damage_overlays()
	to_chat(C, "<span class='userdanger'>The foxglove burns your bare hand!</span>")
	if(prob(50))
		user.Paralyze(50)
		to_chat(user, "<span class='userdanger'>You are stunned by [src] as you try picking it up!</span>")
	return TRUE

/obj/item/britevidence/foxglove/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is eating some of [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS|TOXLOSS)

/obj/item/britevidence/foxglove/attack(mob/living/carbon/M, mob/user)
	. = ..()
	if(isliving(M))
		to_chat(M, "<span class='danger'>You are stunned by the powerful poison of [src]!</span>")
		log_combat(user, M, "attacked", src)
		M.adjust_blurriness(force/7)
		if(prob(20))
			M.Unconscious(force / 0.3)
			M.Paralyze(force / 0.75)
		M.drop_all_held_items()

/obj/item/britevidence/foxglove/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/britevidence/ribbon))
		to_chat(user, "<span class='notice'>You carefully tie the ribbon to the flower's stem. A single petal falls from the plant.</span>")
		qdel(O)
		new /obj/item/britevidence/glovepetal(loc)
		icon_state = "flower_ribbon"
		return 1
	else if (istype(O, /obj/item/secateurs))
		if(!pruned)
			if(do_after(user, 15, TRUE))
				to_chat(user, "<span class='notice'>You carefully prune some petals from the plant.</span>")
				new /obj/item/britevidence/glovepetal(loc)
				new /obj/item/britevidence/glovepetal(loc)
				new /obj/item/britevidence/glovepetal(loc)
				pruned = TRUE
			else
				to_chat(user, "<span class='notice'>Your movement diverts your focus.</span>")
		else
			to_chat(user, "<span class='notice'>It's already been pruned!</span>")
	else
		return ..()

/obj/item/britevidence/foxglove/Crossed(atom/movable/AM)
	. = ..()
	if(isliving(AM))
		var/mob/living/L = AM
		if(!(L.is_flying() || L.is_floating() || L.buckled))
			to_chat(L, "<span class='danger'>You are stunned by the powerful poison of [src]!</span>")
			L.adjust_blurriness(force/7)
			if(prob(20))
				L.Unconscious(force / 0.3)
				L.Paralyze(force / 0.75)
			L.drop_all_held_items()

/obj/item/britevidence/ribbon
	name = "blue ribbon"
	desc = "It's surprisingly intact. Made of a soft material, with pieces of white fur sticking to it."
	icon_state = "ribbon"
	w_class = WEIGHT_CLASS_TINY

/obj/item/britevidence/blue_key
	name = "blue key"
	desc = "You feel empty holding the cold, painted metal in your hand."
	icon_state = "bluekey"
	w_class = WEIGHT_CLASS_TINY

/obj/item/britevidence/glovepetal
	name = "Foxglove Petal"
	icon_state = "glovepetal"
	desc = "A petal from a foxglove plant. In such a low volume, they're relatively harmless unless directly consumed."
	grind_results = list(/datum/reagent/toxin/glovepowder = 5)
	w_class = WEIGHT_CLASS_TINY

/obj/item/britevidence/glovepetal/attack(mob/living/carbon/M, mob/user)
	if(isliving(M))
		if(M != user)
			user.visible_message("<span class='danger'>[user] tries to feed [M] the [src], but [M.p_they()] spit it out!</span>")
		else
			to_chat(M, "<span class='danger'>You try to eat the [src], but the taste makes you spit it out!</span>")

/obj/item/britevidence/hellphone
	name = "pulsating red phone"
	desc = "A vintage phone, with gold ornaments piercing into its writhing mass. There is no visible way to input a number."
	icon_state = "hellphone"
	force = 3
	throwforce = 2
	throw_speed = 3
	throw_range = 4
	w_class = WEIGHT_CLASS_SMALL
	attack_verb_continuous = list("calls", "rings")
	attack_verb_simple = list("call", "ring")
	hitsound = 'sound/weapons/ring.ogg'
	var/handled = FALSE
	var/answered = FALSE

/obj/item/britevidence/hellphone/Initialize()
	. = ..()
	GLOB.phones += src

/obj/item/britevidence/hellphone/suicide_act(mob/user)
	if(locate(/obj/structure/chair/stool) in user.loc)
		user.visible_message("<span class='suicide'>[user] begins to tie a noose with [src]'s cord! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	else
		user.visible_message("<span class='suicide'>[user] is strangling [user.p_them()]self with [src]'s cord! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return(OXYLOSS)

/obj/item/britevidence/hellphone/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	if(!handled)
		to_chat(user, "<span class='notice'>You start pulling the handset away from the phone. Its connective tissues make this a difficult process.</span>")
		if(!(do_after(user, 5 SECONDS, TRUE)))
			return
		var/obj/item/britevidence/bloodphone/flesh = new /obj/item/britevidence/bloodphone(get_turf(src))
		flesh.add_fingerprint(user)
		user.put_in_hands(flesh)
		to_chat(user, "<span class='notice'>You tear [flesh] off of [src]. It starts to ring as soon as you lift it.</span>")
		handled = TRUE
		icon_state = "hellphone-1"
		playsound(get_turf(user), 'sound/effects/wounds/blood2.ogg', 50, TRUE)
		message_admins("[user.key] has begun a phone call. [ADMIN_VERBOSEJMP(src)]")
		for(var/obj/item/britevidence/pager/paging in GLOB.pagers)
			paging.page()
		answered = FALSE
		if(do_after(user, 20 SECONDS, TRUE) && !answered && handled)
			playsound(get_turf(user), 'sound/misc/busy_phone.ogg', 50, TRUE)
			to_chat(user, "<span class='notice'>Looks like they're busy.</span>")
		else if(!answered)
			to_chat(user, "<span class='notice'>You dropped the phone!</span>")
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")
	add_fingerprint(user)

/obj/item/britevidence/hellphone/proc/answer_phone()
	if(handled && !answered)
		answered = TRUE
		for(var/mob/living/L in range(1, src))
			to_chat(L, "<span class='notice'>Someone picks up, and you hear their breathing through the handset.</span>")
		return TRUE
	return FALSE

/obj/item/britevidence/hellphone/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/britevidence/bloodphone) && handled)
		to_chat(user, "<span class='notice'>You put [I] in [src]. The flesh connecting the handset to the phone regenerates.</span>")
		qdel(I)
		icon_state = "hellphone"
		playsound(get_turf(user), 'sound/misc/hang_up_phone.ogg', 50, TRUE)
		handled = FALSE
		message_admins("[user.key] has hung up a phone call.")
	else
		return ..()

/obj/item/britevidence/bloodphone
	name = "fleshy handset"
	desc = "The smell of the bleeding handset is almost too much to bear. An umbilical chord connects it to the phone."
	icon_state = "bloodphone"
	force = 2
	throwforce = 1
	throw_speed = 4
	throw_range = 6
	w_class = WEIGHT_CLASS_SMALL
	attack_verb_continuous = list("calls", "rings")
	attack_verb_simple = list("call", "ring")
	hitsound = 'sound/weapons/ring.ogg'

/obj/item/britevidence/pager
	name = "\improper <span class='warning'>pager</span>"
	desc = "<span class='warning'>An admin item, for all intents and purposes it does not physically exist. If you find this, please ahelp, thanks.</span>"
	icon = 'icons/obj/telescience.dmi'
	icon_state = "blpad-remote"

/obj/item/britevidence/pager/Initialize()
	. = ..()
	GLOB.pagers += src

/obj/item/britevidence/pager/attack_self(mob/user)
	. = ..()
	for(var/obj/item/britevidence/hellphone/phone in GLOB.phones)
		if(phone.answer_phone(phone))
			to_chat(user, "<span class='notice'>You paged the phone.</span>")
		else
			to_chat(user, "<span class='warning'>Nobody was at the phone, quit hitting the button!</span>")

/obj/item/britevidence/pager/proc/page(mob/user)
	playsound(src, 'sound/weapons/ring.ogg', 50, TRUE)
	for(var/mob/living/L in range(0, src))
		to_chat(L, "<span class='warning'>The pager blinks!</span>")

/obj/item/britevidence/spawner
	name = "spawn radio"
	desc = "We need backup!"
	icon = 'icons/obj/telescience.dmi'
	icon_state = "blpad-remote"
	/// What item/spawner does this spawn/trigger?
	var/spawntype = /obj/item/toy/plush/rouny

/obj/item/britevidence/spawner/attack_self(mob/user)
	. = ..()
	new spawntype(loc)
	balloon_alert(user, "Spawned [spawntype]")
	qdel(src)

/obj/item/britevidence/spawner/armymen
	spawntype = /obj/effect/spawner/scatter/armymen

/obj/item/britevidence/spawner/armymen/attack_self(mob/user)
	user.faction |= list(ROLE_DEATHSQUAD)
	. = ..()

///This spawner will scatter armymen around the user.
/obj/effect/spawner/scatter/armymen
	name = "armymen scatterer"
	max_spawns = 8
	radius = 3
	loot_table = list(/mob/living/simple_animal/hostile/nanotrasen/elite = 20,
					/mob/living/simple_animal/hostile/nanotrasen/ranged/assault = 30,
					/mob/living/simple_animal/hostile/nanotrasen/screaming = 30,
					/mob/living/simple_animal/hostile/nanotrasen = 40,
					/mob/living/simple_animal/hostile/nanotrasen/ranged = 35,
					/mob/living/simple_animal/hostile/nanotrasen/ranged/smg = 20
					)
