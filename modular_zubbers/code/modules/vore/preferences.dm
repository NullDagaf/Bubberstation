#define STOMACH_MAX_COUNT 8 //arbitrary, raise if ppl complain
#define STOMACH_MAX_DESC_LEN 2048

/datum/preference_middleware/vore_stomachs
	key = "vore"
	action_delegations = list(
		"add_stomach" = PROC_REF(add_stomach),
		"remove_stomach" = PROC_REF(remove_stomach),
		"modify_stomach" = PROC_REF(modify_stomach),
		"move_stomach" = PROC_REF(move_stomach)
	)

/datum/preference_middleware/vore_stomachs/get_constant_data()
	var/list/data = list()
	data["stomach_types"] = GLOB.vore_belly_types
	data["max_desc_len"] = STOMACH_MAX_DESC_LEN
	data["max_stomach_count"] = STOMACH_MAX_COUNT
	return data

/datum/preference_middleware/vore_stomachs/get_ui_static_data(mob/user)
	var/list/data = list()

	var/list/stomach_data = list()
	for(var/index in 1 to length(preferences.vore_template?.stomach_descs_owner)) //doesnt run if vore_template == null
		var/list/stomach = list()
		stomach["type"] = preferences.vore_template.stomach_types[index]
		stomach["desc_owner"] = preferences.vore_template.stomach_descs_owner[index]
		stomach["desc_prey"] = preferences.vore_template.stomach_descs_prey[index]

		stomach_data[++stomach_data.len] = stomach

	data["stomachs"] = stomach_data

	return data

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

	if(length(vore_template.stomach_descs_owner) == 0)
		QDEL_NULL(preferences.vore_template)
	return TRUE

/datum/preference_middleware/vore_stomachs/proc/modify_stomach(stomach_index, modified_value, new_value)
	var/datum/vore_template/custom/vore_template = preferences.vore_template
	if(!isnum(stomach_index) || isnull(vore_template))
		return FALSE

	if(stomach_index < 1 || stomach_index > length(vore_template.stomach_descs_owner))
		return FALSE

	switch(modified_value)
		if("desc_owner")
			#error i dont rember how to sanitize text, look at it later bob
			var/sanitized_text = STRIP_HTML_SIMPLE(new_value, STOMACH_MAX_DESC_LEN)
			vore_template.stomach_descs_owner = sanitized_text

		if("desc_prey")
			#error i dont rember how to sanitize text, look at it later bob
			var/sanitized_text = STRIP_HTML_SIMPLE(new_value, STOMACH_MAX_DESC_LEN)
			vore_template.stomach_descs_prey = sanitized_text
		if("type")
			vore_template.stomach_descs_owner = sanitize_inlist(new_value, GLOB.vore_belly_types, VORE_TYPE_DIGEST)
		else
			return FALSE
	return TRUE

/datum/preference_middleware/vore_stomachs/proc/move_stomach(stomach_index, direction)
	var/datum/vore_template/custom/vore_template = preferences.vore_template
	if(!isnum(stomach_index) || !isnum(direction) || isnull(vore_template))
		return FALSE

	if(stomach_index < 1 || stomach_index > length(vore_template.stomach_descs_owner))
		return FALSE

	var/new_index = stomach_index + SIGN(direction) //ech
	if(new_index < 1 || new_index > length(vore_template.stomach_descs_owner))
		return FALSE

	vore_template.stomach_descs_owner.Swap(stomach_index, new_index)
	vore_template.stomach_descs_prey.Swap(stomach_index, new_index)
	vore_template.stomach_types.Swap(stomach_index, new_index)
	return TRUE


#undef STOMACH_MAX_COUNT
#undef STOMACH_MAX_DESC_LEN
