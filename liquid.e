note
	description: "Classe héritées de tous les blocs liquides."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

deferred class
	LIQUID

inherit
	BLOCK

feature -- Fonctions

	gravity(a_block_array : BLOCK_ARRAY)
			-- Fait tomber le {BLOCK} avec de la physique d'un liquide dans la liste `a_block_array`
		do
			if a_block_array.is_valid_position (x_table, y_table + 1) and attached {AIR} (a_block_array.block_at (x_table, y_table + 1)) then
				a_block_array.swap_block_with_down(x_table, y_table)
			elseif a_block_array.is_valid_position (x_table - 1, y_table + 1) and attached {AIR} (a_block_array.block_at (x_table - 1, y_table + 1)) then
				a_block_array.swap_block_with_down_left (x_table, y_table)
			elseif a_block_array.is_valid_position (x_table + 1, y_table + 1) and attached {AIR} (a_block_array.block_at (x_table + 1, y_table + 1)) then
				a_block_array.swap_block_with_down_right (x_table, y_table)
			elseif a_block_array.is_valid_position (x_table - 1, y_table) and attached {AIR} (a_block_array.block_at (x_table - 1, y_table)) then
				a_block_array.swap_block_with_left (x_table, y_table)
			elseif a_block_array.is_valid_position (x_table + 1, y_table) and attached {AIR} (a_block_array.block_at (x_table + 1, y_table)) then
				a_block_array.swap_block_with_right (x_table, y_table)
			end
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
