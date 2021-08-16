package com.skilldistillery.habits.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.habits.entities.HabitEntry;

public interface HabitEntryRepository extends JpaRepository<HabitEntry, Integer> {
	
	List<HabitEntry> findByHabit_Name(String habitName);
	
	HabitEntry findByHabit_NameAndId(String habitName);
	
	HabitEntry findByIdAndHabit_Name(int hid, String name);

}
