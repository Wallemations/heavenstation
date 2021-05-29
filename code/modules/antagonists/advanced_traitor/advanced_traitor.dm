#define TRAITOR_HUMAN "human"
#define TRAITOR_AI	  "AI"

/// "Traitor plus" or "Advanced traitor" - a traitor that is able to set their own goals and objectives when in game.
/// Loosely based on the ambitions system from skyrat, but made less bad.
/datum/antagonist/traitor/traitor_plus
	/// Changed to "Traitor" on spawn, but can be changed by the player.
	name = "Advanced Traitor"
	/// Edited to ([starting_tc] / 40).
	var/hijack_speed = 0.5
	/// Can be changed by the player.
	employer = "The Syndicate"
	/// We don't give them standard traitor objectives.
	give_objectives = FALSE
	/// We don't give any codewords out.
	should_give_codewords = FALSE
	/// We equip our traitor after they finish their goals.
	should_equip = FALSE
	/// We finalize our antag when they finish their goals.
	finalize_antag = FALSE
	/// This player's backstory for their antag - optional, can be empty/null
	var/backstory = ""
	/// The starting TC / processing points for this antag. Value below is changed.
	var/starting_tc = 20
	/// Lazylist of our goals datums linked to this antag.
	var/list/datum/advanced_antag_goal/our_goals
	/// List of objectives AIs can get, because apparently they're not initialized anywhere like normal objectives.
	var/static/list/ai_objectives = list("no organics on shuttle" = /datum/objective/block, "no mutants on shuttle" = /datum/objective/purge, "robot army" = /datum/objective/robot_army, "survive AI" = /datum/objective/survive/malf)
	/// Some blacklsited objectives we don't want showing up in the similar objectives pool
	var/static/list/blacklisted_similar_objectives = list("custom", "absorb", "nuclear", "capture")
	/// Goals that advanced traitor malf AIs shouldn't be able to pick
	var/static/list/blacklisted_ai_objectives = list("survive", "destroy AI", "download", "steal", "escape", "debrain")
	/// All advanced traitor panels we have open (assoc list user to panel)
	var/list/open_panels

/datum/antagonist/traitor/traitor_plus/on_gain()
	setup_advanced_traitor()
	antag_memory += "Use the <b>\"Antagonist - Set Goals\"</b> verb to set your goals.<br>"

	/// Only giving them one objective as a reminder - "Set your goals". Only shows up in their memory.
	var/datum/objective/custom/custom_objective = new
	custom_objective.explanation_text = "Set your custom goals via the IC tab."
	objectives += custom_objective

	add_advanced_goal()

	return ..()

/datum/antagonist/traitor/traitor_plus/on_removal()
	remove_verb(owner.current, /mob/proc/open_advanced_traitor_panel)
	QDEL_LIST(our_goals)

	for(var/panel_user in open_panels)
		var/datum/adv_traitor_panel/tgui_panel = open_panels[panel_user]
		tgui_panel.ui_close(panel_user)

	return ..()

/// Greet the antag with big menacing text, then move to greet_two after 3 seconds.
/datum/antagonist/traitor/traitor_plus/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You are a [name]!</span>")
	owner.current.playsound_local(get_turf(owner.current), 'sound/effects/radiodrum.ogg', 100, FALSE, pressure_affected = FALSE, use_reverb = FALSE)
	addtimer(CALLBACK(src, .proc/greet_two), 3 SECONDS)

/// Give them details on what their role actually means to them, then move to greet_three after 3 seconds.
/datum/antagonist/traitor/traitor_plus/proc/greet_two()
	to_chat(owner.current, "<span class='danger'>You are a story driven antagonist! You can set your goals to whatever you think would make an interesting story or round. You have access to your goal panel via your IC tab.</span>")
	addtimer(CALLBACK(src, .proc/greet_three), 3 SECONDS)

/// Give them a short guide on how to use the goal panel, and what all the buttons do.
/datum/antagonist/traitor/traitor_plus/proc/greet_three()
	to_chat(owner.current, "<span class='danger'>In your goal panel, you should set a few goals to get started and finalize them to recieve your uplink. If you're not sure how to use the panel or its functions, use the inbuilt tutorial.</span>")

