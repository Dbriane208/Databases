-- INSTAGRAM DATABSE CLONE

-- creating the database
create database ig_clone;
use ig_clone;
show tables;

-- creating table USERS
create table users(id int auto_increment primary key,
                   username varchar(255) unique not null,
                   created_at timestamp default now());
desc users;                   
                   
-- creating table PHOTOS
create table photos(id int auto_increment primary key,
                    image_url varchar(255) not null,
                    user_id int not null,
                    created_at timestamp default now(),
                    foreign key (user_id) references users(id));  
desc photos;

-- creating table COMMENTS
create table comments (id int auto_increment primary key,
                       comment_text varchar(255) not null,
                       user_id int not null,
                       photo_id int not null,
                       created_at timestamp default now(),
                       foreign key (user_id) references users(id),
                       foreign key (photo_id) references photos(id));     
desc comments;   

-- creating table LIKES
create table likes(user_id int not null, photo_id int not null,
                   created_at timestamp default now(),
                   primary key(user_id,photo_id),
                   foreign key (user_id) references users(id),
                   foreign key (photo_id) references photos(id));      
desc likes; 

-- creating table FOLLOWERS
create table follows(follower_id int not null, followee_id int not null,
                   created_at timestamp default now(),
                   primary key(follower_id,followee_id),
                   foreign key (follower_id) references users(id),
                   foreign key (followee_id) references users(id)); 
desc follows; 

-- creating table TAGS
create table tags(id int auto_increment primary key,
                   tag_name varchar(255) unique,
                   created_at timestamp default now());  
desc tags;  

-- creating photo_tags
create table photo_tags(photo_id int not null,tag_id int not null,
                        primary key(photo_id,tag_id),
                        foreign key (photo_id) references photos(id),
                        foreign key (tag_id) references tags(id)); 
desc photo_tags;                        
                  