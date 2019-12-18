PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname varchar(255) NOT NULL, 
    lname varchar(255) NOT NULL
);


CREATE TABLE questions(             -- Database of Questions/Threads
    id INTEGER PRIMARY KEY,
    title varchar(255) NOT NULL,
    body TEXT,
    author_id INTEGER,
    
    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_follows( -- Followers of Questions/Threads
    id INTEGER PRIMARY KEY,
    question_id INTEGER,        -- Question/Thread they get notifications from (if updated)
    user_id INTEGER,            -- Follower (They get notifications if the question/thread is updated)

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE replies( -- Database of replies to Questions/Threads
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,    -- foreign key to questions
    reply_id INTEGER,       -- if someone replies to a reply
    author_id INTEGER NOT NULL,      -- foreign key to user id
    body TEXT,              -- the text response of the author

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_likes( -- Likes on a question (based on their ID) from a user
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- DATA POPULATION~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INSERT INTO 
    users (fname, lname)
VALUES
    ('Paul','Tan'),
    ('Soohyun', 'Lim'),
    ('Oliver', 'Ball'),
    ('John', 'Smith'),
    ('David','Bowie');

INSERT INTO
    questions(title, body, author_id)
VALUES
    ('Question 1', 'Body of Question 1', 1),
    ('Question 2', 'Question 2''s Body', 3),
    ('Last Question', 'With the last Body', 2);

INSERT INTO
    question_follows(question_id, user_id)
VALUES
    (1, 1),
    (2, 3),
    (3, 2);


INSERT INTO
    replies(question_id, reply_id, author_id, body)
VALUES
    (1, null, 2, 'Oh sorry'),
    (1, null, 2, 'Whatever'),
    (1, 1, 1, 'Thank You' ),
    (1, 3, 3, 'What?');

INSERT INTO
    question_likes(user_id, question_id)
VALUES
    (3, 1),
    (4, 1),
    (2, 2);
