note
	description: "Une liste de listes de blocs"
	author: "Olivier Letendre"
	date: "$Date$"
	revision: "$Revision$"

class
	BLOCK_ARRAY

create
	make

feature {NONE} --Cr�ation
	make(a_height, a_length, a_block_scale : INTEGER; a_block_factory : BLOCK_FACTORY)
			--Cr�ation de la liste de blocs
			--`a_height` : nombre de blocs en vertical
			--`a_length` : nombre de blocs en horizontal
			--`block_scale` : largeur et hauteur des blocs
			--`a_block_fatory` : le cr�ateur des blocs
		local
			l_blocks:LIST[LIST[BLOCK]]
			l_list:LIST[BLOCK]
		do
			block_scale := a_block_scale
			block_factory := a_block_factory
			create {ARRAYED_LIST[LIST[BLOCK]]} l_blocks.make(a_height) --Cr�e des listes qui en contiendront d'autres (rang�es horizontales)
			across 1 |..| (a_height) as la_index loop
				create {ARRAYED_LIST[BLOCK]}l_list.make (a_length) --Cr�e des listes dans les listes (rang�es verticales)
				across 1 |..| (a_length) as la_index2 loop
					l_list.extend (block_factory.air_block) --Remplis la liste de listes avec des blocs d' `AIR`
					l_list.last.set_x((la_index.item - 1) * block_scale)
					l_list.last.set_y((la_index.item - 1) * block_scale)
				end
				l_blocks.extend (l_list)
			end
			blocks := l_blocks
		end


feature --Fonctions
	create_block_at(a_x, a_y : INTEGER) --Cr�e un bloc � une coordonn�e donn�e
										--`a_x` : Coordon�e X � laquelle cr�er un bloc
										--`a_y` : Coordon�e Y � laquelle cr�er un bloc
		do
			blocks.at (a_x).at (a_y) := block_factory.sand_block --Cr�ation du bloc
			blocks.at (a_x).at (a_y).set_x((a_x - 1) * block_scale)
			blocks.at (a_x).at (a_y).set_y((a_y - 1) * block_scale)
		end

	block_at(a_x, a_y : INTEGER):BLOCK --Retourne le bloc � une coordonn�e donn�e
									   --`a_x` : Coordon�e X du bloc � retourner
									   --`a_y` : Coordon�e Y du bloc � retourner
		do
			Result := blocks.at (a_x).at (a_y)
		end

	is_valid_position(a_x, a_y : INTEGER):BOOLEAN --Retourne si la position dans le tableau est valide (a l'int�rieur de l'�cran)
												  --`a_x` : Coordon�e X � v�rifier
												  --`a_y` : Coordon�e Y � v�rifier
		do
			Result := (blocks.valid_index (a_x) and blocks.at(a_x).valid_index (a_y))
		end

	swap_blocks(a_x1, a_y1, a_x2, a_y2 : INTEGER) --�change les positions de deux blocs
												  --`a_x1` : Coordonn�e X du premier bloc
												  --`a_y1` : Coordonn�e Y du premier bloc
												  --`a_x2` : Coordonn�e X du deuxi�me bloc
												  --`a_y1` : Coordonn�e Y du deuxi�me bloc

		local
			l_block1:BLOCK
			l_block2:BLOCK
		do
			if (is_valid_position((a_x1 // block_scale) + 1, (a_y1 // block_scale) + 1) and is_valid_position((a_x2 // block_scale) + 1, (a_y2 // block_scale) + 1))
			then
				l_block1 := block_at((a_x1 // block_scale) + 1, (a_y1 // block_scale) + 1) --Associe le deuxi�me bloc
				l_block1.set_x (a_x2)
				l_block1.set_y (a_y2)
				l_block2 := block_at((a_x2 // block_scale) + 1, (a_y2 // block_scale) + 1) --ASsocie le premier bloc
				l_block2.set_x (a_x1)
				l_block2.set_y (a_y1)

				put_block_at((a_x2 // block_scale) + 1, (a_y2 // block_scale) + 1, l_block1)
				put_block_at((a_x1 // block_scale) + 1, (a_y1 // block_scale) + 1, l_block2)
			end


		end

	swap_block_with_up(a_x, a_y : INTEGER) --�change les positions du bloc avec le bloc en haut
										   --`a_x` : Coordon�e X du bloc � �changer
										   --`a_y` : Coordon�e Y du bloc � �changer
		do
			swap_blocks(a_x, a_y, a_x, a_y - block_scale)
		end

	swap_block_with_down(a_x, a_y : INTEGER) --�change les positions du bloc avec le bloc en bas
											 --`a_x` : Coordon�e X du bloc � �changer
										     --`a_y` : Coordon�e Y du bloc � �changer
		do
			swap_blocks(a_x, a_y, a_x, a_y + block_scale)
		end

	swap_block_with_left(a_x, a_y : INTEGER) --�change les positions du bloc avec le bloc de gauche
											 --`a_x` : Coordon�e X du bloc � �changer
										     --`a_y` : Coordon�e Y du bloc � �changer
		do
			swap_blocks(a_x, a_y, a_x - block_scale, a_y)
		end

	swap_block_with_right(a_x, a_y : INTEGER) --�change les positions du bloc avec le bloc de droite
											  --`a_x` : Coordon�e X du bloc � �changer
										      --`a_y` : Coordon�e Y du bloc � �changer
		do
			swap_blocks(a_x, a_y, a_x + block_scale, a_y)
		end

	put_block_at(a_x, a_y : INTEGER; a_block_to_put : BLOCK) --Place un position � une coordonn�e donn�e
															 --`a_x` : Coordon�e X o� placer le bloc
															 --`a_y` : Coordon�e Y o� placer le bloc
															 --`a_block_to_put` : Le bloc � placer
		do
			blocks.at (a_x).at (a_y) := a_block_to_put
		end

feature --Getters-Setters
	get_blocks:LIST[LIST[BLOCK]]
		do
			Result := blocks
		end


feature {NONE} --Attributs
	blocks:LIST[LIST[BLOCK]] --La liste de listes de blocs

	block_scale:INTEGER --La grosseur d'un bloc

	block_factory:BLOCK_FACTORY --Le cr�ateur de blocs


end
