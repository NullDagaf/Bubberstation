/datum/species/lizard/randomize_features(mob/living/carbon/human/human_mob)
	//color handling
	var/main_color = "#[random_color()]"
	human_mob.dna.features["mcolor"] = main_color
	switch(rand(1,6))
		if(1 to 3) //First random case - all is the same
			human_mob.dna.features["mcolor2"] = main_color
			human_mob.dna.features["mcolor3"] = main_color
		if(4 to 5) //second case: we shift the shading a bit
			var/changed_color = BlendRGB(main_color, BlendRGB("#000000", "#ffffff", rand()), rand())
			human_mob.dna.features["mcolor2"] = changed_color
			human_mob.dna.features["mcolor3"] = changed_color
		if(6) //Third case, more randomisation
			human_mob.dna.features["mcolor2"] = "#[random_color()]"
			human_mob.dna.features["mcolor3"] = "#[random_color()]"

	//no hair. random ones never look good.
	human_mob.hairstyle = "Bald"
	human_mob.facial_hairstyle = "Shaved"

	//tail handling
	var/static/list/valid_tails = list("Smooth", "Dark Tiger", "Light Tiger", "Spikes")
	var/tail_type = human_mob.dna.mutant_bodyparts["tail"]
	if(tail_type && !(tail_type in valid_tails))
		human_mob.dna.mutant_bodyparts["tail"] = pick(valid_tails)

	if(isnull(tail_type))
		human_mob.dna.mutant_bodyparts["spines"] = null //spines without a tail look ugly

	//snout handling
	var/static/list/valid_snouts = list("Sharp", "Round", "Sharp + Light", "Round + Light")
	if(!(human_mob.dna.mutant_bodyparts["snout"] in valid_tails))
		human_mob.dna.mutant_bodyparts["snout"] = pick(valid_snouts)
