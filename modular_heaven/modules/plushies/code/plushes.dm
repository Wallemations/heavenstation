/obj/item/toy/plush/talking
	name = "talking plush"
	desc = "Fucked up yet true."
	icon = 'modular_heaven/modules/plushies/icons/plushes.dmi'
	icon_state = "generic"
	w_class = WEIGHT_CLASS_SMALL
	var/cooldown = FALSE
	var/messages = list("I'm super generic!", "Mathematics class is of variable difficulty!", "I enjoy water without any ice!", "I love the latest season of The Simpsons!")
	var/span = "danger"
	var/recharge_time = 30

	var/chattering = FALSE
	var/phomeme

/obj/item/toy/plush/talking/attack_alien(mob/user)
	return attack_hand(user)

/obj/item/toy/plush/talking/attack_self(mob/user)
	if(!cooldown)
		activation_message(user)
		playsound(loc, 'sound/items/toysqueak2.ogg', 20, TRUE)
		INVOKE_ASYNC(src, .proc/do_toy_talk, user)
		cooldown = TRUE
		addtimer(VARSET_CALLBACK(src, cooldown, FALSE), recharge_time)
		return
	..()

/obj/item/toy/plush/talking/proc/activation_message(mob/user)
	user.visible_message(
		"<span class='notice'>[user] pulls the string on \the [src].</span>",
		"<span class='notice'>You pull the string on \the [src].</span>",
		"<span class='notice'>You hear a string being pulled.</span>")

/obj/item/toy/plush/talking/proc/generate_messages()
	return list(pick(messages))

/obj/item/toy/plush/talking/proc/do_toy_talk(mob/user)
	for(var/message in generate_messages())
		toy_talk(user, message)
		sleep(10)

/obj/item/toy/plush/talking/proc/toy_talk(mob/user, message)
	user.loc.visible_message("<span class='[span]'>[icon2html(src, viewers(user.loc))] [message]</span>")
	if(chattering)
		chatter(message, phomeme, user)


/obj/item/toy/plush/talking/guirec
	name = "chief engineer plushie"
	desc = "A Fumo Station series 1 plush of the Chief Engineer! Collect all the heads of staff!"
	messages = list("Of course!", "Those are my current laws.", "You're an amazing person!", "Please don't say something so weird. We don't need anything like that!", "Please don't associate me with Eugene.", "You're doing such a good job!", "What's a femboy...?")
	icon_state = "guirec"
	inhand_icon_state = "guirec"
	gender = MALE

/obj/item/toy/plush/talking/guirec/attackby(obj/item/I,mob/living/user,params)
	if(istype(I, /obj/item/toy/clockwork_watch))
		user.visible_message("<span class='notice'>[user] watches as [src] falls unconscious at the sight of the watch!</span>", "<span class='notice'>[src] undergoes a violent transformation. Ratvar has possessed him!</span>")
		playsound(src, 'sound/effects/ratvar_reveal.ogg', 50, 1)
		qdel(I)
		qdel(src)
		var/turf/location = get_turf(user)
		new/obj/item/toy/plush/talking/ratrec(location)

/obj/item/toy/plush/talking/ratrec
	name = "possessed chief engineer plushie"
	desc = "A Fumo Station series 1 plush of the Chief Engineer, but something seems wrong. You can faintly hear a clock ticking"
	messages = list("Organic.", "...You wouldn't happen to have any cheesecake, would you?", "I hate the King of Goats.", "I arise once more!!", "Pathetic.", "Don't associate me with that witch Nar'sie!", "This is the promised 'humanity's love'?", "I'm...small.")
	icon_state = "ratvar"
	inhand_icon_state = "ratvar"
	gender = MALE


/obj/item/toy/plush/talking/chef
	name = "head of service plushie"
	desc = "A Fumo Station series 1 plush of the Head of Service! Collect all the heads of staff!"
	messages = list("You'd all starve without me, huh?", "Rescinding of the Eight Boundaries...", "I'll make Gramps proud.", "...What do you mean you can make walls out of pizza.", "Pete talks to me, you know.", "This is all just a dream...")
	icon_state = "chef"
	inhand_icon_state = "chef"
	gender = MALE

/obj/item/toy/plush/talking/chef/attackby(obj/item/I,mob/living/user,params)
	if(istype(I, /obj/item/storage/fancy/cigarettes/cigpack_candy))
		user.visible_message("<span class='notice'>[user] watches as [src] falls unconscious at the sight of the candy cigarettes!</span>", "<span class='notice'>[src] undergoes a beautiful transformation. The King of Goats has possessed him!</span>")
		playsound(src, 'modular_heaven/modules/plushies/sounds/sound_ambience_theking.ogg', 50, 1)
		qdel(I)
		qdel(src)
		var/turf/location = get_turf(user)
		new/obj/item/toy/plush/talking/kinglawrence(location)

/obj/item/toy/plush/talking/kinglawrence
	name = "possessed head of service plushie"
	desc = "A Fumo Station series 1 plush of the Head of Service, but something seems wrong. You can faintly hear a goat bleating."
	messages = list("Welcome to my courtyard.", "I hope Ratvar isn't too upset...", "Please be kind to my Guest.", "Please do calm down! We could chat over cheesecake!", "*bleats* Excuse me...", "Humans have unlimited potential...")
	icon_state = "king"
	inhand_icon_state = "king"
	gender = MALE

