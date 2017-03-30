note
	description: "Objet qui dessine les objets � afficher."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	DRAWER

create
	make

feature -- Cr�ation

	make(a_renderer : GAME_RENDERER)
			-- Cr�ation du dessinateur
			-- `a_renderer` : le `GAME_RENDERER` qui dessinera les objets
		local
			l_background_color:GAME_COLOR_READABLE
		do
			renderer := a_renderer
			create l_background_color.make_rgb(0,0,0)
			background_color := l_background_color

		end

feature -- Fonctions

	draw(a_drawable : DRAWABLE)
			-- D�ssine un objet
			-- `a_drawable` : objet � dessiner
		do
			a_drawable.draw(renderer)
		end

	draw_drawables(a_drawables : LIST[DRAWABLE])
			-- Boucle qui dessine tous les objets dessinables
			-- `a_drawables` : liste d'objets � dessiner
		do
			across a_drawables as la_drawables loop
				draw(la_drawables.item)
			end
		end

	clear
			-- Efface l'�cran
		do
			renderer.set_drawing_color (background_color)
			renderer.clear
		end

feature -- Attributs

	renderer:GAME_RENDERER -- le `GAME_RENDERER` qui dessinera les objets

	background_color:GAME_COLOR_READABLE -- la couleur de fond



end
