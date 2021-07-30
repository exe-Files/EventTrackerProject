package com.skilldistillery.habits.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.habits.entities.Habit;
import com.skilldistillery.habits.services.HabitService;

@RestController
@RequestMapping("api")
public class HabitController {
	@Autowired
	private HabitService svc;
	
	@GetMapping("habits")
	public List<Habit> listHabits() {
		return svc.allHabits();
	}
	
}
