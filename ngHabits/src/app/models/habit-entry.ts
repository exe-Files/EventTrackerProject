export class HabitEntry {
  id: number;
  completed: boolean;
  dateCompleted:string;
  habitId:number;

  constructor(
    id: number = 0,
    completed: boolean = false,
    dateCompleted: string = '',
    habitId: number = 0
  ){
    this.id = id;
    this.completed = completed;
    this.dateCompleted = dateCompleted;
    this.habitId = habitId;
  }

}
