require 'test_helper'

class TaskTest < Minitest::Test

    def setup
        super
        filename = "/tests/unit/tasks_test.txt"
    end

	def test_separate_tasks_in_file
    # Setup:
    # Access a new/different flat storage.
    # It's empty to begin with.
    # Now add two rows that we define here.

    # Exercise
        results = Task.searchForName("/tests/unit/tasks_test.txt")

    # Verify

		assert_equal([["c","Mary","Vacuum the living room carpet"], ["i","Bob","Mop the basement"]], results)

	end


end