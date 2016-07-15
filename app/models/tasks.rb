class Task

# This function is supposed to split the strings stored in the text fine to separate them into different elements so that each element can be used or returned as needed
	def Task.searchForName(filename)
		separatedTasks = Array.new
		file = File.open(filename, "r")
		file.each_line do |line|
			l = line.split("|")
			separatedTasks << l
		end
		# separatedTasks.map {|x| [x[0], x[1], x[2], x[3].chomp]}
		return separatedTasks
	end
#This funciton sorts the unfiltered list by family member
	def Task.searchForFamilyMember(filename, name)
		familyMemberTasks = Array.new
		Task.searchForName(filename).each do |element|
			if element[1] == name
				familyMemberTasks << element
			end
		end
		return familyMemberTasks
	end
#The below two functions sort the filtered-by-family list by incomplete and complete
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

#This section is a way to sort the overall, unfiltered list by completed and incomplete tasks!

	def Task.completedTasks(filename)
		completed = Array.new
		Task.searchForName(filename).each do |element|
			if element[0] == "c"
				completed << element
			end
		end
		return completed
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


# Finds the index of the nested array that contains num

# num is a number that each task is randomly assigned, you can see them on tasts.txt
# arr is an array of arrays. Each line in the tasks.txt represents one element of arr 
# and each element has 4 elements (one for complate/incomplete, name, task, random ID)

# returns a number that represents the index of the element that contains num

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

# Deletes a given line from tasks.txt

# num is a number that each task is randomly assigned, you can see them on tasts.txt
# filename is the txt file that stores all of our data (tasks.txt)

# Does not return anything

	def Task.deleteTask(num, filename)
		t = Task.searchForName(filename)
		ind = Task.findTask(num, t)
		t.delete_at(ind)
		i=0
		File.delete(filename)
		File.open(filename, "a") { |f|
			while i < t.length
				f.puts t[i].join("|")
				i += 1
			end
		}
	end

	def Task.editTask(num, filename)
		t= Task.searchForName(filename)
		
	end

# This is the end for the class	
end

