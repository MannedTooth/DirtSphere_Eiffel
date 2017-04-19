note
	description: "Un gestionnaire des entrées."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	CONTROLLER

create
	make

feature {NONE} -- Création

	make
			-- Création de `Current`
		local
			l_mouse_state:GAME_MOUSE_STATE
		do
			create l_mouse_state
			mouse := l_mouse_state
		end

feature -- Implementation

	update_mouse
			-- Mets à jour les informations concernant la souris
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

	mouse_left_is_held:BOOLEAN -- État du bouton gauche de la souris (tenu ou non)

	mouse_x:INTEGER -- Position X de la souris dans l'écran

	mouse_y:INTEGER -- Position Y de la souris dans l'écran

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
