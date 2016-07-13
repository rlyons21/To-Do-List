require 'test_helper'

class TaskTest < Minitest::Test

	def test_separate_tasks_in_file
    # Setup:
    # Access a new/different flat storage.
    # It's empty to begin with.
    # Now add two rows that we define here.

    # Exercise
    results = Task.searchForName

    # Verify

		assert_equal(["Bob|4|Make Paint"], results)

	end


end