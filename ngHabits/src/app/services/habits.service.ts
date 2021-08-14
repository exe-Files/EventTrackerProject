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

  constructor(
    private http: HttpClient
  ) { }

  index(): Observable<Habit[]>{
    return this.http.get<Habit[]>(this.url).pipe(
      catchError((err: any) => {
        console.error('HabitService.index(): error retrieving habit list');
        return throwError(err);
      })
    );
  }



}
