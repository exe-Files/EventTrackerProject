# EventTrackerProject

## Full-Stack Spring/REST/JPA Project for Skill Distillery


## Overview
To wrap up our material on JPA/REST/Angular, each of us were tasked with creating a full stack java web application that would keep track of information over time. For my project, I decided to go with a simple habit-tracker that allows a user to create and update different habits they would like to accomplish throughout the day. Originally, the website only worked through REST endpoints, listed in the table below. That's no longer the case, and now the user can interact with the site through the browser because of the angular frontend. By linking the website to the Java backend and MySql database, the user is able to dynamically update their list in realtime as the user accomplishes their daily goals.

![DB Schema](https://user-images.githubusercontent.com/23006320/127801588-96f3dd68-f7f8-4ae7-92d8-5b1a6984be16.png)

The original table was smaller and only kept track of the individual habits. While working on the project this weekend, I included two more tables to keep track of user accounts, and another to keep track of entries as seen below. In the future, I will most likely need to implement another that can keep track of frequency and reccurrence of certain habits, so that the user can better keep track of what is due for them that day. 

![DB Schema Updated](https://user-images.githubusercontent.com/23006320/129566691-e9144f63-948e-47dc-a482-ba7564caa49c.png)


## REST Endpoints
<!-- markdown tables -->
| Method   | HTTP Verb | URI               | Request Body | Response Body |
|----------|-----------|-------------------|--------------|---------------|
| Read     | GET       | `/api/habits`     |              | Collection of representations of all _habit_ resources |
| Read     | GET       | `/api/habits/1`   |              | Representation of _habit_ `1` |
| Create   | POST      | `/api/habits`     | Representation of a new _habit_ resource | Description of the result operation |
| Update   | PUT       | `/api/habits/1`   | Representation of a new version of _habit_ `1` | Description of the result operation |
| Delete   | DELETE    | `/api/habits/1`   |              | |


### Lessons Learned
Right now, the site is functional with full CRUD cability, but there's a lot of features missing that I would like to implement. I'm working towards having the user be able to mark off each day, which would create a separate entry in their database. By aggregating these entries by dates, the user could then see streaks and trends of their accomplishments throughout the month and year on a calendar heatmap or graph. I also want to update the edit and details view to have more options available including a color picker and a way to set how often certain habits should be done to not break a streak. Finally, I would like to implement Spring Security so that users can have their own accounts and use their lists without any overlap as well as . 

This has been one of the more difficult projects because of the amount of moving parts involved in order to get everythiing working together. Angular is still pretty fresh material, so understanding why and how things work was key to getting each section talking with eachother. There's still a lot of material that I would like to review to make sure I have a solid understanding, but overall I really enjoyed this project, and I would like to come back to add these extra features when I get the chance. 

---

So far the most difficult issues I've faced while working on this project are the reserved words used by MySql. Definitely ran into an error working with "interval" in the sql database.
A potential issue I'm running into now though is the proper implementation of a recurring task system. Right now, the project is setup like a regular todo list, but the idea is to have different habits recurring on different days and to be able to mark off whether it was completed. The problem is that if a user wanted to "workout every Tuesday and Thursday" the way the system is currently setup, there would have to be a different row in a table to track whether it was accomplished for that day or not. This could lead to a lot of rows added if, for instance, there is a habit a user wants to track multiple times a day. Another issue with that is if a user doesn't set an end date for a habit goal. How do those rows get populated, and how far out can user track their data? This project idea may be going outside the scope of what is required, so i'll definitely need to follow up with the instructors on this one.
