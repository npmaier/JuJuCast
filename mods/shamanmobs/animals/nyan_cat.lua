--
--NYAN CAT
--
shamanmobs:register_mob("shamanmobs:nyan_cat", {
	juju = Pink,
	jump = true,
	follow = true,
	attack_type = "dogfight",
	damage = 3,
	run_velocity = 2,
	type = "monster",
	hp_max = 4,
	collisionbox = {-0.25*(0.5/0.7), -0.33*(0.5/0.7), -0.25*(0.5/0.7), 0.25*(0.5/0.7), 0.33*(0.5/0.7), 0.25*(0.5/0.7)},
	visual = "cube",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"nc_side.png", "nc_side.png", "nc_side.png", "nc_side.png", "nc_front.png", "nc_back.png"},
	makes_footstep_sound = false,
	view_range = 13,
	walk_velocity = 3,
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
				clicker:get_inventory():add_item("main", "shamanmobs:nyan_cat")
				self.object:remove()
		end
	end,
})

--minetest.register_craftitem("shamanmobs:nyan_cat", {
--	description = "nyan_cat",
	--inventory_image = "nc_front.png",
	--on_place = function(itemstack, placer, pointed_thing)
		--if pointed_thing.above then
			--local i = 1
			--local pink_monster_table = { "chicken", "cow", "sheep", "nyan_cat", "rabbit", "pig" }
			--while i <= 4 do
				--local pink_monster_table = { "chicken", "cow", "sheep", "rabbit", "nyan_cat", "pig" }
				--local index = math.random(1,6)
				--local mtype = pink_monster_table[index]
				--minetest.env:add_entity(pointed_thing.above, "shamanmobs:"..mtype)
				--if minetest.setting_getbool("creative_mode") then
				--	itemstack:take_item()
				--else 
					--iiitemstack:take_item()
					--placer:get_inventory():add_item("main", "shamanmobs:cage")
				--end	
			--i = i + 1
			--end
	--	end
		--return itemstack
	--end,
--})

--minetest.register_craft({
	--type = "shapeless",
	--output = "default:nyan_cat",
	--recipe = {"shamanmobs:nyan_cat", "shamanmobs:nyan_cat", "shamanmobs:nyan_cat", "shamanmobs:nyan_cat"}
--})
