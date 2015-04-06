shamanmobs:register_mob("shamanmobs:red_dragon", {
	juju = Red,
	name = "RedDragon",
	type = "monster",
	hp_max = 10,
	collisionbox = {-0.5, -1.5, -0.5, 0.5, 0.5, 0.5},
	visual = "mesh",
	mesh = "shamanmobs_red_dragon.x",
	textures = {"shamanmobs_red_dragon.png"},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 10,
	walk_velocity = 0.5,
	run_velocity = 2,	
	damage = 2,
	drops = {
		{name = "default:mese",
		chance = 9,
		min = 1,
		max = 1,},
	},
	light_resistang = true,
	armor = 50, 
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	attack_type = "shoot",
	arrow = "shamanmobs:dragon_fireball",
	shoot_interval = .5,
	animation = {
		speed_normal = 5,
		speed_run = 5,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		punch_start = 40,
		punch_end = 63,
	}
})
shamanmobs.register_spawn("shamanmobs:red_dragon", {"default:stone"}, 3, -1, 5000, 3, 0)

shamanmobs:register_arrow("shamanmobs:dragon_fireball", {
	visual = "sprite",	
	visual_size = {x=1, y=1},
	textures = {"shamanmobs_red_dragon_fireball.png"},
	velocity = 5,
	hit_player = function(self, player)
		local s = self.object:getpos()
		local p = player:getpos()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		player:punch(self.object, 1.0, {
			full_punch_interval=1.0,
			damage_groups = {fleshy=1},
		}, vec)
	end,
	hit_node = function(self, pos,node)
	end
})

--minetest.register_craft({
--	output = "shamanmobs:red_dragon"
	--recipe = {
		--{'"shamanmobs:redjuju"','"shamanmobs:redjuju"','"shamanmobs:redjuju"'},
	--}.

--})
