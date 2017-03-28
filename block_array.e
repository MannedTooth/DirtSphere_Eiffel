note
	description: "Summary description for {BLOCK_ARRAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BLOCK_ARRAY

create
	make

feature
	make(a_height, a_length, a_block_scale : INTEGER; a_block_factory : BLOCK_FACTORY)
		local
			l_blocks:LIST[LIST[BLOCK]]
			l_list:LIST[BLOCK]
		do
			block_scale := a_block_scale
			block_factory := a_block_factory
			create {ARRAYED_LIST[LIST[BLOCK]]} l_blocks.make(a_height // block_scale)
			across 1 |..| (a_height - 1) as la_index loop
				create {ARRAYED_LIST[BLOCK]}l_list.make (a_length // block_scale)
				across 1 |..| (a_length - 1) as la_index2 loop
					l_list.extend (block_factory.air_block)
					l_list.last.set_x(la_index.item // block_scale + 1)
					l_list.last.set_y(la_index.item // block_scale + 1)
				end
				l_blocks.extend (l_list)
			end
			blocks := l_blocks
		end

feature
	blocks:LIST[LIST[BLOCK]]

	block_scale:INTEGER

feature -- Functions
	create_block_at(a_x, a_y : INTEGER)
		do
			blocks.at (a_x).at (a_y) := block_factory.sand_block
			blocks.at (a_x).at (a_y).set_x((a_x - 1) * block_scale)
			blocks.at (a_x).at (a_y).set_y((a_y - 1) * block_scale)
		end

	block_at(a_x, a_y : INTEGER):BLOCK
		do
			Result := blocks.at (a_x).at (a_y)
		end

	swap_blocks(a_x1, a_y1, a_x2, a_y2 : INTEGER)
		local
			l_block1:BLOCK
			l_block2:BLOCK
		do
			l_block1 := block_at((a_x1 // block_scale) + 1, (a_y1 // block_scale) + 1)
			l_block1.set_x (a_x2)
			l_block1.set_y (a_y2)
			l_block2 := block_at((a_x2 // block_scale) + 1, (a_y2 // block_scale) + 1)
			l_block2.set_x (a_x1)
			l_block2.set_y (a_y1)

			put_block_at((a_x2 // block_scale) + 1, (a_y2 // block_scale) + 1, l_block1)
			put_block_at((a_x1 // block_scale) + 1, (a_y1 // block_scale) + 1, l_block2)

		end

	swap_block_with_up(a_x, a_y : INTEGER)
		do
			swap_blocks(a_x, a_y, a_x, a_y - 10)
		end

	swap_block_with_down(a_x, a_y : INTEGER)
		do
			swap_blocks(a_x, a_y, a_x, a_y + block_scale)
		end

	swap_block_with_left(a_x, a_y : INTEGER)
		do
			swap_blocks(a_x, a_y, a_x - block_scale, a_y)
		end

	swap_block_with_right(a_x, a_y : INTEGER)
		do
			swap_blocks(a_x, a_y, a_x + block_scale, a_y)
		end



	put_block_at(a_x, a_y : INTEGER; a_block_to_put : BLOCK)
		do
			blocks.at (a_x).at (a_y) := a_block_to_put
		end

	block_factory:BLOCK_FACTORY

end
