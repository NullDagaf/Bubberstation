/datum/vore_template
	var/list/stomach_types = list()
	var/list/stomach_descs_prey = list()
	var/list/stomach_descs_owner = list()

/datum/vore_template/Destroy(force)
	stomach_types = null
	stomach_descs_prey = null
	stomach_descs_owner = null
	return ..()


/datum/vore_template/default
	stomach_types = list(
		1 = VORE_TYPE_DIGEST
	)
	stomach_descs_prey = list(
		1 = "Idk, figure this shit out, fuckee edition"
	)
	stomach_descs_owner = list(
		1 = "Idk, figure this shit out, nommer edition"
	)

/datum/vore_template/custom
	var/datum/preferences/stored_prefs = null

/datum/vore_template/custom/New(datum/preferences/prefs)
	ASSERT(istype(prefs))

	stored_prefs = prefs
