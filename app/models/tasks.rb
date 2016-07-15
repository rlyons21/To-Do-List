class Task

# This function is supposed to split the strings stored in the text fine to separate them into different elements so that each element can be used or returned as needed
	def Task.searchForName(filename)
		separatedTasks = Array.new
		file = File.open(filename, "r")
		file.each_line do |line|
			l = line.split("|")
			separatedTasks << l
		end

		return separatedTasks
	end
# For each family member that will be called with (name) the following functions split up the tasks into complete and incomplete and will print out those tasks.
	def Task.searchForFamilyMember(filename, name)
		familyMemberTasks = Array.new
		Task.searchForName(filename).each do |element|
			if element[1] == name
				familyMemberTasks << element
			end
		end
		return familyMemberTasks
	end

	def Task.familyMemberCompletedTasks(filename, name)
		familyMemberComplete = Array.new
		Task.searchForFamilyMember(filename, name).each do |element|
			if element[0] == "c"
				familyMemberComplete << element
			end
		end
		return familyMemberComplete
	end

	def Task.familyMemberIncompleteTasks(filename, name)
		familyMemberIncomplete = Array.new
		Task.searchForFamilyMember(filename, name).each do |element|
			if element[0] == "i"
				familyMemberIncomplete << element
			end
		end
		return familyMemberIncomplete
	end	

	def Task.familyMemberToDos(filename, name)
		tasksToBeDone = Array.new
		Task.familyMemberIncompleteTasks(filename, name).each do |element|
			tasksToBeDone << element
		end
		return tasksToBeDone
	end

	def Task.familyMemberDone(filename, name)
		tasksDone = Array.new
		Task.familyMemberCompletedTasks(filename, name).each do |element|
			tasksDone << element
		end
		return tasksDone
	end
	
#This section is for sorting Tasks by complete and incomplete, and then functions for separating them for printing
	def Task.completedTasks(filename)
		completed = Array.new
		Task.searchForName(filename).each do |element|
			if element[0] == "c"
				completed << element
			end
		end
		return completed
	end

	def Task.done(filename)
		completedFamilyTasks = Array.new
		Task.completedTasks(filename).each do |element|
			completedFamilyTasks << element
		end
		return completedFamilyTasks
	end

	def Task.incompleteTasks(filename)
		incompleteTasks = Array.new
		Task.searchForName(filename).each do |element|
			if element[0] == "i"
				incompleteTasks << element
			end
		end
		return incompleteTasks
	end

	def Task.notDone(filename)
		notDoneFamilyTasks = Array.new
		Task.incompleteTasks(filename).each do |element|
			notDoneFamilyTasks << element
		end
		return notDoneFamilyTasks
	end



	def Task.findTask(num, arr)
		numIndex = 0
		arr.each do |element|
			if element[3].to_i == num.to_i
				return numIndex
			else
				numIndex += 1
			end
		end
		
	end

	def Task.deleteTask(num, filename)
		t = Task.searchForName(filename)
		ind = Task.findTask(num, t)
		t.delete_at(ind)
		i=0
		File.delete("tasks.txt")
		File.open("tasks.txt", "a") { |f|
			while i < t.length
				f.puts t[i].join("|")
				i += 1
			end
		}
	end

	def Task.editTask(num, filename)
		t= Task.searchForName(filename)
		ind = Task.findTask(num, t)
	end


# This is the end for the class	
end

