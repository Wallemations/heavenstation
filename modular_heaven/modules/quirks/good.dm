//By Melbert
/datum/quirk/no_appendix
	name = "Appendicitis Survivor"
	desc = "You had a run-in with appendicitis in the past and no longer have an appendix."
	value = 2
	gain_text = "<span class='notice'>You no longer have an appendix.</span>"
	lose_text = "<span class='notice'>You miss your appendix.</span>"
	medical_record_text = "Patient had appendicitis in the past and has had their appendix surgically removed as a consequence."

/datum/quirk/no_appendix/on_spawn()
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder
	var/obj/item/organ/appendix/dumb_appendix = carbon_quirk_holder.getorganslot(ORGAN_SLOT_APPENDIX)
	dumb_appendix.Remove(quirk_holder, TRUE)
