/obj/item/clothing/shirt
	name = "shirt"
	icon = 'modular_zubbers/icons/mob/clothing/shirt.dmi' //you want to make custom sprites, be my guest
	worn_icon = 'modular_zubbers/icons/mob/clothing/shirt.dmi'
	armor_type = /datum/armor/none
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'
	slot_flags = ITEM_SLOT_UNDERWEAR
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	var/preferred_gender = NEUTER //is this meant for males or females? used for randomization

/obj/item/clothing/shirt/setDir(newdir)
	SHOULD_CALL_PARENT(FALSE)
	dir = NORTH //hahahahahah


//i spent WAY too much time categorizing these. respect that when adding new things
//if you just slap your own shirt at the very end, i will personally hunt you down

/datum/sprite_accessory/undershirt/binder
	name = "Binder"
	icon_state = "binder"
	prefered_gender = MALE

/datum/sprite_accessory/undershirt/binder/strapless
	name = "Binder (Strapless)"
	icon_state = "binder_strapless"

/datum/sprite_accessory/undershirt/buttondown
	name = "Shirt (Buttondown)"
	icon_state = "buttondown"

/datum/sprite_accessory/undershirt/buttondown_short_sleeve
	name = "Shirt (Buttondown, Short-Sleeved)"
	icon_state = "buttondown_short"

/datum/sprite_accessory/undershirt/offshoulder
	name = "Shirt (Off-Shoulder)"
	icon_state = "one_arm"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/polo
	name = "Shirt (Polo)"
	icon_state = "polo_white"

/datum/sprite_accessory/undershirt/shortsleeve
	name = "Shirt (Short-Sleeve)"
	icon_state = "shortsleeve_white"

/datum/sprite_accessory/undershirt/shirt_white
	name = "Shirt (White)"
	icon_state = "shirt_white"


/datum/sprite_accessory/undershirt/alienshirt
	name = "Shirt (Alien)"
	icon_state = "shirt_alien"

/datum/sprite_accessory/undershirt/mondmondjaja
	name = "Shirt (Band)"
	icon_state = "shirt_band"

/datum/sprite_accessory/undershirt/bulletclub //4 life
	name = "Shirt (Black Skull)"
	icon_state = "shirt_bc"

/datum/sprite_accessory/undershirt/clownshirt
	name = "Shirt (Clown)"
	icon_state = "shirt_clown"

/datum/sprite_accessory/undershirt/commie
	name = "Shirt (Commie)"
	icon_state = "shirt_commie"

/datum/sprite_accessory/undershirt/ian
	name = "Shirt (Ian)"
	icon_state = "shirt_ian"

/datum/sprite_accessory/undershirt/ilovent
	name = "Shirt (I Love NT)"
	icon_state = "shirt_lovent"

/datum/sprite_accessory/undershirt/lover
	name = "Shirt (Lover)"
	icon_state = "shirt_lover"

/datum/sprite_accessory/undershirt/matroska
	name = "Shirt (Matroska)"
	icon_state = "shirt_matroska"

/datum/sprite_accessory/undershirt/meat
	name = "Shirt (Meat)"
	icon_state = "shirt_meat"

/datum/sprite_accessory/undershirt/nano
	name = "Shirt (Nanotrasen)"
	icon_state = "shirt_nano"

/datum/sprite_accessory/undershirt/peace
	name = "Shirt (Peace)"
	icon_state = "shirt_peace"

/datum/sprite_accessory/undershirt/pacman
	name = "Shirt (Pogoman)"
	icon_state = "shirt_pogoman"

/datum/sprite_accessory/undershirt/question
	name = "Shirt (Question)"
	icon_state = "shirt_question"

/datum/sprite_accessory/undershirt/redshirt
	name = "Shirt (Red)"
	icon_state = "shirt_red"

/datum/sprite_accessory/undershirt/skull
	name = "Shirt (Skull)"
	icon_state = "shirt_skull"

/datum/sprite_accessory/undershirt/ss13
	name = "Shirt (SS13)"
	icon_state = "shirt_ss13"

