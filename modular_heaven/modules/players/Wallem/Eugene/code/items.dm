//| Telescopic Crowbar |//
/obj/item/melee/baton/telescopic/crowbar
	name = "telescopic crowbar"
	desc = "A compact yet robust personal defense weapon. Can be concealed when folded."
	icon_state = "telebar"
	icon = 'modular_heaven/modules/players/Wallem/Eugene/icons/items.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	bare_wound_bonus = 5
	on_inhand_icon_state = "crowbar"

/obj/item/melee/baton/telescopic/crowbar/on_transform(obj/item/source, mob/user, active)
	. = ..()
	tool_behaviour = (active ? TOOL_CROWBAR : NONE)

//| Telescopic Crowbar |//
//| Britnotes |//

/obj/item/britnotes
	name = "RD's Personal Tablet"
	desc = "It smells vaguely of plasma-burned hay."
	icon = 'modular_heaven/modules/players/Wallem/Eugene/icons/items.dmi'
	var/icon_state_unpowered = "tablet-blue"
	var/icon_state_powered = "tablet-secret"
	w_class = WEIGHT_CLASS_SMALL
	var/enabled = FALSE
	attack_verb_simple = list("tapped", "slapped", "hit")
	attack_verb_continuous = list("taps", "slaps", "hits")
	var/password = "Rose"

/obj/item/britnotes/Initialize()
	. = ..()
	update_icon()
	update_icon_state()

/obj/item/britnotes/update_icon_state()
	. = ..()
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
			enabled = FALSE
			to_chat(user, span_notice("The device goes back into sleep mode."))
	else
		to_chat(user, span_notice("You press the power button, the screen shining with a dim grey light."))
		enabled = TRUE
	update_icon()
	update_icon_state()

/obj/item/britnotes/proc/ask_for_pass(mob/user)
	var/guess = stripped_input(user,"Please insert password:", "Password", "")
	if(guess == password)
		return TRUE
	return FALSE

/obj/item/britnotes/proc/open(mob/user)
	var/rulesurl = "https://docs.google.com/document/d/1F6Jm6Gt8p1BvBIaByPZY6iF4OgA76OK8IHj9f-bnPVI/edit?usp=sharing"
	if(rulesurl)
		if(alert(user,"You are about to open a new window.","Confirm","Ok","No")!="Ok")
			return
		_link(usr, rulesurl)
	else
		to_chat(src, "<span class='danger'>The notes URL is not set in the server configuration.</span>")
	return

//| Britnotes |//
//| Brit Evidence |//

/obj/item/britevidence
	icon = 'modular_heaven/modules/players/Wallem/Eugene/icons/items.dmi'
	w_class = WEIGHT_CLASS_SMALL
	force = 0
	attack_verb_simple = list("hit", "smashed")
	attack_verb_continuous = list("hits", "smashes")
/*
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
		playsound(src, 'modular_heaven/modules/players/Wallem/Eugene/sounds/hellscream.ogg', 75, 6)
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
*/
//| Brit Evidence |//
//| Foxglove |//

/obj/item/foxglove
	name = "potted foxglove"
	desc = "The bell-like petals are poisonous to anything that hasn't evolved to interact with them. They remind you of someone you used to know."
	icon_state = "flower"
	icon = 'modular_heaven/modules/players/Wallem/Eugene/icons/items.dmi'
	damtype = BURN
	force = 15
	throwforce = 5
	w_class = WEIGHT_CLASS_BULKY
	throw_speed = 1
	throw_range = 3
	attack_verb_continuous = list("stings")
	attack_verb_simple = list("sting")
	var/pruned = FALSE

/obj/item/foxglove/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/caltrop, min_damage = 0, max_damage = 5, flags = (CALTROP_BYPASS_SHOES | CALTROP_NOCRAWL))

/obj/item/foxglove/pickup(mob/living/carbon/user)
	..()
	if(!iscarbon(user) || user.gloves || HAS_TRAIT(user, TRAIT_PIERCEIMMUNE))
		return FALSE
	var/hit_zone = (user.held_index_to_dir(user.active_hand_index) == "l" ? "l_":"r_") + "arm"
	var/obj/item/bodypart/affecting = user.get_bodypart(hit_zone)
	if(affecting)
		if(affecting.receive_damage(0, force))
			user.update_damage_overlays()
	to_chat(user, span_userdanger("The foxglove burns your bare hand!"))
	if(prob(50))
		user.Paralyze(50)
		to_chat(user, "<span class='userdanger'>You are stunned by [src] as you try picking it up!</span>")
	return TRUE

/obj/item/foxglove/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is eating some of [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS|TOXLOSS)

