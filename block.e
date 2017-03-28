note
	description: "Classe abstraite repr�sentant un bloc."
	author: "Olivier Letendre"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	BLOCK

inherit
	DRAWABLE

feature {NONE} --Cr�ation

	make(a_texture:GAME_TEXTURE) --Cr�ation d'un bloc
		do
			texture := a_texture
			was_updated := false
		end


feature --Fonctions

	draw(a_renderer:GAME_RENDERER) --Demande au `a_renderer` de dessiner le bloc
								   --`a_renderer` : Le `GAME_RENDERER` qui dessinera le bloc
		do
			a_renderer.draw_texture (texture, x, y)
		end

	update(a_block_array : BLOCK_ARRAY) --Permets � tous les objets de type `BLOCK` de pouvoir appeller la fonction `update` qui sera ensuite red�finie
										--`a_block_array` : la liste de blocs qui sera mise � jour
		do
		end

	get_was_updated:BOOLEAN --Retourne l'�tat de `was_updated`
		do
			Result := was_updated
		end

	set_was_updated(a_state:BOOLEAN) --D�finit l'�tat de `was_updated`
									 --`a_state` : le nouvel �tat de `was_updated`
		do
			was_updated := a_state
		end

feature {NONE} --Attributs

	texture:GAME_TEXTURE --Texture du bloc

	was_updated:BOOLEAN --Indique si le bloc a �t� mis � jour durant cette it�ration

	block_type:INTEGER --Le type du bloc



end
