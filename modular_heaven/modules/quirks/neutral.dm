/datum/quirk/holy
	name = "Holy Figure"
	desc = "You're a diety! Don't let it get to your head."
	value = 0
	mob_trait = TRAIT_HOLY

/// Height changing quirks. - Coded by Melbert, 4 options removed due to being way too big/small
// The default parent quirk shows up in the quirk list because it adds all subtypes of quirks.
// So it's just "average height" Screw it..
/datum/quirk/size_change
	name = "Size B - Average Height"
	desc = "You are average. (0% size change - this quirk does nothing.)"
	value = 0
	gain_text = "<span class='notice'>You feel average.</span>"
	lose_text = "<span class='notice'>You still feel average.</span>"
	medical_record_text = "Patient is of average height."
	/// The amount we resize the quirk holder for.
	var/resize_amount = 1
	/// the amount we offset the person for, with their new size.
	var/y_offset = 0

/datum/quirk/size_change/add_unique()
	if(resize_amount > 1.1)
		ADD_TRAIT(quirk_holder, TRAIT_GIANT, ROUNDSTART_TRAIT)
	else if(resize_amount < 0.9)
		ADD_TRAIT(quirk_holder, TRAIT_DWARF, ROUNDSTART_TRAIT)

	quirk_holder.resize = resize_amount
	quirk_holder.update_transform()
	quirk_holder.base_pixel_y += y_offset
	quirk_holder.pixel_y += y_offset

/datum/quirk/size_change/remove()
	if(resize_amount > 1.1)
		REMOVE_TRAIT(quirk_holder, TRAIT_GIANT, ROUNDSTART_TRAIT)
	else if(resize_amount < 0.9)
		REMOVE_TRAIT(quirk_holder, TRAIT_DWARF, ROUNDSTART_TRAIT)

	quirk_holder.resize = 1/resize_amount
	quirk_holder.update_transform()
	quirk_holder.base_pixel_y -= y_offset
	quirk_holder.pixel_y -= y_offset

// All the height changing quirks.
// They're alphabetized because the quirk list is and I wanted to sort them by height order.

// Large
/datum/quirk/size_change/large
	name = "Size A - Large"
	desc = "You're large and in charge. (10% larger)"
	gain_text = "<span class='notice'>You feel taller.</span>"
	lose_text = "<span class='notice'>You feel shorter.</span>"
	medical_record_text = "Patient has un-natural height and size."
	resize_amount = 1.1
	y_offset = 2

// Short
/datum/quirk/size_change/short
	name = "Size C - Small"
	desc = "You're pretty small. (10% smaller)"
	gain_text = "<span class='notice'>You feel shorter.</span>"
	lose_text = "<span class='notice'>You feel taller.</span>"
	medical_record_text = "Patient is un-naturally short in stature."
	resize_amount = 0.9
	y_offset = -2
/////////////////////////////////////////////////////

/datum/quirk/robotic_talk
	name = "Robotongue"
	desc = "you sound like a kickass robot."
	value = 0
	medical_record_text = "During physical examination, patient's tongue was found to be uniquely damaged."

/datum/quirk/robotic_talk/add_unique()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/tongue/old_tongue = locate() in H.internal_organs
	var/obj/item/organ/tongue/robot/new_tongue = new(get_turf(H))
	old_tongue.Remove(H)
	new_tongue.Insert(H)
	qdel(old_tongue)
	H.regenerate_icons()
