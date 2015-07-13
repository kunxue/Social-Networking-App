/*
SQLyog Enterprise - MySQL GUI v5.02
Host - 5.0.11-beta-nt : Database - socialnetworking
*********************************************************************
Server version : 5.0.11-beta-nt
*/


create database if not exists `socialnetworking`;

USE `socialnetworking`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(200) NOT NULL,
  `photo` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

/*Table structure for table `contactlist` */

DROP TABLE IF EXISTS `contactlist`;

CREATE TABLE `contactlist` (
  `user` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contactlist` */

/*Table structure for table `photo` */

DROP TABLE IF EXISTS `photo`;

CREATE TABLE `photo` (
  `id` int(11) NOT NULL auto_increment,
  `photoaddress` varchar(100) default NULL,
  `photodescription` varchar(100) default NULL,
  `user` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `photo` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `account` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `validatepassword` varchar(100) default NULL,
  `name` varchar(100) default NULL,
  `msn` varchar(100) default NULL,
  `mainpage` varchar(200) default NULL,
  `interest` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `gender` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */
