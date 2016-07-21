window.addEventListener("load", function(){

	complete_button = document.getElementsByClassName("completeBtn");
	toDo_button = document.getElementsByClassName("toDoBtn");
	addTask_button = document.getElementsByClassName("addTask");
	cancelAddTask_button = document.getElementsByClassName("cancelButton");
	editTask_button = document.getElementsByClassName("");
	
	complete_button[0].addEventListener("click", function(){
		var task_list = document.getElementsByClassName("completeTask");
		
		if(task_list[0].style.display == "flex"){
			for(var i=0; i<task_list.length; i++){
					task_list[i].style.display = "none";
				}
		}else{ 
			for(var i=0; i<task_list.length; i++){
					task_list[i].style.display = "flex";
				}
		}
	});

	
	toDo_button[0].addEventListener("click", function(){
		var task_list = document.getElementsByClassName("task");
		
		if(task_list[0].style.display == "flex"){
			for(var i=0; i<task_list.length; i++){
					task_list[i].style.display = "none";
				}
		}else{ 
			for(var i=0; i<task_list.length; i++){
					task_list[i].style.display = "flex";
				}
		}
	});


	addTask_button[0].addEventListener("click", function(){
		var add_task = document.getElementsByClassName("modalBackground");

			add_task[0].style.display = "flex";
		});

	cancelAddTask_button[0].addEventListener("click", function(){
		var add_task = document.getElementsByClassName("modalBackground");
		add_task[0].style.display = "none";
	});

});