/obj/item/toy/plush/talking/rushia
	name = "janitor plushie"
	desc = "A leaked Fumo Station series 2 plush of the Janitor! This shouldn't be here!!"
	messages = list("Uweh...", "Ish alwight!", "*boot eating noises*", "*flutter flutter*")
	icon_state = "rushia"
	inhand_icon_state = "rushia"
	gender = FEMALE

/obj/item/toy/plush/talking/rushia/attackby(obj/item/I,mob/living/user,params)
	if(istype(I, /obj/item/melee/baseball_bat))
		user.visible_message("<span class='notice'>[user] watches as [src] turns deathly still!</span>", "<span class='notice'>[src] turns into a shadow of herself. Reshia has taken over!</span>")
		playsound(src, 'sound/hallucinations/im_here2.ogg', 50, 1)
		qdel(I)
		qdel(src)
		var/turf/location = get_turf(user)
		new/obj/item/toy/plush/talking/reshia(location)

/obj/item/toy/plush/talking/reshia
	name = "transformed janitor plushie"
	desc = "Something happened to the janitor plushie. No matter what kind of light you put her under, she's always obscured in shadow. Freaky..."
	messages = list("...", "Sorry about this", "...", "...", "Tetsu...", "...", "I'm... scared.")
	icon_state = "reshia"
	inhand_icon_state = "reshia"
	gender = FEMALE

/obj/item/toy/plush/talking/reshia/attackby(obj/item/I,mob/living/user,params)
	if(istype(I, /obj/item/clothing/neck/collar))
		user.visible_message("<span class='notice'>[user] watches as [src] snatches the leash away!</span>", "<span class='notice'>[src] She undergoes a violent transformation and is possessed by......oh no.</span>")
		playsound(src, 'sound/creatures/narsie_rises.ogg', 50, 1)
		qdel(I)
		qdel(src)
		var/turf/location = get_turf(user)
		new/obj/item/toy/plush/talking/narshia(location)

/obj/item/toy/plush/talking/narshia
	name = "possessed janitor plushie"
	desc = "Something is seriously wrong."
	messages = list("I have risen!", "You'll look good in this.", "KYAHAHAHAHAHAHAHAHA", "Congratula~tions~!", "Where's that little boy?", "*cackle cackle cackle*")
	inhand_icon_state = "narshia"
	icon_state = "narshia"
	gender = FEMALE

/obj/item/toy/plush/talking/tay
	name = "captain plushie"
	desc = "A Fumo Station series 1 plush of the Captain! Collect all the heads of staff!"
	messages = list("You could've just asked to come in.", "I'll get to the bottom of this.", "Could you all please clean up after yourselves for once?", "Feels nice to have a family again...", "The only good God is a dead one.", "Of course Runtime is a crew member!")
	inhand_icon_state = "tay"
	icon_state = "tay"
	gender = MALE

/obj/item/toy/plush/talking/ulyssa
	name = "head of security plushie"
	desc = "A Fumo Station series 1 plush of the Head of Security! Collect all the heads of staff!"
	messages = list("*coughs*", "You're a good kid.", "Here's looking at you, kid.", "Go ahead, make my day.", "I've got this theory about the station...", "My lungs are fine. Fuck off.")
	inhand_icon_state = "ulyssa"
	icon_state = "ulyssa"
	gender = FEMALE

/obj/item/toy/plush/talking/eugene
	name = "head of research plushie"
	desc = "A Fumo Station series 1 plush of the Head of Research! Collect all the heads of staff!"
	messages = list("The ends justify the means.", "*adjusts glasses*", "I will not die a preventable death this shift. Don't be rude.", "What the bloody hell is ToonTown??", "I assure you everyone does not hate me.", "If you find any strange objects, make sure to bring them to me.", "I don't have a tea addiction, don't be ridiculous.", "What is 'Peppa Pig'?")
	inhand_icon_state = "eugene"
	icon_state = "eugene"
	gender = MALE

/obj/item/toy/plush/goatplush
	name = "child's goat plush"
	icon = 'modular_heaven/modules/plushies/icons/plushes.dmi'
	icon_state = "goatplush"
	desc = "A nice, gentle goat plushie. It looks like someone repaired it very lovingly. You're reminded of happier, more innocent days looking at this plush."
	inhand_icon_state = "goatplush"

/obj/item/toy/plush/talking/geschutzt
	name = "Geschutzt"
	desc = "The last apostle. You somehow managed to never notice this one, yet it looks very familiar to someone you cherish. You notice some new additions however...a red beret with a star hair pin, blue hair and bow ties, a juicebox, and a peculiar golden box a certain goat used to carry around. You feel a sense of nostalgia that makes you wanna cry looking at this.."
	messages = list("Bitte verlass mich nicht...", "Bleib bei mir...", "Beschütze mich, Zevachya ...", "*sobs*", "Bitte verletzt mich nicht ....", "Ich möchte nicht, dass du leidest ...")
	icon_state = "geschutzt"
	inhand_icon_state = "geschutzt"

/obj/item/toy/plush/moth/conversion
	name = "suspicious moth plushie"
	desc = "Its eyes are completely black & bloodshot, which you didn't think was possible for a moth. Creepy."
	icon = 'modular_heaven/modules/plushies/icons/plushes.dmi'
	icon_state = "moffplushevil"

/obj/item/toy/plush/moth/conversion/attack_self(mob/user)
	for(var/mob/living/carbon/human/H in view(7,loc))
		H.set_species(/datum/species/moth)
		playsound(H, 'sound/voice/moth/scream_moth.ogg', 100, TRUE)
		to_chat(H, "<span class='notice'>Your body contorts into a nefariously adorable form!</span.?>")
