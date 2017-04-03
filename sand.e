note
	description: "Un bloc de sable."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	SAND

inherit
	SOLID
	redefine
		update
	end

create
	make

feature -- Fonction

	update(a_block_array : BLOCK_ARRAY)
			-- <precursor>
		do
			if a_block_array.is_valid_position (get_x_table, get_y_table + 1) and attached {WATER} (a_block_array.block_at (get_x_table, get_y_table + 1)) then
				a_block_array.swap_block_with_down (get_x_table, get_y_table)
			end
			if a_block_array.is_valid_position (get_x_table, get_y_table - 1) and attached {WATER} (a_block_array.block_at (get_x_table, get_y_table - 1)) then
				a_block_array.create_block_at (3, get_x_table, get_y_table)
			end
			gravity(a_block_array)
			set_was_updated(true)
		end

note
	copyright: "Copyright (c) 2017, Olivier Letendre"
	license: "[
			 This program is free software: you can redistribute it and/or modify
			 it under the terms of the GNU General Public License as published by
			 the Free Software Foundation, either version 3 of the License, or
			 (at your option) any later version.
			 ]"
	source: "[
			Olivier Letendre
			Email MannedTooth@outlook.com
			]"

end
