note
	description: "Summary description for {SOUND_MANAGER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SOUND_MANAGER

inherit
	AUDIO_LIBRARY_SHARED

create
	make

feature
	make
		local
			l_environment:EXECUTION_ENVIRONMENT
		do
			audio_library.enable_sound
			create l_environment
			audio_library.sources_add
			source := audio_library.last_source_added
		end

	play_sound(a_sound : STRING)
		local
			l_sound:AUDIO_SOUND_WAV_FILE
		do
			create l_sound.make(a_sound)
			l_sound.open
			source.queue_sound_loop (l_sound,1)
			source.play

		end

	source:AUDIO_SOURCE
end