/obj/item/foxglove/attack(mob/living/carbon/M, mob/user)
	. = ..()
	if(isliving(M))
		to_chat(M, "<span class='danger'>You are stunned by the powerful poison of [src]!</span>")
		log_combat(user, M, "attacked", src)
		M.adjust_blurriness(force/7)
		if(prob(20))
			M.Unconscious(force / 0.3)
			M.Paralyze(force / 0.75)
		M.drop_all_held_items()

/obj/item/foxglove/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/ritrice/ribbon))
		to_chat(user, "<span class='notice'>You carefully tie the ribbon to the flower's stem. A single petal falls from the plant.</span>")
		qdel(O)
		new /obj/item/glovepetal(loc)
		icon_state = "flower_ribbon"
		return 1
	else if (istype(O, /obj/item/secateurs))
		if(!pruned)
			if(do_after(user, 15))
				to_chat(user, "<span class='notice'>You carefully prune some petals from the plant.</span>")
				new /obj/item/glovepetal(loc)
				new /obj/item/glovepetal(loc)
				new /obj/item/glovepetal(loc)
				new /obj/item/glovepetal(loc)
				new /obj/item/glovepetal(loc)
				pruned = TRUE
			else
				to_chat(user, "<span class='notice'>Your movement diverts your focus.</span>")
		else
			to_chat(user, "<span class='notice'>It's already been pruned!</span>")
	else
		return ..()

/obj/item/glovepetal
	name = "foxglove petal"
	icon_state = "glovepetal"
	icon = 'modular_heaven/modules/players/Wallem/Eugene/icons/items.dmi'
	desc = "A petal from a foxglove plant. In such a low volume they're harmless to touch, though eating them would still be a bad idea."
	force = 0
	grind_results = list(/datum/reagent/toxin/glovepowder = 5)
	w_class = WEIGHT_CLASS_TINY

/obj/item/glovepetal/attack(mob/living/carbon/M, mob/user)
	if(isliving(M))
		if(M != user)
			user.visible_message("<span class='danger'>[user] tries to feed [M] the [src], but [M.p_they()] spit it out!</span>")
		else
			to_chat(M, span_danger("You try to eat [src], but you nearly vomit the moment it touches your tongue. Maybe if it was more diluted..."))

//| Foxglove |//
//| Phone & Pager |//
GLOBAL_LIST_EMPTY(pagers) // All pagers

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
		if(!(do_after(user, 5 SECONDS)))
			return
		var/obj/item/britevidence/bloodphone/flesh = new /obj/item/britevidence/bloodphone(get_turf(src))
		flesh.add_fingerprint(user)
		user.put_in_hands(flesh)
		to_chat(user, "<span class='notice'>You tear [flesh] off of [src]. It starts to ring as soon as you lift it.</span>")
		handled = TRUE
		icon_state = "hellphone-1"
		playsound(get_turf(user), 'sound/effects/wounds/blood2.ogg', 50, TRUE)
		message_admins("[user.key] has begun a phone call. [ADMIN_VERBOSEJMP(src)]")
		for(var/obj/item/britevidence/pager/page in GLOB.pagers)
			page.page(src)
		answered = FALSE
		if(do_after(user, 20 SECONDS) && !answered && handled)
			playsound(get_turf(user), 'modular_heaven/modules/players/Wallem/Eugene/sounds/busy_phone.ogg', 50, TRUE)
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
		playsound(get_turf(user), 'modular_heaven/modules/players/Wallem/Eugene/sounds/hang_up_phone.ogg', 50, TRUE)
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
	var/datum/weakref/handset = null

/obj/item/britevidence/pager/Initialize()
	. = ..()
	GLOB.pagers += src

/obj/item/britevidence/pager/attack_self(mob/user)
	. = ..()
	if(isnull(handset))
		to_chat(user, span_warning("This pager isn't linked to any phones yet! Wait until someone calls!"))
		return
	var/obj/item/britevidence/hellphone/phone = handset?.resolve()
	if(phone.answer_phone(phone))
		to_chat(user, "<span class='notice'>You paged the phone.</span>")
	else
		to_chat(user, "<span class='warning'>Nobody was at the phone, quit hitting the button!</span>")

/obj/item/britevidence/pager/proc/page(obj/item/britevidence/hellphone/phone)
	handset = WEAKREF(handset)
	playsound(src, 'sound/weapons/ring.ogg', 50, TRUE, extrarange = SILENCED_SOUND_EXTRARANGE)
	for(var/mob/living/L in range(0, src))
		balloon_alert(L, "The pager blinks!")

//| Phone & Pager |//
