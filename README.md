

# Makers B&B
### Authors: Kate Young, Courtney Stow, Mohammed Salah, Jacob Hanrahan 
 
| [Overview](#overview) | [MVP](#MVP) | [User Stories](#user_stories) | 


## <a name="verview">Overview</a>
For this project we plan to make a system which can show rooms available for hire by clients. We want people to be able to log in and list multiple rooms and if they are available and to hire places for the night.

## <a name="MVP">MVP</a>
Our MVP for this project would be that available rooms can be viewed and booked.

### To set up the database
 Connect to `psql` and create the `makersbnb` database:
 ```
 CREATE DATABASE makersbnb;
 ```
 To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

 ### To set up a test database
 Follow the same steps for creating the main database, but name the test database `makersbnb_test`.

# <a name="user stories">User stories</a>

```
As a guest,
So I can hire a room,
I would like to be able to view rooms online.

As a guest,
So I can book a room,
I would like to be able to request to hire a room.

As a guest,
So that I can see if a property is available to rent,
I would like to make a request to hire the property.

As an owner,
So I can list a space,
I would like to be able to post a space I have online.

As an owner,
So I can list a space's name,
I would like to be able to post a space's name.

As an owner,
So I can rent more than one space,
I would like to be able to post multiple spaces.

As an owner,
In order to show prices,
I would like to be able to post the prices of each space.

As an owner,
In order to show a description,
I would like to be able to post a description of each space.

As an owner,
So that renters know when my property is available,
I would like to add a list of available dates.

As an owner
So that a booking can go through,
I would like to approve or decline a booking request. 


```

