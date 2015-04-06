shamanmobs:register_mob("shamanmobs:black_spider", {
	juju = Black,
	type = "monster",
	view_range = 14, 
	hp_max = 2,
	attack_type = "dogfight",
	collisionbox = {-0.1, -0.1, -0.1, 0.1, 0.1, 0.1},
	visual = "mesh",
	mesh = "shamanmobs_black_spider.b3d",
	textures = {"zmobs_spider.png"},
	damage = 1,
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 1,
	armor = 200,
	drops = {},
	drawtype = "front",
	light_resistant = true,
	water_damage = 0,
	lava_damage = 1,
	follow = true,
	animation = {
		speed_normal = 15,
		speed_run = 20,
		stand_start = 0,
		stand_end = 8,
		walk_start = 10,
		walk_end = 18,
		run_start = 10,
		run_end = 18,
		punch_start = 10,
		punch_end = 18,
	}
})

minetest.register_craft({
	output = '"shamanmanifestingeggs:black_spider"',
	recipe = {
		{'"juju:blackjuju"','"juju:blackjuju"','"juju:blackjuju"'},
		{'"juju:blackjuju"','"juju:blackjuju"','"juju:blackjuju"'},
	}
})
