/datum/vore_handler
	var/mob/living/owner = null
	var/datum/vore_template/vore_template = null

	var/list/datum/vore_stomach/stomachs = list()

/datum/vore_handler/New(mob/living/owner, datum/vore_template/template = datum/vore_template/default)
	ASSERT(istype(owner))
	ASSERT(ispath(template))

	src.owner = owner

	if(owner.ckey)
		var/datum/preferences/prefs = GLOB.preferences_datums[owner.ckey]
		vore_template = prefs.read_preference(/datum/preference/vore_stomachs)
	else
		vore_template = GLOB.vore_templates[template]

	refresh_template()

/datum/vore_handler/proc/refresh_template()
	var/stomach_count = length(stomachs)
	if(!stomach_count) //nothing preexisting, can assign directly
		for(var/index in 1 to length(vore_template.stomach_descs))
			var/datum/vore_stomach/new_stomach = new
			new_stomach.enter_desc_owner = vore_template.stomach_descs_owner[index]
			new_stomach.enter_desc_prey = vore_template.stomach_descs_prey[index]

			stomachs += new_stomach
	else
		var/list/new_stomachs = list()
		for(var/index in 1 to length(vore_template.stomach_descs))
			var/datum/vore_stomach/new_stomach = new
			new_stomach.enter_desc_owner = vore_template.stomach_descs_owner[index]
			new_stomach.enter_desc_prey = vore_template.stomach_descs_prey[index]

			if(index <= stomach_count)
				#error finish
				//for()
				stomachs[] += new_stomach


/datum/vore_handler/proc/set_template_from_prefs(datum/preferences/prefs)
	ASSERT(istype(prefs))

	var/datum/vore_template/template = new
	var/list/stomach_amount = prefs.read_preference(/datum/)
