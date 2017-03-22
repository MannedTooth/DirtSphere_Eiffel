note
	description: "Summary description for {AIR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	AIR

inherit
	BLOCK
	undefine
		update
	redefine
		draw
	end
	SOLID

create
	make

feature

	draw(a_renderer:GAME_RENDERER)
		do
		end
end