/datum/antagonist/traitor/traitor_plus/roundend_report()
	var/list/result = list()

	result += printplayer(owner)
	result += "<b>[owner]</b> was \a <b>[name]</b>[employer? " employed by <b>[employer]</b>":""]."
	if(backstory)
		result += "<b>[owner]'s</b> backstory was the following: <br>[backstory]"

	var/TC_uses = 0
	var/uplink_true = FALSE
	var/purchases = ""

	if(should_equip)
		LAZYINITLIST(GLOB.uplink_purchase_logs_by_key)
		var/datum/uplink_purchase_log/H = GLOB.uplink_purchase_logs_by_key[owner.key]
		if(H)
			uplink_true = TRUE
			TC_uses = H.total_spent
			purchases += H.generate_render(FALSE)

	if(LAZYLEN(our_goals))
		var/count = 1
		for(var/datum/advanced_antag_goal/goal in our_goals)
			result += goal.get_roundend_text(count)
			count++
		if(uplink_true)
			result += "<br>They were afforded <b>[starting_tc]</b> tc to accomplish these tasks."

	if(uplink_true)
		var/uplink_text = "(used [TC_uses] TC) [purchases]"
		result += uplink_text
		if (contractor_hub)
			result += contractor_round_end()
	else if (!should_equip)
		result += "<br>The [name] never obtained their uplink!"

	return result.Join("<br>")

/datum/antagonist/traitor/traitor_plus/roundend_report_footer()
	return "<br>And thus ends another story on board [station_name()]."

/// Set their name to default "Traitor" and give the traitor the verb to open their goal panel.
/datum/antagonist/traitor/traitor_plus/proc/setup_advanced_traitor()
	switch(traitor_kind)
		if(TRAITOR_AI)
			name = "Malfunctioning AI"
		if(TRAITOR_HUMAN)
			name = "Traitor"
	show_advanced_traitor_panel(owner.current)
	add_verb(owner.current, /mob/proc/open_advanced_traitor_panel)

/// A mob proc / verb that lets the antagonist open up their goal panel in game.
/mob/proc/open_advanced_traitor_panel()
	set name = "Antagonist - Set Goals"
	set category = "IC"

	var/datum/antagonist/traitor/traitor_plus/our_antag_datum = mind?.has_antag_datum(/datum/antagonist/traitor/traitor_plus)
	if(!our_antag_datum)
		to_chat(src, "You shouldn't have this!")
		remove_verb(src, /mob/proc/open_advanced_traitor_panel)
		return

	our_antag_datum.show_advanced_traitor_panel(src)

/* A mind proc that makes the current mind into an advanced traitor.
 *
 * Used after a timer by the [/datum/game_mode/traitor_plus] to make picked minds into antags.
 *
 * our_antag_datum - a typepath of an antag datum
 * traitor_name - the name of the traitor, to assign to their [special_role] (traitors are ROLE_TRAITOR)
 * restricted_jobs - list of jobs they shouldn't be able to be
 */
/datum/mind/proc/make_advanced_traitor(datum/antagonist/our_antag_datum, traitor_name, restricted_jobs, forced = FALSE)
	var/go_ahead = TRUE
	if(QDELETED(src)) // If our mind is gone, nowhere to put the antag
		go_ahead = FALSE
	else if(!current) // No body = not a good antag
		go_ahead = FALSE
	else if(!current.client) // No client = not a good antag
		go_ahead = FALSE
	else if(current.stat == DEAD) // Dead people = not a good antag
		go_ahead = FALSE
	else if(has_antag_datum(our_antag_datum)) // If we're already an advanced traitor, don't try again
		go_ahead = FALSE

	if(forced || go_ahead)
		var/datum/antagonist/traitor/new_antag = new our_antag_datum()
		special_role = traitor_name
		restricted_roles = restricted_jobs
		add_antag_datum(new_antag)
	else
		var/datum/game_mode/traitor_plus/our_mode = SSticker.mode
		if(istype(our_mode))
			our_mode.mulligan_choice()

/* Updates the user's currently open TGUI panel, or open a new panel if they don't have one.
 *
 * user - the user, opening the panel (usually, [owner.current], but sometimes admins)
 */
/datum/antagonist/traitor/traitor_plus/proc/show_advanced_traitor_panel(mob/user)
	var/datum/adv_traitor_panel/tgui
	if(LAZYLEN(open_panels))
		tgui = open_panels[user]
		if(tgui)
			tgui.ui_interact(user, tgui.open_ui)
			return
	tgui = new(user, src)
	tgui.ui_interact(user)
	LAZYADDASSOC(open_panels, user, tgui)

/datum/antagonist/traitor/traitor_plus/proc/cleanup_advanced_traitor_panel(mob/viewer)
	open_panels[viewer] = null
	open_panels -= viewer
	if(!LAZYLEN(open_panels))
		open_panels = null

