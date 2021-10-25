## CUSTOM HEAVEN RACES

Adds 4 custom races, two transform races and two roundstart races.
The trasform races are the Void race and the Balan race.
The roundstart races are the Goat and the Spirit.

### TG Edits

- code/game/objects/effects/decals/cleanable/humans.dm  = /obj/effect/decal/cleanable/blood/footprints/examine(mob/user)
- code/modules/mob/living/carbon/human/species.dm  = /datum/species/proc/harm(mob/living/carbon/human/user, mob/living/carbon/human/target, datum/martial_art/attacker_style)
- code/modules/surgery/bodyparts/_bodyparts.dm = /obj/item/bodypart/proc/get_limb_icon(dropped, draw_external_organs)
- config/game_options.txt = Roundstart races

### Defines

- N/A

### Included files that are not contained in this module:

- tgui/packages/tgui/interfaces/PreferencesMenu/preferences/species/goat.ts
- tgui/packages/tgui/interfaces/PreferencesMenu/preferences/species/spirit.ts

### Credits

doshMobile - Spirit, Balan, Void & Port
Bolty - Goat
Wallem - Additional Porting & TGUI
