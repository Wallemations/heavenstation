/obj/item/YGO
	resistance_flags = FLAMMABLE
	max_integrity = 50
	var/YGO_parentdeck = null
	var/YGO_deckstyle = "yugioh"
	var/YGO_card_hitsound = null
	var/YGO_card_force = 0
	var/YGO_card_throwforce = 20
	var/YGO_card_throw_speed = 4
	var/YGO_card_throw_range = 7
	var/list/YGO_card_attack_verb = list("attacked")
	w_class = WEIGHT_CLASS_SMALL

/obj/item/YGO/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] is slitting [user.p_their()] wrists with \the [src]! It looks like [user.p_they()] [user.p_have()] a crummy hand!</span>")
	playsound(src, 'sound/items/cardshuffle.ogg', 50, TRUE)
	return BRUTELOSS

/obj/item/YGO/proc/apply_card_vars(obj/item/YGO/newobj, obj/item/YGO/sourceobj) // Applies variables for supporting multiple types of card deck
	if(!istype(sourceobj))
		return

/obj/item/YGO/deck
	name = "deck of Yu-Gi-Oh! cards"
	desc = "Get your game on!"
	icon = 'icons/obj/Yugioh.dmi'
	YGO_deckstyle = "yugioh"
	icon_state = "deck_yugioh_full"
	w_class = WEIGHT_CLASS_SMALL
	var/cooldown = 0
	var/obj/machinery/computer/holodeck/holo = null // Holodeck cards should not be infinite
	var/list/YGO = list()

/obj/item/YGO/deck/Initialize()
	. = ..()
	populate_deck()

///Generates all the cards within the deck.List in here has potential to mess up!!! 41 42 yadda yadda
/obj/item/YGO/deck/proc/populate_deck()
	icon_state = "deck_[YGO_deckstyle]_full"
	for(var/monster in list("bubbleman", "blueeyes", "burstinatrix", "avian", "clayman"))
		YGO += "[monster]"


/obj/item/YGO/deck/proc/draw_card(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	var/choice = null
	if(YGO.len == 0)
		to_chat(user, "<span class='warning'>There are no more cards to draw!</span>")
		return
	var/obj/item/YGO/singlecard/H = new/obj/item/YGO/singlecard(user.loc)//54
	if(holo)
		holo.spawned += H // track them leaving the holodeck
	choice = YGO[1]
	H.cardname = choice
	H.parentdeck = src
	var/O = src
	H.apply_card_vars(H,O)
	popleft(YGO)
	H.pickup(user)
	user.put_in_hands(H)
	user.visible_message("<span class='notice'>[user] draws a card from the deck.</span>", "<span class='notice'>You draw a card from the deck.</span>")
	update_icon()
	return H

/obj/item/YGO/deck/update_icon_state()
	switch(YGO.len)
		if(4 to INFINITY)
			icon_state = "deck_[YGO_deckstyle]_full"
		if(3 to 4)
			icon_state = "deck_[YGO_deckstyle]_half"
		if(1 to 2)
			icon_state = "deck_[YGO_deckstyle]_low"
		else
			icon_state = "deck_[YGO_deckstyle]_empty"

/obj/item/YGO/deck/attack_self(mob/user)
	if(cooldown < world.time - 50)
		YGO = shuffle(YGO)
		playsound(src, 'sound/items/cardshuffle.ogg', 50, TRUE)
		user.visible_message("<span class='notice'>[user] shuffles the deck.</span>", "<span class='notice'>You shuffle the deck.</span>")
		cooldown = world.time

/obj/item/YGO/deck/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/YGO/singlecard))
		var/obj/item/YGO/singlecard/SC = I
		if(SC.parentdeck == src)
			if(!user.temporarilyRemoveItemFromInventory(SC))
				to_chat(user, "<span class='warning'>The card is stuck to your hand, you can't add it to the deck!</span>")
				return
			YGO += SC.cardname
			user.visible_message("<span class='notice'>[user] adds a card to the bottom of the deck.</span>","<span class='notice'>You add the card to the bottom of the deck.</span>")
			qdel(SC)
		else
			to_chat(user, "<span class='warning'>You can't mix cards from other decks!</span>")
		update_icon()
	else if(istype(I, /obj/item/YGO/cardhand))
		var/obj/item/YGO/cardhand/CH = I
		if(CH.parentdeck == src)
			if(!user.temporarilyRemoveItemFromInventory(CH))
				to_chat(user, "<span class='warning'>The hand of cards is stuck to your hand, you can't add it to the deck!</span>")
				return
			YGO += CH.currenthand
			user.visible_message("<span class='notice'>[user] puts [user.p_their()] hand of cards in the deck.</span>", "<span class='notice'>You put the hand of cards in the deck.</span>")
			qdel(CH)
		else
			to_chat(user, "<span class='warning'>You can't mix cards from other decks!</span>")
		update_icon()
	else
		return ..()

/obj/item/YGO/deck/MouseDrop(atom/over_object)
	. = ..()
	var/mob/living/M = usr
	if(!istype(M) || !(M.mobility_flags & MOBILITY_PICKUP))
		return
	if(Adjacent(usr))
		if(over_object == M && loc != M)
			M.put_in_hands(src)
			to_chat(usr, "<span class='notice'>You pick up the deck.</span>")

		else if(istype(over_object, /obj/screen/inventory/hand))
			var/obj/screen/inventory/hand/H = over_object
			if(M.putItemFromInventoryInHandIfPossible(src, H.held_index))
				to_chat(usr, "<span class='notice'>You pick up the deck.</span>")

	else
		to_chat(usr, "<span class='warning'>You can't reach it from here!</span>")
