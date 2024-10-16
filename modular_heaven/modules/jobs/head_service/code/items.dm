/obj/item/radio/headset/heads/hoser
	name = "\proper the head of service's headset"
	desc = "The headset of the guy stopping us from starving."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/hop

/obj/item/modular_computer/tablet/pda/heads/hoser
	name = "head of service PDA"
	greyscale_config = /datum/greyscale_config/tablet/head
	greyscale_colors = "#469746#00ff00"
	default_applications = list(
		/datum/computer_file/program/crew_manifest,
		/datum/computer_file/program/status,
		/datum/computer_file/program/science,
		/datum/computer_file/program/robocontrol,
		/datum/computer_file/program/budgetorders,
		/datum/computer_file/program/radar/custodial_locator,
	)

/obj/structure/closet/secure_closet/hose
	name = "\proper head of service's locker"
	icon = 'modular_heaven/modules/jobs/head_service/icons/locker.dmi'
	req_access = list(ACCESS_HOSE)
	icon_state = "hose"

/obj/structure/closet/secure_closet/hose/PopulateContents()
	..()
	new /obj/item/radio/headset/heads/hoser(src)
	new /obj/item/clothing/under/rank/civilian/chef(src)
	new /obj/item/clothing/suit/toggle/chef(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/lightreplacer(src)
	new /obj/item/knife/butcher(src)
	new /obj/item/knife/kitchen(src)
	new /obj/item/reagent_containers/glass/bucket(src)
	new /obj/item/mop(src)
	new /obj/item/reagent_containers/spray/cleaner(src)
	new /obj/item/reagent_containers/spray/cleaner(src)
	new /obj/item/grenade/chem_grenade/cleaner(src)
	new /obj/item/grenade/chem_grenade/cleaner(src)
	new /obj/item/grenade/chem_grenade/cleaner(src)
	new /obj/item/hand_labeler(src)
	new /obj/item/storage/box/lights/mixed(src)
	new /obj/item/toy/plush/goatplush(src)
//	new /obj/item/clothing/under/costume/frenchmaid(src)
//	new /obj/item/clothing/shoes/frenchmaid(src)
//	new /obj/item/clothing/head/frenchmaid(src)
//	new /obj/item/clothing/gloves/frenchmaid(src)
	new /obj/item/clothing/head/rabbitears(src)
//	new /obj/item/clothing/under/costume/servicesuit(src)
	new /obj/item/toy/plush/goatplush(src)
//	new /obj/item/specialphoto(src)
//	new /obj/item/guirecphoto(src)
//	new /obj/item/clothing/neck/chefbandana(src)
//  new /obj/item/knife/combat/ezel(src)
