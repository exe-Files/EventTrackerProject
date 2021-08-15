export class Habit {

  id: number;
  name: string;
  description: string;
  category: string;
  active: boolean;
  accomplished: boolean
  recurring: string;
  frequency: string;
  notes: string;
  startDate: string;
  endDate: string;
  color: string;
  icon: string;

  constructor(
    id: number = 0,
    name: string = '',
    description: string = '',
    category: string = '',
    active: boolean = false,
    accomplished = false,
    recurring = '',
    frequency = '',
    notes = '',
    startDate = '',
    endDate = '',
    color = '',
    icon = ''
  ){
    this.id = id;
    this.name = name;
    this.description = description;
    this.category = category;
    this.active = active;
    this.accomplished = accomplished;
    this.recurring = recurring;
    this.frequency = frequency;
    this.notes = notes;
    this.startDate = startDate;
    this.endDate = endDate;
    this.color = color;
    this.icon = icon;
  }

}
