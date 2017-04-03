note
	description: "Classe abstraite représentant un bloc."
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

deferred class
	BLOCK

inherit
	DRAWABLE

feature {NONE} -- Création

	make(a_texture:GAME_TEXTURE; a_is_floating: BOOLEAN)
			-- Création d'un bloc
		do
			texture := a_texture
			is_floating := a_is_floating
			was_updated := false
		end


feature -- Fonctions

	draw(a_renderer:GAME_RENDERER)
			-- Demande au `a_renderer` de dessiner le bloc
			-- `a_renderer` : Le `GAME_RENDERER` qui dessinera le bloc
		do
			a_renderer.draw_texture (texture, get_x_screen, get_y_screen)
		end

	update(a_block_array : BLOCK_ARRAY)
			-- Mets à jour le bloc dans une liste
			-- `a_block_array` : la liste de blocs qui sera mise à jour
		deferred
		end

feature -- Getters & Setters
	get_was_updated:BOOLEAN
			-- Retourne l'état de `was_updated`
		do
			Result := was_updated
		end

	set_was_updated(a_state:BOOLEAN)
			-- Définit l'état de `was_updated`
			-- `a_state` : le nouvel état de `was_updated`
		do
			was_updated := a_state
		end

	get_x_table:INTEGER
			-- Retourne la coordonnée X du bloc dans la liste
		do
			Result := x_table
		end

	set_x_table(a_x:INTEGER)
			-- Définit la coordonnée X du bloc dans la liste
			-- `a_x` : la nouvelle valeur de `x_table`
		do
			x_table := a_x
		end

	get_y_table:INTEGER
			-- Retourne la coordonnée Y du bloc dans la liste
		do
			Result := y_table
		end

	set_y_table(a_y:INTEGER)
			-- Définit la coordonnée Y du bloc dans la liste
			-- `a_y` : la nouvelle valeur de `y_table`
		do
			y_table := a_y
		end

feature {NONE} -- Attributs

	texture:GAME_TEXTURE -- Texture (couleur) du bloc

	was_updated:BOOLEAN -- Indique si le bloc a été mis à jour durant cette itération

	block_type:INTEGER -- Le type du bloc [TBA]

	x_table:INTEGER -- La coordonnée X du bloc dans la liste

	y_table:INTEGER -- La coordonnée Y du bloc dans la liste

	is_floating:BOOLEAN -- Est-ce que le bloc peut flotter sur des liquides?

end
