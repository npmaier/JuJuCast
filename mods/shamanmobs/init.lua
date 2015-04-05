-- SPAWNING: [true --or-- false]
-- 
local CHICKEN_SPAWN = true
local COW_SPAWN = true
local NYAN_CAT_SPAWN = true
local PIG_SPAWN = true
local RABBIT_SPAWN = true
local SHEEP_SPAWN = true

dofile(minetest.get_modpath("shamanmobs").."/api.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/chicken.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/cow.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/nyan_cat.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/pig.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/rabbit.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/sheep.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/green_saproling.lua")
--dofile(minetest.get_modpath("shamanmobs").."/animals/pink_swarm.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/black_spider.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/red_dragon.lua")
dofile(minetest.get_modpath("shamanmobs").."/animals/white_rhino.lua")

if CHICKEN_SPAWN then
shamanmobs:register_spawn("shamanmobs:chicken", {"default:dirt_with_grass"}, 20, 8, 8000, 1, 31000)
end

if COW_SPAWN then
shamanmobs:register_spawn("shamanmobs:cow", {"default:dirt_with_grass"}, 20, 8, 8000, 1, 31000)
end

if NYAN_CAT_SPAWN then
shamanmobs:register_spawn("shamanmobs:nyan_cat", {"default:dirt_with_grass"}, 20, 8, 8000, 1, 31000)
end

if PIG_SPAWN then
shamanmobs:register_spawn("shamanmobs:pig", {"default:dirt_with_grass"}, 20, 8, 8000, 1, 31000)
end

if RABBIT_SPAWN then
shamanmobs:register_spawn("shamanmobs:rabbit", {"default:dirt_with_grass"}, 20, 8, 8000, 1, 31000)
end

if SHEEP_SPAWN then
shamanmobs:register_spawn("shamanmobs:sheep", {"default:dirt_with_grass"}, 20, 8, 8000, 1, 31000)
end

