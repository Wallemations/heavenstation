/obj/item/radio/headset/heads/hoser
	name = "\proper the head of service's headset"
	desc = "The headset of the guy stopping us from starving."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/heads/hop

/obj/item/computer_hardware/hard_drive/role/hoser
	name = "\improper Crispy-N'-Clean disk"
	icon_state = "datadisk7"
	disk_flags = DISK_MANIFEST | DISK_STATUS | DISK_JANI | DISK_ROBOS | DISK_BUDGET | DISK_SCI
	bot_access = list(
		CLEAN_BOT,
		VIBE_BOT,
	)

/obj/item/modular_computer/tablet/pda/heads/hoser
	name = "head of service PDA"
	default_disk = /obj/item/computer_hardware/hard_drive/role/hop
	greyscale_config = /datum/greyscale_config/tablet/head
	greyscale_colors = "#469746#00ff00"

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
