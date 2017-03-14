note
	description: "Summary description for {CONTROLLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTROLLER

create
	make

feature {NONE} -- Initialization

	make
		local
			l_mouse_state:GAME_MOUSE_STATE
		do
			create l_mouse_state
			mouse := l_mouse_state
		end

feature -- Access

	mouse:GAME_MOUSE_STATE

	mouse_x:INTEGER -- X position of the mouse

	mouse_y:INTEGER -- Y position of the mouse

feature -- Implementation

	update_mouse_position
		local
			l_mouse_state:GAME_MOUSE_STATE
		do
			create l_mouse_state
			mouse := l_mouse_state
			mouse_x := mouse.x
			mouse_y := mouse.y
		end

end
