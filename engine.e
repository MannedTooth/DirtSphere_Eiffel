note
	description: "Summary description for {ENGINE}."
	author: "Olivier Letendre"
	date: "$Date$"
	revision: "$Revision$"

class
	ENGINE

inherit
	GAME_LIBRARY_SHARED
	AUDIO_LIBRARY_SHARED

create
	make

feature {NONE} -- Initialization

	make
		local
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
			l_controller:CONTROLLER
		do
			resolution_height := 200
			resolution_length := 200
			block_scale := 10
			current_block := 1;
			game_library.enable_video
			has_error := False
			create l_window_builder
			l_window_builder.set_dimension (resolution_height, resolution_length)
			window := l_window_builder.generate_window

			create updater.make


			create l_controller.make
			controller := l_controller

			create sound_manager.make
			create block_factory.make(window.renderer)

			create block_array.make(resolution_height, resolution_length, block_scale, block_factory)
			create drawer.make(window.renderer)
		end

feature -- Access

	updater:UPDATER

	current_block:INTEGER

	block_scale:INTEGER

	resolution_height:INTEGER

	resolution_length:INTEGER

	has_error:BOOLEAN -- If the game encounters an error

	window:GAME_WINDOW_RENDERED -- The window to draw the scene

	controller:CONTROLLER -- Controller that manages inputs

	sound_manager:SOUND_MANAGER

	block_array:BLOCK_ARRAY

	block_factory:BLOCK_FACTORY

	drawer:DRAWER

	run --Execute the game
		require
			No_Error: not has_error
		do
			window.mouse_button_pressed_actions.extend (agent on_mouse_button_pressed)
			game_library.iteration_actions.extend (agent on_iteration)
			game_library.quit_signal_actions.extend (agent on_quit)
			game_library.launch
		end

feature {NONE} -- Implementation

	on_mouse_button_pressed(a_timestamp:NATURAL_32; a_mouse_state:GAME_MOUSE_BUTTON_PRESSED_STATE; a_nb_clicks:NATURAL_8)
	do
		sound_manager.play_sound ("sand1.wav")
		block_array.create_block_at ((controller.mouse_x // block_scale) + 1, (controller.mouse_y // block_scale) + 1)
	end

	on_iteration(a_timestamp:NATURAL) -- Launched at every game loop iteration
		do
			controller.update_mouse_position
			updater.update (block_array)
			across block_array.blocks as  la_array loop
				drawer.draw_drawables (la_array.item)
			end
			window.update
		end


	on_quit(a_timestamp:NATURAL) -- When the user closes the window
		do
			game_library.stop
		end

	is_block_array_valid:BOOLEAN
		do
			Result := True
			across 1 |..| block_array.blocks.count as la_index1 loop
				across 1 |..| block_array.blocks.at (la_index1.item).count as la_index2 loop
					Result := Result and
								block_array.blocks.at (la_index1.item).at (la_index2.item).x = ((la_index1.item - 1) * 10) and
								block_array.blocks.at (la_index1.item).at (la_index2.item).y = ((la_index2.item - 1) * 10)
					if not Result then
						print("Index1: " + ((la_index1.item - 1) * 10).out + "%N")
						print("Index2: " + ((la_index2.item - 1) * 10).out + "%N")
						print("X:" + block_array.blocks.at (la_index1.item).at (la_index2.item).x.out + "%N")
						print("Y:" + block_array.blocks.at (la_index1.item).at (la_index2.item).y.out + "%N")
					end
				end
			end
		end

invariant
	Block_Position_Valid:--is_block_array_valid
end
