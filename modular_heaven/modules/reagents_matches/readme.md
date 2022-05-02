# Custom Drinks & Chemicals

To create a custom drink reagent, add it to the `custom_drinks.dm` file. 

Custom drinks require you to set `has_custom_glass = TRUE` in order for the drinking glass sprite to properly change. 
Non-drink chemicals do not.

To change the reagents in a chem dispenser, go into `dispensers.dm` and follow the instructions & previous examples.

To change an existing drink's icon, set `has_custom_glass = TRUE` in `bottle_matches.dm`.




# CUSTOM REAGENTS

Adds custom reagents & reagent container sprites.

### TG Edits

- code\modules\food_and_drinks\drinks\drinks\drinkingglass.dm = /obj/item/reagent_containers/food/drinks/drinkingglass/update_icon_state()

### Defines

- N/A

### Included files that are not contained in this module:

- N/A

### Credits

Et al.
