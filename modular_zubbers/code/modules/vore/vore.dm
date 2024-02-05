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
		vore_template = prefs.vore_template //cant wait for all the weird harddels this will cause
	else
		vore_template = GLOB.vore_templates[template]

	refresh_template()

/datum/vore_handler/proc/refresh_template()
	var/stomach_count = length(stomachs)
	if(!stomach_count) //nothing preexisting, can assign directly
		for(var/index in 1 to length(vore_template.stomach_descs_owner))
			var/datum/vore_stomach/new_stomach = create_stomach()
			new_stomach.enter_desc_owner = vore_template.stomach_descs_owner[index]
			new_stomach.enter_desc_prey = vore_template.stomach_descs_prey[index]

			stomachs += new_stomach
	else
		var/list/new_stomachs = list()
		for(var/index in 1 to length(vore_template.stomach_descs_owner))
			var/datum/vore_stomach/new_stomach = create_stomach()
			new_stomach.enter_desc_owner = vore_template.stomach_descs_owner[index]
			new_stomach.enter_desc_prey = vore_template.stomach_descs_prey[index]

			new_stomachs += new_stomach
			if(index > stomach_count)
				continue

			var/datum/vore_stomach/old_stomach = stomachs[index]
			for(var/mob/living/transfered as anything in old_stomach.contents)
				old_stomach.exit_stomach(transfered, new_stomach, forced = TRUE)

			qdel(old_stomach)

		stomachs.Cut()
		stomachs = new_stomachs


/datum/vore_handler/proc/create_stomach()
	var/datum/vore_stomach/stomach = new
	RegisterSignal(stomach, COMSIG_QDELETING, PROC_REF(on_stomach_qdel))
	return stomach

/datum/vore_handler/proc/on_stomach_qdel(datum/vore_stomach/source, force)
	SIGNAL_HANDLER

	// ejecting handled by stomach qdel
	stomachs -= source

