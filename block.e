note
	description: "Summary description for {BLOCK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	BLOCK

inherit
	DRAWABLE

feature
	draw(a_renderer:GAME_RENDERER)
		do
			a_renderer.draw_texture (texture, x, y)
		end

	make(a_texture:GAME_TEXTURE)
		do
			texture := a_texture
		end

	update(a_block_array : BLOCK_ARRAY)
		do
		end


	texture:GAME_TEXTURE

end
