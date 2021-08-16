import { Component, OnInit } from '@angular/core';
import { Habit } from 'src/app/models/habit';
import { HabitEntry } from 'src/app/models/habit-entry';
import { HabitsService } from 'src/app/services/habits.service';

@Component({
  selector: 'app-habit-list',
  templateUrl: './habit-list.component.html',
  styleUrls: ['./habit-list.component.css']
})
export class HabitListComponent implements OnInit {

  habits: Habit[] = [];
  newHabit = new Habit();
  newHabitEntry = new HabitEntry();
  editHabit: Habit | null = null;
  title = 'Habit Tracker';
  selected: Habit | null = null;
  todayDate = new Date(Date.now());
  // new Date(Date.now() - 7 * 24 * 60 * 60 * 1000)  // Tue Feb 04 2020 13:50:37 GMT...
  // date = new Date();
  currentWeek: Date[] = [];

  constructor(
    private habitService: HabitsService
  ) { }

  ngOnInit(): void {
    this.loadHabits(); //when the component loads, this will populate the habits array
    this.loadDates();
  }

  // getTodoCount() : Number {
  //   return this.incompletePipe.transform(this.todos).length;
  // }

  loadDates(){
  for (let i = 0; i < 5; i++) {
      var date = new Date();
      date.setDate(this.todayDate.getDate() - i);
      console.log(date);
      // this.currentWeek.push(this.date);
      this.currentWeek.unshift(date);
      console.log(this.currentWeek);
    }
    return this.currentWeek;
  }

  loadHabits(){
    this.habitService.index().subscribe(
      habits => {
        this.habits = habits;
      },
      noHabits => {
        console.error('HabitListComponent.loadHabits(): error retrieving habit list');
        console.error(noHabits);
      }
    )
  }

  loadStreaks(){
  // startDate: string = "2021-08-14";
  // date1: Date = new Date();
  // date2: Date = new Date(this.startDate);
  // timeInMilisec: number = this.date1.getTime() - this.date2.getTime();
  // daysBetweenDates: number = Math.ceil(this.timeInMilisec / (1000 * 60 * 60 * 24));
  }


  displayHabit(habit: Habit){
    this.selected = habit;
  }

  displayTable(): void {
    this.selected = null;
  }

  reloadHabits() {
    this.habitService.index().subscribe(
      data => {
        this.habits = data;
      },
      err => {
        console.log("Error retreiving habits from service");
      }
    );
  }

  getHabitCount() : Number{
    return this.habits.length;
  }

  addHabit() : void{
    this.habitService.create(this.newHabit).subscribe(
      data => {
        this.reloadHabits();
      },
      error => {
        console.log(error);
        console.log("Error creating habit through service.");
      }
    );
    this.newHabit = new Habit();
    // this.todos = this.todoService.index();
  }

  deleteHabit(id: number) {
    this.habitService.destroy(id).subscribe(
      data => {
        this.reloadHabits();
      },
      error => {
        console.log(error);
        console.log("error deleting habit through service")
      }
    );
  }

  setEditTodo() : void {
    this.editHabit = Object.assign({}, this.selected);
  }

  updateHabit(habit: Habit){
    this.habitService.update(habit).subscribe(
      data => {
        this.reloadHabits();
      },
      error => {
        console.log(error);
        console.log("error updating habit through service")
      }
    );
    this.editHabit = null;
    this.selected = null;
  }
  updateHabitEntry(habit: Habit, weekday: Date){
    this.habitService.update(habit).subscribe(
      data => {
        this.reloadHabits();
      },
      error => {
        console.log(error);
        console.log("error updating habit through service")
      }
    );
    this.editHabit = null;
    this.selected = null;
  }

  getWarningLevel() {
    let warningLevel = this.getHabitCount();
    if(warningLevel >= 10) {
      return "badge bg-danger";
    } else if(warningLevel >= 5) {
      return "badge bg-warning";
    } else {
      return "badge bg-success";
    }
  }

}
