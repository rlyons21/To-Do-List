MyApp.get "/filtered" do
	@theseAreNotDone = Task.familyMemberIncompleteTasks("tasks.txt", params[:user])
	@theseAreDone = Task.familyMemberCompletedTasks("tasks.txt", params[:user])

	erb :"filtered"
end


