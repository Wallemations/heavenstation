// Contains Borg Power Tools & Their Upgrade Modules, Since I forgot to take it from skyrat //

/obj/item/crowbar/cyborg/power
	name = "modular crowbar"
	desc = "A cyborg fitted module resembling the jaws of life."
	icon = 'modular_heaven/modules/borgtools/icons/borg tools.dmi'
	icon_state = "jaws_pry_cyborg"
	usesound = 'sound/items/jaws_pry.ogg'
	force = 10
	toolspeed = 0.5

/obj/item/crowbar/cyborg/power/examine()
	. = ..()
	. += " It's fitted with a [tool_behaviour == TOOL_CROWBAR ? "prying" : "cutting"] head."

/obj/item/crowbar/cyborg/power/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_jaws.ogg', 50, TRUE)
	if(tool_behaviour == TOOL_CROWBAR)
		tool_behaviour = TOOL_WIRECUTTER
		to_chat(user, "<span class='notice'>You attach the cutting jaws to [src].</span>")
		icon_state = "jaws_cutter_cyborg"
		usesound = 'sound/items/jaws_cut.ogg'
	else
		tool_behaviour = TOOL_CROWBAR
		to_chat(user, "<span class='notice'>You attach the prying jaws to [src].</span>")
		icon_state = "jaws_pry_cyborg"
		usesound = 'sound/items/jaws_pry.ogg'

/obj/item/screwdriver/cyborg/power
	name =	"automated drill"
	desc = "A cyborg fitted module resembling the hand drill"
	icon = 'modular_heaven/modules/borgtools/icons/borg tools.dmi'
	icon_state = "drill_screw_cyborg"
	hitsound = 'sound/items/drill_hit.ogg'
	usesound = 'sound/items/drill_use.ogg'
	toolspeed = 0.5
	random_color = FALSE

/obj/item/screwdriver/cyborg/power/examine()
	. = ..()
	. += " It's fitted with a [tool_behaviour == TOOL_SCREWDRIVER ? "screw" : "bolt"] head."

/obj/item/screwdriver/cyborg/power/attack_self(mob/user)
	playsound(get_turf(user), 'sound/items/change_drill.ogg', 50, TRUE)
	if(tool_behaviour == TOOL_SCREWDRIVER)
		tool_behaviour = TOOL_WRENCH
		to_chat(user, "<span class='notice'>You attach the bolt bit to [src].</span>")
		icon_state = "drill_bolt_cyborg"
	else
		tool_behaviour = TOOL_SCREWDRIVER
		to_chat(user, "<span class='notice'>You attach the screw bit to [src].</span>")
		icon_state = "drill_screw_cyborg"

//////////////////////////////////////////////////////////////////////////////////////

/mob/living/silicon/robot
	var/hasShrunk = FALSE
	var/hasAdvanced = FALSE

/obj/item/borg/upgrade/shrink
	name = "borg shrinker"
	desc = "A cyborg resizer, it makes a cyborg small."
	icon_state = "cyborg_upgrade3"

/obj/item/borg/upgrade/shrink/action(mob/living/silicon/robot/borg, user = usr)
	. = ..()
	if(.)

		if(borg.hasShrunk)
			to_chat(usr, "<span class='warning'>This unit already has a shrink module installed!</span>")
			return FALSE

		borg.hasShrunk = TRUE
		borg.notransform = TRUE
		var/prev_lockcharge = borg.lockcharge
		borg.SetLockdown(1)
		borg.set_anchored(TRUE)
		var/datum/effect_system/smoke_spread/smoke = new
		smoke.set_up(1, borg.loc)
		smoke.start()
		sleep(2)
		for(var/i in 1 to 4)
			playsound(borg, pick('sound/items/drill_use.ogg', 'sound/items/jaws_cut.ogg', 'sound/items/jaws_pry.ogg', 'sound/items/welder.ogg', 'sound/items/ratchet.ogg'), 80, TRUE, -1)
			sleep(12)
		if(!prev_lockcharge)
			borg.SetLockdown(0)
		borg.set_anchored(FALSE)
		borg.notransform = FALSE
		borg.resize = 0.75
		borg.update_transform()

/obj/item/borg/upgrade/shrink/deactivate(mob/living/silicon/robot/borg, user = usr)
	. = ..()
	if (.)
		if (borg.hasShrunk)
			borg.hasShrunk = FALSE
			borg.resize = (4/3)
			borg.update_transform()

/obj/item/borg/upgrade/surgerytools
	name = "medical cyborg advanced surgery tools"
	desc = "An upgrade to the Medical model cyborg's surgery loadout, replacing non-advanced tools with their advanced counterpart."
	icon_state = "cyborg_upgrade3"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/medical)
	model_flags = BORG_MODEL_MEDICAL

