shamanmobs:register_mob("shamanmobs:white_rhino", {
	type = "monster",
	hp_max = 22,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "shamanmobs_white_rhino.b3d",
	textures = {"shamanmobs_white_rhino.png"},
	visual_size = {x = 8, y = 8},
	makes_footstep_sound = true,
	view_range = 14,
	walk_velocity = 1.2,
	run_velocity = 2,
	damage = 2,
	drops = {
		name = "default:steel_ingot",
		chance = 1,
		min = 10,
		max = 10,
	},
	armor = 60,
	drawtype = "front",
	lava_damage = 8,
	light_damage = nil,	
	on_rightclick = nil,
	attack_type = "shoot",
	arrow = "shamanmobs:bullet",
	shoot_interval = 0.5,
	sounds = {
		attack = "shamanmobs_bullet",
	},
	animation = {
		speed_normal = 25,
		speed_run = 45,
		stand_start = 0,
		stand_end = 39,
		walk_start = 41,
		walk_end = 72,
		run_start = 74,
		run_end = 105,
		punch_start = 74,
		punch_end = 105,
	},
})

shamanmobs:register_arrow("shamanmobs:bullet", {
	visual = "sprite",
	visual_size = {x = 0.75, y = 0.75},
	textures = {"shamanmobs_bullet.png"},
	velocity = 15,
	hit_player = function(self, player)
		local s = self.object:getpos()
		local p = player:getpos()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {flesht = 2 },
		}, vec)
		local pos = self.object:getpos()
		for dx = -1, 1 do
			for dy = -1, 1 do
				for dz = -1, 1 do
					local p = {x = pos.x + dx, y = pos.y + dy, z = pos.z +dz}
					local n = minetest.get_node(pos).name
				end
			end
		end
	end,
	hit_node = function(self, pos, node)
		for dx = -1, 1 do
			for dy = -2, 1 do
				for dz = -1, 1 do
					local p = {x = pos.x + dx, y = pos.y + dy, z = pos.z + dz}
					local n = minetest.get_node(pos).name
				end	
			end
		end
	end
})

--minetest.register_craft({
	--output = "shamanmobs:white_rhino",
	--recipe = {
		--{'"shamanmobs:whitejuju"','"shamanmobs:whitejuju"','"shamanmobs:whitejuju"'}
	--},
--})
