--- START OF BSD LICENSE ---

---Copyright (c) 2014, Nathan Maier 
--
--All rights reserved.

--Redistribution and use in source and binary forms, with or without
--modification, are permitted provided that the following conditions are met:

--	* Redistributions of source code must retain the above copyright notice,
--	this list of conditions and the following disclaimer.
--	* Redistributions in binary form must reproduce the above copyright notice,
--	this list of conditions and the following disclaimer in the documentation
--	and/or other materials provided with the distribution.

--	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
--	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
--	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
--	ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
--	LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
--	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
--	
--	SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
--	INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
--	CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--	ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
--POSSIBILITY OF SUCH DAMAGE.

--- END OF BSD LICENSE ---



jujutable = {"whitejuju","blackjuju","pinkjuju","greenjuju","redjuju"}

for v in pairs(jujutable) do
	minetest.register_craftitem("juju:"..jujutable[v], {
		description = jujutable[v],
		inventory_image = jujutable[v]..".png",
	})	
end

minetest.register_craft({
	output = '"juju:blackjuju"',
	recipe = {
			{'"shamanmobs:rat"','"shamanmobs:rat"','"shamanmobs:rat"'},
	},	
})	
	
minetest.register_craft({
	output = '"juju:pinkjuju"',
	recipe = {
		{'"default:nyancat_rainbow"','"default:nyancat_rainbow"','"default:nyancat_rainbow"'},
	},
})
minetest.register_craft({
	output = '"juju:whitejuju"',
	recipe = {
		{'"farming:wheat"','"farming:wheat"','"farming:wheat"'},
	},
})
minetest.register_craft({
	output = '"juju:redjuju"',
	recipe = {
		{'"bucket:bucket_lava"','"bucket:bucket_lava"','"bucket:bucket_lava"'},
	},	
})
minetest.register_craft({
	output = '"juju:greenjuju"',
	recipe = {
		{'"default:jungle_sapling"','"default:sapling"','"default:pine_sapling"'},
	},
})
