/datum/quirk/unholy
	name = "Dead Man Walking"
	desc = "You have an extremely adverse reaction to holy figures."
	icon = "book-dead"
	value = -6
	gain_text = "<span class='warning'>You feel your soul trying to escape your body. Try to stay away from sources of holiness!</span>"
	var/antispam = FALSE // Stops spam in chat
	processing_quirk = TRUE

/datum/quirk/unholy/process(delta_time)
	var/mob/living/carbon/human/chained = quirk_holder
	for(var/mob/living/L in get_hearers_in_view(2, chained))
		if(HAS_TRAIT(L, TRAIT_HOLY))
			if(DT_PROB(10, delta_time)) // 10% chance to cough regardless of spam check, just to make sure the player knows they're still fucked.
				chained.emote("cough")
			if(DT_PROB(65, delta_time)) // Brute or burn, with brute doing less damage.
				if(!antispam)
					chained.visible_message(span_warning("Blood seeps from [chained]'s pores!"))
				chained.bleed(rand(10, 40))
				chained.adjustBruteLoss(rand(1,2),0)
			else
				if(!antispam)
					chained.visible_message(span_warning("A red steam collects around [chained]'s skin!"))
				chained.adjustFireLoss(rand(1,6), 0)
			if(DT_PROB(2, delta_time)) // 2% chance to burst into flames
				if(!antispam)
					chained.visible_message(span_warning("[chained] bursts into darkened flames!"))
				chained.set_fire_stacks(min(5, chained.fire_stacks + 3))
				chained.ignite_mob()
			if(!antispam) // General message
				to_chat(chained, "<span class='warning'>Your soul feels like it's being ripped from your body, towards [L]!</span>")
				antispam = TRUE
				addtimer(CALLBACK(src, .proc/spam_check), 10 SECONDS)

/datum/quirk/unholy/proc/spam_check()
	antispam = FALSE
