note
	description: "Summary description for {SAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SAND

inherit
	BLOCK
	redefine
		update
	end
	SOLID

create
	make

feature
	update(a_block_array : BLOCK_ARRAY)
		do
			gravity(x, y, a_block_array)
		end

end
