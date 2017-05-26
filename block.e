note
	description: "Classe abstraite représentant un bloc."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

deferred class
	BLOCK

inherit
	DRAWABLE

feature {NONE} -- Création

	make(a_texture:GAME_TEXTURE; a_is_floating: BOOLEAN)
			-- Création de `Current`
		do
			texture := a_texture
			is_floating := a_is_floating
			was_updated := false
		end


feature -- Fonctions

	draw(a_renderer:GAME_RENDERER)
			-- Demande au `a_renderer` de dessiner `Current`
		do
			a_renderer.draw_texture (texture, x_screen, y_screen)
		end

	update(a_block_array : BLOCK_ARRAY)
			-- Mets à jour `Current` dans `a_block_array`
		deferred
		end

feature -- Attributs

	texture:GAME_TEXTURE -- {GAME_TEXTURE} (couleur) de `Current`

	was_updated:BOOLEAN -- Indique si `Current` a été mis à jour durant cette itération

	block_type:INTEGER -- Le type de `Current` [TBA]

	x_table:INTEGER -- La coordonnée X de `Current` dans le {BLOCK_ARRAY}

	y_table:INTEGER -- La coordonnée Y de `Current` dans le {BLOCK_ARRAY}

	is_floating:BOOLEAN -- Si `Current` peut flotter sur des {LIQUID}

feature -- Setters

	set_was_updated(a_state:BOOLEAN)
			-- Mets `was_updated` à `a_state`
		do
			was_updated := a_state
		end


	set_x_table(a_x:INTEGER)
			-- Mets `x_table` à `a_x`
		do
			x_table := a_x
		end


	set_y_table(a_y:INTEGER)
			-- Mets `y_table` à `y_x`
		do
			y_table := a_y
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
