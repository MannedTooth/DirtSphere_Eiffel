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

feature --Création

	make
			--Création de `Current`
		local
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
			l_controller:CONTROLLER
		do
			resolution_height := 600
			resolution_length := 600
			block_scale := 15
			current_block := 1
			is_muted := FALSE
			game_library.enable_video
			has_error := False
			create l_window_builder
			l_window_builder.set_dimension (resolution_height, resolution_length)
			window := l_window_builder.generate_window




			create l_controller.make
			controller := l_controller

			create sound_manager.make
			create block_factory.make(block_scale, window.renderer)

			create block_array.make(resolution_height // block_scale, resolution_length // block_scale, block_scale, block_factory)
			create drawer.make(window.renderer)

			create updater.make(block_array)
			updater.launch
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
			-- Fonction qui se lance à chaque itération du jeu
		do
			controller.update_mouse
			if controller.mouse_left_is_held then

				if block_array.is_valid_position((controller.mouse_x // block_scale) + 1, (controller.mouse_y // block_scale) + 1) and attached {AIR} block_array.block_at ((controller.mouse_x // block_scale) + 1, (controller.mouse_y // block_scale) + 1) then
					block_array.create_block_at (current_block, (controller.mouse_x // block_scale) + 1, (controller.mouse_y // block_scale) + 1)
					if not is_muted then
						sound_manager.creation_block(current_block)
					end

				end

			end
			drawer.clear
			across block_array.blocks as  la_array loop
				drawer.draw_drawables (la_array.item)
			end
			window.update
		end

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Fonction qui se lance lorsque une touche est pressée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_space then
					current_block := 2
				elseif a_key_state.is_m then
					if is_muted then
						is_muted := FALSE
					else
						is_muted := TRUE
					end
				elseif a_key_state.is_s then
					connection_au_serveur
				end

			end
		end

	on_key_released(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- Fonction qui se lance lorsque une touche est relachée
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_space then
					current_block := 1
				end

			end
		end

	on_quit(a_timestamp:NATURAL)
			-- Fonction qui se lance lorsque l'utilisateur ferme la fenêtre
		do
			game_library.stop
		end

	connection_au_serveur
			-- Fonction permettant de se connecter au serveur du jeu
		local
			l_addr_factory:INET_ADDRESS_FACTORY
			l_socket:NETWORK_STREAM_SOCKET
		do
			create l_addr_factory
			if attached l_addr_factory.create_from_name ("localhost") as la_address then
				create l_socket.make_client_by_address_and_port (la_address, 12345)
				if not l_socket.invalid_address then
					l_socket.connect
					if l_socket.is_connected then
						print("je suis connecte au serveur")
						l_socket.independent_store (sauvegarder_blocs(block_array))
					else
						io.error.put_string ("Erreur lors de la connexion au serveur.%N")
					end
				else
					io.error.put_string ("Erreur: Adresse invalide: " + io.last_string + ".%N")

				end
				l_socket.close
			end
		end

	sauvegarder_blocs(a_block_array:BLOCK_ARRAY):LIST[LIST[INTEGER]]
			-- Fonction qui sauvegarde et retourne la liste de {BLOCKS} actuels sous form de tableau d'entiers
		local
			l_list_blocks_transfert:LIST[LIST[INTEGER]]
			l_list_transfert:LIST[INTEGER]
		do
			create {ARRAYED_LIST[LIST[INTEGER]]} l_list_blocks_transfert.make(a_block_array.blocks.count)
			across 1 |..| a_block_array.blocks.count as la_rangee loop
				create {ARRAYED_LIST[INTEGER]}l_list_transfert.make (a_block_array.blocks.count.item)
				across 1 |..| l_list_transfert.count as la_colonne loop
					if attached {AIR} a_block_array.block_at (la_rangee.item, la_colonne.item) then
						l_list_blocks_transfert.at (la_rangee.item).at (la_colonne.item) := 0
					elseif attached {WATER} a_block_array.block_at (la_rangee.item, la_colonne.item) then
						l_list_blocks_transfert.at (la_rangee.item).at (la_colonne.item) := 1
					elseif attached {SAND} a_block_array.block_at (la_rangee.item, la_colonne.item) then
						l_list_blocks_transfert.at (la_rangee.item).at (la_colonne.item) := 2
					elseif attached {MUD} a_block_array.block_at (la_rangee.item, la_colonne.item) then
						l_list_blocks_transfert.at (la_rangee.item).at (la_colonne.item) := 3
					end
				end
			end


			Result := l_list_blocks_transfert

		end

feature -- Attributs

	updater:UPDATER -- L'objet qui mets à jour les {BLOCK}

	current_block:INTEGER -- Le {BLOCK} utilisé en ce moment [TBA]

	block_scale:INTEGER -- La grosseur d'un {BLOCK}

	resolution_height:INTEGER -- La résolution verticale de la fenêtre

	resolution_length:INTEGER -- La résolution horizontale de la fenêtre

	has_error:BOOLEAN -- Si le jeu rencontre un erreur

	is_muted:BOOLEAN -- Si le jeu est en sourdine

	window:GAME_WINDOW_RENDERED -- La fenêtre du jeu

	controller:CONTROLLER -- Le gestionnaire d'entrées

	sound_manager:SOUND_MANAGER -- Le gestionnaire de sons

	block_array:BLOCK_ARRAY -- La liste de {BLOCK}

	block_factory:BLOCK_FACTORY -- Le créateur de {BLOCK}

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