/obj/item/borg/upgrade/surgerytools/action(mob/living/silicon/robot/borg)
	. = ..()
	if(.)
		for(var/obj/item/retractor/RT in borg.model.modules)
			borg.model.remove_module(RT, TRUE)
		for(var/obj/item/hemostat/HS in borg.model.modules)
			borg.model.remove_module(HS, TRUE)
		for(var/obj/item/cautery/CT in borg.model.modules)
			borg.model.remove_module(CT, TRUE)
		for(var/obj/item/surgicaldrill/SD in borg.model.modules)
			borg.model.remove_module(SD, TRUE)
		for(var/obj/item/scalpel/SP in borg.model.modules)
			borg.model.remove_module(SP, TRUE)
		for(var/obj/item/circular_saw/CS in borg.model.modules)
			borg.model.remove_module(CS, TRUE)
		for(var/obj/item/healthanalyzer/HA in borg.model.modules)
			borg.model.remove_module(HA, TRUE)

		var/obj/item/scalpel/advanced/AS = new /obj/item/scalpel/advanced(borg.model)
		borg.model.basic_modules += AS
		borg.model.add_module(AS, FALSE, TRUE)
		var/obj/item/retractor/advanced/AR = new /obj/item/retractor/advanced(borg.model)
		borg.model.basic_modules += AR
		borg.model.add_module(AR, FALSE, TRUE)
		var/obj/item/cautery/advanced/AC = new /obj/item/cautery/advanced(borg.model)
		borg.model.basic_modules += AC
		borg.model.add_module(AC, FALSE, TRUE)
		var/obj/item/healthanalyzer/advanced/AHA = new /obj/item/healthanalyzer/advanced(borg.model)
		borg.model.basic_modules += AHA
		borg.model.add_module(AHA, FALSE, TRUE)

/obj/item/borg/upgrade/surgerytools/deactivate(mob/living/silicon/robot/borg, user = usr)
	. = ..()
	if(.)
		for(var/obj/item/scalpel/advanced/AS in borg.model.modules)
			borg.model.remove_module(AS, TRUE)
		for(var/obj/item/retractor/advanced/AR in borg.model.modules)
			borg.model.remove_module(AR, TRUE)
		for(var/obj/item/cautery/advanced/AC in borg.model.modules)
			borg.model.remove_module(AC, TRUE)
		for(var/obj/item/healthanalyzer/advanced/AHA in borg.model.modules)
			borg.model.remove_module(AHA, TRUE)

		var/obj/item/retractor/RT = new (borg.model)
		borg.model.basic_modules += RT
		borg.model.add_module(RT, FALSE, TRUE)
		var/obj/item/hemostat/HS = new (borg.model)
		borg.model.basic_modules += HS
		borg.model.add_module(HS, FALSE, TRUE)
		var/obj/item/cautery/CT = new (borg.model)
		borg.model.basic_modules += CT
		borg.model.add_module(CT, FALSE, TRUE)
		var/obj/item/surgicaldrill/SD = new (borg.model)
		borg.model.basic_modules += SD
		borg.model.add_module(SD, FALSE, TRUE)
		var/obj/item/scalpel/SP = new (borg.model)
		borg.model.basic_modules += SP
		borg.model.add_module(SP, FALSE, TRUE)
		var/obj/item/circular_saw/CS = new (borg.model)
		borg.model.basic_modules += CS
		borg.model.add_module(CS, FALSE, TRUE)
		var/obj/item/healthanalyzer/HA = new (borg.model)
		borg.model.basic_modules += HA
		borg.model.add_module(HA, FALSE, TRUE)

/obj/item/borg/upgrade/powertools
	name = "engineering cyborg advanced power tools"
	desc = "An upgrade to the Engineering model cyborg's tool loadout, replacing non-advanced tools with their advanced counterpart."
	icon_state = "cyborg_upgrade3"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/engineering, /obj/item/robot_model/saboteur)
	model_flags = BORG_MODEL_ENGINEERING

/obj/item/borg/upgrade/powertools/action(mob/living/silicon/robot/borg, user = usr)
	. = ..()
	if(.)
		var/obj/item/crowbar/cyborg/power/ACR = locate() in borg.model.modules
		if(ACR)
			to_chat(user, "<span class='warning'>This unit is already equipped with powertools!</span>")
			return FALSE

		for(var/obj/item/screwdriver/cyborg/SC in borg.model.modules)
			borg.model.remove_module(SC, TRUE)
		for(var/obj/item/wrench/cyborg/WR in borg.model.modules)
			borg.model.remove_module(WR, TRUE)
		for(var/obj/item/crowbar/cyborg/CR in borg.model.modules)
			borg.model.remove_module(CR, TRUE)
		for(var/obj/item/wirecutters/cyborg/WC in borg.model.modules)
			borg.model.remove_module(WC, TRUE)

		ACR = new (borg.model)
		borg.model.basic_modules += ACR
		borg.model.add_module(ACR, FALSE, TRUE)
		var/obj/item/screwdriver/cyborg/power/ASC = new (borg.model)
		borg.model.basic_modules += ASC
		borg.model.add_module(ASC, FALSE, TRUE)

/obj/item/borg/upgrade/powertools/deactivate(mob/living/silicon/robot/borg)
	. = ..()
	if(.)
		for(var/obj/item/crowbar/cyborg/power/ACR in borg.model.modules)
			borg.model.remove_module(ACR, TRUE)
		for(var/obj/item/screwdriver/cyborg/power/ASC in borg.model.modules)
			borg.model.remove_module(ASC, TRUE)

		var/obj/item/screwdriver/cyborg/SC = new (borg.model)
		borg.model.basic_modules += SC
		borg.model.add_module(SC, FALSE, TRUE)
		var/obj/item/wrench/cyborg/WR = new (borg.model)
		borg.model.basic_modules += WR
		borg.model.add_module(WR, FALSE, TRUE)
		var/obj/item/crowbar/cyborg/CR = new (borg.model)
		borg.model.basic_modules += CR
		borg.model.add_module(CR, FALSE, TRUE)
		var/obj/item/wirecutters/cyborg/WC = new (borg.model)
		borg.model.basic_modules += WC
		borg.model.add_module(WC, FALSE, TRUE)
