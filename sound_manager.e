note
	description: "Gestionnaire de sons."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	SOUND_MANAGER

inherit
	AUDIO_LIBRARY_SHARED

create
	make

feature -- Création

	make
			-- Création de `Current`
		do
			audio_library.enable_sound
			create environment
			audio_library.sources_add
			source := audio_library.last_source_added
		end

feature -- Fonctions

	play_sound(a_sound : STRING)
			-- Joue le son du fichier à l'adresse `a_sound`
		local
			l_sound:AUDIO_SOUND_WAV_FILE
		do
			create l_sound.make(a_sound)
			l_sound.open
			source.queue_sound_loop (l_sound,1)
			source.play
--			from
--				source.play
--			until
--				not source.is_playing
--			loop
--				environment.sleep (10000000)
--				audio
--			end
		end

	creation_block(block_created:INTEGER)
			-- Détermine le son à jouer
		do
			inspect block_created
				when 1 then
					play_sound("sand.wav")
				when 2 then
					play_sound("water.wav")
			end
		end


feature -- Attributs

	source:AUDIO_SOURCE -- Source du son

	environment:EXECUTION_ENVIRONMENT

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
