create table Users(
user_id int primary key auto_increment,
full_name varchar(100) not null,
email varchar(100) unique not null,
city varchar(100) not null,
registration_date date not null
);
create table Events(
event_id int primary key auto_increment,
title varchar(200) not null,
description text,
city varchar(100) not null,
start_date datetime not null,
end_date datetime not null,
status enum('upcomming','completed','cancelled'),
organizer_id int ,
foreign key(organizer_id) references Users(user_id)
);

create table Sessions(
session_id int primary key auto_increment,
event_id int,
foreign key(event_id) references Events(event_id),
title varchar(200) not null,
speaker_name varchar(100) not null,
start_time datetime not null,
end_time datetime not null
);

create table Registrations(
registration_id int primary key auto_increment,
user_id int ,
foreign key(user_id) references Users(user_id),
event_id int,
foreign key(event_id) references Events(event_id),
registration_date date not null
);

create table Feedback(
feedback_id int primary key auto_increment,
user_id int ,
foreign key(user_id) references Users(user_id),
event_id int,
foreign key(event_id) references Events(event_id),
rating int,
constraint chk_raiting_range check(rating between 1 and 5),
comments text,
feedback_date date
);

create table Resources(
resource_id int primary key auto_increment,
event_id int,
foreign key(event_id) references Events(event_id),
resource_type enum('pdf','image','link'),
resource_url varchar(255) not null,
uploaded_at datetime not null
);
show databases;