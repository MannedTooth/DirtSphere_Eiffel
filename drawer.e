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
	local
		l_background_color:GAME_COLOR_READABLE
	do
		renderer := a_renderer
		create l_background_color.make_rgb(0,0,0)
		background_color := l_background_color

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

	clear
		do
			renderer.set_drawing_color (background_color)
			renderer.clear
		end


feature

	renderer:GAME_RENDERER

	background_color:GAME_COLOR_READABLE
end
