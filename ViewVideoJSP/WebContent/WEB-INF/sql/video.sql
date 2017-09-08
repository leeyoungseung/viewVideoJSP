-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 17-09-08 07:49
-- 서버 버전: 10.1.24-MariaDB
-- PHP 버전: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 데이터베이스: `mysql`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `video`
--

CREATE TABLE `video` (
  `vidNo` int(11) NOT NULL,
  `memNo` int(11) NOT NULL,
  `vidAddr` varchar(500) NOT NULL,
  `vidDate` date NOT NULL,
  `vidLike` int(11) DEFAULT NULL,
  `vidSub` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vidContent` varchar(800) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `video`
--

INSERT INTO `video` (`vidNo`, `memNo`, `vidAddr`, `vidDate`, `vidLike`, `vidSub`, `vidContent`) VALUES
(13, 5, 'https://www.youtube.com/embed/62ZIJpt0wz8', '2017-09-06', 0, 'twice1', 'twice1'),
(14, 5, 'https://www.youtube.com/embed/3l6Ht_EkdMk', '2017-09-06', 0, 'twice2', 'twice2'),
(16, 6, 'https://www.youtube.com/embed/K7VtJ3VXcy8', '2017-09-06', 0, '1111', '11111'),
(17, 5, 'https://www.youtube.com/embed/0F_XDGvENzc', '2017-09-08', 0, 'twice3', 'twice31'),
(18, 5, 'https://www.youtube.com/embed/0F_XDGvENzc', '2017-09-08', 0, '1111', '1111');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`vidNo`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `video`
--
ALTER TABLE `video`
  MODIFY `vidNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
