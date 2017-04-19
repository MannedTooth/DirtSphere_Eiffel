note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	NEW_TEST_SET_008
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{BLOCK_ARRAY}.swap_blocks"
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

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent v_88.swap_blocks (v_111, v_112, v_113, v_114))
		end

end

