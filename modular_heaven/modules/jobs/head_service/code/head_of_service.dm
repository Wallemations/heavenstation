/datum/job/head_of_service
	title = JOB_HEAD_OF_SERVICE
	description = "Keep the station fed, clean, drunk, and happy. \
  		(Option 3 usually helps with the rest.) \
  		Then hoard all of the remaining food for yourself to start a coup."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list(JOB_CAPTAIN)
	head_announce = list(RADIO_CHANNEL_SERVICE)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#bbe291"
	req_admin_notify = 1
	minimal_player_age = 10
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SERVICE
	exp_granted_type = EXP_TYPE_CREW

	liver_traits = list(TRAIT_CULINARY_METABOLISM)

	outfit = /datum/outfit/job/head_of_service
	plasmaman_outfit = /datum/outfit/plasmaman/chef
	departments_list = list(
		/datum/job_department/service,
		/datum/job_department/command,
		)

	mail_goodies = list(
		/obj/item/storage/box/ingredients/random = 80,
		/obj/item/grenade/chem_grenade/cleaner = 30,
		/obj/item/reagent_containers/glass/bottle/caramel = 20,
		/obj/item/reagent_containers/food/condiment/flour = 20,
		/obj/item/reagent_containers/food/condiment/rice = 20,
		/obj/item/reagent_containers/food/condiment/enzyme = 15,
		/obj/item/reagent_containers/food/condiment/soymilk = 15,
		/obj/item/knife/kitchen = 4,
		/obj/item/knife/butcher = 2
	)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SRV
	bounty_types = CIV_JOB_CHEF

	family_heirlooms = list(/obj/item/reagent_containers/food/condiment/saltshaker, /obj/item/kitchen/rollingpin, /obj/item/clothing/head/chefhat)
	rpg_title = "Tavern Owner"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN
	display_order = JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL
	voice_of_god_power = 1.4 //Command staff has authority


/datum/job/head_of_service/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly promoted Acting Captain [captain.real_name] on deck!"

/datum/outfit/job/head_of_service
	name = "Head of Service"
	jobtype = /datum/job/head_of_service

	id = /obj/item/card/id/advanced/silver
	belt = /obj/item/modular_computer/tablet/pda/heads/hoser
	ears = /obj/item/radio/headset/heads/hoser
	uniform = /obj/item/clothing/under/rank/civilian/chef
	suit = /obj/item/clothing/suit/toggle/chef
	backpack_contents = list(/obj/item/sharpener = 1)
	pda_slot = ITEM_SLOT_BELT
	id_trim = /datum/id_trim/job/head_of_service

/datum/outfit/job/head_of_service/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/list/possible_boxes = subtypesof(/obj/item/storage/box/ingredients)
	var/chosen_box = pick(possible_boxes)
	var/obj/item/storage/box/I = new chosen_box(src)
	H.equip_to_slot_or_del(I,ITEM_SLOT_BACKPACK)
	var/datum/martial_art/cqc/under_siege/justacook = new
	justacook.teach(H)

/datum/id_trim/job/head_of_service
	assignment = "Head of Service"
	intern_alt_name = "Head of Service-in-Training"
	trim_icon = 'modular_heaven/modules/jobs/cards/icons/trims.dmi'
	trim_state = "trim_headofservice"
	sechud_icon_state = SECHUD_HEAD_OF_SERVICE
	extra_access = list(ACCESS_TELEPORTER)
	extra_wildcard_access = list()
	minimal_access = list(ACCESS_BAR, ACCESS_CHAPEL_OFFICE, ACCESS_COURT, ACCESS_EVA, ACCESS_GATEWAY, ACCESS_COMMAND, ACCESS_HYDROPONICS, ACCESS_JANITOR,
					ACCESS_KEYCARD_AUTH, ACCESS_KITCHEN, ACCESS_LAWYER, ACCESS_LIBRARY, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_PSYCHOLOGY,
					ACCESS_QM, ACCESS_RC_ANNOUNCE, ACCESS_RESEARCH, ACCESS_BRIG_ENTRANCE, ACCESS_THEATRE)
	minimal_wildcard_access = list(ACCESS_HOSE)
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)
	job = /datum/job/head_of_service
