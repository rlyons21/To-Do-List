MyApp.get "/new" do
  New.newTask(params[:task], params[:person])
  binding.pry
  erb :"home"
end
