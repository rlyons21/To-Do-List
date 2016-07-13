MyApp.get "/" do
	@variable = Task.searchForName
	erb :"home"

end