note
	description: "Summary description for {DRAWER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DRAWER

create
	make

feature
	make(a_renderer : GAME_RENDERER)
	do
		renderer := a_renderer
	end

	draw(a_drawable : DRAWABLE)
	do
		a_drawable.draw(renderer)
	end

	draw_drawables(a_drawables : LIST[DRAWABLE])
		do
			across a_drawables as la_drawables loop
				draw(la_drawables.item)
			end
		end


feature

	renderer:GAME_RENDERER
end
