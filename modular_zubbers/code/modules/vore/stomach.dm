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
	var/acid_strength = 3
	/// Threshold for how much damage/nutrition/etc must the prey have before being moved to the next stomach. Value is a range between 0 and 1. For damage, 0 means -200 health (aka death threshold).
	var/transfer_threshold = 0.6

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

/datum/vore_stomach/proc/enter_stomach(mob/living/food)
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

	if(iscarbon(food))
		var/mob/living/carbon/carbonara = food
		var/obj/item/clothing/under/unsensored = carbonara.get_item_by_slot(ITEM_SLOT_ICLOTHING)
		unsensored?.sensor_mode = BROKEN_SENSORS
		carbonara.update_suit_sensors()

	if(enter_desc_prey)
		to_chat(food, span_purple(enter_desc_prey))
	if(enter_desc_owner)
		to_chat(owner, span_purple(enter_desc_owner))
	if(enter_sound)
		SEND_SOUND(owner, enter_sound)
		SEND_SOUND(food, enter_sound)


/datum/vore_stomach/proc/exit_stomach(mob/living/food, datum/vore_stomach/new_stomach = null)
	SHOULD_CALL_PARENT(TRUE)
	ASSERT(istype(food))

	if(!(food in contents))
		return FALSE

	food -= contents
	if(!length(contents))
		contents = null
		STOP_PROCESSING(SSobj, src)

	LAZYREMOVE(contents, food)

	if(new_stomach)
		new_stomach.enter_stomach(food)

/datum/vore_stomach/proc/eject_contents()
	for(var/mob/living/survivor as anything in contents)
		exit_stomach(survivor)


/datum/vore_stomach/process(seconds_per_tick)
	// we only transfer one mob at a time, for muh RANDOMNESS!!
	var/mob/living/transfered = null

	//this could be handled with a fn pointer, some subtype fuckery or whatever else
	switch(type) //but we realistically will never get to that point of complexity so who cares
		if(VORE_TYPE_DIGEST)
			if(SPT_PROB(80, seconds_per_tick))
				return

			var/damage = (acid_strength / 3) * 5 * seconds_per_tick // 3 acid_damage (player mobs) == 5 dmg per proc

			for(var/mob/living/occupant as anything in shuffle(contents))
				occupant.apply_damage(damage, BURN)
				if(occupant.get_total_damage() / occupant.maxHealth >= transfer_threshold)
					transfered = occupant

		if(VORE_TYPE_ABSORB) //weird but sure
			if(SPT_PROB(80, seconds_per_tick))
				return

			var/nutrition_loss = (acid_strength)// / ) *  * seconds_per_tick
			for(var/mob/living/occupant as anything in shuffle(contents))
				occupant.adjust_nutrition(nutrition_loss)
				owner.adjust_nutrition(-nutrition_loss * 0.5) //something something stomachs suck at food conversion
				if(occupant.nutrition <= NUTRITION_LEVEL_STARVING)
					occupant.dust()

	if(isnull(transfered))
		return // no one to move

	var/list/stomachs = owner.vore_handler.stomachs //ass
	var/our_index = stomachs.Find(src) //but yknow, it works
	if(our_index >= length(stomachs))
		return //end of the line

	exit_stomach(transfered, stomachs[our_index + 1])
