-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2023 at 06:33 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `first_pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `card_id` int(10) NOT NULL,
  `personality_id` int(10) NOT NULL,
  `card_pic` varchar(1024) DEFAULT NULL,
  `description_en` varchar(50) DEFAULT NULL,
  `description_th` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`card_id`, `personality_id`, `card_pic`, `description_en`, `description_th`) VALUES
(1, 1, 'https://i.im.ge/2023/07/31/9Avd5W.Cow-Front-1-1.jpg', NULL, 'กัดไม่ปล่อย'),
(2, 1, 'https://i.im.ge/2023/07/31/9AvhPa.Cow-Front-2.jpg', NULL, 'เน้นผลลัพธ'),
(3, 1, 'https://i.im.ge/2023/07/31/9Av5uy.Cow-Front-3.jpg', NULL, 'เปิดเผย'),
(4, 1, 'https://i.im.ge/2023/07/31/9AnfgW.Cow-Front-4.jpg', NULL, 'ใจร้อน'),
(5, 1, 'https://i.im.ge/2023/07/31/9CoamK.Cow-Front-5.jpg', NULL, 'นักรบ'),
(6, 1, 'https://i.im.ge/2023/07/31/9Co7Z9.Cow-Front-6.jpg', NULL, 'มุ่งเป้า'),
(7, 1, 'https://i.im.ge/2023/07/31/9Cof7y.Cow-Front-7.jpg', NULL, 'โผงผาง'),
(8, 1, 'https://i.im.ge/2023/07/31/9CXRN4.Cow-Front-8.jpg', NULL, 'มั่นใจในตัวเอง'),
(9, 1, 'https://i.im.ge/2023/07/31/9Clik4.Cow-Front-9.jpg', NULL, 'เรียนรู้ผ่านการปฏิบัติ'),
(10, 1, 'https://i.im.ge/2023/07/31/9Cr5Ay.Cow-Front-10.jpg', NULL, 'ปกป้องพวกพ้อง'),
(11, 1, 'https://i.im.ge/2023/07/31/9C1bxP.Cow-Front-11-1.jpg', NULL, 'กล้าตัดสินใจ'),
(12, 1, 'https://i.im.ge/2023/07/31/9Cr3pY.Cow-Front-12.jpg', NULL, 'เร็ว'),
(13, 1, 'https://i.im.ge/2023/07/31/9Crb2D.Cow-Front-13.jpg', NULL, 'ดุดัน'),
(14, 1, 'https://i.im.ge/2023/07/31/9CrgKC.Cow-Front-14.jpg', NULL, 'แรง'),
(15, 1, 'https://i.im.ge/2023/07/31/9Crf7f.Cow-Front-15.jpg', NULL, 'มุ่งมั่น'),
(16, 1, 'https://i.im.ge/2023/07/31/9CrJVT.Cow-Front-16.jpg', NULL, 'รักความยุตืธรรน'),
(17, 1, 'https://i.im.ge/2023/07/31/9Creex.Cow-Front-17.jpg', NULL, 'กล้าได้ กล้าเสีย'),
(18, 1, 'https://i.im.ge/2023/07/31/9CulSS.Cow-Front-18.jpg', NULL, 'กล้าชน'),
(19, 1, 'https://i.im.ge/2023/07/31/9CuqD8.Cow-Front-19.jpg', NULL, 'ผู้นำในวิกฤติ'),
(20, 1, 'https://i.im.ge/2023/07/31/9CuLV4.Cow-Front-20.jpg', NULL, 'ตรงไปตรงมา'),
(21, 1, 'https://i.im.ge/2023/07/31/9CuPNW.Cow-Front-21.jpg', NULL, 'ชอบลงมือทำ'),
(22, 2, 'https://i.im.ge/2023/07/31/9CuE8L.Rat-Front-1.jpg', NULL, 'พร้อมตอบรับ'),
(23, 2, 'https://i.im.ge/2023/07/31/9CuWfz.Rat-Front-2.jpg', NULL, 'สนับสนุน'),
(24, 2, 'https://i.im.ge/2023/07/31/9Cuf8K.Rat-Front-3.jpg', NULL, 'เห็นอกเห็นใจผู้อื่น'),
(25, 2, 'https://i.im.ge/2023/07/31/9CunqM.Rat-Front-4.jpg', NULL, 'เสียสละ'),
(26, 2, 'https://i.im.ge/2023/07/31/9Cueu4.Rat-Front-5.jpg', NULL, 'ใจเย็น'),
(27, 2, 'https://i.im.ge/2023/07/31/9CFrnf.Rat-Front-6.jpg', NULL, 'ไม่ปฎิเสธ'),
(28, 2, 'https://i.im.ge/2023/07/31/9CFdjT.Rat-Front-7.jpg', NULL, 'ประนืประนอม'),
(29, 2, 'https://i.im.ge/2023/07/31/9CF7LG.Rat-Front-8.jpg', NULL, 'ยอมตาม'),
(30, 2, 'https://i.im.ge/2023/07/31/9CF9j6.Rat-Front-9.jpg', NULL, 'ขี้เกรงใจ'),
(31, 2, 'https://i.im.ge/2023/07/31/9CF6U9.Rat-Front-10.jpg', NULL, 'ใส่ใจผู้คน'),
(32, 2, 'https://i.im.ge/2023/07/31/9CFxOD.Rat-Front-11.jpg', NULL, 'ห่วงใยผู้อื่น'),
(33, 2, 'https://i.im.ge/2023/07/31/9CFkOW.Rat-Front-12.jpg', NULL, 'ผู้ประสาน'),
(34, 2, 'https://i.im.ge/2023/07/31/9CFnYG.Rat-Front-13.jpg', NULL, 'เน้นความสัมพันธ์'),
(35, 2, 'https://i.im.ge/2023/07/31/9COMHy.Rat-Front-14.jpg', NULL, 'ขี้สงสาร'),
(36, 2, 'https://i.im.ge/2023/07/31/9COFb9.Rat-Front-15.jpg', NULL, 'อ่อนโยน'),
(37, 2, 'https://i.im.ge/2023/07/31/9COSAh.Rat-Front-16.jpg', NULL, 'เก็บความรู้สึก'),
(38, 2, 'https://i.im.ge/2023/07/31/9COLiq.Rat-Front-17.jpg', NULL, 'ผู้ให้'),
(39, 2, 'https://i.im.ge/2023/07/31/9CO9pm.Rat-Front-18.jpg', NULL, 'ไม่ชอบความขัดแย้ง'),
(40, 2, 'https://i.im.ge/2023/07/31/9COtic.Rat-Front-19.jpg', NULL, 'รับฟัง'),
(41, 2, 'https://i.im.ge/2023/07/31/9COKe9.Rat-Front-20.jpg', NULL, 'สนับสนุน'),
(42, 2, 'https://i.im.ge/2023/07/31/9CO4l4.Rat-Front-21.jpg', NULL, 'พร้อมตอบรับ'),
(43, 3, 'https://i.im.ge/2023/07/31/9ABLhS.Bear-Front-1.jpg', NULL, 'รักความสามัคคี'),
(44, 3, 'https://i.im.ge/2023/07/31/9ABhB6.Bear-Front-2.jpg', NULL, 'ใจอ่อน'),
(45, 3, 'https://i.im.ge/2023/07/31/9AGC0J.Bear-Front-3.jpg', NULL, 'ชอบความแน่นอน'),
(46, 3, 'https://i.im.ge/2023/07/31/9AekFG.Bear-Front-4.jpg', NULL, 'วิเคราะห์'),
(47, 3, 'https://i.im.ge/2023/07/31/9CMeer.Bear-Front-5.jpg', NULL, 'นิ่ง'),
(48, 3, 'https://i.im.ge/2023/07/31/9CQTC0.Bear-Front-6.jpg', NULL, 'สม่ำเสมอ'),
(49, 3, 'https://i.im.ge/2023/07/31/9CQl2c.Bear-Front-7.jpg', NULL, 'นักวางแผน'),
(50, 3, 'https://i.im.ge/2023/07/31/9CQuKG.Bear-Front-8.jpg', NULL, 'ชอบความสมบูรณ์แบบ'),
(51, 3, 'https://i.im.ge/2023/07/31/9CQOlx.Bear-Front-9.jpg', NULL, 'มีระเบียบ'),
(52, 3, 'https://i.im.ge/2023/07/31/9CQ10a.Bear-Front-10.jpg', NULL, 'มีขั้นตอน'),
(53, 3, 'https://i.im.ge/2023/07/31/9CQI6K.Bear-Front-11.jpg', NULL, 'รักษากติกา'),
(54, 3, 'https://i.im.ge/2023/07/31/9CQwv4.Bear-Front-12.jpg', NULL, 'เน้นระบบ'),
(55, 3, 'https://i.im.ge/2023/07/31/9CQPNq.Bear-Front-13.jpg', NULL, 'นักสะสม'),
(56, 3, 'https://i.im.ge/2023/07/31/9CQtVp.Bear-Front-14.jpg', NULL, 'รู้ลึก รู้จริง'),
(57, 3, 'https://i.im.ge/2023/07/31/9CQC51.Bear-Front-15.jpg', NULL, 'รอบคอบ'),
(58, 3, 'https://i.im.ge/2023/07/31/9CQYIr.Bear-Front-16.jpg', NULL, 'อยู่กับงานซ้ำๆได้'),
(59, 3, 'https://i.im.ge/2023/07/31/9CQcJ0.Bear-Front-17.jpg', NULL, 'เน้นข้อมูล'),
(60, 3, 'https://i.im.ge/2023/07/31/9CQWfL.Bear-Front-18.jpg', NULL, 'ควบคุมตัวเอง'),
(61, 3, 'https://i.im.ge/2023/07/31/9CQHIy.Bear-Front-19.jpg', NULL, 'ละเอียด'),
(62, 3, 'https://i.im.ge/2023/07/31/9CQpxS.Bear-Front-20.jpg', NULL, 'ชอบความถูกต้อง'),
(63, 3, 'https://i.im.ge/2023/07/31/9CQ4PF.Bear-Front-21.jpg', NULL, 'มีวินัย'),
(64, 4, 'https://i.im.ge/2023/07/31/9CTM9X.Falcon-Front-1.jpg', NULL, 'ใช้เหตุผล'),
(65, 4, 'https://i.im.ge/2023/07/31/9CToQh.Falcon-Front-2.jpg', NULL, 'มีพื้นที่ส่วนตัว'),
(66, 4, 'https://i.im.ge/2023/07/31/9CTOPC.Falcon-Front-3.jpg', NULL, 'นักกลยุทธ์'),
(67, 4, 'https://i.im.ge/2023/07/31/9CTaQf.Falcon-Front-4.jpg', NULL, 'นักคิด'),
(68, 4, 'https://i.im.ge/2023/07/31/9CT7Lm.Falcon-Front-5.jpg', NULL, 'เชื่อมโยง'),
(69, 4, 'https://i.im.ge/2023/07/31/9CTUq0.Falcon-Front-6.jpg', NULL, 'เบื่อง่าย'),
(70, 4, 'https://i.im.ge/2023/07/31/9CTjRx.Falcon-Front-7.jpg', NULL, 'มองการณ์ไกล'),
(71, 4, 'https://i.im.ge/2023/07/31/9CT6LJ.Falcon-Front-8.jpg', NULL, 'พร้อมเปลี่ยนแปลง'),
(72, 4, 'https://i.im.ge/2023/07/31/9CTP4S.Falcon-Front-9.jpg', NULL, 'คิดซับซ้อน'),
(73, 4, 'https://i.im.ge/2023/07/31/9CTCzF.Falcon-Front-10.jpg', NULL, 'พลิกแพลง'),
(74, 4, 'https://i.im.ge/2023/07/31/9CTYWX.Falcon-Front-11.jpg', NULL, 'ฟุ้งซ่าน'),
(75, 4, 'https://i.im.ge/2023/07/31/9CTgUh.Falcon-Front-12.jpg', NULL, 'รักการเรียนรู้'),
(76, 4, 'https://i.im.ge/2023/07/31/9CTVzC.Falcon-Front-13.jpg', NULL, 'ยืดหยุ่น'),
(77, 4, 'https://i.im.ge/2023/07/31/9CTkOq.Falcon-Front-14.jpg', NULL, 'เจ้าโปรเจค'),
(78, 4, 'https://i.im.ge/2023/07/31/9CTHWP.Falcon-Front-15.jpg', NULL, 'นักฝัน'),
(79, 4, 'https://i.im.ge/2023/07/31/9CTJUf.Falcon-Front-16.jpg', NULL, 'สังเกตการณ์'),
(80, 4, 'https://i.im.ge/2023/07/31/9CT4Br.Falcon-Front-17.jpg', NULL, 'สนุกกับแนวคิดใหม่ๆ'),
(81, 4, 'https://i.im.ge/2023/07/31/9CTey0.Falcon-Front-18.jpg', NULL, 'มองภาพกว้าง'),
(82, 4, 'https://i.im.ge/2023/07/31/9CoMHT.Falcon-Front-19.jpg', NULL, 'ชอบทดลอง'),
(83, 4, 'https://i.im.ge/2023/07/31/9CoFYJ.Falcon-Front-20.jpg', NULL, 'มองหาความเป็นไปได้ใหม่ๆ'),
(84, 4, 'https://i.im.ge/2023/07/31/9CoSyz.Falcon-Front-21.jpg', NULL, 'รักการผจญภัย');

-- --------------------------------------------------------

--
-- Table structure for table `personality`
--

CREATE TABLE `personality` (
  `personality_id` int(10) NOT NULL,
  `personality_type` varchar(50) NOT NULL,
  `animal_name_en` varchar(50) NOT NULL,
  `animal_name_th` varchar(50) NOT NULL,
  `animal_pic` varchar(1024) DEFAULT NULL,
  `description_en` varchar(500) DEFAULT NULL,
  `description_th` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personality`