/// Miscellaneous logging for the antagonist's goals after they finalize them.
/datum/antagonist/traitor/traitor_plus/proc/log_goals_on_finalize()
	message_admins("[ADMIN_LOOKUPFLW(usr)] finalized their objectives. Their uplink was given to them with [starting_tc] [(traitor_kind == TRAITOR_AI) ? "processing points":"tc"]. ")
	log_game("[key_name(usr)] finalized their objectives. Their uplink was given to them with [starting_tc] [(traitor_kind == TRAITOR_AI) ? "processing points":"tc"]. ")
	if(!LAZYLEN(our_goals))
		message_admins("<b>No set goal:</b> [ADMIN_LOOKUPFLW(usr)] finalized their goals with 0 goals set.")
		return

	for(var/datum/advanced_antag_goal/goals in our_goals)
		if(goals.goal)
			if(goals.intensity >= 4)
				message_admins("<b>High intensity goal:</b> [ADMIN_LOOKUPFLW(usr)] finalized an intensity [goals.intensity] goal: [goals.goal]")
			else if(goals.intensity == 0)
				message_admins("<b>Potential error:</b> [ADMIN_LOOKUPFLW(usr)] finalized an intensity 0 goal: [goals.goal]")
		else if(goals.intensity > 0)
			message_admins("<b>Potential exploit:</b> [ADMIN_LOOKUPFLW(usr)] finalized an intensity [goals.intensity] goal with no goal text. Potential exploit of goals for extra TC.")
		else
			message_admins("<b>Potential error:</b> [ADMIN_LOOKUPFLW(usr)] finalized a goal with no goal text.")

		if(goals.notes)
			message_admins("<b>Finalized goal note:</b> [ADMIN_LOOKUPFLW(usr)] finalized a goal with additional notes: [goals.notes]")

		log_game("[key_name(usr)] finalized an intensity [goals.intensity] goal: [goals.goal] (notes: [goals.notes]).")

/// An extra button for the TP, to open the goal panel
/datum/antagonist/traitor/traitor_plus/get_admin_commands()
	. = ..()
	.["View Goals"] = CALLBACK(src, .proc/show_advanced_traitor_panel, usr)

/// An extra button for check_antagonists, to open the goal panel
/datum/antagonist/traitor/traitor_plus/antag_listing_commands()
	. = ..()
	. += "<a href='?_src_=holder;[HrefToken()];admin_check_goals=[REF(src)]'>Show Goals</a>"

/// An extension of the admin topic for the extra buttons.
/datum/admins/Topic(href, href_list)
	. = ..()
	if(href_list["admin_check_goals"])
		var/datum/antagonist/traitor/traitor_plus/our_traitor = locate(href_list["admin_check_goals"])
		if(!check_rights(R_ADMIN))
			return

		our_traitor.show_advanced_traitor_panel(usr)
		return

/// Modify the traitor's starting_tc (TC or processing points) based on their goals.
/datum/antagonist/traitor/traitor_plus/proc/modify_traitor_points()
	switch(traitor_kind)
		if(TRAITOR_HUMAN)
			var/datum/component/uplink/made_uplink = owner.find_syndicate_uplink()
			if(!made_uplink)
				return

			starting_tc = get_traitor_points_from_goals()
			made_uplink.telecrystals = starting_tc
			hijack_speed = (20 / starting_tc) // 20 tc traitor = 0.5 (default traitor hijack speed)
		if(TRAITOR_AI)
			var/mob/living/silicon/ai/traitor_ai = owner.current
			var/datum/module_picker/traitor_ai_uplink = traitor_ai.malf_picker

			starting_tc = get_traitor_points_from_goals()
			traitor_ai_uplink.processing_time = starting_tc
		else
			CRASH("modify_traitor_points() called on an antagonist with no traitor kind set")

/// Calculate the traitor's starting TC or processing points based on their goal's intensity levels.
/datum/antagonist/traitor/traitor_plus/proc/get_traitor_points_from_goals()
	switch(traitor_kind)
		if(TRAITOR_HUMAN)
			var/finalized_starting_tc = TRAITOR_PLUS_INITIAL_TC
			for(var/datum/advanced_antag_goal/goal in our_goals)
				finalized_starting_tc += (goal.intensity * 2)

			return min(finalized_starting_tc, TRAITOR_PLUS_MAX_TC)
		if(TRAITOR_AI)
			var/finalized_starting_points = TRAITOR_PLUS_INITIAL_MALF_POINTS
			for(var/datum/advanced_antag_goal/goal in our_goals)
				finalized_starting_points += (goal.intensity * 5)

			return min(finalized_starting_points, TRAITOR_PLUS_MAX_MALF_POINTS)
		else
			CRASH("get_traitor_points_from_goals() called on an antagonist with no traitor kind set")

/// Initialize a new goal and append it to our lazylist
/datum/antagonist/traitor/traitor_plus/proc/add_advanced_goal()
	var/datum/advanced_antag_goal/new_goal = new(src)
	LAZYADD(our_goals, new_goal)

/// Remove a goal from our lazylist and qdel it
/// old_goal - reference to the goal we're removing
/datum/antagonist/traitor/traitor_plus/proc/remove_advanced_goal(datum/advanced_antag_goal/old_goal)
	LAZYREMOVE(our_goals, old_goal)
	qdel(old_goal)
