/datum/quirk/unholy
	name = "Dead Man Walking"
	desc = "You have an extremely adverse reaction to holy figures."
	value = -6
	gain_text = "<span class='warning'>You feel your soul trying to escape your body. Try to stay away from sources of holiness!</span>"
	var/antispam = FALSE // Stops spam in chat

/datum/quirk/unholy/process(delta_time)
	var/mob/living/carbon/human/H = quirk_holder
	for(var/mob/living/L in get_hearers_in_view(2, H))
		if(HAS_TRAIT(L, TRAIT_HOLY))
			if(DT_PROB(10, delta_time))
				H.emote("cough")
			if(DT_PROB(50, delta_time))
				if(!antispam)
					H.visible_message("<span class='notice'>begins to seep blood!</span.?>", visible_message_flags = EMOTE_MESSAGE)
				H.bleed(rand(10, 40))
				H.adjustBruteLoss(2,0)
			else
				if(!antispam)
					H.visible_message("<span class='notice'>starts to emit a red steam.</span.?>", visible_message_flags = EMOTE_MESSAGE)
				H.adjustFireLoss(6, 0)
			if(DT_PROB(2, delta_time))
				if(!antispam)
					H.visible_message("<span class='notice'>bursts into darkened flames!</span.?>", visible_message_flags = EMOTE_MESSAGE)
				H.set_fire_stacks(min(5, H.fire_stacks + 3))
				H.IgniteMob()
			if(!antispam)
				to_chat(H, "<span class='warning'>Your soul feels like it's being ripped from your body!</span>")
				antispam = TRUE
				addtimer(CALLBACK(src, .proc/spam_check), 10 SECONDS)

/datum/quirk/unholy/proc/spam_check()
	antispam = FALSE
