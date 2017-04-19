note
	description: "Objet qui mets à jour le {BLOCK_ARRAY}."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	UPDATER

inherit
	THREAD
		rename
			make as make_thread
		end

create
	make

feature {NONE} -- Création

	make(a_block_array:BLOCK_ARRAY)
			-- Création de `Current`
		do
			make_thread
			game_ending := false
			block_array := a_block_array
		end


feature {NONE} -- Fonctions

	execute
			-- L'exécution du {THREAD}
		do
			from
			until
				game_ending
			loop
				across block_array.blocks as la_array loop
					across la_array.item as la_block loop
						if (la_block.item.was_updated = false)
						then
							la_block.item.update(block_array)
						end

					end
				end
				across block_array.blocks as la_array loop
					across la_array.item as la_block loop
						la_block.item.set_was_updated(false)
					end
				end
			end
		end

feature -- Attributs

	game_ending: BOOLEAN -- Le jeu se termine

	block_array: BLOCK_ARRAY -- La liste de {BLOCK}

invariant

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
