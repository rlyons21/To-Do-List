MyApp.get "/" do

	@completedTasks = Task.completedTasks("tasks.txt")
	@incompleteTasks = Task.incompleteTasks("tasks.txt")
	erb :"home"

end

MyApp.get "/new" do
	erb :"new"
end


MyApp.post "/new/process" do
	@new_task = params[:task]
	@new_person = params[:person]
	@randomnumber = rand(99999999)

	# TODO - Move the complexity about adding things to a 
	# file into a separate function that's defined in
	# a model.

	somefile = File.open("tasks.txt", "a")
	somefile.puts "i|#{@new_person}|#{@new_task}|#{@randomnumber}"
	somefile.close
  redirect '/'
end



MyApp.post "/edit" do
	# TODO - Define '@task' as a Hash containing the actual task's info.
	# Get the actual task based on params[:num].
	@task = params[:task]
	@person = params[:person]
	@status = params[:status]
	# @task = {"description" => "Edit Task"}

	Task.editTask(params[:num], "tasks.txt")
	erb :"edit"
end


MyApp.post "/edit/process" do
	Task.deleteTask(params[:num],"tasks.txt")

	@edit_status = params[:status]
	@edit_task = params[:task]
	@edit_person = params[:person]
	@randomnumber = rand(99999999)

	# TODO - Move the complexity about adding things to a 
	# file into a separate function that's defined in
	# a model.

	somefile = File.open("tasks.txt", "a")
	somefile.puts "#{@edit_status}|#{@edit_person}|#{@edit_task}|#{@randomnumber}"
	somefile.close
  redirect '/'
end



MyApp.post '/delete' do
	Task.deleteTask(params[:num],"tasks.txt")
	redirect '/'
end
