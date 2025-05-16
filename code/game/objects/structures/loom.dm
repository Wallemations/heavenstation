///This is a loom. It's usually made out of wood and used to weave fabric like durathread or cotton into their respective cloth types.
/obj/structure/loom
	name = "loom"
	desc = "A simple device used to weave cloth and other thread-based fabrics together into usable material."
	icon = 'icons/obj/service/hydroponics/equipment.dmi'
	icon_state = "loom"
	density = TRUE
	anchored = TRUE

/obj/structure/loom/Initialize(mapload)
	. = ..()

	var/static/list/hovering_item_typechecks = list(
		/obj/item/stack/sheet/cotton = list(
			SCREENTIP_CONTEXT_LMB = "Weave",
		),
	)

	AddElement(/datum/element/contextual_screentip_item_typechecks, hovering_item_typechecks)

/obj/structure/loom/wrench_act(mob/living/user, obj/item/tool)
	. = ..()
	default_unfasten_wrench(user, tool, time = 0.5 SECONDS)
	return ITEM_INTERACT_SUCCESS

/obj/structure/test_structure_delete_after
	name = "I fucking love animate()"
	var/easey = SINE_EASING
	var/easex = LINEAR_EASING
	var/tweentime = 4 DECISECONDS
	var/static/list/all_eases = list(
		"LINEAR_EASING" = LINEAR_EASING,
		"SINE_EASING" = SINE_EASING,
		"CIRCULAR_EASING" = CIRCULAR_EASING,
		"QUAD_EASING" = QUAD_EASING,
		"CUBIC_EASING" = CUBIC_EASING,
		"BOUNCE_EASING" = BOUNCE_EASING,
		"ELASTIC_EASING" = ELASTIC_EASING,
		"BACK_EASING" = BACK_EASING,
		"JUMP_EASING" = JUMP_EASING,
	)
	var/static/list/in_out = list(
		"EASE_IN",
		"EASE_OUT",
		"BOTH",
	)
	var/obj/item/pen/red/testpen

/obj/structure/test_structure_delete_after/Initialize(mapload)
	. = ..()
	testpen = new (get_turf(src))

/obj/structure/test_structure_delete_after/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	arc_throw(initial_velocity = rand(10,80), initial_heading = rand(0,360), elevation_angle = rand(30,85))

/obj/structure/test_structure_delete_after/proc/arc_throw(initial_velocity, initial_heading = 0, elevation_angle = 45)
	// DEFINES & BASICS
	#define GRAVITY_ACCELERATION 0.98
	/// Parabolic height
	var/elevation_rads = TORADIANS(elevation_angle)
	/// Top-down angle
	var/heading_rads = TORADIANS(initial_heading)
	var/horizontal_velocity = initial_velocity * cos(elevation_rads)
	var/vertical_velocity = initial_velocity * sin(elevation_rads)

	// TIME
	var/time_to_zenith = abs(vertical_velocity / GRAVITY_ACCELERATION)
	var/total_time = time_to_zenith * 2
	var/total_time_deciseconds = clamp(round(total_time * 10), 2 DECISECONDS, 8 DECISECONDS)
	var/deciseconds_to_zenith = clamp(round(time_to_zenith * 10), 1 DECISECONDS, 4 DECISECONDS)

	// POSITIONS
	var/total_flat_dist = horizontal_velocity * total_time
	var/last_x = round(cos(heading_rads) * total_flat_dist)
	var/last_y = round(sin(heading_rads) * total_flat_dist)
	var/zenith_y = round((((vertical_velocity * time_to_zenith) - (0.5 * GRAVITY_ACCELERATION * (time_to_zenith**2))) + last_y) / 2) * 8


	visible_message("\n\
		Initial Velocity: [initial_velocity]\n\
		Initial Heading:([initial_heading]deg, [heading_rads]rads)\n\
		Initial Elevation:([elevation_angle]deg, [elevation_rads]rads)\n\
		Horizontal Velocity:[horizontal_velocity],\n\
		Vertical Velocity:[vertical_velocity]\n\
		Ticks To Zenith:[time_to_zenith]\n\
		Deciseconds To Zenith:[deciseconds_to_zenith]\n\
		Total Ticks:[total_time]\n\
		Total Time Deciseconds:[total_time_deciseconds]\n\
		Zenith Y:[zenith_y]\n\
		Last Pos:([last_x],[last_y])\
		Total Distance:[total_flat_dist]\n\
	")

	var/obj/effect/abstract/my_shadow = new(get_turf(src))
	my_shadow.appearance = testpen.appearance
	my_shadow.add_filter("scolor", 2 , color_matrix_filter("#0000000A"))
	my_shadow.add_filter("sshadow", 3, drop_shadow_filter(0,0,3,2, "#0000007A"))
	QDEL_IN(my_shadow, total_time_deciseconds)

	// Pixel Z (pixel_y)
	animate(testpen, time = 0, pixel_z = 0, easing = JUMP_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
	animate(time = deciseconds_to_zenith, pixel_z = zenith_y, easing = SINE_EASING | EASE_OUT)
	animate(time = deciseconds_to_zenith, pixel_z = last_y, easing = SINE_EASING | EASE_IN)
	// Pixel W (pixel_x)
	animate(testpen, time = 0, pixel_w = 0, easing = JUMP_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
	animate(time = total_time_deciseconds, pixel_w = last_x, easing = LINEAR_EASING)

	/// Shadow
	// Pixel Z (pixel_y)
	animate(my_shadow, time = 0, pixel_z = 0, easing = JUMP_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
	animate(time = total_time_deciseconds, pixel_z = last_y, easing = LINEAR_EASING)
	// Pixel W (pixel_x)
	animate(my_shadow, time = 0, pixel_w = 0, easing = JUMP_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
	animate(time = total_time_deciseconds, pixel_w = last_x, easing = LINEAR_EASING)
	// Alpha
	animate(my_shadow, time = 0, alpha = 0, easing = JUMP_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
	animate(time = deciseconds_to_zenith, alpha = 255, easing = SINE_EASING | EASE_OUT)
	animate(time = deciseconds_to_zenith, alpha = 0, easing = SINE_EASING | EASE_IN)

	#undef GRAVITY_ACCELERATION

