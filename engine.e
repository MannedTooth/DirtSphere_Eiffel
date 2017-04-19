note
	description: "Moteur principal du jeu."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	ENGINE

inherit
	GAME_LIBRARY_SHARED
	AUDIO_LIBRARY_SHARED

create
	make

feature --Cr�ation

	make
			--Cr�ation de `Current`
		local
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
			l_controller:CONTROLLER
		do
			resolution_height := 600
			resolution_length := 600
			block_scale := 15
			current_block := 1
			game_library.enable_video
			has_error := False
			create l_window_builder
			l_window_builder.set_dimension (resolution_height, resolution_length)
			window := l_window_builder.generate_window

			create updater.make


			create l_controller.make
			controller := l_controller

			create sound_manager.make
			create block_factory.make(block_scale, window.renderer)

			create block_array.make(resolution_height // block_scale, resolution_length // block_scale, block_scale, block_factory)
			create drawer.make(window.renderer)
		end

feature -- Fonctions

	run
			-- Lance le jeu
		require
			No_Error: not has_error
		do
			window.key_pressed_actions.extend (agent on_key_pressed)
			window.key_released_actions.extend (agent on_key_released)
			game_library.iteration_actions.extend (agent on_iteration)
			game_library.quit_signal_actions.extend (agent on_quit)
			game_library.launch
		end

	on_iteration(a_timestamp:NATURAL)
			-- Fonction qui se lance � chaque it�ration du jeu
		do
			controller.update_mouse
			if controller.mouse_left_is_held then
				--sound_manager.play_sound ("sand1.wav")
				if block_array.is_valid_position((controller.mouse_x // block_scale) + 1, (controller.mouse_y // block_scale) + 1) and attached {AIR} block_array.block_at ((controller.mouse_x // block_scale) + 1, (controller.mouse_y // block_scale) + 1) then
					block_array.create_block_at (current_block, (controller.mouse_x // block_scale) + 1, (controller.mouse_y // block_scale) + 1)
				end
			end
			updater.update (block_array)
			drawer.clear
			across block_array.blocks as  la_array loop
				drawer.draw_drawables (la_array.item)
			end
			window.update
		end

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Fonction qui se lance lorsque une touche est press�e
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_space then
					current_block := 2

				end

			end
		end

	on_key_released(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Fonction qui se lance lorsque une touche est relach�e
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_space then
					current_block := 1

				end

			end
		end

	on_quit(a_timestamp:NATURAL)
			-- Fonction qui se lance lorsque l'utilisateur ferme la fen�tre
		do
			game_library.stop
		end

feature -- Attributs

	updater:UPDATER -- L'objet qui mets � jour les {BLOCK}

	current_block:INTEGER -- Le {BLOCK} utilis� en ce moment [TBA]

	block_scale:INTEGER -- La grosseur d'un {BLOCK}

	resolution_height:INTEGER -- La r�solution verticale de la fen�tre

	resolution_length:INTEGER -- La r�solution horizontale de la fen�tre

	has_error:BOOLEAN -- Si le jeu rencontre un erreur

	window:GAME_WINDOW_RENDERED -- La fen�tre du jeu

	controller:CONTROLLER -- Le gestionnaire d'entr�es

	sound_manager:SOUND_MANAGER -- Le gestionnaire de sons

	block_array:BLOCK_ARRAY -- La liste de {BLOCK}

	block_factory:BLOCK_FACTORY -- Le cr�ateur de {BLOCK}

	drawer:DRAWER -- Le dessinateur

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
