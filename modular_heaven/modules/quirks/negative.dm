/datum/quirk/unholy
	name = "Dead Man Walking"
	desc = "You have an extremely adverse reaction to holy figures."
	icon = "book-dead"
	value = -6
	gain_text = "<span class='warning'>You feel your soul trying to escape your body. Try to stay away from sources of holiness!</span>"
	var/antispam = FALSE // Stops spam in chat
	processing_quirk = TRUE

/datum/quirk/unholy/process(delta_time)
	var/mob/living/carbon/human/H = quirk_holder
	for(var/mob/living/L in get_hearers_in_view(2, H))
		if(HAS_TRAIT(L, TRAIT_HOLY))
			if(DT_PROB(10, delta_time)) // 10% chance to cough regardless of spam check, just to make sure the player knows they're still fucked.
				H.emote("cough")
			if(DT_PROB(65, delta_time)) // Brute or burn, with brute doing less damage.
				if(!antispam)
					H.visible_message(span_warning("Blood seeps from [H]'s pores!"))
				H.bleed(rand(10, 40))
				H.adjustBruteLoss(rand(1,2),0)
			else
				if(!antispam)
					H.visible_message(span_warning("A red steam collects around [H]'s skin!"))
				H.adjustFireLoss(rand(1,6), 0)
			if(DT_PROB(2, delta_time)) // 2% chance to burst into flames
				if(!antispam)
					H.visible_message(span_warning("[H] bursts into darkened flames!"))
				H.set_fire_stacks(min(5, H.fire_stacks + 3))
				H.IgniteMob()
			if(!antispam) // General message
				to_chat(H, "<span class='warning'>Your soul feels like it's being ripped from your body, towards [L]!</span>")
				antispam = TRUE
				addtimer(CALLBACK(src, .proc/spam_check), 10 SECONDS)

/datum/quirk/unholy/proc/spam_check()
	antispam = FALSE
