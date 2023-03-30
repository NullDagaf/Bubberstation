/obj/structure/dresser
	name = "dresser"
	desc = "A nicely-crafted wooden dresser. It's filled with lots of undies."
	density = TRUE
	anchored = TRUE
	var/static/list/holdable

/obj/structure/dresser/Initialize(mapload)
	. = ..()
	var/static/list/holdable
	var/static/list/spawnable
	if(isnull(spawnable))
		holdable = subtypesof(/obj/item/clothing/underwear) + subtypesof(/obj/item/clothing/shirt) + subtypesof(/obj/item/clothing/socks)
		spawnable = holdable - /obj/item/clothing/underwear/loincloth

	create_storage(32)
	atom_storage.exception_hold = holdable
	for(var/i in 1 to 24)
		var/spawned = pick(holdable)
		new spawned(src)

/obj/structure/dresser/attackby(obj/item/item, mob/user, params)
	if(item.tool_behaviour == TOOL_WRENCH)
		to_chat(user, span_notice("You begin to [anchored ? "unwrench" : "wrench"] [src]."))
		if(!item.use_tool(src, user, 20, volume=50))
			return
		to_chat(user, span_notice("You successfully [anchored ? "unwrench" : "wrench"] [src]."))
		set_anchored(!anchored)
	else
		return ..()

/obj/structure/dresser/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/mineral/wood(drop_location(), 10)
	return ..()
