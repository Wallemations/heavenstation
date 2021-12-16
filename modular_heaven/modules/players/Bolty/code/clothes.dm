// WHERE'S THAT DAMN CHAOS EMERALD

/obj/item/clothing/under/suit/king_attire
	name = "King's Attire"
	desc = "An elegant white suit, fit for someone of high class. Occasionally white pedals can be seen falling out of the suit jacket."
	icon = 'modular_heaven/modules/players/Bolty/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Bolty/icons/worn_suits.dmi'
	icon_state = "king_attire"
	inhand_icon_state = "king_attire"

// lawrence

/obj/item/clothing/under/suit/stolen_captain_uniform
	name = "Stolen Uniform"
	desc = "A uniform that seems to fit you perfectly, one of the sleeves appears to be torn off."
	icon = 'modular_heaven/modules/players/Bolty/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Bolty/icons/worn_suits.dmi'
	icon_state = "stolen_captain_uniform"
	inhand_icon_state = "stolen_captain_uniform"
	body_parts_covered = CHEST|GROIN|LEGS|FEET

/obj/item/clothing/neck/chefbandana
	name = "chef bandana"
	desc = "Smells like goat."
	icon = 'modular_heaven/modules/players/Bolty/icons/UH_OH_I_ALMOST_FORGOT_TO_ADD_THIS.dmi'
	worn_icon = 'modular_heaven/modules/players/Bolty/icons/worn_neck.dmi'
	icon_state = "chefbandana"
	inhand_icon_state = "chefbandana"
	dynamic_hair_suffix = ""

/obj/item/clothing/gloves/armistice
	name = "Armistice"
	desc = "A temporary replacement. Filled with intense magical energy, a mere swing of this arm can erase any darkness."
	icon = 'modular_heaven/modules/players/Bolty/icons/gloves.dmi'
	worn_icon = 'modular_heaven/modules/players/Bolty/icons/worn_gloves.dmi'
	icon_state = "armistice"
	inhand_icon_state = "armistice"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	strip_delay = 99180
	undyeable = TRUE
	body_parts_covered = ARMS
	cold_protection = ARMS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	force = 1
	damtype = BURN
	armor = list(MELEE = 100, BULLET = 100, LASER = 100, ENERGY = 100, BOMB = 100, BIO = 100, RAD = 100, FIRE = 100, ACID = 100)

// boopie

/obj/item/clothing/suit/corset
	name = "Centcomm Top"
	desc = "You used to wear red, but green fits you a lot more nicely."
	icon = 'modular_heaven/modules/players/Bolty/icons/corset.dmi'
	worn_icon = 'modular_heaven/modules/players/Bolty/icons/worn_corset.dmi'
	icon_state = "corset"
	inhand_icon_state = "corset"

/obj/item/clothing/glasses/mystic_killer
	name = "Strange Glasses"
	desc = "Mystic Eye Killers. They're more for everyone else's safety than your own. "
	icon = 'modular_heaven/modules/players/Bolty/icons/glasses.dmi'
	worn_icon = 'modular_heaven/modules/players/Bolty/icons/worn_glasses.dmi'
	icon_state = "mystic_killer"
	inhand_icon_state = "mystic_killer"

/obj/item/clothing/under/rank/centcom/administrator
	name = "\improper CentCom Administrator Uniform"
	desc = "Your uniform! Though you refuse to wear the actual uniform. The colors fit you nicely atleast!"
	icon = 'modular_heaven/modules/players/Bolty/icons/centcom.dmi'
	worn_icon = 'modular_heaven/modules/players/Bolty/icons/worn_centcom.dmi'
	icon_state = "administrator"
	inhand_icon_state = "administrator"
	can_adjust = FALSE
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 10, BIO = 10, RAD = 0, FIRE = 0, ACID = 35)

// bitch

/obj/item/clothing/under/costume/servicesuit
	name = "Service Suit"
	desc = "A gift from Guirec, you'd probably die of embarassment if anyone but him saw you in this."
	icon = 'modular_heaven/modules/players/Bolty/icons/servicesuit.dmi'
	worn_icon = 'modular_heaven/modules/players/Bolty/icons/worn_costume.dmi'
	icon_state = "servicesuit"
	inhand_icon_state = "servicesuit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
