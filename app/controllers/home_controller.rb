MyApp.get "/" do
	@completedTasks = Task.done
	@incompleteTasks = Task.notDone
	erb :"home"

end

MyApp.get "/filtered" do
	erb :"filtered"
end

MyApp.get "/new" do
	erb :"new"
end


MyApp.post "/new/process" do
	@new_task = params[:task]
	@new_person = params[:person]

	somefile = File.open("tasks.txt", "a")
	somefile.puts "i|#{@new_person}|#{@new_task}"
	somefile.close
    erb :"process"
    redirect '/'
end



MyApp.get "/edit" do
	erb :"edit"
end

MyApp.post '/delete' do
		Task.deleteTask(params[:num])
		redirect '/'
	end