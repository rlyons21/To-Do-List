require 'test_helper'

class TaskTest < Minitest::Test
    def setup
        super
        filename = "tasks_test.txt"
    end

	def test_separate_tasks_in_file
        results = Task.searchForName("#{MyApp.settings.root}/tests/unit/tasks_test.txt")
		assert_equal([["i", "Bob", "Scoop the cat litter", "98174236\n"], ["c", "Bob", "Mop the mud room floor", "38374236\n"], ["i", "Mary", "Clean the fish bowl", "28374416\n"], ["c", "Mary", "Change the AC filter", "28354455\n"], ["i", "Joe", "Sweep the porch", "68364455\n"], ["c", "Joe", "Make beds", "68364456\n"], ["i", "Lisa", "Vacuum the living room carpet", "68364459\n"], ["c", "Lisa", "Do the dishes", "98174836\n"]], results)
	end

    def test_separate_by_name
        results = Task.searchForFamilyMember("#{MyApp.settings.root}/tests/unit/tasks_test.txt", "Bob")
        assert_equal([["i", "Bob", "Scoop the cat litter", "98174236\n"], ["c", "Bob", "Mop the mud room floor", "38374236\n"]], results)
    end

    def test_family_member_completed_tasks
        results = Task.familyMemberCompletedTasks("#{MyApp.settings.root}/tests/unit/tasks_test.txt", "Bob")
        assert_equal([["c", "Bob", "Mop the mud room floor", "38374236\n"]], results)
    end

    def test_family_member_incomplete_tasks
        results = Task.familyMemberIncompleteTasks("#{MyApp.settings.root}/tests/unit/tasks_test.txt", "Bob")
        assert_equal([["i", "Bob", "Scoop the cat litter", "98174236\n"]], results)
    end

    def test_sort_by_completed_tasks
        results = Task.completedTasks("#{MyApp.settings.root}/tests/unit/tasks_test.txt")
        assert_equal([["c", "Bob", "Mop the mud room floor", "38374236\n"], ["c", "Mary", "Change the AC filter", "28354455\n"], ["c", "Joe", "Make beds", "68364456\n"], ["c", "Lisa", "Do the dishes", "98174836\n"]], results)
    end

    def test_sort_by_incomplete_tasks    
        results = Task.incompleteTasks("#{MyApp.settings.root}/tests/unit/tasks_test.txt")
        assert_equal([["i", "Bob", "Scoop the cat litter", "98174236\n"], ["i", "Mary", "Clean the fish bowl", "28374416\n"], ["i", "Joe", "Sweep the porch", "68364455\n"], ["i", "Lisa", "Vacuum the living room carpet", "68364459\n"]], results)
    end

    def test_find_a_task
        results = Task.findTask(10, [[1,2,3,4],[4,5,6,7],[7,8,9,10]])
        assert_equal(2, results)
    end

    def test_delete_a_task
        results = Task.deleteTask(98174836, "#{MyApp.settings.root}/tests/unit/tasks_test_delete.txt")
        assert_equal([["i", "Bob", "Scoop the cat litter", "98174236\n"], ["c", "Bob", "Mop the mud room floor", "38374236\n"], ["i", "Mary", "Clean the fish bowl", "28374416\n"], ["c", "Mary", "Change the AC filter", "28354455\n"], ["i", "Joe", "Sweep the porch", "68364455\n"], ["c", "Joe", "Make beds", "68364456\n"], ["i", "Lisa", "Vacuum the living room carpet", "68364459\n"]], results)
    end


end