--
--COW
--
shamanmobs:register_mob("shamanmobs:cow", {
	type = "monster",
	jump = true,
	damage = 1,
	attack_type = "dogfight",
	run_velocity = 2,
	hp_max = 10,
	collisionbox = {-0.5, -0.66, -0.5, 0.5, 0.66, 0.5},
	visual = "cube",
	visual_size = {x = 1.4, y = 1.4},
	textures = {"cow_side.png", "cow_bot.png", "cow_side.png", "cow_side.png", "cow_front.png", "cow_back.png"},
	makes_footstep_sound = false,
	view_range = 16,
	walk_velocity = 1,
	follow = true,
	armor = 100,
	drops = {
		{name = "shamanmobs:meat_raw",
		chance = 1,
		min = 1,
		max = 1,},
		},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item():get_name()
		if tool == "bucket:bucket_empty" and not self.empty then
		self.empty = true
				clicker:get_inventory():remove_item("main", "bucket:bucket_empty")
				clicker:get_inventory():add_item("main", "shamanmobs:bucket_milk")
		elseif tool == "shamanmobs:cage" then
				clicker:get_inventory():remove_item("main", "shamanmobs:cage")
				clicker:get_inventory():add_item("main", "shamanmobs:cow")
				self.object:remove()
		end
	end,
})

minetest.register_craftitem("shamanmobs:cow", {
	description = "Cow",
	inventory_image = "cow_front.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "shamanmobs:cow")
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

minetest.register_craftitem("shamanmobs:bucket_milk", {
	description = "bucket with milk",
	inventory_image = "bucket_milk.png",
	groups = {not_in_creative_inventory = 1},
	stack_max = 1,
})

minetest.register_node("shamanmobs:cow_block", {
	description = "cow block",
	tiles = {"cow_side.png", "cow_bot.png", "cow_side.png", "cow_side.png", "cow_back.png", "cow_front.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "shamanmobs:cow_block",
	recipe = {"shamanmobs:cow", "shamanmobs:cow", "shamanmobs:cow", "shamanmobs:cow"}
})
