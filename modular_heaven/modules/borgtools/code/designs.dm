/datum/design/borg_upgrade_shrink
	name = "Cyborg Upgrade (Shrink)"
	id = "borg_upgrade_shrink"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/shrink
	materials = list(/datum/material/iron=20000, /datum/material/glass=5000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_surgicaltools
	name = "Cyborg Upgrade (Advanced Surgical Tools)"
	id = "borg_upgrade_surgicaltools"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/surgerytools
	materials = list(/datum/material/iron = 14500, /datum/material/glass = 7500, /datum/material/silver = 6000, /datum/material/gold = 1500,  /datum/material/diamond = 200, /datum/material/titanium = 8000, /datum/material/plasma = 2000)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/advanced_materials
	name = "Cyborg Upgrade (Advanced Materials)"
	id = "advanced_materials"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/advanced_materials
	materials = list(
		/datum/material/titanium=5000,
		/datum/material/iron=10000,
		/datum/material/uranium=5000,
		/datum/material/glass=10000,
		/datum/material/plasma=7500,
	)
	category = list("Cyborg Upgrade Modules")

/datum/techweb_node/cyborg_upg_engiminer
	module_designs = list("advanced_materials", )

/datum/techweb_node/cyborg_upg_med
	module_designs = list("borg_upgrade_surgicaltools")

/datum/design/borg_upgrade_surgicaltools
	name = "Cyborg Upgrade (Advanced Surgical Tools)"
	id = "borg_upgrade_surgicaltools"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/surgerytools
	materials = list(/datum/material/iron = 14500, /datum/material/glass = 7500, /datum/material/silver = 6000, /datum/material/gold = 1500,  /datum/material/diamond = 200, /datum/material/titanium = 8000, /datum/material/plasma = 2000)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")
