export class Habit {

  id: number;
  name: string;
// TODO other habit properties

  constructor(
    id: number = 0,
    name: string = ''
  ){
    this.id = id;
    this.name = name;
  }

}
