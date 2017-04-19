note
	description: "Objet qui dessine les objets à afficher."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	DRAWER

create
	make

feature -- Création

	make(a_renderer : GAME_RENDERER)
			-- Création de `Current`
			-- `a_renderer` : le `GAME_RENDERER` qui dessinera les {DRAWABLE}
		local
			l_background_color:GAME_COLOR_READABLE
		do
			renderer := a_renderer
			create l_background_color.make_rgb(0,0,0)
			background_color := l_background_color

		end

feature -- Fonctions

	draw(a_drawable : DRAWABLE)
			-- Déssine `a_drawable`
		do
			a_drawable.draw(renderer)
		end

	draw_drawables(a_drawables : LIST[DRAWABLE])
			-- Boucle qui dessine tous les {DRAWABLE} dans `a_drawables`
		do
			across a_drawables as la_drawables loop
				draw(la_drawables.item)
			end
		end

	clear
			-- Efface l'écran
		do
			renderer.set_drawing_color (background_color)
			renderer.clear
		end

feature -- Attributs

	renderer:GAME_RENDERER -- Le `GAME_RENDERER` qui dessinera les {DRAWABLE}

	background_color:GAME_COLOR_READABLE -- La couleur de fond

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
