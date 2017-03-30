note
	description: "Classe héritées de tous les blocs solides."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

deferred class
	SOLID

inherit
	BLOCK

feature -- Fonctions

	gravity(a_block_array : BLOCK_ARRAY)
			-- Fait tomber le bloc avec de la physique d'un bloc solide
			-- `a_block_array` : la liste de bloc dans laquelle le bloc sera déplacé
		do
			if (a_block_array.is_valid_position (get_x_table, get_y_table + 1)) then
				if attached {AIR} (a_block_array.block_at (get_x_table, get_y_table + 1)) then
					a_block_array.swap_block_with_down(get_x_table, get_y_table)
				end
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
