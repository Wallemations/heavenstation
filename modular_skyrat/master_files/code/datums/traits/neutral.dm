//uncontrollable laughter
/datum/quirk/item_quirk/joker
	name = "Pseudobulbar Affect"
	desc = "At random intervals, you suffer uncontrollable bursts of laughter."
	value = 0
	medical_record_text = "Patient suffers with sudden and uncontrollable bursts of laughter."
	var/pcooldown = 0
	var/pcooldown_time = 60 SECONDS
	icon = "grin-squint-tears"

/datum/quirk/item_quirk/joker/add_unique()
	give_item_to_holder(/obj/item/paper/joker, list(LOCATION_BACKPACK = ITEM_SLOT_BACKPACK, LOCATION_HANDS = ITEM_SLOT_HANDS))

/obj/item/paper/joker
	name = "disability card"
	icon = 'modular_skyrat/master_files/icons/obj/card.dmi'
	icon_state = "joker"
	desc = "Smile, though your heart is aching."
	info = "<i>\
			<div style='border-style:solid;text-align:center;border-width:5px;margin: 20px;margin-bottom:0px'>\
			<div style='margin-top:20px;margin-bottom:20px;font-size:150%;'>\
			Forgive my laughter:<br>\
			I have a condition.\
			</div>\
			</div>\
			</i>\
			<br>\
			<center>\
			<b>\
			MORE ON BACK\
			</b>\
			</center>"
	var/info2 = "<i>\
			<div style='border-style:solid;text-align:center;border-width:5px;margin: 20px;margin-bottom:0px'>\
			<div style='margin-top:20px;margin-bottom:20px;font-size:100%;'>\
			<b>\
			It's a medical condition causing sudden,<br>\
			frequent and uncontrollable laughter that<br>\
			doesn't match how you feel.<br>\
			It can happen in people with a brain injury<br>\
			or certain neurological conditions.<br>\
			</b>\
			</div>\
			</div>\
			</i>\
			<br>\
			<center>\
			<b>\
			KINDLY RETURN THIS CARD\
			</b>\
			</center>"
	var/flipped = FALSE

/obj/item/paper/joker/update_icon()
	..()
	icon_state = "joker"

/obj/item/paper/joker/AltClick(mob/living/carbon/user, obj/item/I)
	if(flipped)
		info = initial(info)
		flipped = FALSE
		to_chat(user, "<span class='notice'>You unflip the card.</span>")
	else
		info = info2
		flipped = TRUE
		to_chat(user, "<span class='notice'>You flip the card.</span>")

/datum/quirk/item_quirk/joker/process()
	if(pcooldown > world.time)
		return
	pcooldown = world.time + pcooldown_time
	var/mob/living/carbon/human/H = quirk_holder
	if(H && istype(H))
		if(H.stat == CONSCIOUS)
			if(prob(20))
				H.emote("laugh")
				addtimer(CALLBACK(H, /mob/proc/emote, "laugh"), 5 SECONDS)
				addtimer(CALLBACK(H, /mob/proc/emote, "laugh"), 10 SECONDS)
