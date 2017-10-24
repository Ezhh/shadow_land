
-- test node
minetest.register_node("shadow_land:test", {
	description = "This is a test...",
	tiles = {"default_obsidian.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})


-- adjust light levels
function round(num)
	if num == nil then return end
	local mult = 10^(2)
	return math.floor(num * mult + 0.5) / mult
end

local function light_level()
	for _, player in pairs(minetest.get_connected_players()) do
		if player == nil then return end
		local natural_light = round((minetest.get_node_light(player:getpos(), nil))/15)
		local current_light = round(player:get_day_night_ratio()) or natural_light

		-- test
		minetest.chat_send_player(player:get_player_name(), "current: "..current_light.." Natural: "..natural_light)

		if minetest.find_node_near(player:getpos(), 3, "shadow_land:test") then
			-- reduce light
			if current_light > 0.10 then
				player:override_day_night_ratio(current_light - 0.05)
			elseif current_light > 0.00 then
				player:override_day_night_ratio(current_light - 0.01)
			end
		else
			-- adjust current light toward natural light
			if current_light < natural_light then
				if current_light + 0.10 < natural_light then
					current_light = current_light + 0.05
				else
					current_light = current_light + 0.01
				end
				player:override_day_night_ratio(current_light)
			elseif natural_light < current_light then
				if natural_light + 0.10 < current_light then
					current_light = current_light - 0.05
				else
					current_light = current_light - 0.01
				end
				player:override_day_night_ratio(current_light)
			end

		end
	end
	minetest.after(2, light_level) --low for testing
end

minetest.after(5, light_level)

