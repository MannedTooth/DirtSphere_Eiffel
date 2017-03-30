note
	description: "Un créateur de blocs."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	BLOCK_FACTORY

create
	make

feature -- Création

	make(a_block_scale : INTEGER; a_renderer : GAME_RENDERER)
			-- Crée le créateur de blocs
			-- `a_block_scale` : la grosseur d'un bloc
			-- `a_renderer` : le `GAME_RENDERER` qui créera les textures des blocs
		do
			texture_air := get_target (a_block_scale, a_renderer, create {GAME_COLOR}.make_rgb (0, 0, 0))
			texture_sand := get_target (a_block_scale, a_renderer, create {GAME_COLOR}.make_rgb (123, 213, 20))
			texture_dirt := get_target (a_block_scale, a_renderer, create {GAME_COLOR}.make_rgb (56, 35, 1))
		end

feature -- Fonctions

	air_block:AIR
			-- Crée un bloc d' `AIR`
		do
			create Result.make(texture_air)
		end

	sand_block:SAND
			-- Crée un bloc de `SAND`
		do
			create Result.make(texture_sand)
		end

	dirt_block:DIRT
			-- Crée un bloc de `DIRT`
		do
			create Result.make(texture_dirt)
		end

	get_target(a_block_scale : INTEGER; a_renderer:GAME_RENDERER; a_color:GAME_COLOR):GAME_TEXTURE_TARGET
			-- Crée et retourne une texture d'un bloc
			-- `a_block_scale` : grosseur du bloc
			-- `a_renderer` : le ``GAME_RENDERER` qui dessinera la texture
			-- `a_color` : la couleur du bloc
		local
			l_target:GAME_TEXTURE_TARGET
			l_pixel_format:GAME_PIXEL_FORMAT
		do
			create l_pixel_format
			l_pixel_format.set_rgb888
			create l_target.make (a_renderer, l_pixel_format, a_block_scale, a_block_scale)
			a_renderer.set_target (l_target)
			a_renderer.drawing_color := a_color
			a_renderer.draw_filled_rectangle (0, 0, a_block_scale, a_block_scale)
			a_renderer.set_original_target
			Result := l_target
		end

feature {NONE} -- Attributs

	texture_air:GAME_TEXTURE -- texture d'un bloc d' `AIR`

	texture_sand:GAME_TEXTURE -- texture d'un bloc de `SAND`

	texture_dirt:GAME_TEXTURE -- texture d'un bloc de `DIRT`



end
