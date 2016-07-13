MyApp.get "/" do
	@variable = Task.searchForName
	erb :"home"

end

MyApp.get "/filtered" do
	erb :"filtered"
end

MyApp.get "/new" do
	erb :"new"
end

MyApp.get "/edit" do
	erb :"edit"
end