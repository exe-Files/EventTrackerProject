package com.skilldistillery.habits.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class HabitEntry {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private boolean completed;
	
	@Column(name = "date_completed")
	private LocalDateTime dateCompleted;
	
	@ManyToOne
	@JoinColumn(name="habit_id")
	private Habit habit;

	public HabitEntry() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	public LocalDateTime getDateCompleted() {
		return dateCompleted;
	}

	public void setDateCompleted(LocalDateTime dateCompleted) {
		this.dateCompleted = dateCompleted;
	}

	public Habit getHabit() {
		return habit;
	}

	public void setHabit(Habit habit) {
		this.habit = habit;
	}

	@Override
	public String toString() {
		return "HabitEntry [id=" + id + ", completed=" + completed + ", dateCompleted=" + dateCompleted + ", habit="
				+ habit + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (completed ? 1231 : 1237);
		result = prime * result + ((dateCompleted == null) ? 0 : dateCompleted.hashCode());
		result = prime * result + ((habit == null) ? 0 : habit.hashCode());
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HabitEntry other = (HabitEntry) obj;
		if (completed != other.completed)
			return false;
		if (dateCompleted == null) {
			if (other.dateCompleted != null)
				return false;
		} else if (!dateCompleted.equals(other.dateCompleted))
			return false;
		if (habit == null) {
			if (other.habit != null)
				return false;
		} else if (!habit.equals(other.habit))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
	
}
