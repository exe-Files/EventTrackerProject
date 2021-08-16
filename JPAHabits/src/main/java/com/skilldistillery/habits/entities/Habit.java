package com.skilldistillery.habits.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Habit {
	// Fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	private String category;

	private Boolean active;

	private Boolean accomplished;

	private String recurring;

	private String frequency;

	private String notes;

	@Column(name = "start_date")
	@CreationTimestamp
	private LocalDateTime startDate;

	@Column(name = "end_date")
	private LocalDateTime endDate;

	private String color;

	private String icon;
	
	@JsonIgnore //ignores
	@OneToMany(mappedBy="habit") //mapped by the field in HabitEntry entity
	private List<HabitEntry> habitEntries;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	

	// Constructors

	public Habit() {
		super();
	}

	// Methods

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Boolean getAccomplished() {
		return accomplished;
	}

	public void setAccomplished(Boolean accomplished) {
		this.accomplished = accomplished;
	}


	public String getRecurring() {
		return recurring;
	}

	public void setRecurring(String recurring) {
		this.recurring = recurring;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public LocalDateTime getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}

	public LocalDateTime getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDateTime endDate) {
		this.endDate = endDate;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	

	public List<HabitEntry> getHabitEntries() {
		return habitEntries;
	}

	public void setHabitEntries(List<HabitEntry> habitEntries) {
		this.habitEntries = habitEntries;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Habit [id=" + id + ", name=" + name + ", description=" + description + ", category=" + category
				+ ", active=" + active + ", accomplished=" + accomplished + ", recurring=" + recurring + ", frequency="
				+ frequency + ", notes=" + notes + ", startDate=" + startDate + ", endDate=" + endDate + ", color="
				+ color + ", icon=" + icon + ", habitEntries=" + habitEntries + ", user=" + user + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		Habit other = (Habit) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
