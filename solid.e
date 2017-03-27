note
	description: "Summary description for {SOLID}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SOLID

feature
	gravity(a_x, a_y : INTEGER; a_block_array : BLOCK_ARRAY)
		do
			a_block_array.swap_block_with_left(a_x, a_y)
		end
end
