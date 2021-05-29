/obj/item/paper/crumpled/bloody/Newshowers
	name = "note"
	info = {"I certainly did not expect this<br>
	much blood from a simple shower-tile test.<br>
	Oh well, we have so many test subjects."}

/turf/open/floor/noslip/airless
	initial_gas_mix = AIRLESS_ATMOS

///Spawns stock parts of varying qualities
/obj/effect/spawner/lootdrop/stockpart_spawner
	name = "stockpart spawner"
	icon_state = "random_loot"
	loot = list(
				/obj/item/stock_parts/capacitor/quadratic = 10,
				/obj/item/stock_parts/scanning_module/triphasic = 10,
				/obj/item/stock_parts/manipulator/femto = 10,
				/obj/item/stock_parts/micro_laser/quadultra = 10,
				/obj/item/stock_parts/matter_bin/bluespace = 10,
				/obj/item/stock_parts/cell/bluespace/empty = 10,
				/obj/item/stock_parts/electrolite/bluespace = 10,
				/obj/item/stock_parts/capacitor/void = 5,
				/obj/item/stock_parts/scanning_module/void = 5,
				/obj/item/stock_parts/manipulator/void = 5,
				/obj/item/stock_parts/micro_laser/void = 5,
				/obj/item/stock_parts/matter_bin/void = 5,
				/obj/item/reagent_containers/glass/beaker/void = 5,
				/obj/item/stock_parts/cell/void/empty = 5,
				/obj/item/stock_parts/electrolite/void = 5
				)
