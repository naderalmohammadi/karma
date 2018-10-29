/*
Nader Ramadan M Almohammadi
U01394442
nn-1411@hotmail.com
*/



#CREATE DATABASE
DROP DATABASE IF EXISTS karma;
CREATE DATABASE karma;
SELECT 'DATABASE karma CREATED AND IN USE ' AS Msg;
USE karma;



#CREATE TABLES
CREATE TABLE user (
Username VARCHAR(20) NOT NULL,
Age VARCHAR(20) NOT NULL,
Gender enum('Male','Female') NOT NULL,
Email VARCHAR(50) NOT NULL UNIQUE,
Password VARCHAR(20) NOT NULL,
Points int(20) default 3,
CONSTRAINT PK_user PRIMARY KEY  (Username)
);


CREATE TABLE post (
PostID INT NOT NULL AUTO_INCREMENT,
Username VARCHAR(20) NOT NULL,
Subject VARCHAR(60) NOT NULL,
Content LONGTEXT NOT NULL,
Post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT PK_post PRIMARY KEY  (PostID),
CONSTRAINT fk_user FOREIGN KEY(Username) REFERENCES user(Username)
);

CREATE TABLE reply (
ReplyID INT NOT NULL AUTO_INCREMENT,
Username VARCHAR(20) NOT NULL,
PostID INT NOT NULL,
Rsubject LONGTEXT NOT NULL,
Reply_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
bestanswer int(1) default 0,
CONSTRAINT PK_reply PRIMARY KEY  (ReplyID),
CONSTRAINT fk_user_reply FOREIGN KEY(Username) REFERENCES user(Username),
CONSTRAINT fk_post FOREIGN KEY(PostID) REFERENCES post(PostID)
);