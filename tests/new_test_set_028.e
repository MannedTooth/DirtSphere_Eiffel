note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	NEW_TEST_SET_028
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{BLOCK_ARRAY}.swap_block_with_down"
		local
			v_1: detachable ANY
			v_85: INTEGER_32
			v_86: INTEGER_32
			v_87: INTEGER_32
			v_88: BLOCK_ARRAY
			v_89: INTEGER_32
			v_90: INTEGER_32
			v_91: INTEGER_32
			v_92: INTEGER_32
			v_93: INTEGER_32
			v_94: INTEGER_32
			v_104: detachable ANY
			v_109: INTEGER_32
			v_110: INTEGER_32
			v_111: INTEGER_32
			v_112: INTEGER_32
			v_113: INTEGER_32
			v_114: INTEGER_32
			v_115: INTEGER_32
			v_116: INTEGER_32
			v_117: detachable ANY
			v_118: INTEGER_32
			v_119: INTEGER_32
			v_120: detachable ANY
			v_121: detachable ANY
			v_130: INTEGER_32
			v_131: INTEGER_32
			v_132: INTEGER_32
			v_146: INTEGER_32
			v_147: INTEGER_32
			v_148: detachable ANY
			v_153: INTEGER_32
			v_154: INTEGER_32
		do
			v_1 := Void
			v_85 := {INTEGER_32} 0
			v_86 := {INTEGER_32} -2
			v_87 := {INTEGER_32} -6
			execute_safe (agent (a_arg1: INTEGER_32; a_arg2: INTEGER_32; a_arg3: INTEGER_32; a_arg4: NONE): BLOCK_ARRAY
				do
					create {BLOCK_ARRAY} Result.make (a_arg1, a_arg2, a_arg3, a_arg4)
				end (v_85, v_86, v_87, Void))
			check attached {BLOCK_ARRAY} last_object as l_ot1 then
				v_88 := l_ot1
			end
			v_89 := {INTEGER_32} 8
			v_90 := {INTEGER_32} -4
			execute_safe (agent v_88.put_block_at (v_89, v_90, Void))
			execute_safe (agent v_88.set_blocks (Void))
			v_91 := {INTEGER_32} -6
			v_92 := {INTEGER_32} 0
			execute_safe (agent v_88.swap_block_with_up (v_91, v_92))
			v_93 := {INTEGER_32} 1
			v_94 := {INTEGER_32} 4
			execute_safe (agent v_88.swap_block_with_left (v_93, v_94))
			execute_safe (agent v_88.block_scale)
			v_104 := last_object
			v_109 := {INTEGER_32} 8
			v_110 := {INTEGER_32} -4
			execute_safe (agent v_88.swap_block_with_down_right (v_109, v_110))
			v_111 := {INTEGER_32} -1
			v_112 := {INTEGER_32} -4
			v_113 := {INTEGER_32} 6
			v_114 := {INTEGER_32} -4
			execute_safe (agent v_88.swap_blocks (v_111, v_112, v_113, v_114))
			v_115 := {INTEGER_32} 6
			v_116 := {INTEGER_32} 2
			execute_safe (agent v_88.is_valid_position (v_115, v_116))
			v_117 := last_object
			v_118 := {INTEGER_32} -4
			v_119 := {INTEGER_32} 2
			execute_safe (agent v_88.swap_block_with_down_left (v_118, v_119))
			execute_safe (agent v_88.blocks)
			v_120 := last_object
			execute_safe (agent v_88.block_factory)
			v_121 := last_object
			v_130 := {INTEGER_32} 8
			v_131 := {INTEGER_32} 1
			v_132 := {INTEGER_32} 6
			execute_safe (agent v_88.create_block_at (v_130, v_131, v_132))
			v_146 := {INTEGER_32} -6
			v_147 := {INTEGER_32} -1
			execute_safe (agent v_88.block_at (v_146, v_147))
			v_148 := last_object
			v_153 := {INTEGER_32} 3
			v_154 := {INTEGER_32} 7

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent v_88.swap_block_with_down (v_153, v_154))
		end

end

