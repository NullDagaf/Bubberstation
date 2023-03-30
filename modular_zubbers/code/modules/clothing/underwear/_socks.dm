/obj/item/clothing/socks
	name = "socks"
	icon = 'modular_zubbers/icons/mob/clothing/socks.dmi' //you want to make custom sprites, be my guest
	worn_icon = 'modular_zubbers/icons/mob/clothing/socks.dmi'
	armor_type = /datum/armor/none
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'
	slot_flags = ITEM_SLOT_SOCKS

/obj/item/clothing/shirt/setDir(newdir)
	SHOULD_CALL_PARENT(FALSE)
	dir = NORTH //hahahahahah

// GAGS SOCKS
/obj/item/clothing/socks/stockings
	name = "Stockings"
	greyscale_config = /datum/greyscale_config/stockings
	greyscale_colors = "#000000#000000"

/obj/item/clothing/socks/stockings/pink
	name = "Stockings (Pink)"
	greyscale_colors = "#D77BBA#BA619E"

/obj/item/clothing/socks/stockings/purple
	name = "Stockings (Purple)"
	greyscale_colors = "#9835BE#71228F"

/obj/item/clothing/socks/stockings/green
	name = "Stockings (Green)"
	greyscale_colors = "#6ABE30#549C22"

/obj/item/clothing/socks/stockings/cyan
	name = "Stockings (Cyan)"
	greyscale_colors = "#5FCDE4#50A4B6"

/obj/item/clothing/socks/stockings/orange
	name = "Stockings (Orange)"
	greyscale_colors = "#DF7126#C26B2F"

/obj/item/clothing/socks/stockings/yellow
	name = "Stockings (Yellow)"
	greyscale_colors = "#FBF236#C2BC2F"

/obj/item/clothing/socks/stockings/magenta
	name = "Stockings (Magenta)"
	greyscale_colors = "#CB0C7F#A40D68"

/obj/item/clothing/socks/stockings/blue
	name = "Stockings (Blue)"
	greyscale_colors = "#1313BA#0B0B8A"

/obj/item/clothing/socks/stockings/gray
	name = "Stockings (Gray)"
	greyscale_colors = "#515151#3B3B3B"

/obj/item/clothing/socks/stockings/christmas_green
	name = "Stockings (Candy Cane, Green)"
	greyscale_colors = "#1DCB00#1AB400"

/obj/item/clothing/socks/stockings/christmas_red
	name = "Stockings (Candy Cane, Red)"
	greyscale_colors = "#E90000#D40000"
// END GAGS SOCKS

/obj/item/clothing/socks/stockings_fishnet
	name = "Stockings (Fishnet)"
	icon_state = "fishnet_full"

/obj/item/clothing/socks/stockings_ripped
	name = "Stockings (Ripped)"
	icon_state = "stockings_ripped"


/obj/item/clothing/socks/ace_knee
	name = "Knee-high (Ace)"
	icon_state = "ace_knee"

/obj/item/clothing/socks/bee_knee
	name = "Knee-high (Bee)"
	icon_state = "bee_knee"

/obj/item/clothing/socks/bee_knee
	name = "Knee-high (Bee, Old)"
	icon_state = "bee_knee_old"

/obj/item/clothing/socks/black_knee
	name = "Knee-high (Black)"
	icon_state = "black_knee"

/obj/item/clothing/socks/candycaneg_knee
	name = "Knee-High (Candy Cane, Green)"
	icon_state = "candycaneg_knee"

/obj/item/clothing/socks/candycaner_knee
	name = "Knee-High (Candy Cane, Red)"
	icon_state = "candycaner_knee"

/obj/item/clothing/socks/christmas_knee
	name = "Knee-High (Christmas)"
	icon_state = "christmas_knee"

/obj/item/clothing/socks/commie_knee
	name = "Knee-High (Commie)"
	icon_state = "commie_knee"

/obj/item/clothing/socks/usa_knee
	name = "Knee-High (Freedom)"
	icon_state = "assblastusa_knee"

/obj/item/clothing/socks/fishnet_knee
	name = "Knee-high (Fishnet)"
	icon_state = "fishnet_knee"

/obj/item/clothing/socks/rainbow_knee
	name = "Knee-high (Rainbow)"
	icon_state = "rainbow_knee"

/obj/item/clothing/socks/rainbow_stirrups
	name = "Knee-high (Rainbow Stirrups)"
	icon_state = "rainbow_knee-stir"



/obj/item/clothing/socks/striped_knee
	name = "Knee-high (Striped)"
	icon_state = "striped_knee"

/obj/item/clothing/socks/stirrups_knee
	name = "Knee-high (Stirrups)"
	icon_state = "socks_knee-stir"

/obj/item/clothing/socks/thin_knee
	name = "Knee-high (Thin)"
	icon_state = "thin_knee"

/obj/item/clothing/socks/trans_knee
	name = "Knee-high (Trans)"
	icon_state = "trans_knee"

/obj/item/clothing/socks/uk_knee
	name = "Knee-High (UK)"
	icon_state = "uk_knee"

