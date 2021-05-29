/// Advanced antag goal datum.
/// Like your standard /datum/objective/custom, but with more fun stuff.
/// Used by advanced traitors [/datum/antagonist/traitor/traitor_plus]
/datum/advanced_antag_goal
	/// Our antag datum
	var/datum/antagonist/our_antag
	/// What's our actual set goal?
	var/goal = ""
	/* How dangerous this goal is
	 * 5 = Mass killings, vaporizing departments
	 * 4 = Mass sabotage (engine delamination)
	 * 3 = Assassination / Grand Theft
	 * 2 = Kidnapping / Theft
	 * 1 = Minor theft or basic antagonizing
	 */
	var/intensity = 0
	/// Extra notes about this goal.
	var/notes = ""
	/// Similar objective datums we can compare this goal too for success and such
	var/list/datum/objective/similar_objectives
	/// Whether we check all objectives or just the first successful one in our [similar_objectives]
	var/check_all_objectives = TRUE

/datum/advanced_antag_goal/New(datum/antagonist/antag_datum, identifier)
	our_antag = antag_datum

/datum/advanced_antag_goal/Destroy()
	QDEL_LIST(similar_objectives)
	our_antag = null
	return ..()

/// Set our goal to our passed goal.
/datum/advanced_antag_goal/proc/set_goal_text(_goal)
	goal = _goal

/// Set our intensity level to our passed intensity.
/datum/advanced_antag_goal/proc/set_intensity(_intensity)
	if(_intensity)
		intensity = _intensity
	else
		intensity = 1

/// Generate roundend text for the roundend report for this advanced goal.
/// Number is the number in the list that this objective is. (1 to 5)
/datum/advanced_antag_goal/proc/get_roundend_text(number)
	var/datum/antagonist/our_antag_datum = our_antag
	var/formatted_text = "<br><B>Objective #[number]</B>: [goal]"
	if(LAZYLEN(similar_objectives))
		if(check_relative_success())
			formatted_text += "<br><span class='greentext'> The [our_antag_datum.name] succeeded this goal!</span>"
		else
			formatted_text += "<br><span class='redtext'> The [our_antag_datum.name] failed this goal!</span>"
	if(notes)
		formatted_text += "<br><span class='info'>Extra info they had about this goal: [notes]</span>"

	return formatted_text

/// Loop through all our similar objectives and see if we completed them.
/// If [check_all_objectives] is true, we need all objectives in the list to be successful to return TRUE.
/// If it is false, we only need ONE objective to be true to return TRUE.
/datum/advanced_antag_goal/proc/check_relative_success()
	for(var/datum/objective/objective in similar_objectives)
		if(check_all_objectives)
			if(!objective.check_completion())
				return FALSE
		else
			if(objective.check_completion())
				return TRUE

	return TRUE
