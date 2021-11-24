//MODULAR ID TRIM ACCESS OVERRIDES GO HERE!!

/datum/id_trim/job/quartermaster
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION,
				ACCESS_MINERAL_STOREROOM, ACCESS_VAULT, ACCESS_AUX_BASE, ACCESS_KEYCARD_AUTH, ACCESS_RC_ANNOUNCE, ACCESS_SEC_DOORS, ACCESS_HEADS)

/datum/id_trim/job/nanotrasen_representative
	assignment = "Nanotrasen Representative"
	trim_icon = 'modular_skyrat/master_files/icons/obj/card.dmi'
	trim_state = "trim_nanotrasenrepresentative"
	extra_access = list()
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_COURT, ACCESS_WEAPONS,
				ACCESS_MEDICAL, ACCESS_PSYCHOLOGY, ACCESS_ENGINE, ACCESS_CHANGE_IDS, ACCESS_AI_UPLOAD, ACCESS_EVA, ACCESS_HEADS,
				ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_JANITOR, ACCESS_CONSTRUCTION, ACCESS_MORGUE,
				ACCESS_CREMATORIUM, ACCESS_KITCHEN, ACCESS_HYDROPONICS, ACCESS_LAWYER,
				ACCESS_MECH_ENGINE, ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL,
				ACCESS_THEATRE, ACCESS_CHAPEL_OFFICE, ACCESS_LIBRARY, ACCESS_RESEARCH, ACCESS_VAULT, ACCESS_MINING_STATION,
				ACCESS_HOP, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM, ACCESS_AUX_BASE, ACCESS_TELEPORTER, ACCESS_CENT_GENERAL)
	extra_wildcard_access = list(ACCESS_CAPTAIN, ACCESS_CENT_GENERAL)
	minimal_wildcard_access = list(ACCESS_CAPTAIN, ACCESS_CENT_GENERAL)
	config_job = "nanotrasen_representative"
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)

/datum/id_trim/job/captain/shuttle_pilot
	assignment = "Shuttle Pilot"
	trim_state = "trim_shuttlepilot"
	config_job = "shuttle pilot"

/datum/id_trim/job/security_medic
	assignment = "Security Medic"
	trim_icon = 'modular_skyrat/master_files/icons/obj/card.dmi'
	trim_state = "trim_securitymedic"
	extra_access = list(ACCESS_FORENSICS_LOCKERS, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_VIROLOGY)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY, ACCESS_MINERAL_STOREROOM,
				ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS)
	config_job = "security_medic"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOS, ACCESS_CHANGE_IDS)

/datum/id_trim/job/security_medic/New()
	. = ..()

	// Config check for if sec has maint access.
	if(CONFIG_GET(flag/security_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)

/datum/id_trim/job/junior_officer
	assignment = "Civil Disputes Officer"
	trim_icon = 'modular_skyrat/master_files/icons/obj/card.dmi'
	trim_state = "trim_juniorofficer"
	extra_access = list()
	minimal_access = list(ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MECH_SECURITY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM,
				ACCESS_MAINT_TUNNELS)

	config_job = "junior_officer"
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOS, ACCESS_CHANGE_IDS)

/datum/id_trim/job/junior_officer/New()
	. = ..()

	// Config check for if sec has maint access.
	if(CONFIG_GET(flag/security_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)
