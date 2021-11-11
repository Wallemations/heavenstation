/obj/item/pda/voidtech
	name = "void technician PDA"
	default_cartridge = /obj/item/cartridge/engineering
	greyscale_config = /datum/greyscale_config/pda/stripe_thick
	greyscale_colors = "#ff9933#ffffff#9933ff"

/obj/item/radio/headset/subspace/void
	name = "voidtech's subspace headset"
	desc = "A headset made with special tech in mind to explore deep space. A rarity around these parts"
	icon_state = "subspace_headset"
	keyslot = new /obj/item/encryptionkey/headset_void
	subspace_transmission = FALSE

/obj/item/encryptionkey/headset_void
	name = "void technician radio encryption key"
	icon_state = "eng_cypherkey"
	channels = list(RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_ENGINEERING = 1)

/obj/item/clothing/under/rank/engineering/void
	desc = "It's a grey jumpsuit worn by those that love the void."
	name = "void technician's jumpsuit"
	icon = 'modular_heaven/modules/jobs/void_tech/icons/tech.dmi'
	worn_icon = 'modular_heaven/modules/jobs/void_tech/icons/tech_worn.dmi'
	icon_state = "voidtech"
	inhand_icon_state = "void_suit"
	lefthand_file = 'modular_heaven/modules/jobs/void_tech/icons/left.dmi'
	righthand_file = 'modular_heaven/modules/jobs/void_tech/icons/right.dmi'
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 30, ACID = 10)
	resistance_flags = NONE

/obj/item/clothing/head/helmet/space/hardsuit/voidtech
	name = "voidtech hardsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Trades all protection for speed."
	icon_state = "hardsuit0-voidtech"
	inhand_icon_state = "void_hardsuit"
	lefthand_file = 'modular_heaven/modules/jobs/void_tech/icons/left.dmi'
	righthand_file = 'modular_heaven/modules/jobs/void_tech/icons/right.dmi'
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 10, BIO = 75, RAD = 15, FIRE = 30, ACID = 15, WOUND = 10)
	hardsuit_type = "voidtech"

/obj/item/clothing/suit/space/hardsuit/voidtech
	name = "voidtech hardsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Trades all protection for speed."
	icon_state = "hardsuit-voidtech"
	inhand_icon_state = "void_hardsuit"
	lefthand_file = 'modular_heaven/modules/jobs/void_tech/icons/left.dmi'
	righthand_file = 'modular_heaven/modules/jobs/void_tech/icons/right.dmi'
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 10, BIO = 75, RAD = 15, FIRE = 30, ACID = 15, WOUND = 10)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/voidtech
	slowdown = 0.15

/obj/machinery/suit_storage_unit/voidtech
	suit_type = /obj/item/clothing/suit/space/hardsuit/voidtech
	mask_type = /obj/item/clothing/mask/breath
