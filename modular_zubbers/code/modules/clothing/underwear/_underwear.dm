/obj/item/clothing/underwear
	name = "underwear"
	icon = 'modular_zubbers/icons/mob/clothing/underwear.dmi' //you want to make custom sprites, be my guest
	worn_icon = 'modular_zubbers/icons/mob/clothing/underwear.dmi'
	armor_type = /datum/armor/none
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'
	slot_flags = ITEM_SLOT_UNDERWEAR
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	var/preferred_gender = NEUTER //is this meant for males or females? used for randomization

/obj/item/clothing/shirt/setDir(newdir)
	SHOULD_CALL_PARENT(FALSE)
	dir = NORTH //hahahahahah

/obj/item/clothing/underwear/male_briefs
	name = "Briefs"
	icon_state = "male_briefs"
	preferred_gender = MALE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/male_boxers
	name = "Boxers"
	icon_state = "male_boxers"
	preferred_gender = MALE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/male_stripe
	name = "Striped Boxers"
	icon_state = "male_stripe"
	preferred_gender = MALE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/male_midway
	name = "Midway Boxers"
	icon_state = "male_midway"
	preferred_gender = MALE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/male_longjohns
	name = "Long Johns"
	icon_state = "male_longjohns"
	preferred_gender = MALE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/male_kinky
	name = "Jockstrap"
	icon_state = "male_kinky"
	preferred_gender = MALE

/obj/item/clothing/underwear/male_mankini
	name = "Mankini"
	icon_state = "male_mankini"
	preferred_gender = MALE

/obj/item/clothing/underwear/male_hearts
	name = "Hearts Boxers"
	icon_state = "male_hearts"
	preferred_gender = MALE
	use_static = TRUE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/male_commie
	name = "Commie Boxers"
	icon_state = "male_commie"
	preferred_gender = MALE
	use_static = TRUE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/male_usastripe
	name = "Freedom Boxers"
	icon_state = "male_assblastusa"
	preferred_gender = MALE
	use_static = TRUE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/male_uk
	name = "UK Boxers"
	icon_state = "male_uk"
	preferred_gender = MALE
	use_static = TRUE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION


//FEMALE UNDERWEAR
/obj/item/clothing/underwear/female_bikini
	name = "Bikini"
	icon_state = "female_bikini"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/female_lace
	name = "Lace Bikini"
	icon_state = "female_lace"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/female_bralette
	name = "Bralette w/ Boyshorts"
	icon_state = "female_bralette"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/female_sport
	name = "Sports Bra w/ Boyshorts"
	icon_state = "female_sport"
	preferred_gender = FEMALE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
	hides_breasts = TRUE

/obj/item/clothing/underwear/female_thong
	name = "Thong"
	icon_state = "female_thong"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/female_strapless
	name = "Strapless Bikini"
	icon_state = "female_strapless"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/female_babydoll
	name = "Babydoll"
	icon_state = "female_babydoll"
	preferred_gender = FEMALE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
	hides_breasts = TRUE

/obj/item/clothing/underwear/swimsuit_onepiece
	name = "One-Piece Swimsuit"
	icon_state = "swim_onepiece"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/swimsuit_strapless_onepiece
	name = "Strapless One-Piece Swimsuit"
	icon_state = "swim_strapless_onepiece"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/swimsuit_twopiece
	name = "Two-Piece Swimsuit"
	icon_state = "swim_twopiece"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/swimsuit_strapless_twopiece
	name = "Strapless Two-Piece Swimsuit"
	icon_state = "swim_strapless_twopiece"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/swimsuit_stripe
	name = "Strapless Striped Swimsuit"
	icon_state = "swim_stripe"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/swimsuit_halter
	name = "Halter Swimsuit"
	icon_state = "swim_halter"
	preferred_gender = FEMALE
	hides_breasts = TRUE

