/datum/game_mode/traitor_plus
	name = "traitor plus"
	config_tag = "traitor_plus"
	report_type = "traitor_plus"
	antag_flag = ROLE_TRAITOR
	false_report_weight = 15
	restricted_jobs = list("Cyborg") // Sorry, no cyborg traitors
	//protected_jobs = list("Prisoner","Security Officer", "Warden", "Detective", "Head of Security", "Captain") // No protected jobs!
	required_enemies = 1
	recommended_enemies = 4
	reroll_friendly = 1
	enemy_minimum_age = 0
	reroll_friendly = FALSE

	announce_span = "danger"
	announce_text = "There are antagonistic agents on the station!\n	\
		<span class='danger'>Traitors</span>: Set an objective and complete it!\n	\
		<span class='notice'>Crew</span>: Ensure the station and crew survive!"

	var/max_traitors = 3
	var/give_antag_lower_timer = 8 MINUTES
	var/give_antag_upper_timer = 12 MINUTES

	var/list/datum/mind/pre_chosen_traitors = list()
	var/antag_datum = /datum/antagonist/traitor/traitor_plus

/datum/game_mode/traitor_plus/pre_setup()
	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		restricted_jobs += protected_jobs

	var/num_traitors = clamp(1, round(num_players() * 0.15), max_traitors)

	for(var/j = 0, j < num_traitors, j++)
		if (!antag_candidates.len)
			break
		var/datum/mind/traitor = antag_pick(antag_candidates)
		pre_chosen_traitors += traitor
		message_admins("[ADMIN_LOOKUPFLW(traitor)] has been selected as a potential advanced traitor. They will recieve traitor status in [give_antag_lower_timer / (60*10)] to [give_antag_upper_timer / (60*10)] minutes.")
		log_game("[key_name(traitor)] has been selected as a potential advanced traitor.")
		antag_candidates.Remove(traitor)

	for(var/antag in pre_chosen_traitors)
		GLOB.pre_setup_antags += antag
	return TRUE

/datum/game_mode/traitor_plus/post_setup()
	for(var/datum/mind/traitor in pre_chosen_traitors)
		addtimer(CALLBACK(traitor, /datum/mind.proc/make_advanced_traitor, antag_datum, ROLE_TRAITOR, restricted_jobs), rand(give_antag_lower_timer, give_antag_upper_timer))
		GLOB.pre_setup_antags -= traitor
	..()

	return TRUE

/datum/game_mode/traitor_plus/proc/mulligan_choice()
	var/give_mulligan_lower_time = 0
	var/give_mulligan_upper_timer = 2 MINUTES
	if (!antag_candidates.len)
		message_admins("An advanced traitor that was chosen to spawn was mulliganed, and no replacement was found.")
		log_game("An advanced traitor failed to spawn and no mulligan was selected.")
		return FALSE

	var/datum/mind/traitor = antag_pick(antag_candidates)
	addtimer(CALLBACK(traitor, /datum/mind.proc/make_advanced_traitor, antag_datum, ROLE_TRAITOR, restricted_jobs), rand(0, 2 MINUTES))
	message_admins("An advanced traitor that was chosen to spawn was mulliganed and [ADMIN_LOOKUPFLW(traitor)] has been selected as a replacement. They will recieve traitor status in [give_mulligan_lower_time / (60*10)] to [give_mulligan_upper_timer / (60*10)] minutes.")
	log_game("An advanced traitor failed to spawn and [key_name(traitor)] has been selected as a replacement.")
	antag_candidates.Remove(traitor)

	return TRUE

/datum/game_mode/traitor_plus/generate_report()
	return "Recent reports of agents from a wide variety of branches, employers, and origins have been spreading around the sector. While we're sure it's probably nothing, \
			expect the unexpected - if they happen to be true, anyone could be dangerous enemy of the corporation, even who you least expect it."
