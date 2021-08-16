package com.skilldistillery.habits.services;

import java.util.List;

import com.skilldistillery.habits.entities.Habit;

public interface HabitEntryService {

	List<Habit> allHabitEntries();

	Habit showHabitEntry(Integer habitEntryId);

	Habit createHabitEntry(Habit habitEntry);

	Habit updateHabitEntry(Habit habitEntry);

	boolean deleteHabitEntry(int habitEntryId);

	
	
	
}
