CREATE DATABASE mewe;
USE mewe;

CREATE TABLE user (
  `email` VARCHAR(40) NOT NULL,
  `nickname` VARCHAR(8) NOT NULL,
  `block` BIT(1) NOT NULL,
  PRIMARY KEY (email)
);

CREATE TABLE user_block (
  `email` VARCHAR(40) NOT NULL,
  `banEmail` VARCHAR(40) NOT NULL
);

CREATE TABLE user_friend (
  `email` VARCHAR(40) NOT NULL,
  `friendEmail` VARCHAR(40) NOT NULL
);

INSERT INTO user(`email`, `nickname`, `block`) VALUES('mewe@mewe.com', 'mewe', 0);