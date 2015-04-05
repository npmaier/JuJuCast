shamanmobs:register_mob("shamanmobs:rat", {
        type = "animal",
        hp_max = 1,
        collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.2, 0.2},
        visual = "mesh",
        mesh = "shamanmobs_rat.x",
        textures = {"shamanmobs_rat.png"},
        makes_footstep_sound = false,
        walk_velocity = 1,
        armor = 200,
        drops = {
		{name = "shamanmobs:rat",
		chance = 1,
		min = 1,
		max = 1,},
		},
        drawtype = "front",
        water_damage = 0,
        lava_damage = 1,
        light_damage = 0,
        
        on_rightclick = function(self, clicker)
		 if clicker:is_player() and clicker:get_inventory() then
                        clicker:get_inventory():add_item("main", "shamanmobs:rat")
                        self.object:remove()
                end
        end,
})

shamanmobs:register_spawn("shamanmobs:rat", {"default:dirt_with_grass", "default:stone"}, 20, -1, 7000, 1, 31000)

minetest.register_craftitem("shamanmobs:rat", {
        description = "Rat",
        inventory_image = "shamanmobs_rat_inventory.png",
        
        on_place = function(itemstack, placer, pointed_thing)
		 if pointed_thing.above then
                        minetest.env:add_entity(pointed_thing.above, "shamanmobs:rat")
                        itemstack:take_item()
                end
                return itemstack
        end,
})
minetest.register_craftitem("shamanmobs:rat_cooked", {
        description = "Cooked Rat",
        inventory_image = "shamanmobs_cooked_rat.png",
        
        on_use = minetest.item_eat(3),
})

minetest.register_craft({
        type = "cooking",
        output = "shamanmobs:rat_cooked",
        recipe = "shamanmobs:rat",
        cooktime = 5,
})

--minetest.register_craftitem("shamanmobs:meat", {
 --       description = "Meat",
   --     inventory_image = "shamanmobs_meat.png",
     --   on_use = minetest.item_eat(8),
--})
minetest.register_craft({
        type = "cooking",
        output = "shamanmobs:meat",
        recipe = "shamanmobs:meat_raw",
        cooktime = 5,
})

