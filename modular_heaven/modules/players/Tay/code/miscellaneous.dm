//Tay//

//Melee weapon choice beacon
/obj/item/choice_beacon/sabre
	name = "captain's blade beacon"
	desc = "A beacon the captain uses to select his weapon of choice."

/obj/item/choice_beacon/sabre/generate_display_names()
	var/static/list/sord_item_list
	if(!sord_item_list)
		sord_item_list = list()
		var/list/templist = typesof(/obj/item/storage/box/sabre) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			sord_item_list[initial(A.name)] = A
	return sord_item_list

/obj/item/choice_beacon/sabre/spawn_option(obj/choice,mob/living/M)
	new choice(get_turf(M))
	to_chat(M, "<span class='hear'>Thank you for your service, Captain.</span>")

//Tay end//
