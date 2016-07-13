class Task

# This function is supposed to split the strings stored in the text fine to separate them into different elements so that each element can be used or returned as needed
	def Task.searchForName
		separatedTasks = Array.new
		file = File.open("tasks.txt","r")
		file.each_line do |line|
			l = line.split("|")
			separatedTasks << l
		end

		return separatedTasks
	end
# For each family member that will be called with (name) the following functions split up the tasks into complete and incomplete and will print out those tasks.
	def Task.searchForFamilyMember(name)
		familyMemberTasks = Array.new
		Task.searchForName.each do |element|
			if element[1] == name
				familyMemberTasks << element
			end
		end
		return familyMemberTasks
	end

	def Task.familyMemberCompletedTasks(name)
		familyMemberComplete = Array.new
		Task.searchForFamilyMember(name).each do |element|
			if element[0] == "c"
				familyMemberComplete << element
			end
		end
		return familyMemberComplete
	end

	def Task.familyMemberIncompleteTasks(name)
		familyMemberIncomplete = Array.new
		Task.searchForFamilyMember(name).each do |element|
			if element[0] == "i"
				familyMemberIncomplete << element
			end
		end
		return familyMemberIncomplete
	end	

	def Task.familyMemberToDos(name)
		tasksToBeDone = Array.new
		Task.familyMemberIncompleteTasks(name) do |element|
			tasksToBeDone << element[2]
		end
		return tasksToBeDone
	end

	def Task.familyMemberDone(name)
		tasksDone = Array.new
		Task.familyMemberCompletedTasks(name).each do |element|
			tasksDone << element[2]
		end
		return tasksDone
	end
	
#This section is for sorting Tasks by complete and incomplete, and then functions for separating them for printing
	def Task.completedTasks
		completed = Array.new
		Task.searchForName.each do |element|
			if element[0] == "c"
				completed << element
			end
		end
		return completed
	end

	def Task.done
		taskstasks = Array.new
		Task.completedTasks.each do |element|
			taskstasks << element[2]
		end
		return taskstasks
	end

	def Task.incompleteTasks
		incompleteTasks = Array.new
		Task.searchForName.each do |element|
			if element[0] == "i"
				incompleteTasks << element
			end
		end
		return incompleteTasks
	end

	def Task.notDone
		taskstaskstasks = Array.new
		Task.incompleteTasks.each do |element|
			taskstaskstasks << element[2]
		end
		return taskstaskstasks
	end






	def Task.deleteTask(num)
		n = num.to_i 
		t = Task.searchForName
		t.delete_at(n)
		File.delete("tasks.txt")
		File.open("tasks.txt", "a")
		
		end
	end

# This is the end for the class	
end

