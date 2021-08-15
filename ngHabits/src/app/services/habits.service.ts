import { DatePipe } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Habit } from '../models/habit';


@Injectable({
  providedIn: 'root'
})
export class HabitsService {

  baseUrl = 'http://localhost:8084/';
  url = this.baseUrl + 'api/habits';

  private habits: Habit[] = [];

  constructor(
    private http: HttpClient,
    private datePipe:DatePipe,
  ) { }

  index(): Observable<Habit[]>{
    return this.http.get<Habit[]>(this.url).pipe(
      catchError((err: any) => {
        console.error('HabitService.index(): error retrieving habit list');
        return throwError(err);
      })
    );
  }

  create(habit: Habit){
    // let options = this.getHttpOptions();
    habit.accomplished = false;
    return this.http.post<Habit>(this.url, habit ).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError('Error sending new Habit');

      })
    );
  }

  update(habit: Habit){
    // TODO : update database and java to have a completed counter
    // if(habit.accomplished === true){
    //   habit. = this.datePipe.transform(Date.now(), 'shortDate'); // 8/24/1999
    // }
    // else{
    //   todo.completeDate = '';
    // }
    return this.http.put<Habit>(this.url + '/' + habit.id, habit).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError('Error updating Habit of id: ' + habit.id);
      })
    )

  }

  destroy(id: number){
    return this.http.delete<Habit>(this.url + '/' + id).pipe(
      catchError((err: any) =>{
        console.log(err);
        return throwError('Error deleting Habit of id: ' + id);
      })
    )
  }

  // getHttpOptions() {
  //   const credentials = this.auth.getCredentials();
  //   const httpOptions = {
  //     headers: new HttpHeaders({
  //       'Content-Type': 'application/json',
  //       'X-Requested-With': 'XMLHttpRequest',
  //       'Authorization': `Basic ${credentials}`
  //     }),
  //   };
  //   return httpOptions;
  // }

}
