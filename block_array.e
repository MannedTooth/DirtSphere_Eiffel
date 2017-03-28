note
	description: "Une liste de listes de blocs"
	author: "Olivier Letendre"
	date: "$Date$"
	revision: "$Revision$"

class
	BLOCK_ARRAY

create
	make

feature {NONE} --Création
	make(a_height, a_length, a_block_scale : INTEGER; a_block_factory : BLOCK_FACTORY)
			--Création de la liste de blocs
			--`a_height` : nombre de blocs en vertical
			--`a_length` : nombre de blocs en horizontal
			--`block_scale` : largeur et hauteur des blocs
			--`a_block_fatory` : le créateur des blocs
		local
			l_blocks:LIST[LIST[BLOCK]]
			l_list:LIST[BLOCK]
		do
			block_scale := a_block_scale
			block_factory := a_block_factory
			create {ARRAYED_LIST[LIST[BLOCK]]} l_blocks.make(a_height) --Crée des listes qui en contiendront d'autres (rangées horizontales)
			across 1 |..| (a_height) as la_index loop
				create {ARRAYED_LIST[BLOCK]}l_list.make (a_length) --Crée des listes dans les listes (rangées verticales)
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
	create_block_at(a_x, a_y : INTEGER) --Crée un bloc à une coordonnée donnée
										--`a_x` : Coordonée X à laquelle créer un bloc
										--`a_y` : Coordonée Y à laquelle créer un bloc
		do
			blocks.at (a_x).at (a_y) := block_factory.sand_block --Création du bloc
			blocks.at (a_x).at (a_y).set_x((a_x - 1) * block_scale)
			blocks.at (a_x).at (a_y).set_y((a_y - 1) * block_scale)
		end

	block_at(a_x, a_y : INTEGER):BLOCK --Retourne le bloc à une coordonnée donnée
									   --`a_x` : Coordonée X du bloc à retourner
									   --`a_y` : Coordonée Y du bloc à retourner
		do
			Result := blocks.at (a_x).at (a_y)
		end

	is_valid_position(a_x, a_y : INTEGER):BOOLEAN --Retourne si la position dans le tableau est valide (a l'intérieur de l'écran)
												  --`a_x` : Coordonée X à vérifier
												  --`a_y` : Coordonée Y à vérifier
		do
			Result := (blocks.valid_index (a_x) and blocks.at(a_x).valid_index (a_y))
		end

	swap_blocks(a_x1, a_y1, a_x2, a_y2 : INTEGER) --Échange les positions de deux blocs
												  --`a_x1` : Coordonnée X du premier bloc
												  --`a_y1` : Coordonnée Y du premier bloc
												  --`a_x2` : Coordonnée X du deuxième bloc
												  --`a_y1` : Coordonnée Y du deuxième bloc

		local
			l_block1:BLOCK
			l_block2:BLOCK
		do
			if (is_valid_position((a_x1 // block_scale) + 1, (a_y1 // block_scale) + 1) and is_valid_position((a_x2 // block_scale) + 1, (a_y2 // block_scale) + 1))
			then
				l_block1 := block_at((a_x1 // block_scale) + 1, (a_y1 // block_scale) + 1) --Associe le deuxième bloc
				l_block1.set_x (a_x2)
				l_block1.set_y (a_y2)
				l_block2 := block_at((a_x2 // block_scale) + 1, (a_y2 // block_scale) + 1) --ASsocie le premier bloc
				l_block2.set_x (a_x1)
				l_block2.set_y (a_y1)

				put_block_at((a_x2 // block_scale) + 1, (a_y2 // block_scale) + 1, l_block1)
				put_block_at((a_x1 // block_scale) + 1, (a_y1 // block_scale) + 1, l_block2)
			end


		end

	swap_block_with_up(a_x, a_y : INTEGER) --Échange les positions du bloc avec le bloc en haut
										   --`a_x` : Coordonée X du bloc à échanger
										   --`a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x, a_y - block_scale)
		end

	swap_block_with_down(a_x, a_y : INTEGER) --Échange les positions du bloc avec le bloc en bas
											 --`a_x` : Coordonée X du bloc à échanger
										     --`a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x, a_y + block_scale)
		end

	swap_block_with_left(a_x, a_y : INTEGER) --Échange les positions du bloc avec le bloc de gauche
											 --`a_x` : Coordonée X du bloc à échanger
										     --`a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x - block_scale, a_y)
		end

	swap_block_with_right(a_x, a_y : INTEGER) --Échange les positions du bloc avec le bloc de droite
											  --`a_x` : Coordonée X du bloc à échanger
										      --`a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x + block_scale, a_y)
		end

	put_block_at(a_x, a_y : INTEGER; a_block_to_put : BLOCK) --Place un position à une coordonnée donnée
															 --`a_x` : Coordonée X où placer le bloc
															 --`a_y` : Coordonée Y où placer le bloc
															 --`a_block_to_put` : Le bloc à placer
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

	block_factory:BLOCK_FACTORY --Le créateur de blocs


end
