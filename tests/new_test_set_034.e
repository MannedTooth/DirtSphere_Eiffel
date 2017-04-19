note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	NEW_TEST_SET_034
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{BLOCK_FACTORY}.make"
		local
			v_1: detachable ANY
			v_9: INTEGER_32
			v_10: BLOCK_FACTORY
		do
			v_1 := Void
			v_9 := {INTEGER_32} 9

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent (a_arg1: INTEGER_32; a_arg2: NONE): BLOCK_FACTORY
				do
					create {BLOCK_FACTORY} Result.make (a_arg1, a_arg2)
				end (v_9, Void))
			check attached {BLOCK_FACTORY} last_object as l_ot1 then
				v_10 := l_ot1
			end
		end

end

