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



jujutable = {
		{"whitejuju","farming:wheat"},
	    	{"blackjuju","shamanmbos:rat"},
	    	{"pinkjuju","default:nyancat_rainbow"},
            	{"greenjuju","default:sapling"},
	    	{"redjuju", "bucket:lava"}
	}

for i in ipairs(jujutable) do
	local ingredient = jujutable[i][2]
	local juju_type = jujutable[i][1]
	minetest.register_craft({
		output = 'juju:'..juju_type,'2',
		recipe = {
			 {ingredient,ingredient,ingredient},
		},
	})
	minetest.register_craftitem('juju:'..juju_type, {
		description = juju_type,
	inventory_image = juju_type..'.png',
	})
end

