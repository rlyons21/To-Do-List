class Task

	def Task.searchForName
		file = File.open("tasks.txt","r")
		file.each_line do |line|
			line.split("|")
			puts line
		end
	end
end