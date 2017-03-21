note
	description: "Summary description for {UPDATER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	UPDATER

create
	make

feature
	make
		do

		end

feature
	update(a_block_array : BLOCK_ARRAY)
		do
			across a_block_array.blocks as la_array loop
				across la_array as la_block loop
					la_block.item.item.update
				end
			end
		end


end