--

INSERT INTO `personality` (`personality_id`, `personality_type`, `animal_name_en`, `animal_name_th`, `animal_pic`, `description_en`, `description_th`) VALUES
(1, 'Dominance', 'Bull', 'กระทิง', './image/Cow.jpg', 'Relates to control, power and assertiveness. A person who ranks highly in dominance places emphasis on accomplishing results and is often confident, outspoken, assertive and decisive.', 'คนแบบกระทิงมีลักษณะที่เป็นใจร้อนและกล้าแสดงออก มีจุดแข็งในการเปนผู้นำ รักพวกพ้องเพื่อนร่วมงาน และสามารถปกป้องคนรอบข้างได้ อย่างไรก็ตาม จุดอ่อนของคนแบบกระทิงคือมักมีเรื่องผิดพลาดเล็ก ๆ น้อย ๆ และชอบเปรียบเทียบตนเองกับผู้อื่น เสมอ ดังนั้น สิ่งที่ต้องแก้ไขคือรู้จักอดทน รอคอย ทบทวน และยอมรับความผิดพลาด เมื่อทำงานร่วมกับคนแบบกระทิงต้องสื่อสารให้ตรงประเด็นและชัดเจน และแนะนำให้เลือกอาชีพที่เหมาะสมเช่นการเป็นนักการเมือง สื่อสารมวลชน หรือทนายความ ที่มีบุคลิกแบบกระทิง.'),
(2, 'Influence', 'Rat', 'หนู', './image/Rat.jpg', 'Relates to social situations and communication. A person who ranks highly in this quadrant is often skilled at influencing or persuading others and tends to be optimistic, open, enthusiastic, trusting and energetic.', 'คนแบบหนูมีลักษณะที่อ่อนไหวง่ายและใช้อารมณ์มากกว่ากำลังหรือเหตุผล มีเมตตาและชอบช่วยเหลือผู้อื่นเสมอ นักสานสัมพันธ์กับเพื่อร่วมงานได้ดี อ่อนน้อม ประนีประนอม และมีนิสัยขี้เล่น ร่าเริง และคล่องแคล่ว จุดแข็งของคนแบบนี้คือมีน้ำใจและสร้างควมสุขให้กับคนรอบข้างได้ สามารถไกล่เกลี่ยและแก้ไขปัญหาความขัดแย้งได้ด้วยความสันติ แต่จุดอ่อนคือขาดความเชื่อมั่นในตนเอง ขี้กลัวและขี้เกรงใจ ควรพยายามเพิ่มความกล้า และสร้างความเชื่อมั่นในตนเองให้มากขึ้น เมื่อทำงานร่วมกับคนแบบนี้ควรใส่ใจความรู้สึกของหนูและไม่เารัดเอาเปรีย'),
(3, 'Steadiness', 'Bear', 'หมี', './image/Bear.jpg', 'Relates to patience, persistence and thoughtfulness. A person who ranks highly in steadiness places emphasis on cooperation, sincerety and dependability and tends to have calm, deliberate dispositions.', 'คนแบบหมีมีความเน้นทำงานช้า ๆ และรอบคอบ ชอบในหลักการและทฤษฎี งานทุกชิ้นจะต้องออกมาเป๊ะ ๆ โดยใช้ตรรกะและเหตุผลเข้ามาสนับสนุนเสมอชอบจดจ่อกับสิ่งใดสิ่งหนึ่ง และโลกส่วนตัวสูง เป็นคนละเอียด แม่นยำ รอบคอบถี่ถ้วน และมีความรับผิดชอบสูง รวมถึงมีระบบระเบียบหลักการ ทฤษฎี และกฎเกณฑ์ที่ชัดเจน อย่างไรก็ตาม คนแบหมีไม่ชอบการเปลี่ยนแปลง ขาดไอเดียและแนวคิดใหม่ ๆ ขาดความยืดหยุ่นในทำงาน และอาจเคร่งเครียดกว่าคนอื่น ๆ ในการทำงานร่วมกับคนแบบหมี อาจต้องให้เวลาตัดสินใจและการหาข้อมูล รวมถึงในการสื่อสารอาจจะต้องเน้นทฤษฎี ก'),
(4, 'Conscientious', 'Falcon', 'อินทรี', './image/Falcon.jpg', 'Relates to structure and organization. A person who ranks highly in this quadrant places emphasis on quality and accuracy and tends to enjoy their independence and be detail-oriented.\r\n\r\n', 'คนแบบอินทรีมีลักษณะนิสัยที่ชอบการเปลี่ยนแปลงและอิสระ ชอบการส้างสรรค์และมีไอเดียใหม่ ๆ ตลอดเวลา จึงมักมีโครงการใหม่ ๆ เกิดขึ้นเรื่อย ๆ อย่างกระตือรือร้น จุดแข็งของคนแบบนี้คือมีไหวพริบและมีวิธีคิดและขั้นตอนการทำงนที่แตกต่างไปจากคนอื่น ๆ สามารถเชื่อมโยงสิ่งต่าง ๆ และสร้างสรรค์ออกได้อย่างลงตัว แต่จุดอ่อนคือไม่ชอบความจำเจ ซ้ำซาก และเบื่อง่าย ควรจัดลำดับความสำคัญของงานและโฟกัสรายละเอียดของงานแต่ละงานให้ลึกซึ้ง เมื่อทำงานร่วมกับคนแบบนี้ควรช่วยจัดลำดับความสำคัญ และเสนอไอเดียเพิ่มเติมได้ อาชีพที่เหมาะสำห');

-- --------------------------------------------------------

--
-- Table structure for table `play_log`
--

CREATE TABLE `play_log` (
  `play_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `personality_id` int(10) NOT NULL,
  `play_date` date DEFAULT current_timestamp(),
  `play_time` time(3) DEFAULT current_timestamp(),
  `like_selected` varchar(30) DEFAULT NULL,
  `notlike_selected` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `play_log`
--

INSERT INTO `play_log` (`play_id`, `user_id`, `personality_id`, `play_date`, `play_time`, `like_selected`, `notlike_selected`) VALUES
(36, 8, 1, '2023-08-29', '10:40:31.000', '3 8 13 12 9 14 15 10 4 5', '3 8 7 9 4'),
(38, 8, 1, '2023-08-29', '11:15:06.000', '3 4 5 33 38 43 48 53 58 68', '58 63 68 73 78');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `email`, `first_name`, `last_name`) VALUES
(8, 'biesummer561@gmail.com', 'No.6', 'phetnakone');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `personality_id` (`personality_id`);

--
-- Indexes for table `personality`
--
ALTER TABLE `personality`
  ADD PRIMARY KEY (`personality_id`);

--
-- Indexes for table `play_log`
--
ALTER TABLE `play_log`
  ADD PRIMARY KEY (`play_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `personality_id` (`personality_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `personality`
--
ALTER TABLE `personality`
  MODIFY `personality_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `play_log`
--
ALTER TABLE `play_log`
  MODIFY `play_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`personality_id`) REFERENCES `personality` (`personality_id`);

--
-- Constraints for table `play_log`
--
ALTER TABLE `play_log`
  ADD CONSTRAINT `play_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  ADD CONSTRAINT `play_log_ibfk_2` FOREIGN KEY (`personality_id`) REFERENCES `personality` (`personality_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
