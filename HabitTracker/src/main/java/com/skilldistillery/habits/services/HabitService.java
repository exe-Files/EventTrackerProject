package com.skilldistillery.habits.services;

import java.util.List;

import com.skilldistillery.habits.entities.Habit;

public interface HabitService {
	
	List<Habit> allHabits();

	Habit showHabit(Integer habitId);

	Habit createHabit(Habit habit);

	Habit updateHabit(Habit habit);

	boolean delete(int habitId);

	
	

}
