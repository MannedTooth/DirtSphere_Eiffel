note
	description: "Classe h�rit�e de tous les objets qui peuvent se dessiner � l'�cran."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

deferred class
	DRAWABLE


feature -- Fonctions

	draw(a_renderer:GAME_RENDERER)
			-- Dessine `Current` � l'�cran
			-- `a_renderer` : le `GAME_RENDERER` qui dessinera l'objet
		deferred
		end

feature {NONE} -- Attributs

	x_screen:INTEGER -- Position X de `Current`

	y_screen:INTEGER -- Position Y de `Current`

feature -- Setters

	set_x_screen(a_x:INTEGER)
			-- Mets la position X de `Current` � `a_x`
		do
			x_screen := a_x
		end

	set_y_screen(a_y:INTEGER)
			-- Mets la position Y de `Current` � `a_y`
		do
			y_screen := a_y
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
