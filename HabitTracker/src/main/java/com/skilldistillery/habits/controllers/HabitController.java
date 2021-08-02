package com.skilldistillery.habits.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		// TODO add HTML response codes
		return svc.allHabits();
	}

	@GetMapping("habits/{habitId}")
	public Habit showHabit(
			@PathVariable Integer habitId,
			HttpServletRequest req,
			HttpServletResponse res
		) {
		Habit habit = svc.showHabit(habitId);
		if (habit == null) {
			res.setStatus(404);
		}
		return habit;

	}

	@PostMapping("habits")
	public Habit createHabit(
			@RequestBody Habit habit,
			HttpServletRequest req,
			HttpServletResponse res
			) {
		try {
			svc.createHabit(habit);
			res.setStatus(201);
			StringBuffer url = req.getRequestURL();
			url.append("/").append(habit.getId());
			res.setHeader("Location", url.toString());
		} catch (Exception e) {
			res.setStatus(400); // Bad request
			habit = null;
		}
		return habit;
	}

	@PutMapping("habits/{habitId}")
	public Habit updateHabit(
			@RequestBody Habit habit,
			@PathVariable Integer habitId,
			HttpServletResponse res
		) {
		try {
			habit = svc.updateHabit(habit);
			if (habit == null) {
				res.setStatus(404);
			} 
		} catch (Exception e) {
			res.setStatus(400);
			habit = null;
		}
		return habit;
	}

	@DeleteMapping("habits/{habitId}")
	public boolean deleteFilm(
			@PathVariable Integer habitId,
			HttpServletResponse res
			) {
		// TODO add HTML response codes
//		return svc.delete(habitId);
		try {
			boolean deleted = svc.delete(habitId);
			if (deleted) {
				res.setStatus(204);
				return deleted;
			} else {
				res.setStatus(404);
			}
		} catch (Exception e) {
			res.setStatus(400);
		}
		return false;
	}

}
