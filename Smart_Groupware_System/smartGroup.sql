-- phpMyAdmin SQL Dump
-- version 2.11.5.1
-- http://www.phpmyadmin.net
--
-- 호스트: localhost
-- 처리한 시간: 17-02-28 14:16 
-- 서버 버전: 5.5.17
-- PHP 버전: 5.2.17p1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 데이터베이스: `tsuyu040913`
--

-- --------------------------------------------------------

--
-- Structure for view `eb_search_book_view`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`tsuyu040913`@`localhost` SQL SECURITY DEFINER VIEW `tsuyu040913`.`eb_search_book_view` AS select `r`.`book_code` AS `도서코드`,`b`.`book_name` AS `도서명`,`r`.`lending_date` AS `대여일`,`r`.`return_date` AS `반납일`,`m`.`member_code` AS `멤버코드` from ((`tsuyu040913`.`eb_book` `b` join `tsuyu040913`.`eb_member` `m`) join `tsuyu040913`.`eb_receiptspayments` `r`) where ((`m`.`member_code` = `r`.`member_code`) and (`r`.`book_code` = `b`.`book_code`));

--
-- VIEW  `eb_search_book_view`
-- 데이터: 없음
--

