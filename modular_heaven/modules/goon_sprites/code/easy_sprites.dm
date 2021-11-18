/obj/item/disk
	icon = 'modular_heaven/modules/goon_sprites/icons/disks.dmi'

/obj/item/storage/book/bible
	icon = 'modular_heaven/modules/goon_sprites/icons/bibles.dmi'

/obj/structure/noticeboard
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/instrument/trumpet
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/instrument/trumpet/spectral
	icon = 'icons/obj/musician.dmi'

/obj/item/instrument/banjo
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/taperecorder
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/structure/lattice
	icon = 'modular_heaven/modules/goon_sprites/icons/lattice.dmi'

/obj/structure/lattice/catwalk
	icon = 'modular_heaven/modules/goon_sprites/icons/wackywalks.dmi'

/obj/item/radio
	icon = 'modular_heaven/modules/goon_sprites/icons/radio.dmi'

/obj/item/radio/headset
	icon = 'icons/obj/radio.dmi'

/obj/item/radio/intercom
	icon = 'icons/obj/radio.dmi'

/obj/structure/extraction_point
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/fishing_rod
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/effect/fishing_bobber
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/restraints/legcuffs/beartrap
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/restraints/legcuffs/beartrap/energy
	icon = 'icons/obj/restraints.dmi'

/obj/item/restraints/legcuffs/beartrap/mega_arachnid
	icon = 'icons/obj/restraints.dmi'

/obj/item/gavelhammer
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/gavelblock
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/relic
	icon = 'modular_heaven/modules/goon_sprites/icons/assemble.dmi'

/obj/item/relic/Initialize(mapload)
	. = ..()
	icon_state = pick("shock_kit","armor-igniter-analyzer","infra-igniter0","infra-igniter1","radio-multitool","prox-radio1","radio-radio","timer-multitool0","radio-igniter-tank", "prox-igniter1", "timer-radio2", "prox-igniter-chem1", "m-i-p-wire", "radio-horn")

/obj/item/assembly
	icon = 'modular_heaven/modules/goon_sprites/icons/assemblies.dmi'

/obj/item/assembly_holder
	icon = 'modular_heaven/modules/goon_sprites/icons/assemblies.dmi'

/obj/item/beacon
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/hand_tele
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/dnainjector
	icon = 'modular_heaven/modules/goon_sprites/icons/misc.dmi'

/obj/item/disk/cargo/bluespace_pod
	icon = 'modular_heaven/modules/goon_sprites/icons/disks.dmi'

/obj/item/stack/rods
	icon = 'modular_heaven/modules/goon_sprites/icons/rods.dmi'