/obj/item/clothing/socks/white_knee
	name = "Knee-high (White)"
	icon_state = "white_knee"



/obj/item/clothing/socks/ace_thigh
	name = "Thigh-high (Ace)"
	icon_state = "ace_thigh"

/obj/item/clothing/socks/bee_thigh
	name = "Thigh-high (Bee)"
	icon_state = "bee_thigh"

/obj/item/clothing/socks/bee_thigh
	name = "Thigh-high (Bee, Old)"
	icon_state = "bee_thigh_old"

/obj/item/clothing/socks/black_thigh
	name = "Thigh-high (Black)"
	icon_state = "black_thigh"

/obj/item/clothing/socks/christmas_thigh
	name = "Thigh-high (Christmas)"
	icon_state = "christmas_thigh"

/obj/item/clothing/socks/commie_thigh
	name = "Thigh-high (Commie)"
	icon_state = "commie_thigh"

/obj/item/clothing/socks/fishnet_thigh
	name = "Thigh-high (Fishnet)"
	icon_state = "fishnet_thigh"

/obj/item/clothing/socks/fishnet_thigh_old
	name = "Thigh-high (Fishnet, Old)"
	icon_state = "fishnet"

/obj/item/clothing/socks/fishnet_thigh_alt
	name = "Thigh-high (Fishnet, Alt)"
	icon_state = "fishnet_alt"

/obj/item/clothing/socks/usa_thigh
	name = "Thigh-high (Freedom)"
	icon_state = "assblastusa_thigh"

/obj/item/clothing/socks/rainbow_thigh
	name = "Thigh-high (Rainbow)"
	icon_state = "rainbow_thigh"

/obj/item/clothing/socks/striped_thigh
	name = "Thigh-high (Striped)"
	icon_state = "striped_thigh"

/obj/item/clothing/socks/stirrups_thigh
	name = "Thigh-high (Stirrups)"
	icon_state = "socks_thigh-stir"

/obj/item/clothing/socks/stirrups_gym_thigh
	name = "Thigh-high (Stirrups, Black)"
	icon_state = "leggings-stir-black"

/obj/item/clothing/socks/stirrups_striped_thigh
	name = "Thigh-high (Stirrups, Striped)"
	icon_state = "striped_thigh-stir"

/obj/item/clothing/socks/stirrups_rainbow_thing
	name = "Thigh-high (Stirrups, Rainbow)"
	icon_state = "rainbow_thigh-stir"

/obj/item/clothing/socks/thin_thigh
	name = "Thigh-high (Thin)"
	icon_state = "thin_thigh"

/obj/item/clothing/socks/trans_thigh
	name = "Thigh-high (Trans)"
	icon_state = "trans_thigh"

/obj/item/clothing/socks/uk_thigh
	name = "Thigh-high (UK)"
	icon_state = "uk_thigh"

/obj/item/clothing/socks/white_thigh
	name = "Thigh-high (White)"
	icon_state = "white_thigh"


/obj/item/clothing/socks/black_norm
	name = "Normal (Black)"
	icon_state = "black_norm"

/obj/item/clothing/socks/candycaneg_norm
	name = "Normal (Candy Cane, Green)"
	icon_state = "candycaneg_norm"

/obj/item/clothing/socks/candycaner_norm
	name = "Normal (Candy Cane, Red)"
	icon_state = "candycaner_norm"

/obj/item/clothing/socks/christmas_norm
	name = "Normal (Christmas)"
	icon_state = "christmas_norm"

/obj/item/clothing/socks/stirrups_norm
	name = "Normal (Stirrups)"
	icon_state = "socks_norm-stir"

/obj/item/clothing/socks/white_norm
	name = "Normal (White)"
	icon_state = "white_norm"



/obj/item/clothing/socks/pantyhose
	name = "Pantyhose"
	icon_state = "pantyhose"

/obj/item/clothing/socks/pantyhose_stirrups
	name = "Pantyhose (Stirrups)"
	icon_state = "pantyhose-stir"

/obj/item/clothing/socks/pantyhose_ripped
	name = "Pantyhose (Ripped)"
	icon_state = "pantyhose_ripped"

/obj/item/clothing/socks/pantyhose_stirrups_ripped
	name = "Pantyhose (Stirrups, Ripped)"
	icon_state = "pantyhose_ripped-stir"



/obj/item/clothing/socks/black_short
	name = "Short (Black)"
	icon_state = "black_short"

/obj/item/clothing/socks/white_short
	name = "Short (White)"
	icon_state = "white_short"



/obj/item/clothing/socks/leggings
	name = "Leggings"
	icon_state = "leggings"

/obj/item/clothing/socks/leggings_stirrups
	name = "Leggings (Stirrups)"
	icon_state = "leggings-stir"



/obj/item/clothing/socks/thocks
	name = "Thocks"
	icon_state = "thocks"

/obj/item/clothing/socks/leggings_latex
	name = "Latex Socks"
	icon_state = "socks_latex"
