note
    description : "A game created in Eiffel."
    author      : ""
    generator   : "Eiffel Game2 Project Wizard"
    date        : "2017-02-14 07:27:19.999 +0000"
    revision    : "0.1"

class
    APPLICATION

inherit
	GAME_LIBRARY_SHARED
	AUDIO_LIBRARY_SHARED

create
    make

feature {NONE} -- Initialization

    make
            -- Running the game.
        local
        	l_engine:ENGINE
        do
            create l_engine.make
            if not l_engine.has_error then
            	l_engine.run
            end
        end

end
