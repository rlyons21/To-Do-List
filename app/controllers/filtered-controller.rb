MyApp.get "/filtered" do
	@theseAreNotDone = Task.familyMemberToDos("tasks.txt", params[:user])
	@theseAreDone = Task.familyMemberDone("tasks.txt", params[:user])

	erb :"filtered"
end


