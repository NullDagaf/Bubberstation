/mob/living/carbon/human/update_worn_underwear()
	remove_overlay(UNDERWEAR_LAYER)

	if(client && hud_used?.inv_slots[TOBITSHIFT(ITEM_SLOT_UNDERWEAR) + 1])
		var/atom/movable/screen/inventory/inv = hud_used.inv_slots[TOBITSHIFT(ITEM_SLOT_UNDERWEAR) + 1]
		inv.update_icon()

	if(underwear && !(underwear_visibility & UNDERWEAR_HIDE_UNDIES))
		var/obj/item/worn_item_state = underwear.icon_state
		var/mutable_appearance/underwear_overlay
		update_hud_underwear()

				var/icon_state = underwear.icon_state
				if(underwear.has_digitigrade && (bodytype & BODYTYPE_DIGITIGRADE))
					icon_state += "_d"
				underwear_overlay = mutable_appearance(underwear.icon, icon_state, -BODY_LAYER)
				underwear_overlay.color = species_human.underwear_color
				standing += underwear_overlay
	apply_overlay(UNDERWEAR_LAYER)


/mob/living/carbon/human/proc/update_hud_underwear(obj/item/worn_item)
	worn_item.screen_loc = UI_LOC_UNDERWEAR
	if((client && hud_used?.hud_shown))
		client.screen += worn_item
	update_observer_view(worn_item)

/mob/living/carbon/human/proc/update_hud_shirt(obj/item/worn_item)
	worn_item.screen_loc = UI_LOC_SHIRT
	if((client && hud_used?.hud_shown))
		client.screen += worn_item
	update_observer_view(worn_item)

/mob/living/carbon/human/proc/update_hud_socks(obj/item/worn_item)
	worn_item.screen_loc = UI_LOC_SOCKS
	if((client && hud_used?.hud_shown))
		client.screen += worn_item
	update_observer_view(worn_item)

/mob/living/carbon/human/update_worn_back()
	remove_overlay(BACK_LAYER)

	if(client && hud_used && hud_used.inv_slots[TOBITSHIFT(ITEM_SLOT_BACK) + 1])
		var/atom/movable/screen/inventory/inv = hud_used.inv_slots[TOBITSHIFT(ITEM_SLOT_BACK) + 1]
		inv.update_icon()

	if(back)
		var/obj/item/worn_item = back
		var/mutable_appearance/back_overlay
		update_hud_back(worn_item)
		var/icon_file = 'icons/mob/clothing/back.dmi'

		// SKYRAT EDIT ADDITION
		var/mutant_override = FALSE
		if(dna.species.bodytype & BODYTYPE_CUSTOM)
			var/species_icon_file = dna.species.generate_custom_worn_icon(LOADOUT_ITEM_MISC, back)
			if(species_icon_file)
				icon_file = species_icon_file
				mutant_override = TRUE
		// SKYRAT EDIT END

		back_overlay = back.build_worn_icon(default_layer = BACK_LAYER, default_icon_file = icon_file, override_file = mutant_override ? icon_file : null) // SKYRAT EDIT CHANGE

		if(!back_overlay)
			return
		if(!mutant_override && (OFFSET_BACK in dna.species.offset_features)) // SKYRAT EDIT CHANGE
			back_overlay.pixel_x += dna.species.offset_features[OFFSET_BACK][1]
			back_overlay.pixel_y += dna.species.offset_features[OFFSET_BACK][2]
		overlays_standing[BACK_LAYER] = back_overlay
	apply_overlay(BACK_LAYER)


	//Underwear, Undershirts & Socks
	if(!(NO_UNDERWEAR in species_traits))
		if(species_human.underwear && !(species_human.underwear_visibility & UNDERWEAR_HIDE_UNDIES))
			var/datum/sprite_accessory/underwear/underwear = GLOB.underwear_list[species_human.underwear]
			var/mutable_appearance/underwear_overlay
			if(underwear)
				var/icon_state = underwear.icon_state
				if(underwear.has_digitigrade && (bodytype & BODYTYPE_DIGITIGRADE))
					icon_state += "_d"
				underwear_overlay = mutable_appearance(underwear.icon, icon_state, -BODY_LAYER)
				underwear_overlay.color = species_human.underwear_color
				standing += underwear_overlay

		if(species_human.undershirt && !(species_human.underwear_visibility & UNDERWEAR_HIDE_SHIRT))
			var/datum/sprite_accessory/undershirt/undershirt = GLOB.undershirt_list[species_human.undershirt]
			if(undershirt)
				var/mutable_appearance/undershirt_overlay
				if(species_human.dna.species.sexes && species_human.gender == FEMALE)
					undershirt_overlay = wear_female_version(undershirt.icon_state, undershirt.icon, BODY_LAYER)
				else
					undershirt_overlay = mutable_appearance(undershirt.icon, undershirt.icon_state, -BODY_LAYER)
				undershirt_overlay.color = species_human.undershirt_color
				standing += undershirt_overlay

		if(species_human.socks && species_human.num_legs >= 2 && !(mutant_bodyparts["taur"]) && !(species_human.underwear_visibility & UNDERWEAR_HIDE_SOCKS))
			var/datum/sprite_accessory/socks/socks = GLOB.socks_list[species_human.socks]
			if(socks)
				var/mutable_appearance/socks_overlay
				var/icon_state = socks.icon_state
				if((bodytype & BODYTYPE_DIGITIGRADE))
					icon_state += "_d"
				socks_overlay = mutable_appearance(socks.icon, icon_state, -BODY_LAYER)
				socks_overlay.color = species_human.socks_color
				standing += socks_overlay
