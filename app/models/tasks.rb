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

	def Task.searchForBob
		bobTasks = Array.new
		Task.searchForName.each do |element|
			if element[1] == "Bob"
				bobTasks << element
			end
		end
		return bobTasks
	end

	def Task.bobCompletedTasks
		bobComplete = Array.new
		Task.searchForBob.each do |element|
			if element[0] == "c"
				bobComplete << element
			end
		end
		return bobComplete
	end

	def Task.bobIncompleteTasks
		bobIncomplete = Array.new
		Task.searchForBob.each do |element|
			if element[0] == "i"
				bobIncomplete << element
			end
		end
		return bobIncomplete
	end	

	def Task.bobsToDos
		tasksToBeDone = Array.new
		Task.bobIncompleteTasks.each do |element|
			tasksToBeDone << element[2]
		end
		return tasksToBeDone
	end

# This is the end for the class	
end

