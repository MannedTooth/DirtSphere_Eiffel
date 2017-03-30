note
	description: "Un gestionnaire des entr�es."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	CONTROLLER

create
	make

feature {NONE} -- Cr�ation

	make
			-- Cr�ation du gestionnaire des entr�es
		local
			l_mouse_state:GAME_MOUSE_STATE
		do
			create l_mouse_state
			mouse := l_mouse_state
		end

feature -- Implementation

	update_mouse
			-- Mets � jour les informations concernant la souris
		local
			l_mouse_state:GAME_MOUSE_STATE
		do
			create l_mouse_state
			mouse := l_mouse_state
			mouse_x := mouse.x
			mouse_y := mouse.y
			mouse_left_is_held := mouse.is_left_button_pressed
		end

feature --Attributs

	mouse:GAME_MOUSE_STATE -- La souris

	mouse_left_is_held:BOOLEAN -- �tat du bouton gauche de la souris (tenu ou non)

	mouse_x:INTEGER -- Position X de la souris dans l'�cran

	mouse_y:INTEGER -- Position Y de la souris dans l'�cran



end
