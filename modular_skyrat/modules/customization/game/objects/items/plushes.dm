// MODULAR PLUSHES

/obj/item/toy/plush/borbplushie
	name = "borb plushie"
	desc = "An adorable stuffed toy that resembles a round, fluffy looking bird. Not to be mistaken for his friend, the birb plushie."
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "plushie_borb"
	inhand_icon_state = "plushie_borb"
	attack_verb_continuous = list("pecks", "peeps")
	attack_verb_simple = list("peck", "peep")

/obj/item/toy/plush/deer
	name = "deer plushie"
	desc = "An adorable stuffed toy that resembles a deer."
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "plushie_deer"
	inhand_icon_state = "plushie_deer"
	attack_verb_continuous = list("headbutts", "boops", "bapps", "bumps")
	attack_verb_simple = list("headbutt", "boop", "bap", "bump")
	squeak_override = list('modular_skyrat/modules/customization/game/objects/items/sound/deerplush.ogg' = 1)
	unique_reskin = list("Small" = "plushie_deer",
						"Realistic" = "deer"
						)

/obj/item/toy/plush/sechound
	name = "Sechound plushie"
	desc = "An adorable stuffed toy of a SecHound, the popular childrens TV character, who keeps his station safe!"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "plushie_securityk9"
	inhand_icon_state = "plushie_securityk9"
	attack_verb_continuous = list("beeps", "boops", "pings")
	attack_verb_simple = list("beep", "boop", "ping")
	squeak_override = list('sound/machines/beep.ogg' = 1)

/obj/item/toy/plush/medihound
	name = "Medihound plushie"
	desc = "An adorable stuffed toy of a medihound, the popular childrens TV character, who keeps his station healthy!"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "plushie_medihound"
	inhand_icon_state = "plushie_medihound"
	attack_verb_continuous = list("beeps", "boops", "pings")
	attack_verb_simple = list("beep", "boop", "ping")
	squeak_override = list('sound/machines/beep.ogg' = 1)

/obj/item/toy/plush/scrubpuppy
	name = "Scrubpuppy plushie"
	desc = "An adorable stuffed toy of a Scrubpuppy, the popular childrens TV character, who keeps the station clean!"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "plushie_scrubpuppy"
	inhand_icon_state = "plushie_scrubpuppy"
	attack_verb_continuous = list("beeps", "boops", "pings")
	attack_verb_simple = list("beep", "boop", "ping")
	squeak_override = list('sound/machines/beep.ogg' = 1)

/obj/item/toy/plush/meddrake
	name = "MediDrake Plushie"
	desc = "An adorable stuffed toy of a Medidrake. It's a collectable misprint of a medihound plush!"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "plushie_meddrake"
	inhand_icon_state = "plushie_meddrake"
	attack_verb_continuous = list("beeps", "boops", "pings")
	attack_verb_simple = list("beep", "boop", "ping")
	squeak_override = list('sound/machines/beep.ogg' = 1)

/obj/item/toy/plush/secdrake
	name = "SecDrake Plushie"
	desc = "An adorable stuffed toy of a Secdrake. It's a collectable misprint of a sechound plush!"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "plushie_secdrake"
	inhand_icon_state = "plushie_secdrake"
	attack_verb_continuous = list("beeps", "boops", "pings")
	attack_verb_simple = list("beep", "boop", "ping")
	squeak_override = list('sound/machines/beep.ogg' = 1)


/obj/item/toy/plush/fox
	name = "Fox plushie"
	desc = "An adorable stuffed toy of a Fox."
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "redfox"
	inhand_icon_state = "redfox"
	attack_verb_continuous = list("geckers", "boops","nuzzles")
	attack_verb_simple = list("gecker", "boop", "nuzzle")
	squeak_override = list('modular_skyrat/modules/customization/game/objects/items/sound/deerplush.ogg' = 1)
	unique_reskin = list("Red" = "redfox",
						"Black" = "blackfox",
						"Marble" = "marblefox",
						"Blue" = "bluefox",
						"Orange" = "orangefox",
						"Coffee" = "coffeefox",
						"Pink" = "pinkfox",
						"Purple" = "purplefox",
						"Crimson" = "crimsonfox"
						)


/obj/item/toy/plush/ian
	name = "plush corgi"
	desc = "A plushie of an adorable corgi! Don't you just want to hug it and squeeze it and call it \"Ian\"?"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "corgi"
	inhand_icon_state = "corgi"
	attack_verb_continuous = list("barks", "woofs", "wags his tail at")
	attack_verb_simple = list("lick", "nuzzle", "bite")
	gender = MALE
	young = 1 //No.

/obj/item/toy/plush/ian/lisa
	name = "plush girly corgi"
	desc = "A plushie of an adorable corgi! Don't you just want to hug it and squeeze it and call it \"Lisa\"?"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "girlycorgi"
	inhand_icon_state = "girlycorgi"
	attack_verb_continuous = list("barks", "woofs", "wags her tail at")
	gender = FEMALE

/obj/item/toy/plush/ian/robo
	name = "plush robo corgi"
	desc = "A plushie of an adorable corgi! Don't you just want to hug it and squeeze it and call it \"DESTRUCTON\"?"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "robotcorgi"
	inhand_icon_state = "robotcorgi"
	attack_verb_continuous = list("barks", "woofs", "wags its tail at")
	gender = NEUTER
	squeak_override = list('sound/machines/beep.ogg' = 1)

/obj/item/toy/plush/cat
	name = "cat plushie"
	desc = "A small cat plushie with black beady eyes."
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "blackcat"
	inhand_icon_state = "blackcat"
	attack_verb_continuous = list("cuddles", "meows", "hisses")
	attack_verb_simple = list("cuddle", "meow", "hiss")
	squeak_override = list('modular_skyrat/modules/customization/game/objects/items/sound/merowr.ogg' = 1)
	unique_reskin = list("Black" = "blackcat",
						"Grey" = "greycat",
						"White" = "whitecat",
						"Orange" = "orangecat",
						"Siamese" = "siamesecat",
						"Tabby" = "tabbycat",
						"Tuxedo" = "tuxedocat",
						"Kitten" = "kittenplushie"
						)

/obj/item/toy/plush/mouse
	name = "plush mouse"
	desc = "A plushie of a tiny little mouse! This one might just"
	icon = 'modular_skyrat/master_files/icons/obj/plushes.dmi'
	icon_state = "mouseplushie"
	inhand_icon_state = "mouseplushie"
	attack_verb_continuous = list("chitters", "squeaks", "nuzzles")
	attack_verb_simple = list("squeak", "nuzzle")

