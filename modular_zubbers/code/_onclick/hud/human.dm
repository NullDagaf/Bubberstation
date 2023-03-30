/datum/hud/human
	var/list/extras_inventory = list() //underwear|shirt|socks. things you rarely need.

/datum/hud/human/New(mob/living/carbon/human/owner)
	var/atom/movable/screen/inventory/inv_box

	inv_box = new /atom/movable/screen/inventory()
	inv_box.name = "underwear"
	inv_box.icon = ui_style
	inv_box.icon_state = "underwear"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_head
	inv_box.slot_id = ITEM_SLOT_UNDERWEAR
	inv_box.hud = src
	extras_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory()
	inv_box.name = "shirt"
	inv_box.icon = ui_style
	inv_box.icon_state = "shirt"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_head
	inv_box.slot_id = ITEM_SLOT_SHIRT
	inv_box.hud = src
	extras_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory()
	inv_box.name = "socks"
	inv_box.icon = ui_style
	inv_box.icon_state = "socks"
	inv_box.icon_full = "template"
	inv_box.screen_loc = ui_head
	inv_box.slot_id = ITEM_SLOT_SHIRT
	inv_box.hud = src
	extras_inventory += inv_box

	for(var/atom/movable/screen/inventory/inv in extras_inventory)
		if(inv.slot_id)
			inv.hud = src
			inv_slots[TOBITSHIFT(inv.slot_id) + 1] = inv
			inv.update_appearance()

	return ..()
