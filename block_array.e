note
	description: "Une liste de listes de blocs"
	author: "Olivier Letendre"
	date: "29/03/2016"
	revision: "0.1"

class
	BLOCK_ARRAY

create
	make

feature {NONE} -- Création

	make(a_height, a_length, a_block_scale : INTEGER; a_block_factory : BLOCK_FACTORY)
			-- Création de la liste de blocs
			-- `a_height` : nombre de blocs en vertical
			-- `a_length` : nombre de blocs en horizontal
			-- `a_block_scale` : largeur et hauteur des blocs
			-- `a_block_fatory` : le créateur des blocs
		local
			l_blocks:LIST[LIST[BLOCK]]
			l_list:LIST[BLOCK]
		do
			block_scale := a_block_scale
			block_factory := a_block_factory
			create {ARRAYED_LIST[LIST[BLOCK]]} l_blocks.make(a_height)
			across 1 |..| (a_height) as la_index loop
				create {ARRAYED_LIST[BLOCK]}l_list.make (a_length)
				across 1 |..| (a_length) as la_index2 loop
					l_list.extend (block_factory.air_block)
					l_list.last.set_x_screen((la_index.item - 1) * block_scale)
					l_list.last.set_y_screen((la_index2.item - 1) * block_scale)
					l_list.last.set_x_table(la_index.item)
					l_list.last.set_y_table(la_index2.item)
				end
				l_blocks.extend (l_list)
			end
			blocks := l_blocks
		end


feature -- Fonctions

	create_block_at(a_block_type, a_x, a_y : INTEGER)
			-- Crée un bloc à une coordonnée donnée
			-- `a_block_type` : type du bloc à ajouter
			-- `a_x` : Coordonée X à laquelle créer un bloc
			-- `a_y` : Coordonée Y à laquelle créer un bloc
		do
			inspect a_block_type
				when 1 then
					blocks.at (a_x).at (a_y) := block_factory.sand_block
				when 2 then
					blocks.at (a_x).at (a_y) := block_factory.water_block
				when 3 then
					blocks.at (a_x).at (a_y) := block_factory.dirt_block
				else

			end
			blocks.at (a_x).at (a_y).set_x_screen((a_x - 1) * block_scale)
			blocks.at (a_x).at (a_y).set_y_screen((a_y - 1) * block_scale)
			blocks.at (a_x).at (a_y).set_x_table(a_x)
			blocks.at (a_x).at (a_y).set_y_table(a_y)
		end

	block_at(a_x, a_y : INTEGER):BLOCK
			-- Retourne le bloc à une coordonnée donnée
			-- `a_x` : Coordonée X du bloc à retourner
			-- `a_y` : Coordonée Y du bloc à retourner
		do
			Result := blocks.at (a_x).at (a_y)
		end

	is_valid_position(a_x, a_y : INTEGER):BOOLEAN
			-- Retourne si la position dans le tableau est valide (a l'intérieur de l'écran)
			-- `a_x` : Coordonée X à vérifier
			-- `a_y` : Coordonée Y à vérifier
		do
			Result := (blocks.valid_index (a_x) and blocks.at(a_x).valid_index (a_y))
		end

	swap_blocks(a_x1, a_y1, a_x2, a_y2 : INTEGER)
			-- Échange les positions de deux blocs
			-- `a_x1` : Coordonnée X du premier bloc
			-- `a_y1` : Coordonnée Y du premier bloc
			-- `a_x2` : Coordonnée X du deuxième bloc
			-- `a_y2` : Coordonnée Y du deuxième bloc

		local
			l_block1:BLOCK
			l_block2:BLOCK
		do
			if (is_valid_position(a_x1, a_y1) and is_valid_position(a_x2, a_y2)) then
				l_block1 := block_at(a_x1, a_y1)
				l_block1.set_x_screen ((a_x2 - 1) * block_scale)
				l_block1.set_y_screen ((a_y2 - 1) * block_scale)
				l_block1.set_x_table (a_x2)
				l_block1.set_y_table (a_y2)

				l_block2 := block_at(a_x2, a_y2)
				l_block2.set_x_screen ((a_x1 - 1) * block_scale)
				l_block2.set_y_screen ((a_y1 - 1) * block_scale)
				l_block2.set_x_table (a_x1)
				l_block2.set_y_table (a_y1)

				put_block_at(a_x2, a_y2, l_block1)
				put_block_at(a_x1, a_y1, l_block2)
			end


		end

	swap_block_with_up(a_x, a_y : INTEGER)
			-- Échange les positions du bloc avec le bloc en haut
			-- `a_x` : Coordonée X du bloc à échanger
			-- `a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x, a_y - 1)
		end

	swap_block_with_down(a_x, a_y : INTEGER)
			-- Échange les positions du bloc avec le bloc en bas
			-- `a_x` : Coordonée X du bloc à échanger
			-- `a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x, a_y + 1)
		end

	swap_block_with_left(a_x, a_y : INTEGER)
			-- Échange les positions du bloc avec le bloc de gauche
			-- `a_x` : Coordonée X du bloc à échanger
			-- `a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x - 1, a_y)
		end

	swap_block_with_right(a_x, a_y : INTEGER)
			-- Échange les positions du bloc avec le bloc de droite
			-- `a_x` : Coordonée X du bloc à échanger
			-- `a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x + 1, a_y)
		end

	swap_block_with_down_left(a_x, a_y : INTEGER)
			-- Échange les positions du bloc avec le bloc en bas
			-- `a_x` : Coordonée X du bloc à échanger
			-- `a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x - 1, a_y + 1)
		end

	swap_block_with_down_right(a_x, a_y : INTEGER)
			-- Échange les positions du bloc avec le bloc en bas
			-- `a_x` : Coordonée X du bloc à échanger
			-- `a_y` : Coordonée Y du bloc à échanger
		do
			swap_blocks(a_x, a_y, a_x + 1, a_y + 1)
		end

	put_block_at(a_x, a_y : INTEGER; a_block_to_put : BLOCK)
			-- Place un position à une coordonnée donnée
			-- `a_x` : Coordonée X où placer le bloc
			-- `a_y` : Coordonée Y où placer le bloc
			-- `a_block_to_put` : Le bloc à placer
		do
			blocks.at (a_x).at (a_y) := a_block_to_put
		end

feature -- Getters & Setters

	get_blocks:LIST[LIST[BLOCK]]
			-- Retourne la liste de blocs
		do
			Result := blocks
		end

	set_blocks(a_blocks:LIST[LIST[BLOCK]])
			-- Définit des nouveaux blocs pour la liste
			-- `a_blocks` : La nouvelle liste de blocs
		do
			blocks := a_blocks
		end


feature {NONE} -- Attributs

	blocks:LIST[LIST[BLOCK]] -- La liste de listes de blocs

	block_scale:INTEGER -- La grosseur d'un bloc

	block_factory:BLOCK_FACTORY -- Le créateur de blocs


end
