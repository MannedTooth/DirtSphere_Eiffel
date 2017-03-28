note
	description: "Un type de bloc."
	author: "Olivier Letendre"
	date: "$Date$"
	revision: "$Revision$"

class
	AIR

inherit
	BLOCK
	redefine
		draw
	end

create
	make

feature {NONE} --Fonctions

	draw(a_renderer:GAME_RENDERER) --Redéfinition de la fonction `draw` pour ne rien afficher
		do
		end
end
