CREATE DATABASE baas_app;

/* USERS TABLE*/
CREATE TABLE users (
    user_id int(255) NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password text NOT NULL,
    avatar varchar(255),
    joindate datetime,
    karma int(255),
    PRIMARY KEY (user_id)
);

/* POSTS TABLE */
CREATE TABLE posts (
    post_id int(255) NOT NULL AUTO_INCREMENT,
    author varchar(255) NOT NULL,
    img varchar(255),
    topic text NOT NULL,
    content text,
    postdate datetime NOT NULL,
    likes int(255),
    PRIMARY KEY (post_id)
);

/* COMMENTS TABLE*/
CREATE TABLE comments (
    comment_id int(255) NOT NULL AUTO_INCREMENT,
    commenter varchar(255) NOT NULL,
    comment text NOT NULL,
    date datetime NOT NULL,
    likes int(255),
    PRIMARY KEY (comment_id)
);


/* JOIN TABLES */

/* ASSOCIATE USERS WITH ALL THE COMMENTS THEY HAVE WRITTEN*/
CREATE TABLE users_comments (
    user int(255),
    comment int(255),
    FOREIGN KEY (user) REFERENCES users(user_id),
    FOREIGN KEY (comment) REFERENCES comments(comment_id)
);

/* ASSOCIATE ALL THE COMMENTS WITH THEIR PARENT POSTS */
CREATE TABLE comments_posts (
    comment int(255),
    post int(255),
    FOREIGN KEY (comment) REFERENCES comments(comment_id),
    FOREIGN KEY (post) REFERENCES posts(post_id)
);

/* ASSOCIATE USERS WITH THE POSTS THEY HAVE PUBLISHED */
CREATE TABLE users_posts (
    user int(255),
    post int(255),
    FOREIGN KEY (user) REFERENCES users(user_id),
    FOREIGN KEY (post) REFERENCES posts(post_id)
);