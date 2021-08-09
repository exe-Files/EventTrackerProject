window.addEventListener('load', function(e){
	console.log('script.js loaded');
	init();
});

function init(){
	loadHabits();
	document.newHabitForm.addHabit.addEventListener('click', function(e){
		e.preventDefault(); //prevents default of page refreshing
		let habitForm = document.newHabitForm;
		let newHabit = {
			name: habitForm.name.value,
			description: habitForm.description.value, 
			category: habitForm.category.value, 
			color: habitForm.color.value,
			icon: habitForm.icon.value,
			startDate: habitForm.startDate.value,
			endDate: habitForm.endDate.value		
		};
		createHabit(newHabit);
	});
}

function createHabit(habit){
	let xhr = new XMLHttpRequest();
	xhr.open('POST', 'api/habits'); 
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if (xhr.status === 201 || xhr.status === 200){
				//let newHabit = JSON.parse(xhr.responseText);
				loadHabits();
			}
			else {
				displayError('Error creating habit: ' + xhr.status);
			}
		}
	};
	xhr.setRequestHeader('Content-type', "application/json");
	let habitJson = JSON.stringify(habit);
	xhr.send(habitJson);
}

function loadHabits(){
	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/habits');
	xhr.onreadystatechange = function(){
		if (xhr.readyState === 4) {
			if(xhr.status === 200){
				let habits = JSON.parse(xhr.responseText);
				displayHabits(habits);
			}
		}
	};
	xhr.send();
}

function displayHabits(habits) {
	let table = document.getElementById('habitListTable');
	table.textContent = ''; // Clears the table content if already populated
	for (const habit of habits) {
		let tr = document.createElement('tr');
		let td = document.createElement('td');
		console.log(habit);
		td.textContent = habit.name;
		// for(let h in habit){
		// 	console.log(habit[h]);
		// }
		td.setAttribute('value', habit.id);
		td.addEventListener('click', function(e){
			e.preventDefault();
			habitDetails(habit);
		});
		tr.appendChild(td);
		console.log(tr.textContent);
		table.appendChild(tr);
		
	}
}

function habitDetails(habit){
	let table = document.getElementById('habitDetailsTable');
	table.textContent = ''; 
	let form = document.getElementById('editHabitForm');
	form.textContent = ''; //Clears form of previous values
	for(let h in habit){ // Individual Habit details
		let tr = document.createElement('tr');
		let td = document.createElement('td');
		console.log(h + ": " + habit[h]);
		td.textContent = h + ": " + habit[h];
		tr.appendChild(td);
		console.log(tr.textContent);
		table.appendChild(tr);
	}
	let tr = document.createElement('tr');
	let editBtn = document.createElement('button'); // Edit Button
	editBtn.name = 'edit';
	editBtn.textContent = "Edit";
	tr.appendChild(editBtn);
	editBtn.addEventListener('click', function(e){
		e.preventDefault();
		// Fill Edit Form , send xhr request
		table.textContent= '';
		editHabitForm(habit);
		 
	});
	let delBtn = document.createElement('button'); // Delete Button
	delBtn.name = 'delete';
	delBtn.textContent = "Delete";
	tr.appendChild(delBtn);
	delBtn.addEventListener('click', function(e){
		e.preventDefault();
		deleteHabit(habit.id); // send xhr delete request
		table.textContent = '';
	});
	table.appendChild(tr);
	
}



function editHabitForm(habit){
	let editForm = document.getElementById('editHabitForm');
	editForm.textContent = ''; //Clears form of previous values
	for(let h in habit){ // Individual habit details
		let label = document.createElement('label');
		label.for = h;
		label.textContent = h;
		let formField = document.createElement('input');
		formField.name = h;
		formField.id = h;
		formField.value = habit[h];
		//TODO add attribute for inputs
		editForm.appendChild(label);
		editForm.appendChild(formField);
		lineBreak = document.createElement("br");
		editForm.appendChild(lineBreak);
	}
	let submitEdits = document.createElement('input');
	submitEdits.type = 'submit';
	submitEdits.name = 'submitChanges';
	submitEdits.value = 'Submit Changes';
	submitEdits.addEventListener('click', function(e){
		e.preventDefault();
		let editHabitForm = document.editForm;
		let habitEdits = {
			id: editForm.id.value,
			name: editForm.name.value,
			description: editForm.description.value, 
			category: editForm.category.value, 
			color: editForm.color.value
		};
		editHabit(habitEdits);
		editForm.textContent= ''; //clears form
	});
	editForm.appendChild(submitEdits);
}


function editHabit(habit){
	let xhr = new XMLHttpRequest();
	xhr.open('PUT', 'api/habits/' + habit.id);
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if(xhr.status === 201 || xhr.status === 200){
				//let newHabit = JSON.parse(xhr.responseText);
				loadHabits();
			}
			else {
				displayError('Error creating habit: ' + xhr.status);
			}
		}
	};
	xhr.setRequestHeader('Content-type', "application/json");
	let habitJson = JSON.stringify(habit);
	xhr.send(habitJson);
}
 
function deleteHabit(habitId){
	let xhr = new XMLHttpRequest();
	xhr.open('DELETE', 'api/habits/' + habitId); 
	xhr.onreadystatechange = function(){
		if(xhr.readyState === 4){
			if (xhr.status === 204 || xhr.status === 200){
				//let newHabit = JSON.parse(xhr.responseText);
				loadHabits();
			}
			else {
				displayError('Error deleting habit: ' + xhr.status);
			}
		}
	};
	xhr.send(null);
}



function displayError(msg) {
	var habitTab = document.getElementById('habitDetailsTable');
	habitTab.textContent = msg;
}

