--
--PIG
--
shamanmobs:register_mob("shamanmobs:pig", {
	jump = true,
	attack_type = "dogfight",
	damage = 3,
	run_velocity = 2,
	type = "monster",
	hp_max = 4,
	collisionbox = {-0.25, -0.33, -0.25, 0.25, 0.33, 0.25},
	visual = "cube",
	visual_size = {x = 0.7, y = 0.7},
	textures = {"pig_side.png", "pig_side.png", "pig_side.png", "pig_side.png", "pig_front.png", "pig_back.png"},
	makes_footstep_sound = false,
	view_range = 18,
	walk_velocity = 2,
	armor = 100,
	drops = {
		{name = "shamanmobs:meat_raw",
		chance = 1,
		min = 1,
		max = 1,},
		},
	follow = true,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item():get_name()
		if tool == "shamanmobs:cage" then
				clicker:get_inventory():remove_item("main", "shamanmobs:cage")
				clicker:get_inventory():add_item("main", "shamanmobs:pig")
				self.object:remove()
		end
	end,
})

minetest.register_craftitem("shamanmobs:pig", {
	description = "Pig",
	inventory_image = "pig_front.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "shamanmobs:pig")
			if minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			else 
				itemstack:take_item()
				placer:get_inventory():add_item("main", "shamanmobs:cage")
			end
		end
		return itemstack
	end,
})

minetest.register_craftitem("shamanmobs:meat_raw", {
	description = "raw meat",
	inventory_image = "meat_raw.png",
	on_use = minetest.item_eat(0),
})

minetest.register_craftitem("shamanmobs:meat_cooked", {
	description = "cooked meat",
	inventory_image = "meat_cooked.png",
	on_use = minetest.item_eat(6),
})
	
minetest.register_craft({
	type = "cooking",
	recipe = "shamanmobs:meat_raw",
	output = "shamanmobs:meat_cooked",
})

minetest.register_node("shamanmobs:pig_block", {
	description = "pig block",
	tiles = {"pig_side.png", "pig_side.png", "pig_side.png", "pig_side.png", "pig_back.png", "pig_front.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "shamanmobs:pig_block",
	recipe = {"shamanmobs:pig", "shamanmobs:pig", "shamanmobs:pig", "shamanmobs:pig"}
})
