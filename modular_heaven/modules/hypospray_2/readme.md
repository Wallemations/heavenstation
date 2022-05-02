Ported from 
https://github.com/Skyrat-SS13/Skyrat-tg/pull/1929

(I'm just gonna copy how Skyrat does their readmes for this one, seems simple enough.)
## Hyposprays_MKII (Rework + Port)

This is a rework of Skyrat's hyposprays, in an attempt to make them less overpowered for the general public while still being a useful tool for doctors.

### Differences from Skyrat's

Instead of the two types of hyposprays, there's three. The CMO's is the most powerful, while the standard one is given out to doctors through their lockers. A more powerful upgrade to the standard hypospray is unlocked when better medical tools are unlocked as well.

I've reworked the sprites as well, basing them off TG's new Hypospray color schemes, and giving them flashing lights to make it easier to see when they are empty.

Furthermore, there are two syndie variants, one for nanites and one that's for stimulants. These are more expensive counterparts to their existing ones, as you get the additional benefit of having the best hypospray possible once you expend your vial of stimulants or nanites.

### TG Edits

- /obj/structure/closet/secure_closet/chief_medical/PopulateContents() = Removes base Hypospray
- /datum/techweb_node/exp_tools = Adds upgraded hypospray to tech tree

### Defines

- #define HYPO_SPRAY 0
- #define HYPO_INJECT 1

- #define WAIT_SPRAY 20
- #define WAIT_INJECT 20
- #define SELF_SPRAY 15
- #define SELF_INJECT 15

- #define DELUXE_WAIT_SPRAY 0
- #define DELUXE_WAIT_INJECT 5
- #define DELUXE_SELF_SPRAY 10
- #define DELUXE_SELF_INJECT 10

- #define COMBAT_WAIT_SPRAY 0
- #define COMBAT_WAIT_INJECT 0
- #define COMBAT_SELF_SPRAY 0
- #define COMBAT_SELF_INJECT 0

- #define STANDARD_WAIT_SPRAY 30
- #define STANDARD_WAIT_INJECT 30
- #define STANDARD_SELF_SPRAY 20
- #define STANDARD_SELF_INJECT 20

### Included files that are not contained in this module:

- N/A

### Credits

Wallem - Heaven Port

ShadeAware - Skyrat Port
