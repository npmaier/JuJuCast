--
--SHEEP
--
shamanmobs:register_mob("shamanmobs:sheep", {
	jump = true,
	attack_type = "dogfight",
	damage = 2,
	follow = true,
	run_velocity = 2,
	type = "monster",
	hp_max = 4,
	collisionbox = {-0.25, -0.33, -0.25, 0.25, 0.33, 0.25},
	visual = "cube",
	visual_size = {x=0.7, y=0.7},
	textures = {"sheep_wool.png", "sheep_wool.png", "sheep_wool.png", "sheep_wool.png", "sheep_front.png", "sheep_wool.png"},
	makes_footstep_sound = false,
	view_range = 15,
	walk_velocity = 1,
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
				clicker:get_inventory():add_item("main", "shamanmobs:sheep")
				self.object:remove()
		elseif clicker:get_inventory() and not self.empty then
			self.empty = true
				clicker:get_inventory():add_item("main", "wool:white")
				self.object:set_properties({
					textures = {"sheep_sheared.png", "sheep_sheared.png", "sheep_sheared.png", "sheep_sheared.png", "sheep_front.png", "sheep_sheared.png"},
				})
		end
	end,
})

minetest.register_craftitem("shamanmobs:sheep", {
	description = "Sheep",
	inventory_image = "sheep_front.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "shamanmobs:sheep")
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

minetest.register_node("shamanmobs:sheep_block", {
	description = "sheep block",
	tiles = {"sheep_wool.png", "sheep_wool.png", "sheep_wool.png", "sheep_wool.png", "sheep_wool.png", "sheep_front.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "shamanmobs:sheep_block",
	recipe = {"shamanmobs:sheep", "shamanmobs:sheep", "shamanmobs:sheep", "shamanmobs:sheep"}
})
