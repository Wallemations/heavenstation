// AAAAAAAAAAAAAAAAAAAAAAAAAA

/obj/item/clothing/head/prince
	name = "Prince's crown"
	desc = "A crown of thorns, but it's blossoming."
	icon = 'modular_heaven/modules/players/Dosh/icons/hat.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_hat.dmi'
	icon_state = "prince"
	inhand_icon_state = "prince"
	resistance_flags = FIRE_PROOF |  ACID_PROOF

/obj/item/clothing/under/suit/prince
	name = "Prince Uniform"
	desc = "A formal uniform fit for your position, specially made with four sleeves."
	icon = 'modular_heaven/modules/players/Dosh/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_suits.dmi'
	icon_state = "prince"
	inhand_icon_state = "prince"
	resistance_flags = FIRE_PROOF | ACID_PROOF
	body_parts_covered = CHEST|GROIN|LEGS

/obj/item/clothing/neck/cloak/prince
	name = "Prince's cloak"
	desc = "A stylish cape. It's crooked because you can't figure out how to wear it. Don't tell anyone."
	icon = 'modular_heaven/modules/players/Dosh/icons/cloak.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_cloak.dmi'
	icon_state = "prince"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/gloves/prince
	name = "Prince Gloves"
	desc = "Four gloves. Two of armor and two that just look cool."
	icon = 'modular_heaven/modules/players/Dosh/icons/gloves.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_gloves.dmi'
	icon_state = "prince"
	inhand_icon_state = "prince"
	resistance_flags = FIRE_PROOF |  ACID_PROOF
	undyeable = TRUE

/obj/item/clothing/shoes/prince
	name = "Prince's Boots"
	desc = "Comfortable boots, though you could do without the heels..."
	icon = 'modular_heaven/modules/players/Dosh/icons/shoes.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_shoes.dmi'
	icon_state = "prince"
	can_be_tied = FALSE
	resistance_flags = FIRE_PROOF

//ratvar stuff

/obj/item/clothing/under/suit/ratvar
	name = "Clockwork Suit"
	desc = "A weird suit. Why does it sound like a clock is ticking?"
	icon = 'modular_heaven/modules/players/Dosh/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_suits.dmi'
	icon_state = "ratvar_suit"
	inhand_icon_state = "ratvar_suit"
	resistance_flags = FIRE_PROOF | ACID_PROOF
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/gloves/ratvar
	name = "Clockwork Gloves"
	desc = "Large brass gloves. They kind of make you want to hold your arms in an awkward position."
	icon = 'modular_heaven/modules/players/Dosh/icons/gloves.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_gloves.dmi'
	icon_state = "ratvargloves"
	inhand_icon_state = "ratvargloves"
	resistance_flags = FIRE_PROOF |  ACID_PROOF
	undyeable = TRUE

/obj/item/clothing/shoes/ratvar
	name = "Clockwork Boots"
	desc = "Shoes made for a god. Despite how they look, they're not that loud."
	icon = 'modular_heaven/modules/players/Dosh/icons/shoes.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_shoes.dmi'
	icon_state = "ratvarshoes"
	inhand_icon_state = "ratvarshoes"
	resistance_flags = FIRE_PROOF |  ACID_PROOF
	can_be_tied = FALSE

/obj/item/clothing/under/suit/servant
	name = "servant's suit"
	desc = "A suit for those under Her heel. Red really isn't your color."
	icon = 'modular_heaven/modules/players/Dosh/icons/suits.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_suits.dmi'
	icon_state = "servantsuit"
	resistance_flags = FIRE_PROOF | ACID_PROOF

//uh

/obj/item/clothing/neck/tie/red/guirec
	name = "Chief Engineer's tie"
	resistance_flags = FIRE_PROOF

// i'm going to

/obj/item/clothing/under/rank/engineering/engineeringsuit
	name = "Engineering Suit"
	desc = "Don't let Mothia see this."
	icon = 'modular_heaven/modules/players/Dosh/icons/engisuit.dmi'
	worn_icon = 'modular_heaven/modules/players/Dosh/icons/worn_engisuit.dmi'
	icon_state = "engineeringsuit"
	inhand_icon_state = "engineeringsuit"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 80, "fire" = 60, "acid" = 20)
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE

