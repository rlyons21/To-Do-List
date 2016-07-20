window.addEventListener("load", function(){
	button = document.getElementsByClassName("completeBtnHome");

	button[0].addEventListener("click", function(){
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

});