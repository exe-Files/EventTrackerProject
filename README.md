# EventTrackerProject

## Full-Stack Spring/REST/JPA Project for Skill Distillery


## Overview
To wrap up our material on JPA/REST, each of us were tasked with creating a full stack java web application that would keep track of information over time. For my project, I decided to go with a simple habit-tracker that allows a user to create and update different habits they would like to accomplish throughout the day. Currently, the website only works through REST endpoints, listed in the table below. By linking the website to a MySql database, the user is able to dynamically update their list in realtime as the user accomplishes their daily goals.

![DB Schema](https://user-images.githubusercontent.com/23006320/127801588-96f3dd68-f7f8-4ae7-92d8-5b1a6984be16.png)

## REST Endpoints
<!-- markdown tables -->
| Method   | HTTP Verb | URI               | Request Body | Response Body |
|----------|-----------|-------------------|--------------|---------------|
| Read     | GET       | `/api/habits`     |              | Collection of representations of all _habit_ resources |
| Read     | GET       | `/api/habits/1`   |              | Representation of _habit_ `1` |
| Create   | POST      | `/api/habits`     | Representation of a new _habit_ resource | Description the result of the operation |
| Update   | PUT       | `/api/habits/1`   | Representation of a new version of _habit_ `1` | |
| Delete   | DELETE    | `/api/habits/1`   |              | |


### Lessons Learned
So far the most difficult issues I've faced while working on this project are the reserved words used by MySql. Definitely ran into an error working with "interval" in the sql database.
A potential issue I'm running into now though is the proper implementation of a recurring task system. Right now, the project is setup like a regular todo list, but the idea is to have different habits recurring on different days and to be able to mark off whether it was completed. The problem is that if a user wanted to "workout every Tuesday and Thursday" the way the system is currently setup, there would have to be a different row in a table to track whether it was accomplished for that day or not. This could lead to a lot of rows added if, for instance, there is a habit a user wants to track multiple times a day. Another issue with that is if a user doesn't set an end date for a habit goal. How do those rows get populated, and how far out can user track their data? This project idea may be going outside the scope of what is required, so i'll definitely need to follow up with the instructors on this one.