/datum/sprite_accessory/undershirt/stripe
	name = "Shirt (Striped)"
	icon_state = "shirt_stripes"

/datum/sprite_accessory/undershirt/tiedye
	name = "Shirt (Tie-dye)"
	icon_state = "shirt_tiedye"

/datum/sprite_accessory/undershirt/uk
	name = "Shirt (UK)"
	icon_state = "shirt_uk"

/datum/sprite_accessory/undershirt/usa
	name = "Shirt (USA)"
	icon_state = "shirt_assblastusa"

/datum/sprite_accessory/undershirt/striped
	name = "Striped Shirt (Black)"
	icon_state = "longstripe"

/datum/sprite_accessory/undershirt/striped/blue
	name = "Striped Shirt (Blue)"
	icon_state = "longstripe_blue"


/datum/sprite_accessory/undershirt/swimsuit
	name = "Swimsuit Top"
	icon_state = "bra_swimming"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/swimsuit_red
	name = "Swimsuit, One Piece - Red"
	icon_state = "swimming_red"
	prefered_gender = FEMALE
	hides_breasts = TRUE

/datum/sprite_accessory/undershirt/swimsuit
	name = "Swimsuit, One Piece - Black"
	icon_state = "swimming_black"
	prefered_gender = FEMALE
	hides_breasts = TRUE

/datum/sprite_accessory/undershirt/swimsuit_blue
	name = "Swimsuit, One Piece - Striped Blue"
	icon_state = "swimming_blue"
	prefered_gender = FEMALE
	hides_breasts = TRUE








/datum/sprite_accessory/undershirt/redshirtsport
	name = "Sports Shirt (Red)"
	icon_state = "redshirtsport"

/datum/sprite_accessory/undershirt/greenshirtsport
	name = "Sports Shirt (Green)"
	icon_state = "greenshirtsport"

/datum/sprite_accessory/undershirt/blueshirtsport
	name = "Sports Shirt (Blue)"
	icon_state = "blueshirtsport"

/datum/sprite_accessory/undershirt/redjersey
	name = "Jersey (Red)"
	icon_state = "shirt_redjersey"

/datum/sprite_accessory/undershirt/bluejersey
	name = "Jersey (Blue)"
	icon_state = "shirt_bluejersey"


/datum/sprite_accessory/undershirt/tanktop_alt
	name = "Tank Top - Alt"
	icon_state = "tanktop_alt"

/datum/sprite_accessory/undershirt/tanktop_midriff
	name = "Tank Top - Midriff"
	icon_state = "tank_midriff"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/tanktop_midriff_alt
	name = "Tank Top - Midriff Halterneck"
	icon_state = "tank_midriff_alt"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/tankstripe
	name = "Tank Top - Striped"
	icon_state = "tank_stripes"

/datum/sprite_accessory/undershirt/tank_top_sun
	name = "Tank top - Sun"
	icon_state = "tank_sun"

/datum/sprite_accessory/undershirt/female_midriff
	name = "Tank Top (Midriff)"
	icon_state = "tank_midriff"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/tankfire
	name = "Tank Top (Fire)"
	icon_state = "tank_fire"

/datum/sprite_accessory/undershirt/tankstripe
	name = "Tank Top (Striped)"
	icon_state = "tank_stripes"

/datum/sprite_accessory/undershirt/tank_white
	name = "Tank Top (White)"
	icon_state = "tank_white"

/datum/sprite_accessory/undershirt/whitetop
	name = "Top (White)"
	icon_state = "top_white"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/lizared
	name = "Top (LIZARED)"
	icon_state = "lizared_top"



/datum/sprite_accessory/undershirt/leotard
	name = "Leotard"
	icon_state = "leotard"
	prefered_gender = FEMALE
	hides_groin = TRUE

/datum/sprite_accessory/undershirt/leotard/turtleneck
	name = "Leotard (Turtleneck)"
	icon_state = "leotard_turtleneck"

