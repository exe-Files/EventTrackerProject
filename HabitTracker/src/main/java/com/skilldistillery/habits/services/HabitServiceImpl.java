package com.skilldistillery.habits.services;

import java.util.List;
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

}
