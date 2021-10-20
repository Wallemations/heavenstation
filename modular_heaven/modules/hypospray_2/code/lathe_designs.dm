/datum/design/hypovialsmall
	name = "Hypovial"
	id = "hypovial"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/reagent_containers/glass/hypovial/small
	category = list("initial","Medical","Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/hypoviallarge
	name = "Large Hypovial"
	id = "large_hypovial"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 2500)
	build_path = /obj/item/reagent_containers/glass/hypovial/large
	category = list("initial","Medical","Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/hypomii
	name = "Experimental Hypospray"
	desc = "A device which enables the rapid injecting or spraying of a patient."
	id = "hyposprayII"
	build_type = PROTOLATHE
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
	materials = list(/datum/material/titanium = 1000, /datum/material/glass = 3000, /datum/material/diamond = 2000)
	build_path = /obj/item/hypospray/mkii
	category = list("Medical Designs")
