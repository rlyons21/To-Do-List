class New

	def New.newTask(task, person)
		@new_task = task
		@new_person = person

		somefile = File.open("tasks.txt", "a")
  		somefile.puts "i|#{@new.person}|#{@new.task}"
  		somefile.close
	end
end