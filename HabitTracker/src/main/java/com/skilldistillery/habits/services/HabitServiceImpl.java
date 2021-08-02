package com.skilldistillery.habits.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.habits.entities.Habit;
import com.skilldistillery.habits.repositories.HabitRepository;

@Service
public class HabitServiceImpl implements HabitService {

	@Autowired
	private HabitRepository repo;
	
	@Override
	public List<Habit> allHabits() {
		return repo.findAll();
	}

	@Override
	public Habit showHabit(Integer habitId) {
		Optional<Habit> h = repo.findById(habitId); 
		if(h.isPresent()) {
			return h.get();
		}
		return null;
	}

	@Override
	public Habit createHabit(Habit habit) {
		return repo.saveAndFlush(habit);
	}
	
	@Override
	public Habit updateHabit(Habit habit) {
		return repo.saveAndFlush(habit);
		
	}
	
	@Override
	public boolean delete(int habitId) {
		repo.deleteById(habitId);
		return !repo.existsById(habitId);
	}

}
