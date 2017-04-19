note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	NEW_TEST_SET_015
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{BLOCK_ARRAY}.create_block_at"
		local
			v_1: detachable ANY
			v_177: INTEGER_32
			v_178: INTEGER_32
			v_179: INTEGER_32
			v_180: BLOCK_ARRAY
			v_181: INTEGER_32
			v_182: INTEGER_32
			v_183: INTEGER_32
			v_184: INTEGER_32
			v_208: INTEGER_32
			v_209: INTEGER_32
			v_210: INTEGER_32
		do
			v_1 := Void
			v_177 := {INTEGER_32} 0
			v_178 := {INTEGER_32} 8
			v_179 := {INTEGER_32} 8
			execute_safe (agent (a_arg1: INTEGER_32; a_arg2: INTEGER_32; a_arg3: INTEGER_32; a_arg4: NONE): BLOCK_ARRAY
				do
					create {BLOCK_ARRAY} Result.make (a_arg1, a_arg2, a_arg3, a_arg4)
				end (v_177, v_178, v_179, Void))
			check attached {BLOCK_ARRAY} last_object as l_ot1 then
				v_180 := l_ot1
			end
			v_181 := {INTEGER_32} -2
			v_182 := {INTEGER_32} 6
			execute_safe (agent v_180.swap_block_with_right (v_181, v_182))
			v_183 := {INTEGER_32} 2
			v_184 := {INTEGER_32} 0
			execute_safe (agent v_180.swap_block_with_down_left (v_183, v_184))
			v_208 := {INTEGER_32} -6
			v_209 := {INTEGER_32} -1
			v_210 := {INTEGER_32} -5

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent v_180.create_block_at (v_208, v_209, v_210))
		end

end

