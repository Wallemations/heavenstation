/datum/job/voidtech
	title = "Void Technician"
	department_head = list("Chief Engineer", "Research Director")
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the chief engineer and the research director"
	selection_color = "#fff5cc"
	exp_requirements = 60
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/voidtech
	plasmaman_outfit = /datum/outfit/plasmaman/atmospherics

	liver_traits = list(TRAIT_ENGINEER_METABOLISM)

	departments_list = list(
		/datum/job_department/engineering,
		/datum/job_department/science
		)

	family_heirlooms = list(/obj/item/storage/box/matches, /obj/item/radio)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	rpg_title = "Voidmancer"

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_ENG
	display_order = JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN
	bounty_types = CIV_JOB_ENG

/datum/outfit/job/voidtech
	name = "Void Technician"
	jobtype = /datum/job/voidtech

	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/pda/voidtech
	ears = /obj/item/radio/headset/subspace/void
	uniform = /obj/item/clothing/under/rank/engineering/void
	shoes = /obj/item/clothing/shoes/workboots

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	box = /obj/item/storage/box/survival/engineer
	pda_slot = ITEM_SLOT_LPOCKET
	backpack_contents = list(/obj/item/stack/rods/fifty)

	id_trim = /datum/id_trim/job/voidtech

/datum/id_trim/job/voidtech
	assignment = "Void Technician"
	trim_icon = 'modular_heaven/modules/jobs/cards/icons/trims.dmi'
	trim_state = "trim_voidtechnician"
	extra_access = list(ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_MECH_ENGINE, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION,
								ACCESS_MINERAL_STOREROOM, ACCESS_ATMOSPHERICS, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_MECH_ENGINE, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_MINERAL_STOREROOM)
	config_job = "void_technician"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CE, ACCESS_CHANGE_IDS)
	job = /datum/job/voidtech
