note
	description: "Objet qui mets � jour le {BLOCK_ARRAY}."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	UPDATER

create
	make

feature -- Cr�ation

	make
			-- Cr�ation de `Current`
		do
		end

feature -- Cr�ation

	update(a_block_array : BLOCK_ARRAY)
			-- Mets � jour les {BLOCK} dans `a_block_array`
		do
			across a_block_array.blocks as la_array loop
				across la_array.item as la_block loop
					if (la_block.item.was_updated = false)
					then
						la_block.item.update(a_block_array)
					end

				end
			end
			across a_block_array.blocks as la_array loop
				across la_array.item as la_block loop
					la_block.item.set_was_updated(false)
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