/datum/sprite_accessory/undershirt/leotard/turtleneck/sleeveless
	name = "Leotard (Turtleneck, Sleeveless)"
	icon_state = "leotard_turtleneck_sleeveless"



/datum/sprite_accessory/undershirt/turtleneck
	name = "Sweater (Turtleneck)"
	icon_state = "turtleneck"

/datum/sprite_accessory/undershirt/turtleneck/smooth
	name = "Sweater (Turtleneck, Smooth)"
	icon_state = "turtleneck_smooth"

/datum/sprite_accessory/undershirt/turtleneck/sleeveless
	name = "Sweater (Turtleneck, Sleeveless)"
	icon_state = "turtleneck_sleeveless"



/datum/sprite_accessory/undershirt/bra
	name = "Bra"
	icon_state = "bra"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_alt
	name = "Bra (Alt)"
	icon_state = "bra_alt"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_thin
	name = "Bra (Thin)"
	icon_state = "bra_thin"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_kinky
	name = "Bra (Kinky Black)"
	icon_state = "bra_kinky"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_freedom
	name = "Bra (Freedom)"
	icon_state = "bra_assblastusa"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_commie
	name = "Bra (Commie)"
	icon_state = "bra_commie"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_beekini
	name = "Bra (Bee-kini)"
	icon_state = "bra_beekini"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_uk
	name = "Bra (UK)"
	icon_state = "bra_uk"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_neko
	name = "Bra (Neko)"
	icon_state = "bra_neko"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/halterneck_bra
	name = "Bra (Halterneck)"
	icon_state = "halterneck_bra"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/bra_strapless
	name = "Bra (Strapless)"
	icon_state = "bra_strapless"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/striped_bra
	name = "Bra (Striped)"
	icon_state = "striped_bra"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/sarashi
	name = "Bra (Sarashi)"
	icon_state = "bandages"

/datum/sprite_accessory/undershirt/sports_bra
	name = "Sports Bra"
	icon_state = "sports_bra"

/datum/sprite_accessory/undershirt/sports_bra_alt
	name = "Sports Bra (Alt)"
	icon_state = "sports_bra_alt"



/datum/sprite_accessory/undershirt/fishnet_sleeves
	name = "Fishnet (Sleeved)"
	icon_state = "fishnet_sleeves"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/fishnet_sleeves/alt
	name = "Fishnet (Sleeved, Alt)"
	icon_state = "fishnet_sleeves_alt"

/datum/sprite_accessory/undershirt/fishnet_base
	name = "Fishnet (Sleeveless)"
	icon_state = "fishnet_body"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/fishnet_base/alt
	name = "Fishnet (Sleeveless, Alt)"
	icon_state = "fishnet_body_alt"



/datum/sprite_accessory/undershirt/babydoll
	name = "Baby-Doll"
	icon_state = "babydoll"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/corset
	name = "Corset"
	icon_state = "corset"
	prefered_gender = FEMALE

/datum/sprite_accessory/undershirt/chastbra
	name = "Chastity Bra"
	icon_state = "chastbra"
	prefered_gender = FEMALE
	erp_accessory = TRUE

/datum/sprite_accessory/undershirt/pasties
	name = "Pasties"
	icon_state = "pasties"
	prefered_gender = FEMALE
	erp_accessory = TRUE

/datum/sprite_accessory/undershirt/pasties_alt
	name = "Pasties - Alt"
	icon_state = "pasties_alt"
	prefered_gender = FEMALE
	erp_accessory = TRUE

/datum/sprite_accessory/undershirt/shibari
	name = "Shibari"
	icon_state = "shibari"
	prefered_gender = FEMALE
	erp_accessory = TRUE

/datum/sprite_accessory/undershirt/shibari_sleeves
	name = "Shibari Sleeves"
	icon_state = "shibari_sleeves"
	prefered_gender = FEMALE
	erp_accessory = TRUE

/datum/sprite_accessory/undershirt/bra_latex
	name = "Bra (Latex)"
	icon_state = "bra_latex"
	prefered_gender = FEMALE
	erp_accessory = TRUE