/obj/item/clothing/underwear/female_white_neko
	name = "Neko Bikini (White)"
	icon_state = "female_neko_white"
	preferred_gender = FEMALE
	use_static = TRUE
	hides_breasts = TRUE

/obj/item/clothing/underwear/female_black_neko
	name = "Neko Bikini (Black)"
	icon_state = "female_neko_black"
	preferred_gender = FEMALE
	use_static = TRUE
	hides_breasts = TRUE

/obj/item/clothing/underwear/female_kinky
	name = "Lingerie"
	icon_state = "female_kinky"
	preferred_gender = FEMALE
	use_static = TRUE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/female_commie
	name = "Commie Bikini"
	icon_state = "female_commie"
	preferred_gender = FEMALE
	use_static = TRUE

/obj/item/clothing/underwear/female_usastripe
	name = "Freedom Bikini"
	icon_state = "female_assblastusa"
	preferred_gender = FEMALE
	use_static = TRUE

/obj/item/clothing/underwear/female_uk
	name = "UK Bikini"
	icon_state = "female_uk"
	preferred_gender = FEMALE
	use_static = TRUE
	hides_breasts = TRUE

/obj/item/clothing/underwear/male_bee
	name = "Boxers - Bee"
	icon_state = "bee_shorts"
	preferred_gender = MALE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
	use_static = TRUE

/obj/item/clothing/underwear/female_beekini
	name = "Panties - Bee-kini"
	icon_state = "panties_beekini"
	preferred_gender = FEMALE
	use_static = TRUE

/obj/item/clothing/underwear/panties
	name = "Panties"
	icon_state = "panties"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/fishnet_lower
	name = "Panties - Fishnet"
	icon_state = "fishnet_lower"
	preferred_gender = FEMALE
	use_static = TRUE

/obj/item/clothing/underwear/fishnet_lower_alt
	name = "Panties - Fishnet (Greyscale)"
	icon_state = "fishnet_lower_alt"
	use_static = null

/obj/item/clothing/underwear/female_usa_stripe
	name = "Panties - Freedom"
	icon_state = "panties_assblastusa"
	preferred_gender = FEMALE
	use_static = TRUE

/obj/item/clothing/underwear/female_kinky
	name = "Panties - Kinky Black"
	icon_state = "panties_kinky"
	preferred_gender = FEMALE
	use_static = TRUE

/obj/item/clothing/underwear/panties_uk
	name = "Panties - UK"
	icon_state = "panties_uk"
	preferred_gender = FEMALE
	use_static = TRUE

/obj/item/clothing/underwear/panties_neko
	name = "Panties - Neko"
	icon_state = "panties_neko"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/panties_slim
	name = "Panties - Slim"
	icon_state = "panties_slim"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/striped_panties
	name = "Panties - Striped"
	icon_state = "striped_panties"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/panties_swimsuit
	name = "Panties - Swimsuit"
	icon_state = "panties_swimming"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/panties_thin
	name = "Panties - Thin"
	icon_state = "panties_thin"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/thong
	name = "Thong"
	icon_state = "thong"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/thong_babydoll
	name = "Thong - Alt"
	icon_state = "thong_babydoll"
	preferred_gender = FEMALE

/obj/item/clothing/underwear/chastbelt
	name = "Chastity Belt"
	icon_state = "chastbelt"
	use_static = TRUE
	erp_accessory = TRUE

/obj/item/clothing/underwear/chastcage
	name = "Chastity Cage"
	icon_state = "chastcage"
	use_static = null
	erp_accessory = TRUE

/obj/item/clothing/underwear/latex
	name = "Panties - Latex"
	icon_state = "panties_latex"
	use_static = TRUE
	erp_accessory = TRUE

/obj/item/clothing/underwear/lizared
	name = "LIZARED Underwear"
	icon_state = "lizared"
	use_static = TRUE
	hides_breasts = TRUE

/obj/item/clothing/underwear/boyshorts
	name = "Boyshorts"
	icon_state = "boyshorts"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
	preferred_gender = FEMALE
