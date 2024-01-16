/datum/preference_middleware/vore_stomachs
	action_delegations = list(
		"add_stomach" = PROC_REF(add_stomach),
		"remove_stomach" = PROC_REF(remove_stomach),
		"modify_stomach" = PROC_REF(modify_stomach)
	)

/datum/preference_middleware/vore_stomachs/proc/add_stomach()
	var/datum/vore_template/custom/vore_template = preferences.vore_template
