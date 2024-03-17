/obj/item/kinetic_crusher
	name = "proto-kinetic crusher"
	desc = "An early design of the proto-kinetic accelerator, it is little more than a combination of various mining tools cobbled together, forming a high-tech club. \
	While it is an effective mining tool, it did little to aid any but the most skilled and/or suicidal miners against local fauna."
	icon = 'icons/obj/mining.dmi'
	icon_state = "crusher"
	inhand_icon_state = "crusher0"
	lefthand_file = 'icons/mob/inhands/weapons/hammers_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/hammers_righthand.dmi'
	force = 0 //You can't hit stuff unless wielded
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	throwforce = 5
	throw_speed = 4
	armour_penetration = 10
	custom_materials = list(
		/datum/material/iron = HALF_SHEET_MATERIAL_AMOUNT * 1.15,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT * 2.075
	)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("smashes", "crushes", "cleaves", "chops", "pulps")
	attack_verb_simple = list("smash", "crush", "cleave", "chop", "pulp")
	sharpness = SHARP_EDGED
	actions_types = list(/datum/action/item_action/toggle_light)
	obj_flags = UNIQUE_RENAME
	light_system = OVERLAY_LIGHT
	light_range = 5
	light_on = FALSE

	var/charge_time = 1.5 SECONDS
	var/detonation_damage = 50
	var/backstab_bonus = 30

/obj/item/kinetic_crusher/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering, speed = 6 SECONDS, effectiveness = 110)
	AddComponent(/datum/component/kinetic_crusher, detonation_damage, backstab_bonus, charge_time)
	AddComponent(/datum/component/two_handed, force_wielded = 20)
	RegisterSignal(src, COMSIG_HIT_BY_SABOTEUR, PROC_REF(on_saboteur))

/obj/item/kinetic_crusher/melee_attack_chain(mob/user, atom/target, params)
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		return ..()

	to_chat(user, span_warning("[src] is too heavy to use with one hand! You fumble and drop everything."))
	user.drop_all_held_items()

/obj/item/kinetic_crusher/ui_action_click(mob/user, actiontype)
	set_light_on(!light_on)
	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_appearance()

/obj/item/kinetic_crusher/proc/on_saboteur(datum/source, disrupt_duration)
	set_light_on(FALSE)
	playsound(src, 'sound/weapons/empty.ogg', 100, TRUE)
	return COMSIG_SABOTEUR_SUCCESS

/obj/item/kinetic_crusher/update_icon_state()
	inhand_icon_state = "crusher[HAS_TRAIT(src, TRAIT_WIELDED)]" // this is not icon_state and not supported by 2hcomponent
	return ..()

/obj/item/kinetic_crusher/update_overlays()
	. = ..()
	if(light_on)
		. += "[icon_state]_lit"

/obj/item/kinetic_crusher/compact //for admins
	name = "compact kinetic crusher"
	w_class = WEIGHT_CLASS_NORMAL


/obj/item/crusher_trophy/vortex_talisman
	icon = 'modular_zubbers/icons/obj/artefacts.dmi'
	icon_state = "vortex_talisman"

//stupid to have both crusher and crusher_comp as params but it helps with reducing core code mods
/obj/item/crusher_trophy/proc/add_to(obj/item/crusher, mob/living/user, datum/component/kinetic_crusher/crusher_comp)
	for(var/obj/item/crusher_trophy/trophy as anything in crusher_comp.stored_trophies)
		if(istype(trophy, denied_type) || istype(src, trophy.denied_type))
			to_chat(user, span_warning("You can't seem to attach [src] to [crusher]. Maybe remove a few trophies?"))
			return FALSE

	if(!user.transferItemToLoc(src, crusher))
		return

	crusher_comp.stored_trophies += src
	crusher_comp.RegisterSignal(src, COMSIG_MOVABLE_MOVED, TYPE_PROC_REF(/datum/component/kinetic_crusher, on_trophy_moved))
	to_chat(user, span_notice("You attach [src] to [crusher]."))
	return TRUE

