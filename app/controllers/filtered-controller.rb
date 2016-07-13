MyApp.get "/filtered" do
	@theseAreNotDone = Task.familyMemberToDos(params[:user])
	@theseAreDone = Task.familyMemberDone(params[:user])

	erb :"filtered"
end
