note
	description: "Summary description for {SOLID}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SOLID

feature
	update(a_block_array : BLOCK_ARRAY)
		do
			a_block_array.swap_blocks (x, y, x, y-1)
		end
end
