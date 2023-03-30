/proc/generate_values_for_underwear(list/accessory_list, list/icons, color, icon_offset) //SKYRAT EDIT CHANGE - Colorable Undershirt/Socks
	var/icon/lower_half = icon('icons/blanks/32x32.dmi', "nothing")

	for (var/icon in icons)
		lower_half.Blend(icon('icons/mob/species/human/bodyparts_greyscale.dmi', icon), ICON_OVERLAY)

	var/list/values = list()

	for (var/accessory_name in accessory_list)
		var/icon/icon_with_socks = new(lower_half)
		var/datum/sprite_accessory/accessory = accessory_list[accessory_name]
		//SKYRAT EDIT CHANGE
		if (accessory_name != "Nude" && accessory)
			var/icon/accessory_icon = icon(accessory.icon, accessory.icon_state)
		//SKYRAT EDIT CHANGE END
			if (color && !accessory.use_static)
				accessory_icon.Blend(color, ICON_MULTIPLY)
			icon_with_socks.Blend(accessory_icon, ICON_OVERLAY)
		icon_with_socks.Crop(10, 1+icon_offset, 22, 13+icon_offset)	//SKYRAT EDIT CHANGE - Colorable Undershirt/Socks

		icon_with_socks.Scale(32, 32)

		values[accessory_name] = icon_with_socks

	return values

/datum/preference/choiced/socks/init_possible_values()
	return generate_values_for_underwear(GLOB.socks_list, list("human_r_leg", "human_l_leg"), COLOR_ALMOST_BLACK, 0)

/datum/preference/choiced/socks/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "socks_color"

	return data

/datum/preference/choiced/socks/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(NO_UNDERWEAR in species.species_traits)

/datum/preference/choiced/undershirt/init_possible_values()
	return generate_values_for_underwear(GLOB.undershirt_list, list("human_chest_m", "human_r_arm", "human_l_arm", "human_r_leg", "human_l_leg", "human_r_hand", "human_l_hand"), COLOR_ALMOST_BLACK, 10)

/datum/preference/choiced/undershirt/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "undershirt_color"

	return data

/datum/preference/choiced/undershirt/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(NO_UNDERWEAR in species.species_traits)

/datum/preference/choiced/underwear/init_possible_values()
	return generate_values_for_underwear(GLOB.underwear_list, list("human_chest_m", "human_r_leg", "human_l_leg"), COLOR_ALMOST_BLACK, 5)

/datum/preference/choiced/underwear/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(NO_UNDERWEAR in species.species_traits)
