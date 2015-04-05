--
--RABBIT
--
shamanmobs:register_mob("shamanmobs:rabbit", {
	jump = true,
	follow = true,
	attack_type = "dogfight",
	damage = 2,
	run_velocity = 2,
	type = "monster",
	hp_max = 4,
	collisionbox = {-0.25*(0.5/0.7), -0.33*(0.5/0.7), -0.25*(0.5/0.7), 0.25*(0.5/0.7), 0.33*(0.5/0.7), 0.25*(0.5/0.7)},
	visual = "cube",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"rabbit_top.png", "rabbit_side.png", "rabbit_side.png", "rabbit_side.png", "rabbit_front.png", "rabbit_back.png"},
	makes_footstep_sound = false,
	view_range = 16,
	walk_velocity = 4,
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
		if tool == "shamanmobs:cage" then
				clicker:get_inventory():remove_item("main", "shamanmobs:cage")
				clicker:get_inventory():add_item("main", "shamanmobs:rabbit")
				self.object:remove()
		end
	end,
})

minetest.register_craftitem("shamanmobs:rabbit", {
	description = "Rabbit",
	inventory_image = "rabbit_front.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "shamanmobs:rabbit")
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
minetest.register_node("shamanmobs:rabbit_block", {
	description = "rabbit block",
	tiles = {"rabbit_top.png^[transformR180]", "rabbit_side.png", "rabbit_side.png", "rabbit_side.png", "rabbit_back.png", "rabbit_front.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "shamanmobs:rabbit_block",
	recipe = {"shamanmobs:rabbit", "shamanmobs:rabbit", "shamanmobs:rabbit", "shamanmobs:rabbit"}
})

minetest.register_craft({
	output = "shamanmobs:cage",
	recipe = {
		{"group:stick", "group:stick", "group:stick"}, 
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}, 
		{"group:stick", "group:stick", "group:stick"}
	},
})

minetest.register_craftitem("shamanmobs:cage", {
	description = "monster cage",
	inventory_image = "cage.png"
})
