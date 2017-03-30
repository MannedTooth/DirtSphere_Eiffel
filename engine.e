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
			--Création du moteur de jeu
		local
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
			l_controller:CONTROLLER
		do
			resolution_height := 1280
			resolution_length := 720
			block_scale := 10
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
--			window.mouse_button_pressed_actions.extend (agent on_mouse_button_pressed)
			game_library.iteration_actions.extend (agent on_iteration)
			game_library.quit_signal_actions.extend (agent on_quit)
			game_library.launch
		end

--	on_mouse_button_pressed(a_timestamp:NATURAL_32; a_mouse_state:GAME_MOUSE_BUTTON_PRESSED_STATE; a_nb_clicks:NATURAL_8)
--			
--		do

--		end

	on_iteration(a_timestamp:NATURAL) -- Launched at every game loop iteration
			-- Fonction qui se lance à chaque itération du jeu
		do
			controller.update_mouse
			if controller.mouse_left_is_held then
				--sound_manager.play_sound ("sand1.wav")
				block_array.create_block_at ((controller.mouse_x // block_scale) + 1, (controller.mouse_y // block_scale) + 1)
			end
			updater.update (block_array)
			drawer.clear
			across block_array.get_blocks as  la_array loop
				drawer.draw_drawables (la_array.item)
			end
			window.update
		end

	on_quit(a_timestamp:NATURAL)
			-- Fonction qui se lance lorsque le joueur ferme la fenêtre
		do
			game_library.stop
		end

feature -- Attributs

	updater:UPDATER -- l'objet qui mets à jour les blocs

	current_block:INTEGER -- le bloc utilisé en ce moment [TBA]

	block_scale:INTEGER -- La grosseur d'un bloc

	resolution_height:INTEGER -- La hauteur de la fenêtre

	resolution_length:INTEGER -- La largeur de la fenêtre

	has_error:BOOLEAN -- Si le jeu rencontre un erreur

	window:GAME_WINDOW_RENDERED -- La fenetre du jeu

	controller:CONTROLLER -- Le gestionnaire d'entrées

	sound_manager:SOUND_MANAGER -- Le gestionnaire de sons

	block_array:BLOCK_ARRAY -- La liste de blocs

	block_factory:BLOCK_FACTORY -- Le créateur de blocs

	drawer:DRAWER -- Le dessinateur



end
