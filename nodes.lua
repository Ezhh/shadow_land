
minetest.register_node("shadow_land:shadow_stone", {
	description = "Shadow Stone",
	tiles = {"shadow_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble', -- need to change
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("shadow_land:dirt_with_shadow_grass", {
	description = "Dirt with Shadow Grass",
	tiles = {"shadow_grass_top.png", "default_dirt.png",
		{name = "default_dirt.png^shadow_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("shadow_land:dark_water_source", {
	description = "Dark Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "sl_water_source_animated.png^[colorize:#292421:70",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		{
			name = "sl_water_source_animated.png^[colorize:#292421:70",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	-- is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "shadow_land:dark_water_flowing",
	liquid_alternative_source = "shadow_land:dark_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 50, r = 40, g = 36, b = 33},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("shadow_land:dark_water_flowing", {
	description = "Dark Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"sl_water.png^[colorize:#292421:70"},
	special_tiles = {
		{
			name = "sl_water_flowing_animated.png^[colorize:#292421:70",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "sl_water_flowing_animated.png^[colorize:#292421:70",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "shadow_land:dark_water_flowing",
	liquid_alternative_source = "shadow_land:dark_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 50, r = 40, g = 36, b = 33},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})



minetest.register_node("shadow_land:shadow_grass", {
	description = "Shadow Grass",
	drawtype = "plantlike",
	tiles = {"shadow_grass.png"},
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	buildable_to = true,
	walkable = false,
	groups = {snappy = 3},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},
})

minetest.register_node("shadow_land:suntwist_plant", {
	description = "Sun-twist Plant",
	drawtype = "plantlike",
	tiles = {"suntwist_plant.png"},
	inventory_image = "suntwist_plant.png",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	buildable_to = true,
	walkable = false,
	groups = {snappy = 3},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},
	light_source = 5,
	visual_scale = 0.8
})
