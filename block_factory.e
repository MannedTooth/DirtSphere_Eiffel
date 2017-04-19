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
			-- Crée `Current` avec une grosseur de {BLOCK} de `a_block_scale`
			-- `a_renderer` : le `GAME_RENDERER` qui créera les textures des {BLOCK}
		do
			texture_air := get_target (a_block_scale, a_renderer, create {GAME_COLOR}.make_rgb (0, 0, 0))
			texture_sand := get_target (a_block_scale, a_renderer, create {GAME_COLOR}.make_rgb (237, 213, 118))
			texture_dirt := get_target (a_block_scale, a_renderer, create {GAME_COLOR}.make_rgb (56, 35, 1))
			texture_water := get_target (a_block_scale, a_renderer, create {GAME_COLOR}.make_rgb (106, 144, 226))
		end

feature -- Fonctions

	air_block:AIR
			-- Crée un {BLOCK} d'{AIR}
		do
			create Result.make(texture_air, false)
		end

	sand_block:SAND
			-- Crée un {BLOCK} de {SAND}
		do
			create Result.make(texture_sand, false)
		end

	dirt_block:MUD
			-- Crée un {BLOCK} de {MUD}
		do
			create Result.make(texture_dirt, false)
		end

	water_block:WATER
			--Crée un {BLOCK} de {WATER}
		do
			create Result.make(texture_water, false)
		end

	get_target(a_block_scale : INTEGER; a_renderer:GAME_RENDERER; a_color:GAME_COLOR):GAME_TEXTURE_TARGET
			-- Crée et retourne une texture de {BLOCK} d'une grosseur de `a_block_scale` et de couleur `a_color`
			-- `a_renderer` : le ``GAME_RENDERER` qui dessinera la texture
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

	texture_air:GAME_TEXTURE -- Texture d'un {BLOCK} d'{AIR}

	texture_sand:GAME_TEXTURE -- Texture d'un {BLOCK} de {SAND}

	texture_dirt:GAME_TEXTURE -- Texture d'un {BLOCK} de {MUD}

	texture_water:GAME_TEXTURE -- Texture d'un {BLOCK} de {WATER}

invariant

note
	copyright: "Copyright (c) 2017, Olivier Letendre"
	license: "[
			 This program is free software: you can redistribute it and/or modify
			 it under the terms of the GNU General Public License as published by
			 the Free Software Foundation, either version 3 of the License, or
			 (at your option) any later version.
			 ]"
	source: "[
			Olivier Letendre
			Email MannedTooth@outlook.com
			]"

end
