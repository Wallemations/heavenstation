/// The advanced traitor goal panel used to set and finalized goals.
/// Separated out the HTML data from the main traitor_plus file for cleanliness.
/datum/antagonist/traitor/traitor_plus/proc/build_advanced_panel_html()
	var/dat = ""
	dat += "<div align='center'><a href='?src=[REF(src)];set_name=1'>Set Antagonist Name:</a> [name][FOURSPACES][FOURSPACES]"
	dat += "<a href='?src=[REF(src)];set_employer=1'>Set Antagonist Employer:</a> [employer]</div>"
	dat += "<div width=40%><a href='?src=[REF(src)];set_backstory=1'>Set Backstory:</a> [backstory]</div><div width=60%> </div>"

	dat += "<hr>"

	var/intensity_color = "#f00"
	if(LAZYLEN(our_goals))
		var/count = 1
		for(var/datum/advanced_antag_goal/all_goals in our_goals)
			if(count > TRAITOR_PLUS_MAX_GOALS)
				break

			switch(all_goals.intensity)
				if(1)
					intensity_color = "#7bff00"
				if(2)
					intensity_color = "#fbff00"
				if(3)
					intensity_color = "#ffa600"
				if(4)
					intensity_color = "#ff8800"
				if(5)
					intensity_color = "#f00"

			dat += "<table width=100%>"
			dat += "<b> Goal #[count]: </b>"
			dat += "<tr>"
			dat += "<td width='30%'><center><a href='?src=[REF(src)];edit_new_goal=set_goal;target_goal=[REF(all_goals)]'>Set goal</a></center></td>"
			dat += "<td width='15%'><center><a href='?src=[REF(src)];edit_new_goal=set_level;target_goal=[REF(all_goals)]'>Set intensity</a></center></td>"
			dat += "<td width='25%'><center><a href='?src=[REF(src)];edit_new_goal=set_notes;target_goal=[REF(all_goals)]'>Set notes</a></center></td>"
			dat += "<td width='30%'><table align='center'>"
			dat += "<td><a href='?src=[REF(src)];edit_new_goal=add_sim_objectives;target_goal=[REF(all_goals)]'>Set similar objectives</a></td>"
			dat += "<td><a href='?src=[REF(src)];edit_new_goal=clear_sim_objectives;target_goal=[REF(all_goals)]'>Clear similar objectives</a></td>"
			dat += "<td><a href='?src=[REF(src)];edit_new_goal=toggle_check_all_objectives;target_goal=[REF(all_goals)]'>[all_goals.check_all_objectives? "Check All Successes":"Check First Success"]</a></td>"
			dat += "</table></td>"
			dat += "</tr>"
			dat += "<tr><td width='30%' valign='top'>[TextPreview(all_goals.goal, 210)]</td>"
			dat += "<td width='15%' valign='top'><center><span style='border: 1px solid #161616; background-color: [intensity_color];'> [all_goals.intensity] </span></center></td>"
			dat += "<td width='25%' valign='top'>[TextPreview(all_goals.notes, 140)]</td>"
			dat += "<td width='30%' valign='top'>"
			for(var/datum/objective/objectives as anything in all_goals.similar_objectives)
				if(LAZYLEN(all_goals.similar_objectives) > TRAITOR_PLUS_MAX_SIMILAR_OBJECTIVES)
					break
				dat += "[TextPreview(objectives.explanation_text, 100)]	<a href='?src=[REF(src)];edit_new_goal=cut_sim_objectives;target_goal=[REF(all_goals)];target_objective=[REF(objectives)]'>(Remove objective)</a><br>"
			dat += "</td></tr>"
			dat += "<a href='?src=[REF(src)];remove_goal=[REF(all_goals)]'>Remove goal</a>"
			dat += "</table><br>"
			count++

	dat += "<br><a href='?src=[REF(src)];add_new_goal=1'>Add a new goal</a>"
	if(!should_equip)
		dat += "<br><a href='?src=[REF(src)];finalize_goals=1'>Finalize goals (They can still be edited in the future!)</a>"
		dat += "<br><i>Based on your current goals, finalizing now will grant you [get_traitor_points_from_goals()] [(traitor_kind == TRAITOR_AI) ? "processing units" : "telecrystals"].</i>"

	return dat
