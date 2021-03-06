use
airbnb;

ALTER
DATABASE airbnb CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

drop table if exists host;
drop table if exists city;
drop table if exists location;
drop table if exists additional_cost;
drop table if exists review;
drop table if exists room;
drop table if exists image;
drop table if exists users;
drop table if exists reservation;
drop table if exists wish_list;

create table host
(
    id                bigint auto_increment primary key,
    name              varchar(45),
    profile_image_url varchar(200)
);


create table city(
                     name      varchar(45) primary key,
                     image_url varchar(200)
);

create table location
(
    id        bigint auto_increment primary key,
    city_name varchar(45) references city (name),
    latitude  double(20, 10
) ,
    longitude double(20,10)
);

create table additional_cost(
    id bigint auto_increment primary key ,
    week_sale_percent int,
    cleaning_fee int,
    service_fee_percent int,
    lodgment_fee_percent int
);

create table review(
   id bigint auto_increment primary key ,
   star double (6,3),
   review int
);

create table room
(
    id                 bigint auto_increment primary key,
    host_id            bigint references host (id),
    location_id        bigint references location (id),
    additional_cost_id bigint references additional_cost (id),
    review_id          bigint references review (id),
    name               varchar(100),
    price_per_date     int,
    description        varchar(300),
    bed                int,
    max_guest          int,
    bathroom           int,
    type               varchar(45)

);

create table image
(
    id      bigint auto_increment primary key,
    room_id bigint references room (id),
    url     varchar(200) not null,
    type    varchar(30)  not null
);

create table users(
  id bigint auto_increment primary key,
  github_id bigint unique ,
  login varchar (45),
  email varchar (100),
  access_token varchar (200),
  profile_image_url varchar (200)
);

create table reservation
(
    id          bigint auto_increment primary key,
    user_id     bigint references users (id),
    room_id     bigint references room (id),
    adult       int,
    child       int,
    baby        int,
    check_in    date,
    check_out   date,
    total_price int,
    status      varchar(20)
);

create table wish_list
(
    id      bigint auto_increment primary key,
    user_id bigint references users (id),
    room_id bigint references room (id),
    wish    TINYINT(0)
);