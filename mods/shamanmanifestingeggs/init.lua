local shaman_manifesting_eggs_list = {
	{ "Red Dragon", "red_dragon", "default:lava"},
	{ "White Rhino", "white_rhino", "farming:wheat_harvested"},	
	{ "Black Spider", "black_spider", "default:bones"},
	{ "Pink Swarm", "pink_swarm", "default:water"},
	{ "Green Saproling", "green_saproling", "default:sapling"},
}

for i in ipairs (shaman_manifesting_eggs_list) do 
	local manifesting_egg_desc = shaman_manifesting_eggs_list[i][1]
	local manifesting_eggtype = shaman_manifesting_eggs_list[i][2]
	local ingredient = shaman_manifesting_eggs_list[i][3]
	
	minetest.register_craftitem("shamanmanifestingeggs:"..manifesting_eggtype, {
		description = manifesting_egg_desc,
		inventory_image = "shaman_manifesting_eggs_"..manifesting_eggtype..".png",
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.above then
				if manifesting_eggtype == "pink_swarm" then 
					local i = 1
					local pink_monster_table = { "chicken", "cow", "sheep", "rabbit", "nyan_cat", "pig" }
					while i <= 4 do
						local pink_monster_table = { "chicken", "cow", "sheep", "rabbit", "nyan_cat", "pig" }
						local index = math.random(1,6)
						local mtype = pink_monster_table[index]				
						minetest.env:add_entity(pointed_thing.above, "shamanmobs:"..mtype)
						itemstack:take_item()
					i = i + 1  		
					end
				else
					minetest.env:add_entity(pointed_thing.above, "shamanmobs:"..manifesting_eggtype)
					itemstack:take_item()
				end
			return itemstack
			end
		end,
	})

	minetest.register_craft({
		output = "shamanmanifestingeggs:"..manifesting_eggtype,
		recipe = {
	                {"shamanmanifestingeggs:egg", ingredient, ""},
	                {"", "", ""},
        	        {"", "", ""},
	        },
	})	
end

minetest.register_node("shamanmanifestingeggs:egg", {
	description = "Spawning Egg",
	drawtype = "plantlike",
	tiles = {"shaman_manifesting_eggs_egg.png"},
	inventory_image = "shaman_manifesting_eggs_egg.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3125, -0.5, -0.3125, 0.3125, 0.5, 0.3125}
	},
	groups = {dig_immediate = 3},
	drop = "spawneggs:egg",
	sounds = default.node_sound_stone_defaults(),
})




