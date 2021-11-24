//Credit to coiscin on the ss13 spriting discord for the sprite
/obj/machinery/vending/blood
	name = "\improper Bloodbank"
	desc = "Blood perfect for a beating heart."
	product_ads = "We'll bleed you dry!;Bloody brilliant!;No such thing as too much blood!;Polycythemia? Never heard of her!;When you think bloodrites, think Bloodbank!;Made with real blood!"
	icon = 'modular_heaven/modules/vendors/icons/blood.dmi'
	icon_state = "bloodbank"
	icon_deny = "bloodbank-deny"
	products = list(
		/obj/item/reagent_containers/blood = 4,
		/obj/item/reagent_containers/blood/a_minus = 2,
		/obj/item/reagent_containers/blood/b_minus = 2,
		/obj/item/reagent_containers/blood/b_plus = 2,
		/obj/item/reagent_containers/blood/o_plus = 2,
	)
	premium = list(
		/obj/item/reagent_containers/blood/o_minus = 2,
		/obj/item/reagent_containers/blood/lizard = 2,
		/obj/item/reagent_containers/blood/ethereal = 2,
		/obj/item/reagent_containers/blood/random = 2,
	)
	contraband =list(
		/obj/item/reagent_containers/blood/universal = 1,
	)
	refill_canister = /obj/item/vending_refill/blood
	default_price = PAYCHECK_HARD
	extra_price = PAYCHECK_COMMAND
	payment_department = ACCOUNT_MED
	light_mask="bloodbank-light-mask"

/obj/item/vending_refill/blood
	machine_name = "\improper Bloodbank"
	icon_state = "refill_medical"
