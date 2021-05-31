/datum/job/voidtech
	title = "Void Technician"
	department_head = list("Chief Engineer")
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the chief engineer"
	selection_color = "#fff5cc"
	exp_requirements = 60
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/voidtech

	access = list(ACCESS_ENGINE, ACCESS_ENGINE_EQUIP,ACCESS_MECH_ENGINE, ACCESS_EXTERNAL_AIRLOCKS,
								ACCESS_CONSTRUCTION, ACCESS_MINERAL_STOREROOM, ACCESS_ATMOSPHERICS, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_MECH_ENGINE,
								ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_ENG

	display_order = JOB_DISPLAY_ORDER_STATION_ENGINEER
	bounty_types = CIV_JOB_ENG

/datum/outfit/job/voidtech
	name = "Void Technician"
	jobtype = /datum/job/voidtech

	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/pda/engineering
	ears = /obj/item/radio/headset/subspace/void
	uniform = /obj/item/clothing/under/rank/engineering/void
	shoes = /obj/item/clothing/shoes/workboots

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	box = /obj/item/storage/box/survival/engineer
	pda_slot = ITEM_SLOT_LPOCKET
	backpack_contents = list(/obj/item/stack/rods/fifty)

	skillchip_path = /obj/item/skillchip/job/engineer
