/obj/effect/decal/cleanable/food/salt/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(is_species(mover, /datum/species/spirit))
		return FALSE

/obj/effect/decal/cleanable/food/salt/Bumped(atom/movable/AM)
	. = ..()
	if(is_species(AM, /datum/species/spirit))
		to_chat(AM, span_danger("Your path is obstructed by [span_phobia("salt")]."))

/obj/effect/blessing/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(is_species(mover, /datum/species/spirit))
		return FALSE

/obj/effect/blessing/Bumped(atom/movable/AM)
	. = ..()
	if(is_species(AM, /datum/species/spirit))
		to_chat(AM, span_danger("Your path is obstructed by a [span_phobia("god")]."))
