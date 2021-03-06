//Grassy Plains - The basic of the basic
/obj/effect/overmap/visitable/sector/exoplanet/bub_plains
	name = "grassy plains biome"
	desc = "Biome with sparse biodiversity but rolling plains of seagrass."
	color = "#60e090"
	planetary_area = /area/exoplanet/bub_plains
	rock_colors = list(COLOR_ASTEROID_ROCK, COLOR_GRAY80, COLOR_BROWN)
	plant_colors = list("#0e1e14","#1a3e38","#5a7467","#9eab88","#6e7248","RANDOM")
	map_generators = list(/datum/random_map/noise/exoplanet/bub_plains)
	features_budget = 0

/obj/effect/overmap/visitable/sector/exoplanet/bub_plains/generate_map()
	if(prob(40))
		lightlevel = rand(1,3)/10
	..()

/obj/effect/overmap/visitable/sector/exoplanet/bub_plains/generate_habitability()
	return HABITABILITY_BAD

/obj/effect/overmap/visitable/sector/exoplanet/bub_plains/generate_atmosphere()
	..()
	if(atmosphere)
		atmosphere.temperature = T0C + 2
		atmosphere.adjust_multi(GAS_OXYGEN, MOLES_O2STANDARD * 4, GAS_NITROGEN, MOLES_N2STANDARD * 4)
		atmosphere.update_values()

/obj/effect/overmap/visitable/sector/exoplanet/bub_plains/get_surface_color()
	return grass_color

/area/exoplanet/bub_plains
	base_turf = /turf/simulated/ocean/grass
	ambience = list('maps/bubmarine/sounds/amb/ocean_ambi1.ogg','maps/bubmarine/sounds/amb/ocean_ambi2.ogg',
					'maps/bubmarine/sounds/amb/ocean_ambi3.ogg','maps/bubmarine/sounds/amb/ocean_ambi4.ogg')
	sound_env = UNDERWATER

/datum/random_map/noise/exoplanet/bub_plains
	descriptor = "grassy plains biome"
	smoothing_iterations = 2
	land_type = /turf/simulated/ocean/grass
	water_type = /turf/simulated/ocean/sand
	water_level_min = 1
	water_level_max = 4

	flora_prob = 5
	large_flora_prob = 0
	flora_diversity = 3
	megafauna_types = list(/mob/living/simple_animal/hostile/retaliate/jelly/mega)
	fauna_types = list(/mob/living/simple_animal/aquatic/fish,/mob/living/simple_animal/aquatic/fish/grump,/mob/living/simple_animal/aquatic/fish/judge,
		/mob/living/simple_animal/hostile/retaliate/jelly/alt,/mob/living/simple_animal/hostile/retaliate/royalcrab)