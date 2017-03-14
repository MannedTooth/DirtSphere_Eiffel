note
	description: "Summary description for {DRAWABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DRAWABLE


feature
	x:INTEGER assign set_x

	y:INTEGER assign set_y

	set_x(a_x:INTEGER)
		do
			x := a_x
		end

	set_y(a_y:INTEGER)
		do
			y := a_y
		end

	draw(a_renderer:GAME_RENDERER)
		deferred
		end
end
