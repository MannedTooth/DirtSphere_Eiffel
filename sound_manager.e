note
	description: "Gestionnaire des sons."
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
			-- Création du gestionnaire de sons
		local
			l_environment:EXECUTION_ENVIRONMENT
		do
			audio_library.enable_sound
			create l_environment
			audio_library.sources_add
			source := audio_library.last_source_added
		end

feature -- Fonctions

	play_sound(a_sound : STRING)
			-- Joue un son
			-- `a_sound` : son à jouer
		local
			l_sound:AUDIO_SOUND_WAV_FILE
		do
			create l_sound.make(a_sound)
			l_sound.open
			source.queue_sound_loop (l_sound,1)
			source.play

		end

feature -- Attributs

	source:AUDIO_SOURCE -- source du son


end
