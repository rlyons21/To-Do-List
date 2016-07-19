MyApp.get "/" do

	@completedTasks = Task.completedTasks("tasks.txt")
	@incompleteTasks = Task.incompleteTasks("tasks.txt")
	erb :"home"

end

MyApp.get "/new" do
	erb :"new"
end


MyApp.post "/new/process" do
	binding.pry

	@sendJoeEmail = Task.sendTaskReminder("mhughes27@gmail.com", "Joe")
	@newtask = Task.createNewTask("tasks.txt", params[:person], params[:task], params[:email], rand(99999999))
	redirect '/'
end


MyApp.post "/edit" do
	@task = params[:task]
	@person = params[:person]
	@status = params[:status]

	Task.editTask(params[:num], "tasks.txt")
	erb :"edit"
end


MyApp.post "/edit/process" do
	Task.deleteTask(params[:num],"tasks.txt")
	@edittask = Task.editExistingTask("tasks.txt", params[:status], params[:person], params[:task], rand(99999999))
  	redirect '/'
end



MyApp.post '/delete' do
	Task.deleteTask(params[:num],"tasks.txt")
	redirect '/'
end
