CREATE DATABASE mewe;
USE mewe;

CREATE TABLE user (
  `email` VARCHAR(40) NOT NULL,
  `nickname` VARCHAR(8) NOT NULL,
  `block` BIT(1) NOT NULL,
  PRIMARY KEY (email)
);

CREATE TABLE user_block (
  `idx` INTEGER NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `banEmail` VARCHAR(40) NOT NULL,
  PRIMARY KEY (idx)
);

CREATE TABLE user_friend (
  `idx` INTEGER NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `friendEmail` VARCHAR(40) NOT NULL,
  PRIMARY KEY (idx)
);

INSERT INTO user(`email`, `nickname`, `block`) VALUES('mewe@mewe.com', 'mewe', 0);