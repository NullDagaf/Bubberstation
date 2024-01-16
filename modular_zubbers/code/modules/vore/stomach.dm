/datum/vore_stomach
	/// Owner of the stomach.
	var/mob/living/owner = null
	/// Contents of the stomach. Lazylist.
	var/list/contents = null
	/// How many prey can we hold at once?
	var/max_occupants = 2
	/// What do we do with our food? Uses VORE_TYPE_X defines.
	var/type = VORE_TYPE_DIGEST
	/// How strong of an effect do we have on the prey? Effect depends on the stomach type.
	var/acid_strength = 5

	/// Description to show to the prey upon entry.
	var/enter_desc_prey = null
	/// Description to show to the stomach owner upon entry.
	var/enter_desc_owner = null
	/// Sound to play to both the stomach owner and prey upon entry.
	var/enter_sound = null

/datum/vore_stomach/New(mob/living/owner)
	ASSERT(owner)

	src.owner = owner

	RegisterSignal(owner, COMSIG_QDELETING, PROC_REF(on_owner_qdel))

/datum/vore_stomach/Destroy(force)
	eject_contents()

	owner = null
	return ..()

/datum/vore_stomach/proc/on_owner_qdel(datum/source, force)
	SIGNAL_HANDLER

	qdel(src)

/datum/vore_stomach/proc/on_entry(mob/living/food)
	SHOULD_CALL_PARENT(TRUE)
	ASSERT(istype(food))

	if(length(contents) >= max_occupants)
		return FALSE

	if(food in contents)
		return FALSE

	if(!length(contents))
		contents = list(food)
		START_PROCESSING(SSobj, src)
	food.forceMove(owner)

	if(enter_desc_prey)
		to_chat(food, span_purple(enter_desc_prey))
	if(enter_desc_owner)
		to_chat(owner, span_purple(enter_desc_owner))
	if(enter_sound)
		SEND_SOUND(owner, enter_sound)
		SEND_SOUND(food, enter_sound)


/datum/vore_stomach/proc/on_exit(mob/living/food, datum/vore_stomach/new_stomach = null)
	SHOULD_CALL_PARENT(TRUE)
	ASSERT(istype(food))

	if(!(food in contents))
		return FALSE

	food -= contents
	if(!length(contents))
		contents = null
		STOP_PROCESSING(SSobj, src)

	LAZYREMOVE(contents, food)

/datum/vore_stomach/proc/eject_contents()
	for(var/mob/living/survivor as anything in contents)
		on_exit(food)



/datum/vore_stomach/process(seconds_per_tick)
	//this could be handled with a fn pointer, some subtype fuckery or whatever else
	switch(type) //but we realistically will never get to that point of complexity so who cares
		if(VORE_TYPE_DIGEST)
			for(var/mob/living/occupant as anything in contents)
				/// do stuff i guess


