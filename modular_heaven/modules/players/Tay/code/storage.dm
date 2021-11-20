//Tay//

//Rapier Sheath
/obj/item/storage/belt/rapier
	name = "rapier sheath"
	desc = "An ornate sheath designed to hold an officer's blade."
	icon_state = "rsheath"
	inhand_icon_state = "rsheath"
	worn_icon_state = "rsheath"
	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/belt/rapier/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.rustle_sound = FALSE
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.set_holdable(list(
		/obj/item/melee/rapier
		))

/obj/item/storage/belt/rapier/examine(mob/user)
	. = ..()
	if(length(contents))
		. += "<span class='notice'>Alt-click it to quickly draw the blade.</span>"

/obj/item/storage/belt/rapier/AltClick(mob/user)
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY, FALSE, TRUE))
		return
	if(length(contents))
		var/obj/item/I = contents[1]
		user.visible_message("<span class='notice'>[user] takes [I] out of [src].</span>", "<span class='notice'>You take [I] out of [src].</span>")
		user.put_in_hands(I)
		update_icon()
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

/obj/item/storage/belt/rapier/update_icon_state()
	icon_state = initial(inhand_icon_state)
	inhand_icon_state = initial(inhand_icon_state)
	worn_icon_state = initial(worn_icon_state)
	if(contents.len)
		icon_state += "-rapier"
		inhand_icon_state += "-rapier"
		worn_icon_state += "-rapier"

/obj/item/storage/belt/rapier/PopulateContents()
	new /obj/item/melee/rapier(src)
	update_icon()


//Himbo boxes, box/sabre boxes are used for the blade beacon
/obj/item/storage/box/rules_of_nachure
	name = "bulldog equipment package"
	desc = "A box containing a drum-fed shotgun and various ammo selections. Orders for these have spiked in recent months."

/obj/item/storage/box/rules_of_nachure/PopulateContents()
	new /obj/item/gun/ballistic/shotgun/bulldog/unrestricted(src)
	new /obj/item/ammo_box/magazine/m12g(src)
	new /obj/item/ammo_box/magazine/m12g/stun(src)
	new /obj/item/ammo_box/magazine/m12g/slug(src)

/obj/item/storage/box/sabre
	name = "Sabre, Standard Issue"
	desc = "The classic sabre used for ages by NT captains."

/obj/item/storage/box/sabre/PopulateContents()
	new /obj/item/storage/belt/sabre(src)

/obj/item/storage/box/sabre/rapier
	name = "Rapier, Standard Issue"
	desc = "While less popular than the sabre, the rapier is a common officer's weapon."

/obj/item/storage/box/sabre/rapier/PopulateContents()
	new /obj/item/storage/belt/rapier(src)

/obj/item/storage/box/sabre/katana
	name = "Katana, Standard Issue"
	desc = "A rare sight on station officers, a strain of die-hard adherents keep the katana on NT requisition catalogues."

/obj/item/storage/box/sabre/katana/PopulateContents()
	new /obj/item/katana/captain(src)

/obj/item/storage/box/sabre/spear
	name = "Spear of Longinus, Special Issue"
	desc = "One of a few rare experimental null rods. Available to officers of stations at high risk of blood cultist activity."

/obj/item/storage/box/sabre/spear/PopulateContents()
	new /obj/item/nullrod/spear/captain(src)

//Tay//
