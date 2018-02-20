
-- adjust light levels
function round(num)
	if num == nil then return end
	local mult = 10^(2)
	return math.floor(num * mult + 0.5) / mult
end

local function light_level()
	for _, player in pairs(minetest.get_connected_players()) do
		-- get light values
		local node_light = minetest.get_node_light(player:getpos(), nil) or 15
		local natural_light = round(node_light/15)
		local current_light = round(player:get_day_night_ratio())
		-- if player in shadow biome
		if minetest.find_node_near(player:getpos(), 3, "shadow_land:dirt_with_shadow_grass") then
			-- set current light if no value found
			if current_light == nil then
				minetest.chat_send_player(player:get_player_name(), "1") -- test
				player:override_day_night_ratio(natural_light)
			-- reduce current light if needed
			elseif current_light > 0.10 then
				minetest.chat_send_player(player:get_player_name(), "2") -- test
				player:override_day_night_ratio(current_light - 0.05)
			elseif current_light > 0.00 then
				minetest.chat_send_player(player:get_player_name(), "3") -- test
				player:override_day_night_ratio(current_light - 0.01)
			end
		-- if player left biome, but ratio needs to be adjusted
		elseif current_light then
			-- adjust immediately if player is underground or
			-- if current light equals natural light
			if natural_light == 0 or current_light == natural_light then
				minetest.chat_send_player(player:get_player_name(), "4") -- test
				player:override_day_night_ratio(nil)
				current_light = nil
			--adjust toward natural light (brighter)
			elseif current_light < natural_light then
				minetest.chat_send_player(player:get_player_name(), "5") -- test
				if current_light + 0.10 < natural_light then
					current_light = current_light + 0.05
				else
					current_light = current_light + 0.01
				end
			--adjust toward natural light (darker)
			else
				minetest.chat_send_player(player:get_player_name(), "6") -- test
				if natural_light + 0.10 < current_light then
					current_light = current_light - 0.05
				else
					current_light = current_light - 0.01
				end
			end
			player:override_day_night_ratio(current_light)
		end

	-- test
	minetest.chat_send_player(player:get_player_name(), "current: "..(current_light or "nothing").." Natural: "..natural_light)

	end

	minetest.after(2, light_level) --low for testing
end

minetest.after(5, light_level)


-- accounts for an engine bug which will be fixed in 0.5 release
minetest.register_on_joinplayer(function(player)
	player:override_day_night_ratio(nil)
end)
