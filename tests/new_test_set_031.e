note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	NEW_TEST_SET_031
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{BLOCK_ARRAY}.make"
		local
			v_1: detachable ANY
			v_5: INTEGER_32
			v_6: INTEGER_32
			v_7: INTEGER_32
			v_8: BLOCK_ARRAY
		do
			v_1 := Void
			v_5 := {INTEGER_32} 6
			v_6 := {INTEGER_32} -4
			v_7 := {INTEGER_32} 1

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: INTEGER_32; a_arg2: INTEGER_32; a_arg3: INTEGER_32; a_arg4: NONE): BLOCK_ARRAY
				do
					create {BLOCK_ARRAY} Result.make (a_arg1, a_arg2, a_arg3, a_arg4)
				end (v_5, v_6, v_7, Void))
			check attached {BLOCK_ARRAY} last_object as l_ot1 then
				v_8 := l_ot1
			end
		end

end

