/obj/item/weldingtool/electric
	name = "electrical welding tool"
	desc = "An experimental welding tool capable of welding functionality through the use of electricity. The flame seems almost cold."
	icon = 'modular_skyrat/modules/aesthetics/tools/tools.dmi'
	icon_state = "elwelder"
	inhand_icon_state = "elwelder"
	light_power = 1
	light_color = LIGHT_COLOR_HALOGEN
	tool_behaviour = NONE
	toolspeed = 0.2
	var/active = FALSE
	var/power_use_amount = 1000
	// We don't use fuel
	change_icons = FALSE
	var/obj/item/stock_parts/cell/cell
	var/preload_cell_type //if not empty the welder starts with this type of cell
	var/can_remove_cell = TRUE
	var/powered = FALSE
	max_fuel = 20

/obj/item/weldingtool/electric/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stock_parts/cell))
		var/obj/item/stock_parts/cell/C = W
		if(cell)
			to_chat(user, span_warning("[src] already has a cell!"))
		else
			if(C.maxcharge < power_use_amount)
				to_chat(user, span_notice("[src] requires a higher capacity cell."))
				return
			if(!user.transferItemToLoc(W, src))
				return
			cell = W
			to_chat(user, span_notice("You install a cell in [src]."))
	else if(W.tool_behaviour == TOOL_SCREWDRIVER)
		tryremovecell(user)
	else
		return ..()

/obj/item/weldingtool/electric/proc/tryremovecell(mob/user)
	if(cell && can_remove_cell)
		cell.forceMove(drop_location())
		to_chat(user, span_notice("You remove the cell from [src]."))

/obj/item/weldingtool/electric/ComponentInitialize()
	. = ..()
	if(preload_cell_type)
		if(!ispath(preload_cell_type,/obj/item/stock_parts/cell))
			log_mapping("[src] at [AREACOORD(src)] had an invalid preload_cell_type: [preload_cell_type].")
		else
			cell = new preload_cell_type(src)

/obj/item/weldingtool/electric/attack_self(mob/user, modifiers)
	. = ..()
	if(!powered)
		if(cell?.charge < power_use_amount)
			return
	powered = !powered
	playsound(src, 'sound/effects/sparks4.ogg', 100, TRUE)
	if(powered)
		to_chat(user, "<span class='notice'>You turn [src] on.</span>")
		switched_on()
		return
	to_chat(user, "<span class='notice'>You turn [src] off.</span>")
	switched_off()

/obj/item/weldingtool/electric/proc/deductcharge(deducted_charge)
	if(!cell)
		return
	. = cell.use(deducted_charge)
	if(powered && cell.charge < power_use_amount)
		//we're below minimum, turn off
		switched_off()

/obj/item/weldingtool/electric/switched_on(mob/user)
	welding = TRUE
	tool_behaviour = TOOL_WELDER
	light_on = TRUE
	force = 15
	damtype = BURN
	hitsound = 'sound/items/welder.ogg'
	set_light_on(powered)
	update_appearance()
	START_PROCESSING(SSobj, src)

/obj/item/weldingtool/electric/switched_off(mob/user)
	powered = FALSE
	light_on = FALSE
	force = initial(force)
	damtype = BRUTE
	set_light_on(powered)
	tool_behaviour = NONE
	update_appearance()
	STOP_PROCESSING(SSobj, src)

/obj/item/weldingtool/electric/process(delta_time)
	if(!powered)
		switched_off()
		return
	if(!deductcharge(power_use_amount))
		switched_off()
		return

// We don't need to know how much fuel it has, because it doesn't use any.
/obj/item/weldingtool/electric/examine(mob/user)
	. = ..()
	. -= "It contains [get_fuel()] unit\s of fuel out of [max_fuel]."

// This is what uses fuel in the parent. We override it here to not use fuel
/obj/item/weldingtool/electric/use(used = 0)
	return isOn()

// This is what starts fires. Overriding it stops it starting fires
/obj/item/weldingtool/electric/handle_fuel_and_temps(used = 0, mob/living/user)
	return

/obj/item/weldingtool/electric/examine()
	. = ..()
	. += "[src] is currently [powered ? "powered" : "unpowered"]."

/obj/item/weldingtool/electric/update_icon_state()
	if(powered)
		inhand_icon_state = "[initial(inhand_icon_state)]1"
	else
		inhand_icon_state = "[initial(inhand_icon_state)]"
	return ..()

/obj/item/weldingtool/electric/emp_act(severity)
	. = ..()
	if (!(. & EMP_PROTECT_SELF))
		deductcharge(1000 / severity)

/datum/design/exwelder
	name = "Electrical Welding Tool"
	desc = "An experimental welding tool capable of welding using electricity."
	id = "exwelder"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 500, /datum/material/plasma = 1500, /datum/material/uranium = 200)
	build_path = /obj/item/weldingtool/electric
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/obj/item/weldingtool/electric/loaded
	preload_cell_type = /obj/item/stock_parts/cell/high
