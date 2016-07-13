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
end
