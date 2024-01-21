#define STOMACH_MAX_COUNT 8 //arbitrary, raise if ppl complain
#define STOMACH_MAX_DESC_LEN 2048

/datum/preference_middleware/vore_stomachs
	action_delegations = list(
		"add_stomach" = PROC_REF(add_stomach),
		"remove_stomach" = PROC_REF(remove_stomach),
		"modify_stomach" = PROC_REF(modify_stomach),
		"move_stomach" = PROC_REF(move_stomach)
	)

/datum/preference_middleware/vore_stomachs/proc/add_stomach()
	var/datum/vore_template/custom/vore_template = (preferences.vore_template ||= new /datum/vore_template/custom(preferences))
	if(length(vore_template.stomach_descs_owner) >= STOMACH_MAX_COUNT)
		return FALSE

	vore_template.stomach_descs_owner += "Predator flavor text not set!" // DESYNC GANG LES GOOOOOO
	vore_template.stomach_descs_prey += "Prey flavor text not set!"
	vore_template.stomach_types += VORE_TYPE_DIGEST
	return TRUE

/datum/preference_middleware/vore_stomachs/proc/remove_stomach(stomach_index)
	var/datum/vore_template/custom/vore_template = preferences.vore_template
	if(!isnum(stomach_index) || isnull(vore_template))
		return FALSE

	if(stomach_index < 1 || stomach_index > length(vore_template.stomach_descs_owner))
		return FALSE

	vore_template.stomach_descs_owner.Cut(stomach_index, stomach_index + 1)
	vore_template.stomach_descs_prey.Cut(stomach_index, stomach_index + 1)
	vore_template.stomach_types.Cut(stomach_index, stomach_index + 1)

	if(length(vore_template.stomach_descs_owner) <= 0)
		QDEL_NULL(preferences.vore_template)

/datum/preference_middleware/vore_stomachs/proc/modify_stomach(stomach_index, modified_value, new_value)
	var/datum/vore_template/custom/vore_template = preferences.vore_template
	if(!isnum(stomach_index) || isnull(vore_template))
		return FALSE

	if(stomach_index < 1 || stomach_index > length(vore_template.stomach_descs_owner))
		return FALSE

	switch(modified_value)
		if("desc_owner")
			var/sanitized_text = STRIP_HTML_SIMPLE(new_value, STOMACH_MAX_DESC_LEN)

		if("desc_prey")
		if("type")
		else
			return FALSE



#undef STOMACH_MAX_COUNT
#undef STOMACH_MAX_DESC_LEN
