MyApp.get "/" do
	@completedTasks = Task.done
	@incompleteTasks = Task.notDone
	erb :"home"

end

MyApp.get "/new" do
	erb :"new"
end

MyApp.get "/edit" do
	erb :"edit"
end

MyApp.post '/delete' do
	Task.deleteTask()
	redirect '/'
	end