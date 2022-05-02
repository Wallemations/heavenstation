// Rodent plushes

/obj/item/toy/plush/rodent
	icon = 'modular_heaven/modules/plushies/icons/rodent_plush.dmi'
	desc = "This one's the parent, you're looking for the kids."
	icon_state = "mouseplushie"

/obj/item/toy/plush/rodent/borbplushie
	name = "borb plushie"
	desc = "An adorable stuffed toy that resembles a round, fluffy looking bird. Not to be mistaken for his friend, the birb plushie."
	icon_state = "plushie_borb"
	inhand_icon_state = "plushie_borb"
	attack_verb_continuous = list("pecks", "peeps")
	attack_verb_simple = list("peck", "peep")

/obj/item/toy/plush/rodent/deer
	name = "deer plushie"
	desc = "An adorable stuffed toy that resembles a deer."
	icon_state = "plushie_deer"
	inhand_icon_state = "plushie_deer"
	attack_verb_continuous = list("headbutts", "boops", "bapps", "bumps")
	attack_verb_simple = list("headbutt", "boop", "bap", "bump")
	squeak_override = list('modular_heaven/modules/plushies/sounds/squeak.ogg' = 1)
	unique_reskin = list("Small" = "plushie_deer",
						"Realistic" = "deer"
						)

/obj/item/toy/plush/rodent/bot
	attack_verb_continuous = list("beeps", "boops", "pings")
	attack_verb_simple = list("beep", "boop", "ping")
	squeak_override = list('sound/machines/beep.ogg' = 1)

/obj/item/toy/plush/rodent/bot/sechound
	name = "Sechound plushie"
	desc = "An adorable stuffed toy of a SecHound, the popular childrens TV character, who keeps his station safe!"
	icon_state = "plushie_securityk9"
	inhand_icon_state = "plushie_securityk9"

/obj/item/toy/plush/rodent/bot/medihound
	name = "Medihound plushie"
	desc = "An adorable stuffed toy of a medihound, the popular childrens TV character, who keeps his station healthy!"
	icon_state = "plushie_medihound"
	inhand_icon_state = "plushie_medihound"

/obj/item/toy/plush/rodent/bot/scrubpuppy
	name = "Scrubpuppy plushie"
	desc = "An adorable stuffed toy of a Scrubpuppy, the popular childrens TV character, who keeps the station clean!"
	icon_state = "plushie_scrubpuppy"
	inhand_icon_state = "plushie_scrubpuppy"

/obj/item/toy/plush/rodent/bot/meddrake
	name = "MediDrake Plushie"
	desc = "An adorable stuffed toy of a Medidrake. It's a collectable misprint of a medihound plush!"
	icon_state = "plushie_meddrake"
	inhand_icon_state = "plushie_meddrake"

/obj/item/toy/plush/rodent/bot/secdrake
	name = "SecDrake Plushie"
	desc = "An adorable stuffed toy of a Secdrake. It's a collectable misprint of a sechound plush!"
	icon_state = "plushie_secdrake"
	inhand_icon_state = "plushie_secdrake"

/obj/item/toy/plush/rodent/fox
	name = "Fox plushie"
	desc = "An adorable stuffed toy of a Fox."
	icon_state = "redfox"
	inhand_icon_state = "redfox"
	attack_verb_continuous = list("geckers", "boops","nuzzles")
	attack_verb_simple = list("gecker", "boop", "nuzzle")
	squeak_override = list('modular_heaven/modules/plushies/sounds/squeak.ogg' = 1)
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


/obj/item/toy/plush/rodent/ian
	name = "plush corgi"
	desc = "A plushie of an adorable corgi! Don't you just want to hug it and squeeze it and call it \"Ian\"?"
	icon_state = "corgi"
	inhand_icon_state = "corgi"
	attack_verb_continuous = list("barks", "woofs", "wags his tail at")
	attack_verb_simple = list("lick", "nuzzle", "bite")
	gender = MALE
	young = 1 //No.

/obj/item/toy/plush/rodent/ian/lisa
	name = "plush girly corgi"
	desc = "A plushie of an adorable corgi! Don't you just want to hug it and squeeze it and call it \"Lisa\"?"
	icon_state = "girlycorgi"
	inhand_icon_state = "girlycorgi"
	attack_verb_continuous = list("barks", "woofs", "wags her tail at")
	gender = FEMALE

/obj/item/toy/plush/rodent/ian/robo
	name = "plush robo corgi"
	desc = "A plushie of an adorable corgi! Don't you just want to hug it and squeeze it and call it \"DESTRUCTON\"?"
	icon_state = "robotcorgi"
	inhand_icon_state = "robotcorgi"
	attack_verb_continuous = list("barks", "woofs", "wags its tail at")
	gender = NEUTER
	squeak_override = list('sound/machines/beep.ogg' = 1)

/obj/item/toy/plush/rodent/cat
	name = "cat plushie"
	desc = "A small cat plushie with black beady eyes."
	icon_state = "blackcat"
	inhand_icon_state = "blackcat"
	attack_verb_continuous = list("cuddles", "meows", "hisses")
	attack_verb_simple = list("cuddle", "meow", "hiss")
	squeak_override = list('modular_heaven/modules/plushies/sounds/meow.ogg' = 1)
	unique_reskin = list("Black" = "blackcat",
						"Grey" = "greycat",
						"White" = "whitecat",
						"Orange" = "orangecat",
						"Siamese" = "siamesecat",
						"Tabby" = "tabbycat",
						"Tuxedo" = "tuxedocat",
						"Kitten" = "kittenplushie"
						)

/obj/item/toy/plush/rodent/mouse
	name = "plush mouse"
	desc = "A plushie of a tiny little mouse! This one might just"
	icon_state = "mouseplushie"
	inhand_icon_state = "mouseplushie"
	attack_verb_continuous = list("chitters", "squeaks", "nuzzles")
	attack_verb_simple = list("squeak", "nuzzle")

/obj/item/toy/plush/rodent/spider
	name = "Spider plushie"
	desc = "An adorable stuffed toy of a spider, it almost makes you forget these things are poisonous."
	icon_state = "spiderplushie"
	inhand_icon_state = "spiderplushie"
	squeak_override = list('modular_heaven/modules/plushies/sounds/spider.ogg' = 1)

/obj/item/toy/plush/rodent/hugger
	name = "Headhumper plushie"
	desc = "An adorable stuffed toy of a headhumper, this one won't try to cling to your face."
	icon_state = "huggable"
	inhand_icon_state = "huggable"
	squeak_override = list('modular_heaven/modules/plushies/sounds/spider.ogg' = 1)



