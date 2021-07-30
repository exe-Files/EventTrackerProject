package com.skilldistillery.habits.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.habits.entities.Habit;

public interface HabitRepository extends JpaRepository<Habit, Integer> {

}
