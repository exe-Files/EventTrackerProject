import { Component, OnInit } from '@angular/core';
import { Habit } from 'src/app/models/habit';
import { HabitsService } from 'src/app/services/habits.service';

@Component({
  selector: 'app-habit-list',
  templateUrl: './habit-list.component.html',
  styleUrls: ['./habit-list.component.css']
})
export class HabitListComponent implements OnInit {

  habits: Habit[] = [];

  constructor(
    private habitService: HabitsService
  ) { }

  ngOnInit(): void {
    this.loadHabits();
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

}