/obj/item/crusher_trophy/proc/remove_from(obj/item/kinetic_crusher/crusher, mob/living/user, datum/component/kinetic_crusher/crusher_comp)
	crusher_comp.UnregisterSignal(src, COMSIG_MOVABLE_MOVED)
	crusher_comp.stored_trophies -= src
	forceMove(get_turf(crusher))
	return TRUE

/obj/projectile/destabilizer
	name = "destabilizing force"
	icon_state = "pulse1"
	damage = 0 //We're just here to mark people. This is still a melee weapon.
	damage_type = BRUTE
	armor_flag = BOMB
	range = 6
	log_override = TRUE
	var/datum/component/kinetic_crusher/hammer_synced

/obj/projectile/destabilizer/Destroy()
	hammer_synced = null
	return ..()

/obj/projectile/destabilizer/on_hit(atom/target, blocked = 0, pierce_hit)
	if(isliving(target))
		var/mob/living/victim = target
		var/had_effect = victim.has_status_effect(/datum/status_effect/crusher_mark) //used as a boolean
		var/datum/status_effect/crusher_mark/mark = had_effect || victim.apply_status_effect(/datum/status_effect/crusher_mark, hammer_synced)

		for(var/obj/item/crusher_trophy/trophy as anything in hammer_synced?.stored_trophies)
			trophy.on_mark_application(target, mark, had_effect)

	var/turf/closed/mineral/target_turf = get_turf(target) //sure i guess
	if(istype(target_turf))
		new /obj/effect/temp_visual/kinetic_blast(target_turf)
		target_turf.gets_drilled(firer)

	return ..()

/obj/item/crusher_trophy/legion_skull/add_to(obj/item/kinetic_crusher/crusher, mob/living/user, datum/component/kinetic_crusher/crusher_comp)
	. = ..()
	if(.)
		crusher_comp.recharge_speed -= bonus_value

/obj/item/crusher_trophy/legion_skull/remove_from(obj/item/kinetic_crusher/crusher, mob/living/user, datum/component/kinetic_crusher/crusher_comp)
	. = ..()
	if(.)
		crusher_comp.recharge_speed += bonus_value


/obj/item/crusher_trophy/demon_claws/add_to(obj/item/kinetic_crusher/crusher, mob/living/user, datum/component/kinetic_crusher/crusher_comp)
	. = ..()
	if(!.)
		return

	crusher.force += bonus_value * 0.2
	crusher_comp.detonation_damage += bonus_value * 0.8

	var/datum/component/two_handed/two_handed = crusher.GetComponent(/datum/component/two_handed)
	two_handed?.force_wielded += bonus_value * 0.2

/obj/item/crusher_trophy/demon_claws/remove_from(obj/item/kinetic_crusher/crusher, mob/living/user, datum/component/kinetic_crusher/crusher_comp)
	. = ..()
	if(!.)
		return

	crusher.force -= bonus_value * 0.2
	crusher_comp.detonation_damage -= bonus_value * 0.8

	var/datum/component/two_handed/two_handed = crusher.GetComponent(/datum/component/two_handed)
	two_handed?.force_wielded -= bonus_value * 0.2


/obj/item/crusher_trophy/wendigo_horn/add_to(obj/item/kinetic_crusher/crusher, mob/living/user)
	. = ..()
	if(!.)
		return

	crusher.force *= 2

	var/datum/component/two_handed/two_handed = crusher.GetComponent(/datum/component/two_handed)
	two_handed?.force_wielded *= 2

/obj/item/crusher_trophy/wendigo_horn/remove_from(obj/item/kinetic_crusher/crusher, mob/living/user)
	. = ..()
	if(!.)
		return

	crusher.force *= 0.5

	var/datum/component/two_handed/two_handed = crusher.GetComponent(/datum/component/two_handed)
	two_handed?.force_wielded *= 0.5
