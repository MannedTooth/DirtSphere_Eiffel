note
	description: "Classe héritée de tous les objets qui peuvent se dessiner à l'écran."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

deferred class
	DRAWABLE


feature -- Fonctions

	draw(a_renderer:GAME_RENDERER)
			-- Dessine l'objet à l'écran
			-- `a_renderer` : le `GAME_RENDERER` qui dessinera l'objet
		deferred
		end

feature {NONE} -- Attributs

	x_screen:INTEGER -- Position X de l'objet à l'écran

	y_screen:INTEGER -- Position Y de l'objet à l'écran

feature -- Getters & Setters

	get_x_screen:INTEGER
			-- Retourne la position X de l'objet
		do
			Result := x_screen
		end

	set_x_screen(a_x:INTEGER)
			-- Définit la position X de l'objet
			-- `a_x` : la nouvelle position X de l'objet
		do
			x_screen := a_x
		end

	get_y_screen:INTEGER
			-- Retourne la position Y de l'objet
		do
			Result := y_screen
		end

	set_y_screen(a_y:INTEGER)
			-- Définit la position Y de l'objet
			-- `a_y` : la nouvelle position Y de l'objet
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
