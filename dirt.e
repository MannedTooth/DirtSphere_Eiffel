note
	description: "Un bloc de terre."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	DIRT

inherit
	SOLID

create
	make

feature -- Fonctions

	update(a_block_array:BLOCK_ARRAY)
			-- <precursor>
		do
			gravity(a_block_array)
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
