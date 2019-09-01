/*
This is acount info tables
*/
create table user_info_tab(
    ID int primary key,
    firstName varchar(20),
    lastName varchar(20),
    userName varchar(50),
    password varchar(20),
    locationDetails varchar(200),
    user_status int,
    create_time timestamp,
    update_time TIMESTAMP
);

/*
this is external link url tables
*/
CREATE TABLE external_link_type_tab(
    id int PRIMARY key,
    link_name VARCHAR,
    link_url VARCHAR,
    link_id VARCHAR,
    create_time TIMESTAMP,
    update_time TIMESTAMP,
    create_by VARCHAR,
    update_by VARCHAR
);

/*
this is types of external link url
*/
CREATE TABLE external_links_tab(
    ID int PRIMARY KEY,
    external_type INT,
    create_time TIMESTAMP,
    update_time TIMESTAMP,
    FOREIGN KEY (external_type) REFERENCES external_link_type_tab(id)
);


/*
 this is tags table
*/
CREATE TABLE tag_type_tab(
    id int PRIMARY KEY,
    type_name VARCHAR,
    create_time TIMESTAMP,
    update_time TIMESTAMP,
    create_by VARCHAR,
    update_by VARCHAR
);


/*
this is post table, will save authors writings
*/
CREATE TABLE post_tab(
    id int,
    title VARCHAR,
    content text,
    create_time TIMESTAMP,
    update_time TIMESTAMP,
    create_by VARCHAR,
    FOREIGN KEY (create_by) REFERENCES user_info_tab(id)
);


/*
this is post and tag relations
*/
CREATE TABLE post_tag_ref_tab(
    id INT primary key,
    post_id INT,
    tag_id int
);


/*
this is comments table
*/
CREATE TABLE comments_tab(
    id int PRIMARY KEY,
    content TEXT,
    post_id int,
    link_counts bigint,
    post_id INT,
    create_time TIMESTAMP,
    update_time TIMESTAMP,
    create_by VARCHAR,
    update_by VARCHAR,
    FOREIGN KEY (post_id) REFERENCES post_tab(id)
);

/*
this is notification table
*/
CREATE TABLE notification_tab(
    id int PRIMARY key,
    notif_type VARCHAR,
    notif_content VARCHAR,
    users_id int,
    retry_times int,
    create_time TIMESTAMP,
    update_time TIMESTAMP,
    FOREIGN KEY (users_id) REFERENCES user_info_tab(id)
);


/*
this is follow table, will save follow informations
*/
CREATE TABLE user_follow_tab(
    ID int PRIMARY KEY,
    follow_user_id int,
    follow_by INT,
    create_time TIMESTAMP,
    FOREIGN KEY (follow_user_id) REFERENCES user_info_tab(id),
    FOREIGN KEY (follow_by) REFERENCES user_info_tab(id),
    CONSTRAINT uc_follow UNIQUE (follow_user_id,follow_by)
);