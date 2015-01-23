-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jan 23, 2015 at 11:22 AM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `mini_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
`id` int(11) NOT NULL,
  `content` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
`id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` tinytext NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `description`, `content`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'I experienced ''mixed reality'' with Microsoft''s holographic computer headset, ''HoloLens''', 'Unlike virtual reality, it''s much easier to describe what it''s like using Microsoft''s "mixed reality" holographic headset, HoloLens. Imagine you''re wearing sunglasses with completely transparent lenses, and overlaid on the world in front of you is a recta', 'Does it work? Yes, it works. Is it any good? That''s a much harder question to answer. In its current state, HoloLens is a series of demos with varying levels of polish, meant to demonstrate the possibility of the device. More clearly: In its current state, HoloLens is far from ready for public consumption. It''s an impressive demo in need of long-term investment, which Microsoft says is happening. All that baggage aside, what''s it like using HoloLens?\r\n\r\nI say this in the nicest way possible: Using Microsoft HoloLens kinda stinks. In its current form, it feels like someone is tightening your head into a vice. The model being shown today on Microsoft''s Redmond, Washington, campus isn''t what you saw onstage, but a development kit. It''s rough.\r\n\r\nWhat you do in the headset is impressive. Repeatedly. Sharing a Skype call with another human being overlaid on the real world, and that person being able to literally draw and highlight pieces of my world, is incredibly impressive. Uncomfortable as it is in its current form, HoloLens delivers an experience full of potential.\r\nĐược biết các nghiên cứu này thực hiện trong phòng thí nghiệm của Samsung, Creativity Lab (C-Lab), nơi các nhà khoa học được làm bất cứ thứ gì họ muốn để đưa ra các giải pháp có thể thương mại hóa được. 2 năm trước thì một nhóm các kỹ sư trong bộ phận máy giặt & điện thoại thông minh Samsung muốn làm một cái gì mới hơn và họ đã tạo ra dự án EDSAP. \r\n\r\nMỗi năm trên thế giới có hơn 15 triệu người bị tai biến mạch máu não và 66% số đó bị chết hoặc tật nguyền vĩnh viễn. Các bạn có thể tham khảo thêm thông tin ở liên kết nguồn bài viết.', 'http://o.aolcdn.com/hss/storage/midas/31154c5d2265538ef249901facaca165/201431149/Microsoft+HoloLens+', 1, 1, '2015-01-23 00:00:00', '2015-01-23 00:00:00'),
(4, 'IRL: A month with Sony''s A7 II full-frame mirrorless camera', 'When Sony announced its second-generation A7 mirrorless camera, much of the excitement prior to release was due to the device''s novel five-axis, in-body stabilization system that promised to steady shots with any lens -- new or old. Coupled with a 24.3-me', 'The good news is that Sony''s A7 II does deliver on the high expectations. But it''s not without limitations. For starters, the selection of full-frame E-mount lenses is narrow and, in some cases, quite expensive. Still, it''s not like you only have one or two options to choose from. Plus, you can always attach non-Sony mount lenses via adapters, giving you an alternative that, in theory, should work fine with the in-camera stabilization. I''ve spent my time with the A7 II using it alongside a 28-70mm, f/3.5-5.6 E-Mount Optical SteadyShot lens, and it''s been a beauty thus far. As expected, the A7 II produces high-quality shots, regardless of whether you''re shooting in broad daylight or in the wee hours of the night. In large part, that''s mostly due to its incredible full-frame sensor and BIONZ X image processor, which supports 14-bit RAW files and a maximum shutter speed of 1/8000.\r\n\r\nHaving said that, the A7 did struggle slightly when shooting at higher ISO levels, particularly in JPEG mode (the camera goes up to ISO 25,600). Yes, I know, this is why you should always -- always -- shoot RAW, but that won''t help anyone who''s trying to grab an image quickly and straight out of the camera. (I was shooting RAW + JPEG.) Nevertheless, there weren''t many scenarios where the A7 II underperformed; it can handle just about anything you throw it at it, so long as you keep in mind that in the end, it''s still a mirrorless camera.', 'http://o.aolcdn.com/hss/storage/midas/3b120969f02aeee5a89f067a895f5b47/201391266/P1120016.png', 2, 1, '2015-01-23 00:00:00', '2015-01-23 00:00:00'),
(5, 'IRL: A month with Sony''s A7 II full-frame mirrorless camera', 'When Sony announced its second-generation A7 mirrorless camera, much of the excitement prior to release was due to the device''s novel five-axis, in-body stabilization system that promised to steady shots with any lens -- new or old. Coupled with a 24.3-me', 'The good news is that Sony''s A7 II does deliver on the high expectations. But it''s not without limitations. For starters, the selection of full-frame E-mount lenses is narrow and, in some cases, quite expensive. Still, it''s not like you only have one or two options to choose from. Plus, you can always attach non-Sony mount lenses via adapters, giving you an alternative that, in theory, should work fine with the in-camera stabilization. I''ve spent my time with the A7 II using it alongside a 28-70mm, f/3.5-5.6 E-Mount Optical SteadyShot lens, and it''s been a beauty thus far. As expected, the A7 II produces high-quality shots, regardless of whether you''re shooting in broad daylight or in the wee hours of the night. In large part, that''s mostly due to its incredible full-frame sensor and BIONZ X image processor, which supports 14-bit RAW files and a maximum shutter speed of 1/8000.\r\n\r\nHaving said that, the A7 did struggle slightly when shooting at higher ISO levels, particularly in JPEG mode (the camera goes up to ISO 25,600). Yes, I know, this is why you should always -- always -- shoot RAW, but that won''t help anyone who''s trying to grab an image quickly and straight out of the camera. (I was shooting RAW + JPEG.) Nevertheless, there weren''t many scenarios where the A7 II underperformed; it can handle just about anything you throw it at it, so long as you keep in mind that in the end, it''s still a mirrorless camera.', 'http://www.blogcdn.com/slideshows/images/slides/321/635/3/S3216353/slug/s/dsc04340-1_200x130.jpg', 2, 1, '2015-01-23 00:00:00', '2015-01-23 00:00:00'),
(6, 'IRL: A month with Sony''s A7 II full-frame mirrorless camera', 'When Sony announced its second-generation A7 mirrorless camera, much of the excitement prior to release was due to the device''s novel five-axis, in-body stabilization system that promised to steady shots with any lens -- new or old. Coupled with a 24.3-me', 'The good news is that Sony''s A7 II does deliver on the high expectations. But it''s not without limitations. For starters, the selection of full-frame E-mount lenses is narrow and, in some cases, quite expensive. Still, it''s not like you only have one or two options to choose from. Plus, you can always attach non-Sony mount lenses via adapters, giving you an alternative that, in theory, should work fine with the in-camera stabilization. I''ve spent my time with the A7 II using it alongside a 28-70mm, f/3.5-5.6 E-Mount Optical SteadyShot lens, and it''s been a beauty thus far. As expected, the A7 II produces high-quality shots, regardless of whether you''re shooting in broad daylight or in the wee hours of the night. In large part, that''s mostly due to its incredible full-frame sensor and BIONZ X image processor, which supports 14-bit RAW files and a maximum shutter speed of 1/8000.\r\n\r\nHaving said that, the A7 did struggle slightly when shooting at higher ISO levels, particularly in JPEG mode (the camera goes up to ISO 25,600). Yes, I know, this is why you should always -- always -- shoot RAW, but that won''t help anyone who''s trying to grab an image quickly and straight out of the camera. (I was shooting RAW + JPEG.) Nevertheless, there weren''t many scenarios where the A7 II underperformed; it can handle just about anything you throw it at it, so long as you keep in mind that in the end, it''s still a mirrorless camera.', 'http://www.blogcdn.com/slideshows/images/slides/321/635/5/S3216355/slug/s/pa290292-1_200x130.jpg', 2, 1, '2015-01-23 00:00:00', '2015-01-23 00:00:00'),
(7, 'IRL: A month with Sony''s A7 II full-frame mirrorless camera', 'When Sony announced its second-generation A7 mirrorless camera, much of the excitement prior to release was due to the device''s novel five-axis, in-body stabilization system that promised to steady shots with any lens -- new or old. Coupled with a 24.3-me', 'The good news is that Sony''s A7 II does deliver on the high expectations. But it''s not without limitations. For starters, the selection of full-frame E-mount lenses is narrow and, in some cases, quite expensive. Still, it''s not like you only have one or two options to choose from. Plus, you can always attach non-Sony mount lenses via adapters, giving you an alternative that, in theory, should work fine with the in-camera stabilization. I''ve spent my time with the A7 II using it alongside a 28-70mm, f/3.5-5.6 E-Mount Optical SteadyShot lens, and it''s been a beauty thus far. As expected, the A7 II produces high-quality shots, regardless of whether you''re shooting in broad daylight or in the wee hours of the night. In large part, that''s mostly due to its incredible full-frame sensor and BIONZ X image processor, which supports 14-bit RAW files and a maximum shutter speed of 1/8000.\r\n\r\nHaving said that, the A7 did struggle slightly when shooting at higher ISO levels, particularly in JPEG mode (the camera goes up to ISO 25,600). Yes, I know, this is why you should always -- always -- shoot RAW, but that won''t help anyone who''s trying to grab an image quickly and straight out of the camera. (I was shooting RAW + JPEG.) Nevertheless, there weren''t many scenarios where the A7 II underperformed; it can handle just about anything you throw it at it, so long as you keep in mind that in the end, it''s still a mirrorless camera.', 'http://o.aolcdn.com/hss/storage/midas/3b120969f02aeee5a89f067a895f5b47/201391266/P1120016.png', 2, 1, '2015-01-23 00:00:00', '2015-01-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
`id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '1',
  `birthday` date NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL,
  `login_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `avatar`, `gender`, `birthday`, `address`, `city`, `email`, `mobile`, `group`, `last_login`, `login_hash`, `created_at`, `updated_at`) VALUES
(1, 'phucios', '123456', 'phúc', 'nguyen', NULL, 1, '2015-01-10', 'dấdad', 'aaaa', 'aaa@gmail.com', '2324234', 0, 0, NULL, '2013-12-02 05:19:37', '2015-01-13 03:13:16'),
(2, 'phuc', '123456', 'sadasd', 'aaa', 'aaaa', 1, '2015-01-12', NULL, NULL, '', NULL, 0, 0, NULL, '2015-01-12 00:00:00', '2015-01-12 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
