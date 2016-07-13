MyApp.get "/" do
	@completedTasks = Task.done
	@incompleteTasks = Task.notDone
	erb :"home"

end

MyApp.get "/new" do
	erb :"new"
end


MyApp.post "/new/process" do
	@new_task = params[:task]
	@new_person = params[:person]

	# TODO - Move the complexity about adding things to a 
	# file into a separate function that's defined in
	# a model.

	somefile = File.open("tasks.txt", "a")
	somefile.puts "i|#{@new_person}|#{@new_task}"
	somefile.close
  redirect '/'
end



MyApp.get "/edit" do
	erb :"edit"
end

MyApp.post '/delete' do
	Task.deleteTask()
	redirect '/'
	end