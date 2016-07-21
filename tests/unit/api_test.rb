require 'test_helper'

class APITest < Minitest::Test
    def setup
        super
        @filename = "tasks_test.txt"
    end

    def test_convertToHash
        results = Task.convertToHash("#{MyApp.settings.root}/tests/unit/tasks_test.txt")

        expected = {
        }

        assert_equal(expected, results)
    end
end