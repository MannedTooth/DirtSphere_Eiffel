note
	description: "Summary description for {BLOCK_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BLOCK_FACTORY

create
	make

feature
	make(a_renderer : GAME_RENDERER)
		do
			texture_air := get_target (a_renderer, create {GAME_COLOR}.make_rgb (0, 0, 0))
			texture_sand := get_target (a_renderer, create {GAME_COLOR}.make_rgb (123, 213, 20))
			texture_dirt := get_target (a_renderer, create {GAME_COLOR}.make_rgb (56, 35, 1))
		end

feature
	air_block:AIR
		do
			create Result.make(texture_air)
		end

	sand_block:SAND
		do
			create Result.make(texture_sand)
		end

	dirt_block:DIRT
		do
			create Result.make(texture_dirt)
		end

feature {NONE} -- Implementation

	get_target(a_renderer:GAME_RENDERER; a_color:GAME_COLOR):GAME_TEXTURE_TARGET
		local
			l_target:GAME_TEXTURE_TARGET
			l_pixel_format:GAME_PIXEL_FORMAT
		do
			create l_pixel_format
			l_pixel_format.set_rgb888
			create l_target.make (a_renderer, l_pixel_format, 10, 10)
			a_renderer.set_target (l_target)
			a_renderer.drawing_color := a_color
			a_renderer.draw_filled_rectangle (0, 0, 10, 10)
			a_renderer.set_original_target
			Result := l_target
		end

	texture_air:GAME_TEXTURE

	texture_sand:GAME_TEXTURE

	texture_dirt:GAME_TEXTURE

end
