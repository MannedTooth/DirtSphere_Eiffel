note
	description: "Generated tests created by AutoTest."
	author: "Testing tool"

class
	NEW_TEST_SET_032
	
inherit
	EQA_GENERATED_TEST_SET

feature -- Test routines

	generated_test_1
		note
			testing: "type/generated"
			testing: "covers/{UPDATER}.launch_with_attributes"
		local
			v_1: detachable ANY
			v_13: UPDATER
		do
			v_1 := Void
			execute_safe (agent (a_arg1: NONE): UPDATER
				do
					create {UPDATER} Result.make (a_arg1)
				end (Void))
			check attached {UPDATER} last_object as l_ot1 then
				v_13 := l_ot1
			end

				-- Final routine call
			set_is_recovery_enabled (False)
			execute_safe (agent v_13.launch_with_attributes (Void))
		end

end

