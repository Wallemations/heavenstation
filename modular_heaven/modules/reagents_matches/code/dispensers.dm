
/obj/machinery/chem_dispenser
	/// Reagents added by custom modules
	var/list/modular_reagents
	/// Modular reagents added to dispensers by upgrades
	var/list/modular_upgrade
	/// Modular reagents added to dispensers by emag
	var/list/modular_emag

/obj/machinery/chem_dispenser/Initialize(mapload)
	. = ..()
	dispensable_reagents |= modular_reagents
	upgrade_reagents |= modular_upgrade
	emagged_reagents |= modular_emag

/*
		To add chemicals to a dispenser, add it to the list which corresponds with the level of access you wish
		the chemical to require. As an example, a chemical added to the "modular_emag" list would only show up in
		the dispenser when a player uses an emag on it.
*/

/obj/machinery/chem_dispenser/drinks
	modular_reagents = list(
		/datum/reagent/consumable/greentea,
		/datum/reagent/consumable/redtea)
