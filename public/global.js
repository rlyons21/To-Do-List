window.addEventListener("load", function(){
	var toDoToggle = document.getElementById("toDoTitleHome");

	toDoToggle.addEventListener("click", function(){
		var toDoTasks = document.getElementsByClassName("toDoTask");
		if(toDoTasks[0].style.display == "none"){
				for(var i=0; i<toDoTasks.length; i++){
					toDoTasks[i].style.display = "flex";}
				}
			else {for(var i=0; i<toDoTasks.length; i++){
					toDoTasks[i].style.display = "none";}

			}
	});

});