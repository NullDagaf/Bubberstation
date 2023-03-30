/datum/sprite_accessory/genital/is_hidden(mob/living/carbon/human/target_mob, obj/item/bodypart/head)
	var/obj/item/organ/external/genital/genital = target_mob.getorganslot(associated_organ_slot)
	if(isnull(genital))
		return TRUE

	switch(genital.visibility_preference)
		if(GENITAL_ALWAYS_SHOW) //Never hidden
			return FALSE
		if(GENITAL_HIDDEN_BY_CLOTHES) //Hidden if the relevant body parts are covered by clothes or underwear
			for(var/obj/item/worn_item in (target_mob.get_all_worn_items() - target_mob.underwear - target_mob.undershirt - target_mob.socks))
				if(worn_item.body_parts_covered & genital_location)
					return TRUE

			//this check is depressing
			if(istype(target_mob.wear_suit, /obj/item/clothing/suit/toggle/labcoat/skyrat/hospitalgown))
				return TRUE

			//snowflake code for previewing
			if(!(target_mob.underwear_visibility & UNDERWEAR_HIDE_SHIRT) && (target_mob.underwear?.body_parts_covered & genital_location))
				return TRUE
			if(!(target_mob.underwear_visibility & UNDERWEAR_HIDE_UNDIES) && (target_mob.undershirt?.body_parts_covered & genital_location))
				return TRUE

			return FALSE

	//If not always shown or hidden by clothes, then it defaults to always hidden
	return TRUE
