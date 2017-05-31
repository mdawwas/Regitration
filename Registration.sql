-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2017 at 05:12 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` text NOT NULL,
  `course_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `course_description`) VALUES
(1, 'AI', 'thatja]sjfnfans'),
(2, 'Algo', 'ldsahgoidshgo'),
(3, 'mis', 'bad course for cs student'),
(4, 'Calculus', 'good course for cs student');

-- --------------------------------------------------------

--
-- Table structure for table `Courses_Students`
--

CREATE TABLE `Courses_Students` (
  `Course_Id` int(11) NOT NULL,
  `Student_Id` int(11) NOT NULL,
  `Grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Courses_Students`
--

INSERT INTO `Courses_Students` (`Course_Id`, `Student_Id`, `Grade`) VALUES
(1, 1, NULL),
(2, 1, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_grades`
--
CREATE TABLE `student_grades` (
`Course_Id` int(11)
,`Student_Id` int(11)
,`Grade` int(11)
,`id` int(11)
,`course_name` text
,`course_description` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_gradesa`
--
CREATE TABLE `student_gradesa` (
`id` int(11)
,`course_name` text
,`course_description` text
,`Course_Id` int(11)
,`Student_Id` int(11)
,`Grade` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `username`, `password`, `name`, `type`) VALUES
(1, 'ahmad', '111', 'ahmadsallam', 2),
(2, 'montaser', '111', 'montaser', 2),
(3, 'admin', 'admin', 'Mohammad Abu Dawwas', 0);

-- --------------------------------------------------------

--
-- Structure for view `student_grades`
--
DROP TABLE IF EXISTS `student_grades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_grades`  AS  select `Courses_Students`.`Course_Id` AS `Course_Id`,`Courses_Students`.`Student_Id` AS `Student_Id`,`Courses_Students`.`Grade` AS `Grade`,`courses`.`id` AS `id`,`courses`.`course_name` AS `course_name`,`courses`.`course_description` AS `course_description` from (`Courses_Students` left join `courses` on(1)) ;

-- --------------------------------------------------------

--
-- Structure for view `student_gradesa`
--
DROP TABLE IF EXISTS `student_gradesa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_gradesa`  AS  select `courses`.`id` AS `id`,`courses`.`course_name` AS `course_name`,`courses`.`course_description` AS `course_description`,`Courses_Students`.`Course_Id` AS `Course_Id`,`Courses_Students`.`Student_Id` AS `Student_Id`,`Courses_Students`.`Grade` AS `Grade` from (`courses` left join `Courses_Students` on(1)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
