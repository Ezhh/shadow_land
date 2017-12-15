
-- biome
minetest.register_biome({
	name = "shadow_land",
	-- node_dust = "",
	node_top = "shadow_land:dirt_with_shadow_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_stone = "shadow_land:shadow_stone",
	-- node_water_top = "default:ice",
	-- depth_water_top = 1,
	node_water = "shadow_land:dark_water_source",
	--node_river_water = "",
	node_riverbed = "default:cobble",
	depth_riverbed = 2,
	y_min = -2,
	y_max = 200,
	heat_point = 10,
	humidity_point = 15,
})


-- grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"shadow_land:dirt_with_shadow_grass"},
	sidelen = 16,
	fill_ratio = 0.1,
	biomes = {"shadow_land"},
	y_min = 1,
	y_max = 31000,
	decoration = "shadow_land:shadow_grass",
})