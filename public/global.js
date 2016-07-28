window.addEventListener("load", function(){

	var complete_button = document.getElementsByClassName("completeBtn");
	var toDo_button = document.getElementsByClassName("toDoBtn");
	var addTask_button = document.getElementsByClassName("addTask");
	var cancel_button = document.getElementsByClassName("cancelButton");
	var addTaskCancel_button = document.getElementsByClassName("ATcancelButton");
	var editTask_button = document.getElementsByClassName("edit");
	var delete_btn = document.getElementsByClassName("delete");

	



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
		var add_task = document.getElementsByClassName("ATmodalBackground");

			add_task[0].style.display = "flex";
		});


	for(i=0; i < cancel_button.length; i++){
		cancel_button[i].addEventListener("click", function(){
			var edit_task = document.getElementsByClassName("ETmodalBackground");
			for(i=0; i < edit_task.length; i++){
				edit_task[i].style.display = "none";
			}
		});
	}


	addTaskCancel_button[0].addEventListener("click", function(){
		var add_task = document.getElementsByClassName("ATmodalBackground");
		add_task[0].style.display = "none";
	});
	



	for(i=0; i < editTask_button.length; i++){
		editTask_button[i].addEventListener("click", function(){
			
			var task_id = this.getAttribute("id");
			var edit_task = document.getElementById("modal" + task_id);
			
			edit_task.style.display = "flex";

		});
		
	}

	for(i=0; i < delete_btn.length; i++){
		delete_btn[i].addEventListener("click", function(form){
			form.preventDefault();
			var id = this.getAttribute("id");
			var delete_me = document.getElementById("delete" + id);
			delete_me.style.display = "none";


			var delete_task = new XMLHttpRequest();

			delete_task.addEventListener("load", function(){
				alert("You have just deleted a task");

			});

			delete_task.open("get", "/delete?num=" + id);
			delete_task.send();
		});
	}

	debugger;
});