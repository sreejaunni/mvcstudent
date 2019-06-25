-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 25, 2019 at 10:37 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_students`
--

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) UNSIGNED NOT NULL,
  `student_first_name` varchar(255) DEFAULT NULL,
  `student_last_name` varchar(255) DEFAULT NULL,
  `student_dob` date DEFAULT NULL,
  `student_email` varchar(50) DEFAULT NULL,
  `student_class` varchar(50) DEFAULT NULL,
  `student_guardian_name` varchar(255) DEFAULT NULL,
  `student_phone` varchar(50) DEFAULT NULL,
  `student_joined` year(4) DEFAULT NULL,
  `added_date` date DEFAULT NULL,
  `updated_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_first_name`, `student_last_name`, `student_dob`, `student_email`, `student_class`, `student_guardian_name`, `student_phone`, `student_joined`, `added_date`, `updated_date`) VALUES
(1, 'Asher', 'Sylvester', '2002-11-20', 'Quisque.tincidunt.pede@ultrices.net', '1', 'Hedley', '1-844-385-2263', 2018, '2019-01-18', '2020-02-02'),
(2, 'Davis', 'Nell', '2013-03-03', 'rhoncus.id.mollis@interdumCurabiturdictum.ca', '7', 'Jerome', '1-468-935-1693', 2015, '2019-08-01', '2018-11-24'),
(3, 'Tatyana', 'Teegan', '2005-09-06', 'non.enim.Mauris@Etiambibendum.net', '5', 'Igor', '248-3837', 2018, '2019-09-29', '2019-06-04'),
(4, 'Stuart', 'Mia', '2010-03-04', 'quam.a@molestiearcuSed.co.uk', '3', 'Oscar', '461-6920', 2002, '2018-10-29', '2019-07-02'),
(5, 'Paloma', 'Ingrid', '2012-03-06', 'euismod.et.commodo@luctus.ca', '6', 'Brock', '243-4145', 2006, '2019-09-19', '2019-04-23'),
(6, 'Emi', 'Thomas', '2014-06-01', 'euismod@quama.ca', '9', 'Reuben', '430-6710', 2015, '2019-03-13', '2019-06-15'),
(7, 'Claire', 'Ulla', '2009-08-03', 'hymenaeos.Mauris.ut@elitfermentumrisus.org', '1', 'Armando', '1-290-679-5095', 2017, '2020-01-06', '2018-11-21'),
(8, 'Francis', 'Bryar', '2012-01-28', 'eu@vehiculaetrutrum.edu', '4', 'Basil', '415-0989', 2008, '2019-06-05', '2019-07-21'),
(9, 'Colorado', 'Brock', '2004-11-28', 'amet@non.co.uk', '7', 'Simon', '905-8579', 2016, '2019-09-26', '2019-07-09'),
(10, 'Edward', 'Bruno', '2009-11-20', 'sem.vitae@egestas.net', '5', 'Elvis', '1-148-174-4794', 2018, '2020-03-27', '2018-11-21'),
(11, 'Elijah', 'Imelda', '2011-07-21', 'orci@a.ca', '9', 'Amal', '373-5121', 2012, '2019-12-21', '2020-03-29'),
(12, 'Katelyn', 'Brenda', '2011-07-28', 'elit@sitamet.net', '10', 'August', '1-162-201-1264', 2018, '2018-06-27', '2019-01-16'),
(13, 'Odysseus', 'Hall', '2011-03-17', 'amet.faucibus.ut@consectetueradipiscing.edu', '2', 'Fuller', '1-135-765-8794', 2013, '2020-03-20', '2020-02-09'),
(14, 'James', 'Evelyn', '2001-11-24', 'elit@eros.edu', '5', 'Rogan', '364-7099', 2003, '2019-05-19', '2018-09-10'),
(15, 'Moses', 'Gretchen', '2007-12-22', 'vel.pede.blandit@at.co.uk', '2', 'Lane', '1-471-709-0803', 2007, '2018-10-25', '2019-09-24'),
(16, 'Mary', 'Addison', '2002-03-25', 'sit.amet.ornare@turpisnecmauris.com', '10', 'Aladdin', '1-553-496-6135', 2017, '2019-05-20', '2018-08-26'),
(17, 'Adria', 'Mohammad', '2006-04-01', 'in.molestie@libero.org', '10', 'Keaton', '1-563-557-0829', 2016, '2019-04-16', '2019-08-18'),
(18, 'Kiona', 'Chanda', '2011-12-29', 'non.leo@molestieSed.net', '6', 'Perry', '465-3902', 2019, '2018-09-29', '2019-01-04'),
(19, 'Noel', 'Martha', '2011-07-10', 'velit.in@in.ca', '1', 'Addison', '1-972-216-0012', 2010, '2019-06-15', '2019-10-28'),
(20, 'Ulric', 'Maris', '2006-11-05', 'erat@egestasligula.com', '6', 'Rogan', '194-5690', 2001, '2018-06-28', '2019-02-12'),
(21, 'Bianca', 'Alana', '2013-01-02', 'a.feugiat.tellus@maurisSuspendisse.ca', '7', 'Cooper', '926-0616', 2007, '2019-01-02', '2018-08-30'),
(22, 'Bertha', 'Madaline', '2006-05-04', 'Phasellus@metussitamet.net', '9', 'Nolan', '1-370-675-3213', 2006, '2018-09-11', '2019-02-07'),
(23, 'Judith', 'Anthony', '2003-10-20', 'dui@in.net', '5', 'Kasper', '1-392-198-9910', 2008, '2019-06-12', '2019-10-28'),
(24, 'Burton', 'Kylynn', '2011-12-04', 'molestie.orci.tincidunt@congueInscelerisque.net', '7', 'Cruz', '1-179-432-3584', 2001, '2019-06-28', '2018-09-06'),
(25, 'Griffin', 'Leslie', '2010-08-22', 'Mauris.eu@egetipsumDonec.ca', '3', 'Lewis', '960-3613', 2015, '2020-01-23', '2019-04-25'),
(26, 'Malachi', 'Dakota', '2010-04-06', 'dui@Donec.com', '5', 'Myles', '772-1163', 2013, '2020-05-23', '2019-01-31'),
(27, 'Lillith', 'Herrod', '2002-03-23', 'dui.lectus.rutrum@Phasellusat.org', '4', 'Byron', '1-418-801-2319', 2006, '2019-10-09', '2018-11-30'),
(28, 'Cadman', 'Francesca', '2005-04-09', 'enim.Etiam.imperdiet@idmagnaet.com', '3', 'Burton', '1-179-251-4418', 2012, '2019-02-26', '2019-08-19'),
(29, 'Hermione', 'Clark', '2005-11-28', 'Sed.eu@et.net', '5', 'Baxter', '614-7285', 2017, '2018-10-12', '2019-06-15'),
(30, 'Vaughan', 'Laura', '2001-09-27', 'ipsum.dolor.sit@conguea.org', '6', 'Amal', '537-5457', 2006, '2019-07-09', '2020-02-06'),
(31, 'Linda', 'Rae', '2004-04-05', 'Cras@neque.org', '5', 'Reed', '1-403-525-0276', 2006, '2019-09-17', '2019-09-28'),
(32, 'Upton', 'Forrest', '2005-01-03', 'convallis.erat@arcu.net', '1', 'Hunter', '1-169-965-4786', 2016, '2020-01-21', '2019-09-27'),
(33, 'Emma', 'Brenden', '2009-08-23', 'nulla.vulputate.dui@risus.edu', '9', 'Harlan', '602-8762', 2003, '2018-08-31', '2019-08-01'),
(34, 'Ifeoma', 'Bertha', '2008-09-06', 'auctor@nuncsitamet.edu', '7', 'Colin', '1-221-168-3110', 2004, '2020-03-06', '2018-08-16'),
(35, 'Lareina', 'Hayley', '2002-09-20', 'et@sodaleselit.ca', '8', 'Dolan', '381-3423', 2001, '2020-01-09', '2018-10-13'),
(36, 'Barrett', 'Doris', '2000-08-29', 'fringilla.purus@Aliquamtincidunt.ca', '3', 'Quinlan', '1-311-566-0097', 2011, '2020-01-23', '2019-11-13'),
(37, 'Daphne', 'Shaine', '2005-04-05', 'bibendum.ullamcorper@maurisrhoncus.org', '6', 'Ira', '961-4045', 2000, '2018-08-08', '2018-08-17'),
(38, 'Joy', 'Clarke', '2005-04-18', 'velit.egestas@nulla.org', '7', 'Isaac', '1-574-665-2619', 2005, '2020-04-05', '2018-11-22'),
(39, 'Abraham', 'Quemby', '2010-03-27', 'Pellentesque@lacusQuisque.edu', '6', 'Wallace', '311-3217', 2015, '2020-06-24', '2019-05-17'),
(40, 'Craig', 'Damon', '2007-03-02', 'lorem.vehicula.et@lacus.net', '10', 'Jeremy', '489-6705', 2001, '2019-12-22', '2019-12-01'),
(41, 'Evangeline', 'Randall', '2009-08-10', 'dictum.ultricies@seddolor.net', '6', 'Dominic', '1-752-652-3519', 2005, '2018-12-16', '2019-07-28'),
(42, 'Illiana', 'Jeanette', '2013-09-20', 'non.magna.Nam@lorem.edu', '5', 'William', '1-611-356-0163', 2018, '2018-12-07', '2019-10-14'),
(43, 'Lucas', 'Lance', '2000-07-10', 'sit.amet@ridiculus.edu', '1', 'Ashton', '699-7432', 2009, '2019-12-04', '2020-02-11'),
(44, 'Nathan', 'Brynn', '2011-03-07', 'Quisque.imperdiet@arcuNunc.edu', '10', 'Ciaran', '1-180-372-0407', 2008, '2018-10-09', '2018-12-19'),
(45, 'Hall', 'Bruno', '2009-01-23', 'Duis@eros.edu', '4', 'Tad', '923-9412', 2007, '2020-04-06', '2019-08-04'),
(46, 'Miriam', 'Mari', '2011-08-27', 'imperdiet@odio.edu', '4', 'Dominic', '752-2557', 2018, '2019-06-05', '2019-10-10'),
(47, 'Salvador', 'MacKenzie', '2009-10-09', 'rhoncus.Nullam.velit@mauris.edu', '6', 'Orlando', '1-506-779-0931', 2006, '2019-02-28', '2018-08-28'),
(48, 'Jamal', 'Graiden', '2006-07-28', 'eget.odio@orci.ca', '1', 'Oscar', '1-882-175-2033', 2011, '2019-06-29', '2019-02-01'),
(49, 'Idola', 'Odysseus', '2006-04-03', 'ac@risusNuncac.edu', '3', 'Flynn', '138-2878', 2018, '2020-06-13', '2019-03-14'),
(50, 'Colette', 'Callie', '2009-07-28', 'at.velit.Cras@vulputateeuodio.edu', '4', 'Murphy', '106-7461', 2015, '2020-02-23', '2018-11-13'),
(51, 'Teegan', 'Illiana', '2012-11-04', 'Sed@massa.edu', '5', 'Alan', '1-869-102-2115', 2017, '2019-11-10', '2020-02-05'),
(52, 'Jamalia', 'Maisie', '2003-01-19', 'congue@Vestibulumut.co.uk', '3', 'Boris', '1-199-110-0854', 2017, '2020-05-02', '2020-03-02'),
(53, 'Casey', 'Finn', '2007-08-01', 'luctus.et@sociisnatoquepenatibus.net', '10', 'Ignatius', '714-7858', 2004, '2019-10-13', '2019-11-07'),
(54, 'Sydnee', 'Elijah', '2005-02-22', 'eleifend.non@odio.edu', '9', 'Stephen', '1-435-504-2155', 2013, '2019-02-03', '2019-02-20'),
(55, 'Aubrey', 'Todd', '2000-09-01', 'amet.consectetuer@sollicitudinadipiscing.edu', '1', 'Burke', '1-195-677-4778', 2010, '2019-05-05', '2020-06-16'),
(56, 'Felix', 'Renee', '2011-12-10', 'et@utpharetrased.ca', '8', 'Kareem', '1-739-220-2444', 2004, '2019-08-24', '2019-08-16'),
(57, 'Phillip', 'Ethan', '2004-11-14', 'ligula.eu.enim@congue.com', '2', 'Dexter', '156-0729', 2006, '2019-09-21', '2019-07-22'),
(58, 'Jenette', 'Lacy', '2008-12-10', 'molestie@inmolestietortor.co.uk', '8', 'Raymond', '924-5074', 2019, '2019-03-24', '2019-02-28'),
(59, 'Stuart', 'Clayton', '2014-03-24', 'Pellentesque@ornaresagittisfelis.ca', '8', 'Alfonso', '176-5651', 2011, '2018-09-19', '2019-11-23'),
(60, 'Harper', 'Anjolie', '2014-06-08', 'amet@conubianostra.edu', '3', 'Gavin', '263-0668', 2011, '2018-08-18', '2019-04-28'),
(61, 'Stacey', 'Darryl', '2005-02-04', 'varius.Nam@ipsumcursus.co.uk', '8', 'Chaney', '1-368-527-5691', 2015, '2019-08-06', '2019-08-16'),
(62, 'Lewis', 'Angelica', '2011-12-04', 'Proin@massaIntegervitae.com', '9', 'Kadeem', '110-1257', 2012, '2018-08-03', '2019-05-04'),
(63, 'Joshua', 'Karyn', '2007-12-16', 'dolor@laoreetposuereenim.ca', '3', 'Dexter', '218-0830', 2011, '2018-10-02', '2020-03-08'),
(64, 'Lillith', 'Reagan', '2010-06-11', 'turpis.Aliquam.adipiscing@Integerurna.com', '3', 'Oliver', '320-9068', 2011, '2019-08-06', '2018-08-30'),
(65, 'Chava', 'Ishmael', '2011-01-09', 'bibendum@molestiesodalesMauris.net', '4', 'Hayes', '715-3234', 2009, '2019-03-06', '2019-11-02'),
(66, 'Lila', 'Burton', '2004-09-10', 'arcu.Vestibulum@dolorQuisquetincidunt.net', '3', 'Gray', '1-852-229-6704', 2004, '2019-02-04', '2019-04-08'),
(67, 'Whilemina', 'Phillip', '2009-11-25', 'Sed@ligula.ca', '10', 'Alden', '925-6701', 2014, '2020-04-24', '2020-03-13'),
(68, 'Gretchen', 'Holmes', '2005-01-02', 'mauris@lobortisultrices.net', '7', 'Philip', '1-509-872-4235', 2002, '2020-05-19', '2018-07-13'),
(69, 'Grant', 'Moana', '2007-05-25', 'ac.feugiat@consectetuercursuset.net', '7', 'Myles', '862-9117', 2014, '2018-08-20', '2019-01-30'),
(70, 'Colt', 'Kibo', '2012-09-18', 'sed.pede@auctor.co.uk', '8', 'Paul', '1-313-792-4708', 2019, '2018-07-23', '2019-04-29'),
(71, 'Indira', 'Derek', '2006-11-02', 'ante@ullamcorpervelitin.co.uk', '7', 'Connor', '1-742-464-6337', 2000, '2019-07-18', '2018-07-11'),
(72, 'Jane', 'Leila', '2013-06-27', 'porttitor.scelerisque@erat.edu', '4', 'Paul', '186-5215', 2019, '2020-03-17', '2019-08-23'),
(73, 'Dennis', 'Caesar', '2008-02-12', 'Nullam.suscipit.est@scelerisque.net', '8', 'Marshall', '953-1308', 2015, '2019-03-03', '2020-04-12'),
(74, 'Jillian', 'Virginia', '2003-04-03', 'non.ante.bibendum@leo.co.uk', '3', 'Kenneth', '1-376-848-4504', 2002, '2020-05-11', '2019-01-21'),
(75, 'Lila', 'Alice', '2004-02-20', 'ornare.elit@facilisisnon.org', '10', 'Lucas', '176-5927', 2016, '2020-06-14', '2019-02-17'),
(76, 'Ahmed', 'Mohammad', '2011-03-10', 'odio@IntegerurnaVivamus.ca', '8', 'Knox', '1-954-657-4460', 2007, '2020-01-02', '2019-04-06'),
(77, 'Mara', 'Dexter', '2010-12-27', 'Suspendisse@nonummyFusce.co.uk', '7', 'Jonah', '1-577-414-8791', 2012, '2020-01-18', '2019-01-26'),
(78, 'Sigourney', 'Quynn', '2003-11-28', 'tempor@massaQuisque.net', '7', 'Mason', '605-4027', 2017, '2018-12-21', '2019-06-16'),
(79, 'Stone', 'Adrienne', '2012-12-18', 'amet.lorem@ac.co.uk', '3', 'Jelani', '115-4606', 2015, '2018-08-06', '2020-06-04'),
(80, 'Thaddeus', 'Len', '2001-01-09', 'Phasellus@Aenean.net', '10', 'Elliott', '1-675-220-0166', 2016, '2019-12-19', '2020-04-25'),
(81, 'Wade', 'Katell', '2000-11-01', 'nulla.Cras@pede.co.uk', '5', 'Quinn', '1-236-386-9786', 2011, '2019-03-15', '2019-10-20'),
(82, 'Chava', 'Lamar', '2002-08-05', 'Suspendisse@ametluctus.co.uk', '5', 'Barclay', '409-6109', 2013, '2019-08-18', '2019-09-28'),
(83, 'Blaine', 'Howard', '2014-02-09', 'scelerisque@cursus.co.uk', '7', 'Stewart', '1-157-107-6107', 2004, '2020-02-28', '2019-02-20'),
(84, 'Thane', 'Yuri', '2001-09-06', 'sem.ut.cursus@montesnascetur.co.uk', '9', 'Igor', '388-1547', 2013, '2019-09-11', '2019-12-06'),
(85, 'Jorden', 'Malik', '2002-03-22', 'orci.lobortis@nisinibh.edu', '7', 'Jesse', '1-682-120-6298', 2007, '2018-12-27', '2019-02-18'),
(86, 'Arthur', 'Isabelle', '2012-03-10', 'molestie.tellus.Aenean@nonfeugiat.co.uk', '3', 'Dillon', '1-163-609-0904', 2014, '2019-09-10', '2018-10-22'),
(87, 'James', 'Abigail', '2000-10-06', 'cursus.a@malesuadafames.ca', '6', 'Brandon', '710-9217', 2014, '2018-10-15', '2019-01-07'),
(88, 'Cassandra', 'Maisie', '2006-08-05', 'erat.Sed@duisemperet.edu', '10', 'Hashim', '187-2610', 2002, '2019-03-12', '2020-04-24'),
(89, 'Caleb', 'Arden', '2002-06-21', 'mauris@nonfeugiat.com', '9', 'Keegan', '798-5522', 2010, '2019-09-28', '2019-05-04'),
(90, 'Chase', 'Robin', '2001-10-22', 'nunc.est@inconsectetueripsum.org', '9', 'Ray', '1-227-106-0889', 2012, '2019-12-26', '2018-11-30'),
(91, 'Ava', 'Arden', '2013-06-27', 'turpis.egestas.Aliquam@vulputatenisi.net', '8', 'Wayne', '1-480-626-7070', 2010, '2018-09-27', '2019-06-05'),
(92, 'Brenden', 'Hayley', '2008-10-09', 'risus.quis.diam@ridiculus.co.uk', '7', 'Merritt', '640-3416', 2014, '2020-06-16', '2020-01-07'),
(93, 'Deborah', 'Tad', '2004-09-02', 'rhoncus.Nullam@pellentesque.org', '2', 'Tyrone', '485-2534', 2003, '2019-08-29', '2018-10-12'),
(94, 'Xerxes', 'Kevin', '2009-12-26', 'vestibulum.lorem@Maecenasliberoest.edu', '8', 'Levi', '1-914-360-0249', 2006, '2019-09-04', '2019-11-16'),
(95, 'Alika', 'Ivan', '2002-05-27', 'a.arcu.Sed@placeratorci.co.uk', '7', 'Levi', '1-694-618-2780', 2002, '2019-06-27', '2019-12-04'),
(96, 'Dalton', 'Martina', '2012-11-26', 'vel.pede@fermentumvelmauris.net', '9', 'Noah', '357-0366', 2005, '2020-02-06', '2019-03-02'),
(97, 'Nicole', 'Buffy', '2010-04-14', 'Curabitur.dictum@commodo.com', '8', 'Justin', '1-403-886-4028', 2006, '2019-12-27', '2020-02-15'),
(98, 'Gisela', 'Nicholas', '2001-12-05', 'hendrerit.id.ante@atortorNunc.org', '1', 'Gary', '1-265-970-6172', 2009, '2019-10-10', '2019-01-12'),
(99, 'Channing', 'Logan', '2008-07-01', 'sit@duiCumsociis.edu', '3', 'Bert', '1-128-978-4591', 2019, '2018-09-13', '2019-11-03'),
(100, 'Daphne', 'Galvin', '2010-05-10', 'magnis.dis@eget.org', '7', 'Adam', '1-629-693-9113', 2008, '2018-12-01', '2020-06-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
