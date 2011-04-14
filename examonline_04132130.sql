-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2011 年 04 月 13 日 13:43
-- 服务器版本: 5.0.90
-- PHP 版本: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `examonline`
--

-- --------------------------------------------------------

--
-- 表的结构 `acl_privilege`
--

CREATE TABLE IF NOT EXISTS `acl_privilege` (
  `name` char(11) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `acl_privilege`
--

INSERT INTO `acl_privilege` (`name`) VALUES
('visit');

-- --------------------------------------------------------

--
-- 表的结构 `acl_resource`
--

CREATE TABLE IF NOT EXISTS `acl_resource` (
  `name` char(10) NOT NULL,
  `parent` int(11) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `acl_resource`
--

INSERT INTO `acl_resource` (`name`, `parent`) VALUES
('teacher1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `acl_role`
--

CREATE TABLE IF NOT EXISTS `acl_role` (
  `name` char(10) NOT NULL,
  `parent` char(11) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `acl_role`
--

INSERT INTO `acl_role` (`name`, `parent`) VALUES
('teacher', '0');

-- --------------------------------------------------------

--
-- 表的结构 `acl_rule`
--

CREATE TABLE IF NOT EXISTS `acl_rule` (
  `role` char(10) NOT NULL,
  `resource` char(10) NOT NULL,
  `privilege` char(10) NOT NULL,
  `allow` tinyint(1) NOT NULL,
  PRIMARY KEY  (`role`,`resource`,`privilege`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `acl_rule`
--

INSERT INTO `acl_rule` (`role`, `resource`, `privilege`, `allow`) VALUES
('teacher', 'teacher1', 'visit', 1);

-- --------------------------------------------------------

--
-- 表的结构 `audio_fillblank`
--

CREATE TABLE IF NOT EXISTS `audio_fillblank` (
  `fillblank_id` int(11) NOT NULL,
  `audio` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `audio_fillblank`
--

INSERT INTO `audio_fillblank` (`fillblank_id`, `audio`) VALUES
(8, '11301904013.mp3'),
(9, '11301904093.mp3');

-- --------------------------------------------------------

--
-- 表的结构 `audio_selection`
--

CREATE TABLE IF NOT EXISTS `audio_selection` (
  `selection_id` int(11) NOT NULL,
  `audio` text NOT NULL,
  KEY `selection_id` (`selection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `audio_selection`
--

INSERT INTO `audio_selection` (`selection_id`, `audio`) VALUES
(2, '11301903474.mp3'),
(3, '11301903527.mp3');

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL auto_increment,
  `class_name` char(100) NOT NULL,
  `teacher_id` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `class`
--

INSERT INTO `class` (`id`, `class_name`, `teacher_id`) VALUES
(1, '081班', '1'),
(2, '082班', '13'),
(3, '083班', '2'),
(4, '084班', '13'),
(5, '085班', '13');

-- --------------------------------------------------------

--
-- 表的结构 `class_student`
--

CREATE TABLE IF NOT EXISTS `class_student` (
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `class_student`
--

INSERT INTO `class_student` (`class_id`, `student_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- 表的结构 `examed`
--

CREATE TABLE IF NOT EXISTS `examed` (
  `examination_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY  (`examination_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `examed`
--

INSERT INTO `examed` (`examination_id`, `student_id`) VALUES
(0, 1),
(133, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 0),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 0),
(196, 1),
(197, 1),
(198, 1),
(199, 0),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 0),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 0),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 0),
(217, 1),
(217, 2),
(218, 1),
(218, 2),
(219, 1),
(219, 2),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 0),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 1),
(267, 1),
(268, 1),
(269, 1),
(271, 1),
(272, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(319, 1),
(320, 1),
(320, 2),
(321, 1),
(322, 1),
(322, 2),
(323, 1),
(324, 1),
(325, 1),
(326, 1),
(327, 1),
(327, 2),
(328, 1),
(328, 2),
(329, 1),
(329, 2),
(331, 1);

-- --------------------------------------------------------

--
-- 表的结构 `examination`
--

CREATE TABLE IF NOT EXISTS `examination` (
  `id` int(11) NOT NULL auto_increment,
  `paper_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=332 ;

--
-- 转存表中的数据 `examination`
--

INSERT INTO `examination` (`id`, `paper_id`, `name`, `startTime`, `endTime`, `category_id`) VALUES
(216, 57, 'eee', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2),
(217, 57, 'eee', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2),
(218, 57, 'eee', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2),
(219, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(220, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(221, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(222, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(223, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(224, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(225, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(226, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(227, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(228, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(229, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(230, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(231, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(232, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(233, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(234, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(235, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(236, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(237, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(238, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(239, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(240, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(241, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(242, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(243, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(244, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(245, 58, 'tt', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(246, 59, 'qq', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(247, 59, 'qq', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(248, 60, 'ww', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(249, 61, 'ee', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(250, 61, 'ee', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(251, 61, 'ee', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(252, 62, '123', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(253, 63, 'test', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(254, 64, 't2', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(255, 64, 't2', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(256, 64, 't2', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(257, 65, 'q1', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 2),
(258, 67, 'q222', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(259, 67, 'q222', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(260, 67, 'q222', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(261, 67, 'q222', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(262, 67, 'q222', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(263, 67, 'q222', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(264, 68, 'c', '0000-00-00 00:00:00', '2011-04-28 12:00:00', 1),
(319, 111, '这真的是六级额', '2011-04-01 16:17:00', '2011-04-28 17:17:00', 2),
(320, 111, '这真的是六级额', '2011-04-01 19:00:00', '2011-04-29 21:00:00', 2),
(321, 111, '这真的是六级额', '2011-04-01 19:00:00', '2011-04-29 21:00:00', 2),
(322, 111, '这真的是六级额', '2011-04-01 19:00:00', '2011-04-29 21:00:00', 2),
(323, 111, '这真的是六级额', '2011-04-06 00:00:00', '2011-04-25 00:00:00', 2),
(324, 111, '这真的是六级额', '2011-04-06 00:00:00', '2011-04-25 00:00:00', 2),
(325, 111, '这真的是六级额', '2011-04-06 00:00:00', '2011-04-25 00:00:00', 2),
(326, 111, '这真的是六级额', '2011-04-06 00:00:00', '2011-04-25 00:00:00', 2),
(327, 111, '这真的是六级额', '2011-04-06 00:00:00', '2011-04-25 00:00:00', 2),
(328, 111, '这真的是六级额', '2011-04-06 00:00:00', '2011-04-25 00:00:00', 2),
(329, 111, '这真的是六级额', '2011-04-06 00:00:00', '2011-04-25 00:00:00', 2),
(330, 88, 'wq', '2011-04-06 00:00:00', '2011-04-06 20:00:00', 1),
(331, 111, '这真的是六级额', '2011-04-06 00:00:00', '2011-04-28 00:00:00', 2);

-- --------------------------------------------------------

--
-- 表的结构 `examination_class`
--

CREATE TABLE IF NOT EXISTS `examination_class` (
  `examination_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `examination_class`
--

INSERT INTO `examination_class` (`examination_id`, `class_id`) VALUES
(218, 1),
(217, 1),
(216, 1),
(215, 1),
(214, 1),
(213, 1),
(212, 1),
(211, 1),
(210, 1),
(209, 1),
(208, 1),
(207, 1),
(206, 1),
(205, 1),
(204, 1),
(203, 1),
(202, 1),
(201, 1),
(200, 1),
(199, 1),
(198, 1),
(197, 1),
(196, 1),
(195, 1),
(194, 1),
(193, 1),
(192, 1),
(191, 1),
(190, 1),
(189, 1),
(188, 1),
(187, 1),
(186, 1),
(185, 1),
(184, 1),
(183, 1),
(182, 1),
(181, 1),
(180, 1),
(179, 1),
(178, 1),
(177, 1),
(176, 1),
(175, 1),
(174, 1),
(173, 1),
(172, 1),
(171, 1),
(170, 1),
(169, 1),
(168, 1),
(167, 1),
(166, 1),
(165, 1),
(164, 1),
(163, 1),
(162, 1),
(161, 1),
(160, 1),
(159, 1),
(158, 1),
(157, 1),
(156, 1),
(155, 1),
(154, 1),
(153, 2),
(153, 1),
(152, 3),
(152, 2),
(152, 1),
(151, 3),
(151, 2),
(151, 1),
(150, 1),
(149, 1),
(148, 1),
(147, 1),
(146, 1),
(145, 1),
(144, 1),
(143, 1),
(142, 1),
(141, 1),
(140, 1),
(139, 1),
(138, 1),
(137, 2),
(137, 1),
(136, 2),
(136, 1),
(135, 2),
(135, 1),
(134, 1),
(133, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 1),
(267, 1),
(268, 1),
(269, 1),
(270, 1),
(271, 1),
(272, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(279, 1),
(280, 1),
(281, 1),
(282, 1),
(283, 1),
(284, 1),
(285, 1),
(286, 1),
(287, 1),
(288, 1),
(289, 1),
(290, 1),
(291, 1),
(292, 1),
(293, 1),
(294, 1),
(295, 1),
(296, 1),
(297, 1),
(299, 1),
(300, 1),
(301, 1),
(302, 1),
(303, 1),
(304, 1),
(305, 1),
(306, 1),
(307, 1),
(308, 1),
(309, 1),
(310, 1),
(311, 1),
(312, 1),
(313, 1),
(314, 1),
(315, 1),
(316, 1),
(317, 1),
(318, 1),
(319, 1),
(320, 1),
(320, 2),
(321, 1),
(321, 2),
(322, 1),
(322, 2),
(323, 1),
(324, 1),
(325, 1),
(326, 1),
(327, 1),
(328, 1),
(329, 1),
(330, 1),
(331, 1),
(331, 2),
(331, 3),
(331, 4),
(331, 5);

-- --------------------------------------------------------

--
-- 表的结构 `examination_student`
--

CREATE TABLE IF NOT EXISTS `examination_student` (
  `examination_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `qualification` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `examination_student`
--

INSERT INTO `examination_student` (`examination_id`, `student_id`, `qualification`) VALUES
(307, 2, 0),
(307, 1, 0),
(306, 2, 1),
(306, 1, 1),
(1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fillblank`
--

CREATE TABLE IF NOT EXISTS `fillblank` (
  `id` int(11) NOT NULL auto_increment,
  `content` text NOT NULL,
  `answer` text NOT NULL,
  `hasAudio` tinyint(1) NOT NULL,
  `category` text NOT NULL,
  `score` double NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `fillblank`
--

INSERT INTO `fillblank` (`id`, `content`, `answer`, `hasAudio`, `category`, `score`) VALUES
(1, '<exam:flag=writing><p>\r\n	<strong>Part I Writing (30 minutes)<br />\r\n	</strong>　　注意：此部分试题在答题卡1上。<br />\r\n	　　Directions: For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:<br />\r\n	　　1. 如今不少学生在英语学习中不重视拼写<br />\r\n	　　2. 出现这种情况的原因<br />\r\n	　　3. 为了改变这种状况，我认为&hellip;<br />\r\n	　　Due Attention Should Be Given To Spelling<br />\r\n	　　</p>\r\n', '<p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n', 0, 'writing', 0),
(2, '<exam:flag=dictation><p>\r\n	<strong>Section C<br />\r\n	</strong>　　Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', 'chers ha#chers ha########\r\n#chers has', 1, 'dictation', 0),
(3, '<exam:flag=dictation><p>\r\n	<strong>Section C<br />\r\n	</strong>　　Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', '1#2#3#######5#6', 1, 'dictation', 0),
(4, '<exam:flag=dictation><p>\r\n	<strong>Section C<br />\r\n	</strong>　　Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', '1#2#3#######5#6', 1, 'dictation', 0),
(5, '<exam:flag=dictation><p>\r\n	<strong>Section C<br />\r\n	</strong>　　Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', '1#2#3#######5#6', 1, 'dictation', 0),
(6, '<exam:flag=dictation><p>\r\n	<strong>Section C<br />\r\n	</strong>　　Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', '1#2#3#######5#6', 1, 'dictation', 0),
(7, '<exam:flag=dictation><p>\r\n	<strong>Section C<br />\r\n	</strong>　　Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', '1#2#3#######5#6', 1, 'dictation', 0),
(8, '<exam:flag=dictation><p>\r\n	<strong>Section C<br />\r\n	</strong>　　Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', '1#2#3#######5#6', 1, 'dictation', 0),
(9, '<exam:flag=dictation><p>\r\n	<strong>Section C<br />\r\n	</strong>　　Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', '1#2#3#######5#6', 1, 'dictation', 0),
(10, '<exam:flag=writing><p>\r\n	11</p>\r\n<p>\r\n	2</p>\r\n<p>\r\n	3</p>\r\n', '<p>\r\n	23wasfdgdgfh</p>\r\n', 0, 'writing', 0),
(11, '<exam:flag=writing><p>\r\n	<strong>Part I Writing (30 minutes)<br />\r\n	</strong>　　注意：此部分试题在答题卡1上。<br />\r\n	　　Directions: For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:<br />\r\n	　　1. 如今不少学生在英语学习中不重视拼写<br />\r\n	　　2. 出现这种情况的原因<br />\r\n	　　3. 为了改变这种状况，我认为&hellip;<br />\r\n	　　Due Attention Should Be Given To Spelling<br />\r\n	&nbsp;</p>\r\n', '<p>\r\n	d 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline g</p>\r\n', 0, 'writing', 30);

-- --------------------------------------------------------

--
-- 表的结构 `leader_teacher`
--

CREATE TABLE IF NOT EXISTS `leader_teacher` (
  `leader_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `leader_teacher`
--

INSERT INTO `leader_teacher` (`leader_id`, `teacher_id`) VALUES
(2, 1),
(2, 13);

-- --------------------------------------------------------

--
-- 表的结构 `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `id` int(11) NOT NULL,
  `level_name` char(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `level`
--

INSERT INTO `level` (`id`, `level_name`) VALUES
(0, '学生'),
(1, '教师'),
(2, '系主任'),
(3, '管理员');

-- --------------------------------------------------------

--
-- 表的结构 `level_operation`
--

CREATE TABLE IF NOT EXISTS `level_operation` (
  `level_id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL,
  PRIMARY KEY  (`level_id`,`operation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `level_operation`
--

INSERT INTO `level_operation` (`level_id`, `operation_id`) VALUES
(1, 0),
(1, 1),
(1, 2),
(1, 3),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(2, 0),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(3, 0),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24);

-- --------------------------------------------------------

--
-- 表的结构 `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(100) NOT NULL,
  `action` char(100) NOT NULL,
  `controller` char(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `operation`
--

INSERT INTO `operation` (`id`, `name`, `action`, `controller`) VALUES
(1, '添加学生', 'addstudent', 'TeacherController'),
(0, '搜索学生', 'serchstudent', 'TeacherController'),
(2, '删除学生', 'deletestudent', 'TeacherController'),
(3, '编辑学生信息', 'editstudent', 'TeacherController'),
(4, '添加教师', 'addteacher', 'LeaderController'),
(5, '搜索教师', 'serchteacher', 'LeaderController'),
(6, '编辑教师管理班级', 'editteacher', 'LeaderController'),
(7, '清除教师', 'deleteteacher', 'LeaderController'),
(8, '修改学生分数', 'editscore', 'LeaderController'),
(9, '优化系统', 'optimize', 'AdminController'),
(10, '备份数据', 'backup', 'AdminController'),
(11, '添加系主任', 'addleader', 'AdminController'),
(12, '删除系主任', 'deleteleader', 'AdminController'),
(13, '设置系主任管理的教师', 'editleader', 'AdminController'),
(14, '设置考试', 'setexam', ''),
(15, '设置重考', 'setreexam', ''),
(16, '导出成绩', 'outputscore', ''),
(17, '搜索试卷', 'searchexam', ''),
(18, '添加试卷', 'addexam', ''),
(19, '编辑试卷', 'editexam', ''),
(20, '删除试卷', 'deleteexam', ''),
(21, '添加分类', 'addcategory', ''),
(22, '编辑分类', 'editcategory', ''),
(23, '删除分类', 'deletecategory', ''),
(24, '从题库中提取试题', 'queryparts', '');

-- --------------------------------------------------------

--
-- 表的结构 `paper`
--

CREATE TABLE IF NOT EXISTS `paper` (
  `id` int(11) NOT NULL auto_increment,
  `introduction` text,
  `listening_test` text,
  `title` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `time` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- 转存表中的数据 `paper`
--

INSERT INTO `paper` (`id`, `introduction`, `listening_test`, `title`, `category_id`, `time`) VALUES
(91, NULL, NULL, '六级啊啊', 2, NULL),
(90, NULL, NULL, '这是六级哦...你懂的', 2, NULL),
(89, NULL, NULL, '这是六级哦...你懂的', 2, NULL),
(88, NULL, NULL, 'wq', 1, NULL),
(87, NULL, NULL, 'qq', 1, NULL),
(86, NULL, NULL, 'q', 1, NULL),
(85, NULL, NULL, '12', 2, NULL),
(84, NULL, NULL, '12312', 2, NULL),
(83, NULL, NULL, '11111111', 1, NULL),
(82, NULL, NULL, '回答是否健康良好阿将卡上空间', 1, NULL),
(81, NULL, NULL, '回答是否健康良好阿将卡上空间', 1, NULL),
(80, NULL, NULL, '回答是否健康良好阿将卡上空间', 1, NULL),
(79, NULL, NULL, 'jac5', 1, NULL),
(78, NULL, NULL, 'jac4', 1, NULL),
(77, NULL, NULL, 'jac3', 1, NULL),
(76, NULL, NULL, '3', 1, NULL),
(75, NULL, NULL, 'jac2', 1, NULL),
(74, NULL, NULL, 'jac1', 1, NULL),
(73, NULL, NULL, 'tr', 1, NULL),
(72, NULL, NULL, 'a2', 1, NULL),
(71, NULL, NULL, 'a1', 1, NULL),
(70, NULL, NULL, 'ee', 1, NULL),
(69, NULL, NULL, 'qq', 1, NULL),
(68, NULL, NULL, 'c', 1, NULL),
(67, NULL, NULL, 'q222', 1, NULL),
(66, NULL, NULL, 'w1', 1, NULL),
(65, NULL, NULL, 'q1', 2, NULL),
(64, NULL, NULL, 't2', 1, NULL),
(63, NULL, NULL, 'test', 1, NULL),
(62, NULL, NULL, '123', 1, NULL),
(61, NULL, NULL, 'ee', 2, NULL),
(60, NULL, NULL, 'ww', 2, NULL),
(59, NULL, NULL, 'qq', 2, NULL),
(58, NULL, NULL, 'tt', 2, NULL),
(92, NULL, NULL, '六级啊啊', 2, NULL),
(93, NULL, NULL, '六级啊啊', 2, NULL),
(94, NULL, NULL, '123', 2, NULL),
(95, NULL, NULL, '12312', 2, NULL),
(96, NULL, NULL, '12312', 2, NULL),
(97, NULL, NULL, '12312', 2, NULL),
(98, NULL, NULL, '2134', 2, NULL),
(99, NULL, NULL, '2134', 2, NULL),
(100, NULL, NULL, '2134', 2, NULL),
(101, NULL, NULL, '331', 2, NULL),
(102, NULL, NULL, '123123', 2, NULL),
(103, NULL, NULL, '123123', 2, NULL),
(104, NULL, NULL, '123123', 2, NULL),
(105, NULL, NULL, '2341', 2, NULL),
(106, NULL, NULL, '1143', 2, NULL),
(107, NULL, NULL, 'trew', 2, NULL),
(108, NULL, NULL, '123123', 2, NULL),
(109, NULL, NULL, '123123', 2, NULL),
(110, NULL, NULL, 'weqr', 2, NULL),
(111, NULL, NULL, '这真的是六级额', 2, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `papercategory`
--

CREATE TABLE IF NOT EXISTS `papercategory` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `papercategory`
--

INSERT INTO `papercategory` (`id`, `name`) VALUES
(1, '四级'),
(2, '六级');

-- --------------------------------------------------------

--
-- 表的结构 `paper_answer`
--

CREATE TABLE IF NOT EXISTS `paper_answer` (
  `paper_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY  (`paper_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `paper_answer`
--

INSERT INTO `paper_answer` (`paper_id`, `answer`) VALUES
(3, '<part:1:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:2:2>B#B#B#B#A#B#D#12#23#34</part><part:3:3>B#B#D#A#C#D#C#B#B#C#C#D#1#2#3#######5#6</part>'),
(4, '<part:5:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:6:2>B#B#B#B#A#B#D#12#23#34</part><part:7:3>B#B#D#A#C#D#C#B#B#C#C#D#1#2#3#######5#6</part>'),
(5, '<part:9:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:10:2>B#B#B#B#A#B#D#12#23#34</part><part:11:3>1#2#3#######5#6</part>'),
(6, '<part:12:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:13:2>B#B#B#B#A#B#D#12#23#34</part><part:14:3>1#2#3#######5#6</part>'),
(7, '<part:16:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:17:2>B#B#B#B#A#B#D#12#23#34</part><part:18:3>1#2#3#######5#6</part><part:19:4>A#D#B#C#B</part>'),
(8, '<part:20:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n#B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B#1#2#3#######5#6#A#D#B#C#B#B#####B##########B####C#w#sdaf#sdaf##sdaf</part>'),
(9, '<part:21:1>B#C#C#D#1#2#3#######5#6#B#####B##########B####C</part><part:22:2>B#B#B#B#A#B#D#12#23#34</part><part:23:3>B#B#D#A#C#D#C#B</part>'),
(10, '<part:25:1>B#C#C#D#1#2#3#######5#6#B#####B##########B####C</part><part:26:2>B#B#B#B#A#B#D#12#23#34</part><part:27:3>B#B#D#A#C#D#C#B</part>'),
(11, '<part:29:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n#B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B</part><part:30:2>B#C#C#D#1#2#3#######5#6#A#D#B#C#B</part>'),
(12, '<part:32:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n#B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B#B#C#C#D</part>'),
(13, '<part:34:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n#B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B#B#C#C#D#1#2#3#######5#6#A#D#B#C#B#B#####B##########B####C#w#sdaf#sdaf##sdaf</part>'),
(14, '<part:35:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n#B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B#B#C#C#D</part><part:36:2>1#2#3#######5#6#A#D#B#C#B</part>'),
(15, '<part:37:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(16, '<part:38:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(17, '<part:39:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(18, '<part:40:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(19, '<part:41:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(20, '<part:42:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(21, '<part:43:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(22, '<part:44:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(23, '<part:45:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(24, '<part:46:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(25, '<part:47:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(26, '<part:48:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(28, '<part:50:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(29, '<part:51:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(30, '<part:52:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(31, '<part:53:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(32, '<part:54:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(33, '<part:55:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(34, '<part:56:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(35, '<part:57:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(36, '<part:58:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(37, '<part:59:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(38, '<part:60:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(39, '<part:61:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(40, '<part:62:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(41, '<part:63:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(42, '<part:64:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(43, '<part:65:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(44, '<part:66:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(45, '<part:67:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(46, '<part:68:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(47, '<part:69:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(48, '<part:70:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(49, '<part:71:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(50, '<part:72:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(51, '<part:73:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(52, '<part:74:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(53, '<part:75:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part>'),
(54, '<part:76:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part>'),
(55, '<part:77:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part>'),
(56, '<part:78:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(57, '<part:79:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(58, '<part:80:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part>'),
(59, '<part:81:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part>'),
(60, '<part:82:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part>'),
(61, '<part:83:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part>'),
(62, '<part:84:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:85:2>B#B#B#B#A#B#D#12#23#34</part>'),
(63, '<part:86:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:87:2>B#B#B#B#A#B#D#12#23#34</part><part:88:3>B#B#D#A#C#D#C#B</part>'),
(64, '<part:90:1>B#B#D#A#C#D#C#B#B#C#C#D</part><part:91:2>1#2#3#######5#6</part><part:92:3>w#sdaf#sdaf##sdaf</part>'),
(65, '<part:93:1>1#2#3#######5#6</part><part:94:2>B#####B##########B####C</part><part:95:3>w#sdaf#sdaf##sdaf</part>'),
(66, '<part:96:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:97:2>1#2#3#######5#6</part><part:98:3>B#####B##########B####C</part>'),
(67, '<part:100:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:101:2>1#2#3#######5#6</part><part:102:3>B#####B##########B####C#w#sdaf#sdaf##sdaf</part>'),
(68, '<part:103:1>B#####B##########B####C</part>'),
(69, '<part:104:1>B#####B##########B####C</part>'),
(70, '<part:105:1>B#####B##########B####C</part>'),
(71, '<part:106:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:107:2>B#B#B#B#A#B#D#12#23#34</part><part:108:3>B#B#D#A#C#D#C#B</part><part:109:4>B#C#C#D</part>'),
(72, '<part:110:1>1#2#3#######5#6</part><part:111:2>A#D#B#C#B</part><part:112:3>B#####B##########B####C</part><part:113:4>w#sdaf#sdaf##sdaf</part>'),
(73, '<part:114:1>w#sdaf#sdaf##sdaf</part>'),
(74, '<part:115:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:116:2>B#B#B#B#A#B#D#12#23#34</part><part:117:3>B#B#D#A#C#D#C#B</part><part:118:4>B#C#C#D</part>'),
(75, '<part:119:1>1#2#3#######5#6</part><part:120:2>A#D#B#C#B</part><part:121:3>B#####B##########B####C</part><part:122:4>w#sdaf#sdaf##sdaf</part>'),
(76, '<part:123:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part>'),
(77, '<part:124:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:125:2>B#B#D#A#C#D#C#B</part><part:126:3>A#D#B#C#B</part><part:127:4>B#####B##########B####C</part>'),
(78, '<part:128:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:129:2>1#2#3#######5#6</part><part:130:3>B#####B##########B####C</part>'),
(79, '<part:132:1>B#C#C#D</part><part:133:2>1#2#3#######5#6</part><part:134:3>B#####B##########B####C#w#sdaf#sdaf##sdaf</part>'),
(80, '<part:135:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(81, '<part:136:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(82, '<part:137:1><p>\r\n	23wasfdgdgfh</p>\r\n</part>'),
(83, '<part:138:1>###</part>'),
(84, '<part:139:1>A#C#C#B</part>'),
(85, '<part:140:1>A#C#C#B</part>'),
(86, '<part:141:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:142:2>B#B#B#B#A#B#D#12#23#34</part><part:143:3>B#B#D#A#C#D#C#B</part><part:144:4>B#C#C#D</part>'),
(87, '<part:145:1>1#2#3#######5#6</part><part:146:2>A#D#B#C#B</part><part:147:3>B#####B##########B####C</part>'),
(88, '<part:148:1>B#B#D#A#C#D#C#B#B#C#C#D</part>'),
(89, '<part:149:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:150:2>B#B#B#B#A#B#D#12#23#34</part><part:151:3>B#B#D#A#C#D#C#B#B#C#C#D</part>'),
(90, '<part:153:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:154:2>B#B#B#B#A#B#D#12#23#34</part><part:155:3>B#B#D#A#C#D#C#B#B#C#C#D</part>'),
(91, '<part:157:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:158:2>B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B#B#C#C#D</part><part:159:3>1#2#3#######5#6</part>'),
(92, '<part:161:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:162:2>B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B#B#C#C#D</part><part:163:3>1#2#3#######5#6</part>'),
(93, '<part:165:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:166:2>B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B#B#C#C#D</part><part:167:3>1#2#3#######5#6</part>'),
(94, '<part:169:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:170:2>B#B#B#B#A#B#D#12#23#34</part><part:171:3>B#B#D#A#C#D#C#B</part>'),
(95, '<part:173:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:174:2>B#B#B#B#A#B#D#12#23#34</part><part:175:3>B#B#D#A#C#D#C#B</part>'),
(96, '<part:177:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:178:2>B#B#B#B#A#B#D#12#23#34</part><part:179:3>B#B#D#A#C#D#C#B</part>'),
(97, '<part:181:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:182:2>B#B#B#B#A#B#D#12#23#34</part><part:183:3>B#B#D#A#C#D#C#B</part>'),
(98, '<part:185:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:186:2>B#B#B#B#A#B#D#12#23#34</part><part:187:3>B#B#D#A#C#D#C#B</part>'),
(99, '<part:189:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:190:2>B#B#B#B#A#B#D#12#23#34</part><part:191:3>B#B#D#A#C#D#C#B</part>'),
(100, '<part:193:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:194:2>B#B#B#B#A#B#D#12#23#34</part><part:195:3>B#B#D#A#C#D#C#B</part>'),
(101, '<part:197:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:198:2>B#B#B#B#A#B#D#12#23#34</part><part:199:3>1#2#3#######5#6#A#D#B#C#B</part>'),
(102, '<part:200:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:201:2>B#B#B#B#A#B#D#12#23#34</part>'),
(103, '<part:203:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:204:2>B#B#B#B#A#B#D#12#23#34</part>'),
(104, '<part:206:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:207:2>B#B#B#B#A#B#D#12#23#34</part>'),
(105, '<part:209:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:210:2>B#B#B#B#A#B#D#12#23#34</part><part:211:3>B#B#D#A#C#D#C#B</part><part:212:4>A#D#B#C#B</part>'),
(106, '<part:213:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:214:2>B#B#B#B#A#B#D#12#23#34</part><part:215:3>B#B#D#A#C#D#C#B#B#C#C#D</part>'),
(107, '<part:217:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n#B#B#B#B#A#B#D#12#23#34</part><part:218:2>B#B#D#A#C#D#C#B</part><part:219:3>1#2#3#######5#6#A#D#B#C#B</part>'),
(108, '<part:221:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:222:2>B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B</part><part:223:3>1#2#3#######5#6#A#D#B#C#B</part>'),
(109, '<part:225:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n</part><part:226:2>B#B#B#B#A#B#D#12#23#34#B#B#D#A#C#D#C#B</part><part:227:3>1#2#3#######5#6#A#D#B#C#B</part>'),
(110, '<part:229:1><p>\r\n	&nbsp;For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:</p>\r\n#B#B#B#B#A#B#D#12#23#34</part><part:230:2>B#B#D#A#C#D#C#B#B#C#C#D</part>'),
(111, '<part:232:1>For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below\r\n</part><part:233:2>1#2#3#######5#6</part><part:234:3>A#D#B#C#B</part>');

-- --------------------------------------------------------

--
-- 表的结构 `paper_part`
--

CREATE TABLE IF NOT EXISTS `paper_part` (
  `paper_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  KEY `paper_id` (`paper_id`),
  KEY `part_id` (`part_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `paper_part`
--

INSERT INTO `paper_part` (`paper_id`, `part_id`, `index`) VALUES
(3, 1, 1),
(3, 2, 2),
(3, 3, 3),
(3, 4, 4),
(4, 5, 1),
(4, 6, 2),
(4, 7, 3),
(4, 8, 4),
(5, 9, 1),
(5, 10, 2),
(5, 11, 3),
(6, 12, 1),
(6, 13, 2),
(6, 14, 3),
(6, 15, 4),
(7, 16, 1),
(7, 17, 2),
(7, 18, 3),
(7, 19, 4),
(8, 20, 1),
(9, 21, 1),
(9, 22, 2),
(9, 23, 3),
(9, 24, 4),
(10, 25, 1),
(10, 26, 2),
(10, 27, 3),
(10, 28, 4),
(11, 29, 1),
(11, 30, 2),
(11, 31, 3),
(12, 32, 1),
(12, 33, 2),
(13, 34, 1),
(14, 35, 1),
(14, 36, 2),
(15, 37, 1),
(16, 38, 1),
(17, 39, 1),
(18, 40, 1),
(19, 41, 1),
(20, 42, 1),
(21, 43, 1),
(22, 44, 1),
(23, 45, 1),
(24, 46, 1),
(25, 47, 1),
(26, 48, 1),
(27, 49, 1),
(28, 50, 1),
(29, 51, 1),
(30, 52, 1),
(31, 53, 1),
(32, 54, 1),
(33, 55, 1),
(34, 56, 1),
(35, 57, 1),
(36, 58, 1),
(37, 59, 1),
(38, 60, 1),
(39, 61, 1),
(40, 62, 1),
(41, 63, 1),
(42, 64, 1),
(43, 65, 1),
(44, 66, 1),
(45, 67, 1),
(46, 68, 1),
(47, 69, 1),
(48, 70, 1),
(49, 71, 1),
(50, 72, 1),
(51, 73, 1),
(52, 74, 1),
(53, 75, 1),
(54, 76, 1),
(55, 77, 1),
(56, 78, 1),
(57, 79, 1),
(58, 80, 1),
(59, 81, 1),
(60, 82, 1),
(61, 83, 1),
(62, 84, 1),
(62, 85, 2),
(63, 86, 1),
(63, 87, 2),
(63, 88, 3),
(63, 89, 4),
(64, 90, 1),
(64, 91, 2),
(64, 92, 3),
(65, 93, 1),
(65, 94, 2),
(65, 95, 3),
(66, 96, 1),
(66, 97, 2),
(66, 98, 3),
(66, 99, 4),
(67, 100, 1),
(67, 101, 2),
(67, 102, 3),
(68, 103, 1),
(69, 104, 1),
(70, 105, 1),
(71, 106, 1),
(71, 107, 2),
(71, 108, 3),
(71, 109, 4),
(72, 110, 1),
(72, 111, 2),
(72, 112, 3),
(72, 113, 4),
(73, 114, 1),
(74, 115, 1),
(74, 116, 2),
(74, 117, 3),
(74, 118, 4),
(75, 119, 1),
(75, 120, 2),
(75, 121, 3),
(75, 122, 4),
(76, 123, 1),
(77, 124, 1),
(77, 125, 2),
(77, 126, 3),
(77, 127, 4),
(78, 128, 1),
(78, 129, 2),
(78, 130, 3),
(78, 131, 4),
(79, 132, 1),
(79, 133, 2),
(79, 134, 3),
(80, 135, 1),
(81, 136, 1),
(82, 137, 1),
(83, 138, 1),
(84, 139, 1),
(85, 140, 1),
(86, 141, 1),
(86, 142, 2),
(86, 143, 3),
(86, 144, 4),
(87, 145, 1),
(87, 146, 2),
(87, 147, 3),
(88, 148, 1),
(89, 149, 1),
(89, 150, 2),
(89, 151, 3),
(89, 152, 4),
(90, 153, 1),
(90, 154, 2),
(90, 155, 3),
(90, 156, 4),
(91, 157, 1),
(91, 158, 2),
(91, 159, 3),
(91, 160, 4),
(92, 161, 1),
(92, 162, 2),
(92, 163, 3),
(92, 164, 4),
(93, 165, 1),
(93, 166, 2),
(93, 167, 3),
(93, 168, 4),
(94, 169, 1),
(94, 170, 2),
(94, 171, 3),
(94, 172, 4),
(95, 173, 1),
(95, 174, 2),
(95, 175, 3),
(95, 176, 4),
(96, 177, 1),
(96, 178, 2),
(96, 179, 3),
(96, 180, 4),
(97, 181, 1),
(97, 182, 2),
(97, 183, 3),
(97, 184, 4),
(98, 185, 1),
(98, 186, 2),
(98, 187, 3),
(98, 188, 4),
(99, 189, 1),
(99, 190, 2),
(99, 191, 3),
(99, 192, 4),
(100, 193, 1),
(100, 194, 2),
(100, 195, 3),
(100, 196, 4),
(101, 197, 1),
(101, 198, 2),
(101, 199, 3),
(102, 200, 1),
(102, 201, 2),
(102, 202, 3),
(103, 203, 1),
(103, 204, 2),
(103, 205, 3),
(104, 206, 1),
(104, 207, 2),
(104, 208, 3),
(105, 209, 1),
(105, 210, 2),
(105, 211, 3),
(105, 212, 4),
(106, 213, 1),
(106, 214, 2),
(106, 215, 3),
(106, 216, 4),
(107, 217, 1),
(107, 218, 2),
(107, 219, 3),
(107, 220, 4),
(108, 221, 1),
(108, 222, 2),
(108, 223, 3),
(108, 224, 4),
(109, 225, 1),
(109, 226, 2),
(109, 227, 3),
(109, 228, 4),
(110, 229, 1),
(110, 230, 2),
(110, 231, 3),
(111, 232, 1),
(111, 233, 2),
(111, 234, 3);

-- --------------------------------------------------------

--
-- 表的结构 `part`
--

CREATE TABLE IF NOT EXISTS `part` (
  `id` int(11) NOT NULL auto_increment,
  `direction` text,
  `time` text,
  `name` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=235 ;

--
-- 转存表中的数据 `part`
--

INSERT INTO `part` (`id`, `direction`, `time`, `name`) VALUES
(1, '', '', ''),
(2, '', '', ''),
(3, '', '', ''),
(4, '', '', ''),
(5, '', '', '1'),
(6, '', '', '12'),
(7, '', '', '123'),
(8, '', '', '1234'),
(9, '', '', '2'),
(10, '', '', '2'),
(11, '', '', '3'),
(12, '', '', ''),
(13, '', '', ''),
(14, '', '', ''),
(15, '', '', ''),
(16, '', '', ''),
(17, '', '', ''),
(18, '', '', ''),
(19, '', '', ''),
(20, '', '', ''),
(21, '', '', ''),
(22, '', '', ''),
(23, '', '', ''),
(24, '', '', ''),
(25, '', '', ''),
(26, '', '', ''),
(27, '', '', ''),
(28, '', '', ''),
(29, '', '', ''),
(30, '', '', ''),
(31, '', '', ''),
(32, '', '', ''),
(33, '', '', ''),
(34, '', '', ''),
(35, '', '', ''),
(36, '', '', ''),
(37, '', '', ''),
(38, '', '', '123'),
(39, '', '', ''),
(40, '', '', ''),
(41, '', '', ''),
(42, '', '', ''),
(43, '', '', ''),
(44, '', '', ''),
(45, '', '', ''),
(46, '', '', ''),
(47, '', '', ''),
(48, '', '', ''),
(49, '', '', ''),
(50, '', '', ''),
(51, '', '', ''),
(52, '', '', ''),
(53, '', '', ''),
(54, '', '', ''),
(55, '', '', ''),
(56, '', '', ''),
(57, '', '', ''),
(58, '', '', ''),
(59, '', '', ''),
(60, '', '', ''),
(61, '', '', ''),
(62, '', '', ''),
(63, '', '', ''),
(64, '', '', ''),
(65, '', '', ''),
(66, '', '', ''),
(67, '', '', ''),
(68, '', '', ''),
(69, '', '', ''),
(70, '', '', ''),
(71, '', '', ''),
(72, '', '', ''),
(73, '', '', ''),
(74, '', '', ''),
(75, '', '', ''),
(76, '', '', ''),
(77, '', '', ''),
(78, '', '', ''),
(79, '', '', ''),
(80, '', '', ''),
(81, '', '', ''),
(82, '', '', ''),
(83, '', '', ''),
(84, '', '', ''),
(85, '', '', ''),
(86, '', '', ''),
(87, '', '', ''),
(88, '', '', ''),
(89, '', '', ''),
(90, '', '', ''),
(91, '', '', ''),
(92, '', '', ''),
(93, '', '', ''),
(94, '', '', ''),
(95, '', '', ''),
(96, '', '', ''),
(97, '', '', ''),
(98, '', '', ''),
(99, '', '', ''),
(100, '', '', ''),
(101, '', '', ''),
(102, '', '', ''),
(103, '', '', ''),
(104, '', '', ''),
(105, '', '', ''),
(106, '', '', ''),
(107, '', '', ''),
(108, '', '', ''),
(109, '', '', ''),
(110, '', '', ''),
(111, '', '', ''),
(112, '', '', ''),
(113, '', '', ''),
(114, '', '', ''),
(115, '', '', ''),
(116, '', '', ''),
(117, '', '', ''),
(118, '', '', ''),
(119, '', '', ''),
(120, '', '', ''),
(121, '', '', ''),
(122, '', '', ''),
(123, '', '', ''),
(124, '', '', ''),
(125, '', '', ''),
(126, '', '', ''),
(127, '', '', ''),
(128, '', '', ''),
(129, '', '', ''),
(130, '', '', ''),
(131, '', '', ''),
(132, '', '', ''),
(133, '', '', ''),
(134, '', '', ''),
(135, '', '', ''),
(136, '', '', '23113123'),
(137, '', '', 'fff'),
(138, '', '', ''),
(139, '', '', ''),
(140, '', '', ''),
(141, '', '', '123'),
(142, '', '', '12312'),
(143, '', '', '123'),
(144, '', '', '231'),
(145, '', '', ''),
(146, '', '', ''),
(147, '', '', ''),
(148, '', '', ''),
(149, '', '', '321'),
(150, '', '', '123123'),
(151, '', '', '12312'),
(152, '', '', '听写是'),
(153, '', '', '321'),
(154, '', '', '123123'),
(155, '', '', '12312'),
(156, '', '', '听写是'),
(157, '', '', ''),
(158, '', '', ''),
(159, '', '', ''),
(160, '', '', ''),
(161, '', '', ''),
(162, '', '', ''),
(163, '', '', ''),
(164, '', '', ''),
(165, '', '', ''),
(166, '', '', ''),
(167, '', '', ''),
(168, '', '', ''),
(169, '', '', ''),
(170, '', '', ''),
(171, '', '', ''),
(172, '', '', ''),
(173, '', '', ''),
(174, '', '', ''),
(175, '', '', ''),
(176, '', '', ''),
(177, '', '', ''),
(178, '', '', ''),
(179, '', '', ''),
(180, '', '', ''),
(181, '', '', ''),
(182, '', '', ''),
(183, '', '', ''),
(184, '', '', ''),
(185, '', '', ''),
(186, '', '', ''),
(187, '', '', ''),
(188, '', '', ''),
(189, '', '', ''),
(190, '', '', ''),
(191, '', '', ''),
(192, '', '', ''),
(193, '', '', ''),
(194, '', '', ''),
(195, '', '', ''),
(196, '', '', ''),
(197, '', '', ''),
(198, '', '', ''),
(199, '', '', ''),
(200, '', '', ''),
(201, '', '', ''),
(202, '', '', ''),
(203, '', '', ''),
(204, '', '', ''),
(205, '', '', ''),
(206, '', '', ''),
(207, '', '', ''),
(208, '', '', ''),
(209, '', '', ''),
(210, '', '', ''),
(211, '', '', ''),
(212, '', '', ''),
(213, '', '', ''),
(214, '', '', ''),
(215, '', '', ''),
(216, '', '', ''),
(217, '', '', ''),
(218, '', '', ''),
(219, '', '', ''),
(220, '', '', ''),
(221, '', '', ''),
(222, '', '', ''),
(223, '', '', ''),
(224, '', '', ''),
(225, '', '', ''),
(226, '', '', ''),
(227, '', '', ''),
(228, '', '', ''),
(229, '', '', ''),
(230, '', '', ''),
(231, '', '', ''),
(232, '', '', 'w'),
(233, '', '', '听写'),
(234, '', '', '阅读');

-- --------------------------------------------------------

--
-- 表的结构 `part_category`
--

CREATE TABLE IF NOT EXISTS `part_category` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `part_category`
--


-- --------------------------------------------------------

--
-- 表的结构 `part_fillblank`
--

CREATE TABLE IF NOT EXISTS `part_fillblank` (
  `part_id` int(11) NOT NULL,
  `fillBlank_id` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  KEY `part_id` (`part_id`),
  KEY `fillBlank_id` (`fillBlank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `part_fillblank`
--

INSERT INTO `part_fillblank` (`part_id`, `fillBlank_id`, `index`) VALUES
(1, 1, 1),
(3, 9, 3),
(5, 1, 1),
(7, 9, 3),
(9, 1, 1),
(11, 9, 1),
(12, 1, 1),
(14, 9, 1),
(16, 1, 1),
(18, 9, 1),
(20, 1, 1),
(20, 9, 4),
(21, 9, 2),
(24, 1, 1),
(25, 9, 2),
(28, 1, 1),
(29, 1, 1),
(30, 9, 2),
(32, 1, 1),
(33, 9, 1),
(34, 1, 1),
(34, 9, 5),
(35, 1, 1),
(36, 9, 1),
(37, 10, 1),
(38, 10, 1),
(39, 10, 1),
(40, 10, 1),
(41, 10, 1),
(42, 10, 1),
(43, 10, 1),
(44, 10, 1),
(45, 10, 1),
(46, 10, 1),
(47, 10, 1),
(48, 10, 1),
(50, 10, 1),
(51, 10, 1),
(52, 10, 1),
(53, 10, 1),
(54, 10, 1),
(55, 10, 1),
(56, 10, 1),
(57, 10, 1),
(58, 10, 1),
(59, 10, 1),
(60, 10, 1),
(61, 10, 1),
(62, 10, 1),
(63, 10, 1),
(64, 10, 1),
(65, 10, 1),
(66, 10, 1),
(67, 10, 1),
(68, 10, 1),
(69, 10, 1),
(70, 10, 1),
(71, 10, 1),
(72, 10, 1),
(73, 10, 1),
(74, 10, 1),
(75, 1, 1),
(76, 1, 1),
(77, 1, 1),
(78, 10, 1),
(79, 10, 1),
(80, 1, 1),
(81, 1, 1),
(82, 1, 1),
(83, 1, 1),
(84, 1, 1),
(86, 1, 1),
(89, 9, 1),
(91, 9, 1),
(93, 9, 1),
(96, 1, 1),
(97, 9, 1),
(100, 1, 1),
(101, 9, 1),
(106, 1, 1),
(110, 9, 1),
(115, 1, 1),
(119, 9, 1),
(123, 1, 1),
(124, 1, 1),
(128, 1, 1),
(129, 9, 1),
(133, 9, 1),
(135, 10, 1),
(136, 10, 1),
(137, 10, 1),
(141, 1, 1),
(145, 9, 1),
(149, 1, 1),
(152, 9, 1),
(153, 1, 1),
(156, 9, 1),
(157, 1, 1),
(159, 9, 1),
(161, 1, 1),
(163, 9, 1),
(165, 1, 1),
(167, 9, 1),
(169, 1, 1),
(172, 9, 1),
(173, 1, 1),
(176, 9, 1),
(177, 1, 1),
(180, 9, 1),
(181, 1, 1),
(184, 9, 1),
(185, 1, 1),
(189, 1, 1),
(193, 1, 1),
(197, 1, 1),
(199, 9, 1),
(200, 1, 1),
(202, 9, 1),
(203, 1, 1),
(205, 9, 1),
(206, 1, 1),
(208, 9, 1),
(209, 1, 1),
(213, 1, 1),
(216, 9, 1),
(217, 1, 1),
(219, 9, 1),
(221, 1, 1),
(223, 9, 1),
(225, 1, 1),
(227, 9, 1),
(229, 1, 1),
(231, 9, 1),
(232, 1, 1),
(233, 9, 1);

-- --------------------------------------------------------

--
-- 表的结构 `part_selection`
--

CREATE TABLE IF NOT EXISTS `part_selection` (
  `part_id` int(11) NOT NULL,
  `selection_id` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  KEY `part_id` (`part_id`),
  KEY `selection_id` (`selection_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `part_selection`
--

INSERT INTO `part_selection` (`part_id`, `selection_id`, `index`) VALUES
(2, 1, 1),
(3, 2, 1),
(3, 3, 2),
(4, 4, 1),
(4, 6, 2),
(6, 1, 1),
(7, 2, 1),
(7, 3, 2),
(8, 4, 1),
(8, 6, 2),
(10, 1, 1),
(13, 1, 1),
(15, 4, 1),
(15, 5, 2),
(17, 1, 1),
(19, 4, 1),
(20, 1, 2),
(20, 2, 3),
(20, 4, 5),
(20, 5, 6),
(20, 6, 7),
(21, 3, 1),
(21, 5, 3),
(22, 1, 1),
(23, 2, 1),
(25, 3, 1),
(25, 5, 3),
(26, 1, 1),
(27, 2, 1),
(29, 1, 2),
(29, 2, 3),
(30, 3, 1),
(30, 4, 3),
(31, 5, 1),
(31, 6, 2),
(32, 1, 2),
(32, 2, 3),
(32, 3, 4),
(33, 4, 2),
(33, 5, 3),
(33, 6, 4),
(34, 1, 2),
(34, 2, 3),
(34, 3, 4),
(34, 4, 6),
(34, 5, 7),
(34, 6, 8),
(35, 1, 2),
(35, 2, 3),
(35, 3, 4),
(36, 4, 2),
(85, 1, 1),
(87, 1, 1),
(88, 2, 1),
(90, 2, 1),
(90, 3, 2),
(92, 6, 1),
(94, 5, 1),
(95, 6, 1),
(98, 5, 1),
(99, 6, 1),
(102, 5, 1),
(102, 6, 2),
(103, 5, 1),
(104, 5, 1),
(105, 5, 1),
(107, 1, 1),
(108, 2, 1),
(109, 3, 1),
(111, 4, 1),
(112, 5, 1),
(113, 6, 1),
(114, 6, 1),
(116, 1, 1),
(117, 2, 1),
(118, 3, 1),
(120, 4, 1),
(121, 5, 1),
(122, 6, 1),
(125, 2, 1),
(126, 4, 1),
(127, 5, 1),
(130, 5, 1),
(131, 6, 1),
(132, 3, 1),
(134, 5, 1),
(134, 6, 2),
(138, 7, 1),
(139, 8, 1),
(140, 8, 1),
(142, 1, 1),
(143, 2, 1),
(144, 3, 1),
(146, 4, 1),
(147, 5, 1),
(148, 2, 1),
(148, 3, 2),
(150, 1, 1),
(151, 2, 1),
(151, 3, 2),
(154, 1, 1),
(155, 2, 1),
(155, 3, 2),
(158, 1, 1),
(158, 2, 2),
(158, 3, 3),
(160, 4, 1),
(160, 5, 2),
(162, 1, 1),
(162, 2, 2),
(162, 3, 3),
(164, 4, 1),
(164, 5, 2),
(166, 1, 1),
(166, 2, 2),
(166, 3, 3),
(168, 4, 1),
(168, 5, 2),
(170, 1, 1),
(171, 2, 1),
(172, 4, 2),
(174, 1, 1),
(175, 2, 1),
(178, 1, 1),
(179, 2, 1),
(182, 1, 1),
(183, 2, 1),
(186, 1, 1),
(187, 2, 1),
(188, 5, 1),
(190, 1, 1),
(191, 2, 1),
(192, 5, 1),
(194, 1, 1),
(195, 2, 1),
(196, 5, 1),
(198, 1, 1),
(199, 4, 2),
(201, 1, 1),
(202, 4, 2),
(202, 5, 3),
(202, 6, 4),
(204, 1, 1),
(205, 4, 2),
(205, 5, 3),
(205, 6, 4),
(207, 1, 1),
(208, 4, 2),
(208, 5, 3),
(208, 6, 4),
(210, 1, 1),
(211, 2, 1),
(212, 4, 1),
(214, 1, 1),
(215, 2, 1),
(215, 3, 2),
(216, 4, 2),
(216, 5, 3),
(216, 6, 4),
(217, 1, 2),
(218, 2, 1),
(219, 4, 2),
(220, 5, 1),
(220, 6, 2),
(222, 1, 1),
(222, 2, 2),
(223, 4, 2),
(224, 5, 1),
(224, 6, 2),
(226, 1, 1),
(226, 2, 2),
(227, 4, 2),
(228, 5, 1),
(228, 6, 2),
(229, 1, 2),
(230, 2, 1),
(230, 3, 2),
(231, 4, 2),
(234, 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `reexamination`
--

CREATE TABLE IF NOT EXISTS `reexamination` (
  `examination_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `parts` text NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`examination_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reexamination`
--

INSERT INTO `reexamination` (`examination_id`, `student_id`, `parts`, `teacher_id`, `time`) VALUES
(309, 1, '145#146#147', 1, '2011-04-08 15:27:09'),
(292, 1, '124#125', 1, '2011-04-08 15:26:56');

-- --------------------------------------------------------

--
-- 表的结构 `savereexamination`
--

CREATE TABLE IF NOT EXISTS `savereexamination` (
  `examination_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `parts` text NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY  (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `savereexamination`
--

INSERT INTO `savereexamination` (`examination_id`, `student_id`, `parts`, `teacher_id`, `time`) VALUES
(150, 1, '29#30', 3, '2011-04-05 19:29:29'),
(284, 1, '125#126', 1, '2011-04-08 15:27:02'),
(319, 1, '232#234', 1, '2011-04-09 01:52:34');

-- --------------------------------------------------------

--
-- 表的结构 `score`
--

CREATE TABLE IF NOT EXISTS `score` (
  `student_id` int(11) NOT NULL,
  `examination_id` int(11) NOT NULL,
  `parts_score` text NOT NULL,
  `total_score` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `score`
--

INSERT INTO `score` (`student_id`, `examination_id`, `parts_score`, `total_score`) VALUES
(1, 1, '1', 2),
(1, 321, '', 50),
(1, 322, ' ', 900),
(1, 311, '', 60),
(1, 313, '', 7),
(1, 260, ' 1#2', 12),
(3, 261, ' ', 1000),
(1, 328, ' ', 10),
(1, 329, '#', 100),
(2, 329, '#', 100),
(2, 328, '#', 100),
(2, 327, '#', 90),
(1, 331, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `selection`
--

CREATE TABLE IF NOT EXISTS `selection` (
  `id` int(11) NOT NULL auto_increment,
  `content` text NOT NULL,
  `answer` text NOT NULL,
  `hasAudio` tinyint(1) NOT NULL,
  `category` text NOT NULL,
  `score` double NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `selection`
--

INSERT INTO `selection` (`id`, `content`, `answer`, `hasAudio`, `category`, `score`) VALUES
(1, '<exam:flag=fastReading><es:content><p>\r\n	<strong>Part II Reading Comprehension (Skimming and Scanning) (15 minutes)<br />\r\n	</strong>　　Directions: In this part, you will have 15 minutes to go over the passage quickly and answer the questions on Answer Sheet 1. For questions 1-7, choose the best answer from the four choices marked A), B), C) and D). For questions 8-10, complete the sentences with the information given in the passage.<br />\r\n	　　Caught in the Web<br />\r\n	　　A few months ago, it wasn&#39;t unusual for 47-year-old Carla Toebe to spend 15 hours per day online. She&#39;d wake up early, turn on her laptop and chat on Internet dating sites and instant-messaging programs &ndash; leaving her bed for only brief intervals. Her household bills piled up, along with the dishes and dirty laundry, but it took near-constant complaints from her four daughters before she realized she had a problem.<br />\r\n	　　&quot;I was starting to feel like my whole world was falling apart &ndash; kind of slipping into a depression,&quot; said Carla. &quot;I knew that if I didn&#39;t get off the dating sites, I&#39;d just keep going,&quot; detaching (使脱离) herself further from the outside world.<br />\r\n	　　Toebe&#39;s conclusion: She felt like she was &quot;addicted&quot; to the Internet. She&#39;s not alone.<br />\r\n	　　Concern about excessive Internet use isn&#39;t new. As far back as 1995, articles in medical journals and the establishment of a Pennsylvania treatment center for overusers generated interest in the subject. There&#39;s still no consensus on how much time online constitutes too much or whether addiction is possible.<br />\r\n	　　But as reliance on the Web grows, there are signs that the question is getting more serious attention: Last month, a study published in CNS Spectrums claimed to be the first large-scale look at excessive Internet use. The American Psychiatric Association may consider listing Internet addiction in the next edition of its diagnostic manual. And scores of online discussion boards have popped up on which people discuss negative experiences tied to too much time on the Web.<br />\r\n	　　&quot;There&#39;s no question that there&#39;re people who&#39;re seriously in trouble because they&#39;re overdoing their Internet involvement,&quot; said psychiatrist (精神科医生) Ivan Goldberg. Goldberg calls the problem a disorder rather than a true addiction.<br />\r\n	　　Jonathan Bishop, a researcher in Wales specializing in online communities, is more skeptical. &quot;The Internet is an environment,&quot; he said. &quot;You can&#39;t be addicted to the environment.&quot; Bishop describes the problem as simply a matter of priorities, which can be solved by encouraging people to prioritize other life goals and plans in place of time spent online.<br />\r\n	　　The new CNS Spectrums study was based on results of a nationwide telephone survey of more than 2,500 adults. Like the 2005 survey, this one was conducted by Stanford University researchers.About 6% of respondents reported that &quot;their relationships suffered because of excessive Internet use.&quot; About 9% attempted to conceal &quot;nonessential Internet use,&quot; and nearly 4% reported feeling &quot;preoccupied by the Internet when offline.&quot;<br />\r\n	　　About 8% said they used the Internet as a way to escape problems, and almost 14% reported they &quot;found it hard to stay away from the Internet for several days at a time.&quot;<br />\r\n	　　&quot;The Internet problem is still in its infancy,&quot; said Elias Aboujaoude, a Stanford professor. No single online activity is to blame for excessive use, he said. &quot;They&#39;re online in chat rooms, checking e-mail, or writing blogs. [The problem is] not limited to porn (色情) or gambling&quot; websites.<br />\r\n	　　Excessive Internet use should be defined not by the number of hours spent online but &quot;in terms of losses,&quot; said Maressa Orzack, a Harvard University professor. &quot;If it&#39;s a loss [where] you&#39;re not getting to work, and family relationships are breaking down as a result, then it&#39;s too much.&quot;<br />\r\n	　　Since the early 1990s, several clinics have been established in the U. S. to treat heavy Internet users. They include the Center for Internet Addiction Recovery and the Center for Internet Behavior.<br />\r\n	　　The website for Orzack&#39;s center lists the following among the psychological symptoms of computer addiction:<br />\r\n	　　● Having a sense of well-being (幸福) or excitement while at the computer.<br />\r\n	　　● Longing for more and more time at the computer.<br />\r\n	　　● Neglect of family and friends.<br />\r\n	　　● Feeling empty, depressed or irritable when not at the computer.<br />\r\n	　　● Lying to employers and family about activities.<br />\r\n	　　● Inability to stop the activity.<br />\r\n	　　● Problems with school or job.<br />\r\n	　　Physical symptoms listed include dry eyes, backaches, skipping meals, poor personal hygiene (卫生) and sleep disturbances.<br />\r\n	　　People who struggle with excessive Internet use maybe depressed or have other mood disorders, Orzack said. When she discusses Internet habits with her patients, they often report that being online offers a &quot;sense of belonging, and escape, excitement [and] fun,&quot; she said. &quot;Some people say relief&hellip;because they find themselves so relaxed.&quot;<br />\r\n	　　Some parts of the Internet seem to draw people in more than others. Internet gamers spend countless hours competing in games against people from all over the world. One such game, called World of Warcraft, is cited on many sites by posters complaining of a &quot;gaming addiction.&quot;<br />\r\n	　　Andrew Heidrich, an education network administrator from Sacramento, plays World of Warcraft for about two to four hours every other night, but that&#39;s nothing compared with the 40 to 60 hours a week he spent playing online games when he was in college. He cut back only after a full-scale family intervention (干预), in which relatives told him he&#39;d gained weight.<br />\r\n	　　&quot;There&#39;s this whole culture of competition that sucks people in&quot; with online gaming, said Heidrich, now a father of two. &quot;People do it at the expense of everything that was a constant in their lives.&quot; Heidrich now visits websites that discuss gaming addiction regularly &quot;to remind myself to keep my love for online games in check.&quot;<br />\r\n	　　Toebe also regularly visits a site where posters discuss Internet overuse. In August, when she first realized she had a problem, she posted a message on a Yahoo Internet addiction group with the subject line: &quot;I have an Internet Addiction.&quot;<br />\r\n	　　&quot;I&#39;m self-employed and need the Internet for my work, but I&#39;m failing to accomplish my work,to take care of my home, to give attention to my children,&quot; she wrote in a message sent to the group.&quot;I have no money or insurance to get professional help; I can&#39;t even pay my mortgage (抵押贷款) and face losing everything.&quot;<br />\r\n	　　Since then, Toebe said, she has kept her promise to herself to cut back on her Internet use. &quot;I have a boyfriend now, and I&#39;m not interested in online dating,&quot; she said by phone last week. &quot;It&#39;s a lot better now.&quot;<br />\r\n	　　注意：此部分试题请在答题卡1上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What eventually made Carla Toebe realize she was spending too much time on the Internet?<br />\r\n	　　</eo:question><eo:selection>A) Her daughter&#39;s repeated complaints.<br />\r\n	　　</eo:selection><eo:selection>B) Fatigue resulting from lack of sleep.<br />\r\n	　　</eo:selection><eo:selection>C) The poorly managed state of her house.<br />\r\n	　　</eo:selection><eo:selection>D) The high financial costs adding up.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What does the author say about excessive Internet use?<br />\r\n	　　</eo:question><eo:selection>A) People should be warned of its harmful consequences.<br />\r\n	　　</eo:selection><eo:selection>B) It has become virtually inevitable.<br />\r\n	　　</eo:selection><eo:selection>C) It has been somewhat exaggerated.<br />\r\n	　　</eo:selection><eo:selection>D) People haven&#39;t yet reached agreement on its definition.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Jonathan Bishop believes that the Internet overuse problem can be solved if people ______.<br />\r\n	　　</eo:question><eo:selection>A) try to improve the Internet environment<br />\r\n	　　</eo:selection><eo:selection>B) become aware of its serious consequences<br />\r\n	　　</eo:selection><eo:selection>C) can realize what is important in life<br />\r\n	　　</eo:selection><eo:selection>D) can reach a consensus on its definition<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Professor Maressa Orzack, Internet use would be considered excessive if ______.<br />\r\n	　　</eo:question><eo:selection>A) it seriously affected family relationships<br />\r\n	　　</eo:selection><eo:selection>B) one visited porn websites frequently<br />\r\n	　　</eo:selection><eo:selection>C) too much time was spent in chat rooms<br />\r\n	　　</eo:selection><eo:selection>D) people got involved in online gambling<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Orzack, people who struggle with heavy reliance on the Internet may feel ______.<br />\r\n	　　</eo:question><eo:selection>A) discouraged<br />\r\n	　　</eo:selection><eo:selection>B) pressured<br />\r\n	　　</eo:selection><eo:selection>C) depressed<br />\r\n	　　</eo:selection><eo:selection>D) puzzled<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why did Andre Heidrich cut back online gaming?<br />\r\n	　　</eo:question><eo:selection>A) He had lost a lot of money.<br />\r\n	　　</eo:selection><eo:selection>B) His family had intervened.<br />\r\n	　　</eo:selection><eo:selection>C) He had offended his relatives.<br />\r\n	　　</eo:selection><eo:selection>D) His career had been ruined.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Andrew Heidrich now visits websites that discuss online gaming addiction to ______.<br />\r\n	　　</eo:question><eo:selection>A) improve his online gaming skills<br />\r\n	　　</eo:selection><eo:selection>B) curb his desire for online gaming<br />\r\n	　　</eo:selection><eo:selection>C) show how good he is at online gaming<br />\r\n	　　</eo:selection><eo:selection>D) exchange online gaming experience<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:fillblank> In one of the messages she posted on a website, Toebe admitted that she <eo:blank>.<br />\r\n	　　</eo:fillblank></eo:question><eo:question><eo:fillblank> Excessive Internet use had rendered Toebe so poor that she couldn&#39;t afford to seek <eo:blank>.<br />\r\n	　　</eo:fillblank></eo:question><eo:question><eo:fillblank> Now that she&#39;s got a boyfriend, Toebe is no longer crazy about <eo:blank>.</p>\r\n</eo:fillblank></eo:question>', 'B#B#B#B#A#B#D#12#23#34', 0, 'fastReading', 10),
(2, '<exam:flag=shortListening><es:content><p>\r\n	<strong>Part III Listening Comprehension (35 minutes)<br />\r\n	</strong><strong>　　</strong><strong>Section A</strong><br />\r\n	　　Directions: In this section, you will hear 8 short conversations and 2 long conversations. At the end of each conversation, one or more questions will be asked about what was said.Both the conversation and the questions will be spoken only once. After each question there will be a pause. During the pause, you must read the four choices marked A), B),C) and D), and decide which is the best answer. Then mark the corresponding letter on Answer Sheet 2 with a single line through the centre.<br />\r\n	　　</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	注意：此部分试题请在答题卡2上作答。<br />\r\n	　　</eo:content><eo:question><eo:question></eo:question><eo:selection>A) He has proved to be a better reader than the woman.<br />\r\n	　　</eo:selection><eo:selection>B) He has difficulty understanding the book.<br />\r\n	　　</eo:selection><eo:selection>C) He cannot get access to the assigned book.<br />\r\n	　　</eo:selection><eo:selection>D) He cannot finish his assignment before the deadline.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) She will drive the man to the supermarket.<br />\r\n	　　</eo:selection><eo:selection>B) The man should buy a car of his own.<br />\r\n	　　</eo:selection><eo:selection>C) The man needn&#39;t go shopping every week.<br />\r\n	　　</eo:selection><eo:selection>D) She can pick the man up at the grocery store.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Get more food and drinks.<br />\r\n	　　</eo:selection><eo:selection>B) Ask his friend to come over.<br />\r\n	　　</eo:selection><eo:selection>C) Tidy up the place.<br />\r\n	　　</eo:selection><eo:selection>D) Hold a party.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) The talks can be held any day except this Friday.<br />\r\n	　　</eo:selection><eo:selection>B) He could change his schedule to meet John Smith.<br />\r\n	　　</eo:selection><eo:selection>C) The first-round talks should start as soon as possible.<br />\r\n	　　</eo:selection><eo:selection>D) The woman should contact John Smith first.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) He understands the woman&#39;s feelings.<br />\r\n	　　</eo:selection><eo:selection>B) He has gone through a similar experience.<br />\r\n	　　</eo:selection><eo:selection>C) The woman should have gone on the field trip.<br />\r\n	　　</eo:selection><eo:selection>D) The teacher is just following the regulations.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) She will meet the man halfway.<br />\r\n	　　</eo:selection><eo:selection>B) She will ask David to talk less.<br />\r\n	　　</eo:selection><eo:selection>C) She is sorry the man will not come.<br />\r\n	　　</eo:selection><eo:selection>D) She has to invite David to the party.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Few students understand Prof. Johnson&#39;s lectures.<br />\r\n	　　</eo:selection><eo:selection>B) Few students meet Prof. Jonson&#39;s requirements.<br />\r\n	　　</eo:selection><eo:selection>C) Many students find Prof. Johnson&#39;s lectures boring.<br />\r\n	　　</eo:selection><eo:selection>D) Many students have dropped Prof. Johnson&#39;s class.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Check their computer files.<br />\r\n	　　</eo:selection><eo:selection>B) Make some computations.<br />\r\n	　　</eo:selection><eo:selection>C) Study a computer program.<br />\r\n	　　</eo:selection><eo:selection>D) Assemble a computer.<br />\r\n	<br />\r\n	&nbsp;</p>\r\n</eo:selection></eo:question>', 'B#B#D#A#C#D#C#B', 1, 'shortListening', 0),
(3, '<exam:flag=longListening><es:content><p>\r\n	<strong>Section B<br />\r\n	</strong>　　Directions: In this section, you will hear 3 short passages. At the end of each passage, you will hear some questions. Both the passage and the questions will be spoken only once.After you hear a question, you must choose the best answer from the four choices marked A), B), C) and D). Then mark the corresponding letter on Answer Sheet 2 with a single line through the centre.<br />\r\n	　　注意：此部分试题请在答题卡2上作答。<br />\r\n	　　<strong>Passage One<br />\r\n	　　</strong>Questions 26 to 29 are based on the conversation you have just heard.<br />\r\n	　　</eo:content><eo:question><eo:question></eo:question><eo:selection>A) District managers.<br />\r\n	　　</eo:selection><eo:selection>B) Regular customers.<br />\r\n	　　</eo:selection><eo:selection>C) Sales directors.<br />\r\n	　　</eo:selection><eo:selection>D) Senior clerks.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) The support provided by the regular clients.<br />\r\n	　　</eo:selection><eo:selection>B) The initiative shown by the sales representatives.<br />\r\n	　　</eo:selection><eo:selection>C) The urgency of implementing the company&#39;s plans.<br />\r\n	　　</eo:selection><eo:selection>D) The important part played by district managers.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Some of them were political-minded.<br />\r\n	　　</eo:selection><eo:selection>B) Fifty percent of them were female.<br />\r\n	　　</eo:selection><eo:selection>C) One third of them were senior managers.<br />\r\n	　　</eo:selection><eo:selection>D) Most of them were rather conservative.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) He used too many quotations.<br />\r\n	　　</eo:selection><eo:selection>B) He was not gender sensitive.<br />\r\n	　　</eo:selection><eo:selection>C) He did not keep to the point.<br />\r\n	　　</eo:selection><eo:selection>D) He spent too much time on details.<br />\r\n	&nbsp;</p>\r\n</eo:selection></eo:question>', 'B#C#C#D', 1, 'longListening', 0),
(4, '<exam:flag=reading><es:content><p>\r\n	<strong>Passage One<br />\r\n	</strong>　　Questions 57 to 61 are based on the following passage.<br />\r\n	　　You never see him, but they&#39;re with you every time you fly. They record where you are going,how fast you&#39;re traveling and whether everything on your airplane is functioning normally. Their ability to withstand almost any disaster makes them seem like something out of a comic book.They&#39;re known as the black box.<br />\r\n	　　When planes fall from the sky, as a Yemeni airliner did on its way to Comoros Islands in the India ocean June 30, 2009, the black box is the best bet for identifying what went wrong. So when a French submarine (潜水艇) detected the device&#39;s homing signal five days later, the discovery marked a huge step toward determining the cause of a tragedy in which 152 passengers were killed.<br />\r\n	　　In 1958, Australian scientist David Warren developed a flight-memory recorder that would track basic information like altitude and direction. That was the first mode for a black box, which became a requirement on all U.S. commercial flights by 1960. Early models often failed to withstand crashes, however, so in 1965 the device was completely redesigned and moved to the rear of the plane &ndash; the area least subject to impact &ndash; from its original position in the landing wells (起落架舱). The same year, the Federal Aviation Authority required that the boxes, which were never actually black, be painted orange or yellow to aid visibility.<br />\r\n	　　Modern airplanes have two black boxes: a voice recorder, which tracks pilots&#39; conversations,and a flight-data recorder, which monitors fuel levels, engine noises and other operating functions that help investigators reconstruct the aircraft&#39;s final moments. Placed in an insulated (隔绝的) case and surrounded by a quarter-inch-thick panels of stainless steel, the boxes can withstand massive force and temperatures up to 2,000℉. When submerged, they&#39;re also able to emit signals from depths of 20,000 ft. Experts believe the boxes from Air France Flight 447, which crashed near Brazil on June 1,2009, are in water nearly that deep, but statistics say they&#39;re still likely to turn up. In the approximately 20 deep-sea crashes over the past 30 years, only one plane&#39;s black boxes were never recovered.<br />\r\n	　　注意：此部分试题请在答题卡2上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What does the author say about the black box?<br />\r\n	　　</eo:question><eo:selection>A) It ensures the normal functioning of an airplane.<br />\r\n	　　</eo:selection><eo:selection>B) The idea for its design comes from a comic book.<br />\r\n	　　</eo:selection><eo:selection>C) Its ability to ward off disasters is incredible.<br />\r\n	　　</eo:selection><eo:selection>D) It is an indispensable device on an airplane.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What information could be found from the black box on the Yemeni airliner?<br />\r\n	　　</eo:question><eo:selection>A) Data for analyzing the cause of the crash.<br />\r\n	　　</eo:selection><eo:selection>B) The total number of passengers on board.<br />\r\n	　　</eo:selection><eo:selection>C) The scene of the crash and extent of the damage.<br />\r\n	　　</eo:selection><eo:selection>D) Homing signals sent by the pilot before the crash.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why was the black box redesigned in 1965?<br />\r\n	　　</eo:question><eo:selection>A) New materials became available by that time.<br />\r\n	　　</eo:selection><eo:selection>B) Too much space was needed for its installation.<br />\r\n	　　</eo:selection><eo:selection>C) The early models often got damaged in the crash.<br />\r\n	　　</eo:selection><eo:selection>D) The early models didn&#39;t provide the needed data.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why did the Federal Aviation Authority require the black boxes be painted orange or yellow?<br />\r\n	　　</eo:question><eo:selection>A) To distinguish them from the colour of the plane.<br />\r\n	　　</eo:selection><eo:selection>B) To caution people to handle them with care.<br />\r\n	　　</eo:selection><eo:selection>C) To make them easily identifiable.<br />\r\n	　　</eo:selection><eo:selection>D) To conform to international standards.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What do we know about the black boxes from Air France Flight 447?<br />\r\n	　　</eo:question><eo:selection>A) There is still a good chance of their being recovered.<br />\r\n	　　</eo:selection><eo:selection>B) There is an urgent need for them to be reconstructed.<br />\r\n	　　</eo:selection><eo:selection>C) They have stopped sending homing signals.<br />\r\n	　　</eo:selection><eo:selection>D) They were destroyed somewhere near Brazil.</p>\r\n</eo:selection></eo:question>', 'A#D#B#C#B', 0, 'reading', 0),
(5, '<exam:flag=cloze><es:content><p>\r\n	&nbsp;<strong>Part V Cloze (15 minutes)<br />\r\n	</strong>　　Directions: There are 20 blanks in the following passage. For each blank there are four choices marked A), B), C) and D) on the right side of the paper. You should choose the ONE that best fits into the passage. Then mark the corresponding letter on Answer Sheet 2 with a single line through the centre.<br />\r\n	　　注意：此部分试题请在答题卡2上作答。<br />\r\n	　　The term e-commerce refers to all commercial transactions conducted over the Internet, including transactions by consumers and business-to-business transactions. Conceptually, e-commerce does not <eo:blank> from well-known commercial offerings such as banking by phone, &quot;mail order&quot; catalogs, or sending a purchase order to supplier <eo:blank> fax.E-commerce follows the same model <eo:blank> in other business transactions; the difference <eo:blank> in the details.<br />\r\n	　　To a consumer, the most visible form of e-commerce consists <eo:blank> online ordering. A customer begins with a catalog of possible items, <eo:blank> an item, arranges a form of payment, and <eo:blank> an order. Instead of a physical catalog, e-commerce arranges for catalogs to be <eo:blank> on the Internet. Instead of sending an order on paper or by telephone, e-commerce arranges for orders to be sent <eo:blank> a computer network. Finally, instead of sending a paper representation of payment such as a check, e-commerce <eo:blank> one to send payment information electronically.<br />\r\n	　　In the decade <eo:blank> 1993, e-commerce grew from an <eo:blank> novelty (新奇事物) to a mainstream business influence. In 1993, few <eo:blank> had a web page, and <eo:blank> a handful allowed one to order products or services online. Ten years <eo:blank>, both large and small businesses had web pages, and most <eo:blank> users with the opportunity to place an order. <eo:blank>, many banks added online access, <eo:blank> online banking and bill paying became <eo:blank>. More importantly, the value of goods and services <eo:blank> over the Internet grew dramatically after 1997.<br />\r\n	　　</eo:content><eo:question></eo:question><eo:selection>A) distract&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) descend&nbsp; </eo:selection><eo:selection>C) differ&nbsp; </eo:selection><eo:selection>D) derive<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) with&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) via&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) from&nbsp;&nbsp; </eo:selection><eo:selection>D) off<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) appeared&nbsp; </eo:selection><eo:selection>B) used&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) resorted&nbsp; </eo:selection><eo:selection>D) served<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) situates&nbsp;&nbsp; </eo:selection><eo:selection>B) lies&nbsp; </eo:selection><eo:selection>C) roots&nbsp; </eo:selection><eo:selection>D) locates<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) on&nbsp; </eo:selection><eo:selection>B) of&nbsp; </eo:selection><eo:selection>C) for&nbsp; </eo:selection><eo:selection>D) to<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) reflects&nbsp; </eo:selection><eo:selection>B) detects&nbsp;&nbsp; </eo:selection><eo:selection>C) protects&nbsp; </eo:selection><eo:selection>D) selects<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) sends in&nbsp; </eo:selection><eo:selection>B) puts out&nbsp;&nbsp; </eo:selection><eo:selection>C) stands for&nbsp;&nbsp; </eo:selection><eo:selection>D) carries away<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) visible&nbsp;&nbsp; </eo:selection><eo:selection>B) responsible&nbsp;&nbsp; </eo:selection><eo:selection>C) feasible&nbsp;&nbsp; </eo:selection><eo:selection>D) sensible<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) beside&nbsp;&nbsp; </eo:selection><eo:selection>B) over&nbsp;&nbsp; </eo:selection><eo:selection>C) beyond&nbsp;&nbsp; </eo:selection><eo:selection>D) up<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) appeals&nbsp;&nbsp; </eo:selection><eo:selection>B) admits&nbsp;&nbsp; </eo:selection><eo:selection>C) advocates&nbsp;&nbsp; </eo:selection><eo:selection>D) allows<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) after&nbsp; </eo:selection><eo:selection>B) behind&nbsp;&nbsp; </eo:selection><eo:selection>C) until&nbsp;&nbsp; </eo:selection><eo:selection>D) toward<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) optional&nbsp;&nbsp; </eo:selection><eo:selection>B) invalid&nbsp;&nbsp; </eo:selection><eo:selection>C) occasional&nbsp;&nbsp; </eo:selection><eo:selection>D) insignificant<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) communities&nbsp;&nbsp; </eo:selection><eo:selection>B) corps&nbsp;&nbsp; </eo:selection><eo:selection>C) corporations&nbsp;&nbsp; </eo:selection><eo:selection>D) compounds<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) largely&nbsp;&nbsp; </eo:selection><eo:selection>B) slightly&nbsp;&nbsp; </eo:selection><eo:selection>C) solely&nbsp;&nbsp; </eo:selection><eo:selection>D) only<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) lately&nbsp;&nbsp; </eo:selection><eo:selection>B) later&nbsp;&nbsp; </eo:selection><eo:selection>C) late&nbsp;&nbsp; </eo:selection><eo:selection>D) latter<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) offered&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) convinced&nbsp;&nbsp; </eo:selection><eo:selection>C) equipped&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) provided<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) Instead&nbsp;&nbsp; </eo:selection><eo:selection>B) Nevertheless&nbsp;&nbsp; </eo:selection><eo:selection>C) However&nbsp;&nbsp; </eo:selection><eo:selection>D) Besides<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) and&nbsp;&nbsp; </eo:selection><eo:selection>B) or&nbsp;&nbsp; </eo:selection><eo:selection>C) but&nbsp;&nbsp; </eo:selection><eo:selection>D) though86<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) different&nbsp;&nbsp; </eo:selection><eo:selection>B) flexible&nbsp;&nbsp; </eo:selection><eo:selection>C) widespread&nbsp;&nbsp; </eo:selection><eo:selection>D) productive<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) acquired&nbsp;&nbsp; </eo:selection><eo:selection>B) adapted&nbsp;&nbsp; </eo:selection><eo:selection>C) practiced&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) proceeded<br />\r\n	&nbsp;</p>\r\n</eo:selection>', 'B#####B##########B####C', 0, 'cloze', 0),
(6, '<exam:flag=translation><p>\r\n	<strong>Part VI Translation  minutes</strong><br />\r\n	　　Directions: Complete the sentences by translating into English the Chinese given in bracketsPlease write you translation on Answer Sheet <br />\r\n	　　注意：此部分试题请在答题卡上作答，只需写出译文部分。<br />\r\n	　　 Because of the noise outside, Nancy had great difficulty <eo:blank> 集中注意力在实验上<br />\r\n	　　 The manager never laughed; neither <eo:blank> 她也从来没有发过脾气<br />\r\n	　　 We look forward to <eo:blank> 被邀请出席开幕式<br />\r\n	　　 It is suggested that the air conditioner <eo:blank> 要安装在窗户旁<br />\r\n	　　 The -year-old girl decided to travel abroad on her own despite <eo:blank> 她父母的强烈反对</p>\r\n', 'w#sdaf#sdaf##sdaf', 0, 'translation', 0),
(7, '<exam:flag=fastReading>', '###', 0, 'fastReading', 0),
(8, '<exam:flag=reading><es:content><p>\r\n	　　Toebe also regularly visits a site where posters discuss Internet overuse. In August, when she first realized she had a problem, she posted a message on a Yahoo Internet addiction group with the subject line: &quot;I have an Internet Addiction.&quot;<br />\r\n	　　&quot;I&#39;m self-employed and need the Internet for my work, but I&#39;m failing to accomplish my work,to take care of my home, to give attention to my children,&quot; she wrote in a message sent to the group.&quot;I have no money or insurance to get professional help; I can&#39;t even pay my mortgage (抵押贷款) and face losing everything.&quot;<br />\r\n	　　Since then, Toebe said, she has kept her promise to herself to cut back on her Internet use. &quot;I have a boyfriend now, and I&#39;m not interested in online dating,&quot; she said by phone last week. &quot;It&#39;s a lot better now.&quot;<br />\r\n	　　注意：此部分试题请在答题卡1上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What eventually made Carla Toebe realize she was spending too much time on the Internet?<br />\r\n	　　</eo:question><eo:selection>A) Her daughter&#39;s repeated complaints.<br />\r\n	　　</eo:selection><eo:selection>B) Fatigue resulting from lack of sleep.<br />\r\n	　　</eo:selection><eo:selection>C) The poorly managed state of her house.<br />\r\n	　　</eo:selection><eo:selection>D) The high financial costs adding up.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What does the author say about excessive Internet use?<br />\r\n	　　</eo:question><eo:selection>A) People should be warned of its harmful consequences.<br />\r\n	　　</eo:selection><eo:selection>B) It has become virtually inevitable.<br />\r\n	　　</eo:selection><eo:selection>C) It has been somewhat exaggerated.<br />\r\n	　　</eo:selection><eo:selection>D) People haven&#39;t yet reached agreement on its definition.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Jonathan Bishop believes that the Internet overuse problem can be solved if people ______.<br />\r\n	　　</eo:question><eo:selection>A) try to improve the Internet environment<br />\r\n	　　</eo:selection><eo:selection>B) become aware of its serious consequences<br />\r\n	　　</eo:selection><eo:selection>C) can realize what is important in life<br />\r\n	　　</eo:selection><eo:selection>D) can reach a consensus on its definition<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Professor Maressa Orzack, Internet use would be considered excessive if ______.<br />\r\n	　　</eo:question><eo:selection>A) it seriously affected family relationships<br />\r\n	　　</eo:selection><eo:selection>B) one visited porn websites frequently<br />\r\n	　　</eo:selection><eo:selection>C) too much time was spent in chat rooms<br />\r\n	　　</eo:selection><eo:selection>D) people got involved in online gambling<br />\r\n	&nbsp;</p>\r\n</eo:selection></eo:question>', 'A#C#C#B', 0, 'reading', 0),
(9, '<exam:flag=reading><es:content><p>\r\n	　　Some parts of the Internet seem to draw people in more than others. Internet gamers spend countless hours competing in games against people from all over the world. One such game, called World of Warcraft, is cited on many sites by posters complaining of a &quot;gaming addiction.&quot;<br />\r\n	　　Andrew Heidrich, an education network administrator from Sacramento, plays World of Warcraft for about two to four hours every other night, but that&#39;s nothing compared with the 40 to 60 hours a week he spent playing online games when he was in college. He cut back only after a full-scale family intervention (干预), in which relatives told him he&#39;d gained weight.<br />\r\n	　　&quot;There&#39;s this whole culture of competition that sucks people in&quot; with online gaming, said Heidrich, now a father of two. &quot;People do it at the expense of everything that was a constant in their lives.&quot; Heidrich now visits websites that discuss gaming addiction regularly &quot;to remind myself to keep my love for online games in check.&quot;<br />\r\n	　　Toebe also regularly visits a site where posters discuss Internet overuse. In August, when she first realized she had a problem, she posted a message on a Yahoo Internet addiction group with the subject line: &quot;I have an Internet Addiction.&quot;<br />\r\n	　　&quot;I&#39;m self-employed and need the Internet for my work, but I&#39;m failing to accomplish my work,to take care of my home, to give attention to my children,&quot; she wrote in a message sent to the group.&quot;I have no money or insurance to get professional help; I can&#39;t even pay my mortgage (抵押贷款) and face losing everything.&quot;<br />\r\n	　　Since then, Toebe said, she has kept her promise to herself to cut back on her Internet use. &quot;I have a boyfriend now, and I&#39;m not interested in online dating,&quot; she said by phone last week. &quot;It&#39;s a lot better now.&quot;<br />\r\n	　　注意：此部分试题请在答题卡1上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What eventually made Carla Toebe realize she was spending too much time on the Internet?<br />\r\n	　　</eo:question><eo:selection>A) Her daughter&#39;s repeated complaints.<br />\r\n	　　</eo:selection><eo:selection>B) Fatigue resulting from lack of sleep.<br />\r\n	　　</eo:selection><eo:selection>C) The poorly managed state of her house.<br />\r\n	　　</eo:selection><eo:selection>D) The high financial costs adding up.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What does the author say about excessive Internet use?<br />\r\n	　　</eo:question><eo:selection>A) People should be warned of its harmful consequences.<br />\r\n	　　</eo:selection><eo:selection>B) It has become virtually inevitable.<br />\r\n	　　</eo:selection><eo:selection>C) It has been somewhat exaggerated.<br />\r\n	　　</eo:selection><eo:selection>D) People haven&#39;t yet reached agreement on its definition.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Jonathan Bishop believes that the Internet overuse problem can be solved if people ______.<br />\r\n	　　</eo:question><eo:selection>A) try to improve the Internet environment<br />\r\n	　　</eo:selection><eo:selection>B) become aware of its serious consequences<br />\r\n	　　</eo:selection><eo:selection>C) can realize what is important in life<br />\r\n	　　</eo:selection><eo:selection>D) can reach a consensus on its definition<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Professor Maressa Orzack, Internet use would be considered excessive if ______.<br />\r\n	　　</eo:question><eo:selection>A) it seriously affected family relationships<br />\r\n	　　</eo:selection><eo:selection>B) one visited porn websites frequently<br />\r\n	　　</eo:selection><eo:selection>C) too much time was spent in chat rooms<br />\r\n	　　</eo:selection><eo:selection>D) people got involved in online gambling<br />\r\n	&nbsp;</p>\r\n</eo:selection></eo:question>', 'B#B#C#B', 0, 'reading', 8);

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL auto_increment,
  `username` char(11) NOT NULL,
  `name` char(10) NOT NULL,
  `sex` char(10) NOT NULL,
  `password` char(16) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`id`, `username`, `name`, `sex`, `password`) VALUES
(1, '111', '委鹏', '男', '123'),
(2, '121', '熬广', '女', '123'),
(3, '135', '万能', '男', '123'),
(4, '147', '洛基', '男', '123'),
(5, '123', '1231', 'n', '123');

-- --------------------------------------------------------

--
-- 表的结构 `student_answer`
--

CREATE TABLE IF NOT EXISTS `student_answer` (
  `student_id` int(11) NOT NULL,
  `examination_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY  (`student_id`,`examination_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `student_answer`
--

INSERT INTO `student_answer` (`student_id`, `examination_id`, `answer`) VALUES
(1, 254, '<part:90:5>B#B#B#B#B#B#B#C#C#C#B#C</part><part:91:2>##########</part><part:92:3>awsdf#adsfa#sadfsfads#fsadf#sdafda</part>'),
(1, 255, '<part:90:5>NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL</part><part:91:2>##########</part>'),
(1, 185, '<part:68:1></part>'),
(1, 209, '<part:77:1></part>'),
(1, 252, '<part:84:1></part><part:85:1>D#D#D#B#B#C#B#sdaf#dasfsadfdsaf#sdafafd</part>'),
(1, 253, '<part:86:1></part><part:87:1>C#B#B#NULL#NULL#NULL#C#sdf#sd#df</part><part:88:5>A#D#NULL#D#D#D#D#A</part>'),
(1, 194, '<part:74:1>fdsavdsadc sdaca  asda</part>'),
(1, 198, '<part:75:1>bdsfvs sdavf s  sdfvasdvaa  adawdjmla ldfmalsk c;lasddm,c zzfbxcnxb</part>'),
(1, 157, '<part:42:1></part>'),
(1, 160, '<part:45:1>eqdewqv v qrqwvvwerfwq qrqw v rfwer wrgwe </part>'),
(1, 162, '<part:47:1></part>'),
(1, 176, '<part:62:1>45frv bv34</part>'),
(1, 256, '<part:90:5>D#NULL#NULL#NULL#NULL#C#NULL#NULL#NULL#NULL#NULL#C</part><part:91:2>#adsfa sa c # ds########</part>'),
(1, 258, '<part:100:1>adsfd saa dfa \r\nsadf \r\n asdf\r\n \r\n asd </part><part:101:2>asdfsdaf###a dsf sdaf #sdaf sdaf ###asd af dfsda fasd sdf saf #sdaf dsa fds  dasf a  asdf ##</part><part:101:2>asdfsdaf###a dsf sdaf #sdaf sdaf ###asd af dfsda fasd sdf saf #sdaf dsa fds  dasf a  asdf ##</part>'),
(1, 259, '<part:100:1></part><part:101:2>#sdaf dsa fds  dasf a  asdf #########</part><part:101:2>#sdaf dsa fds  dasf a  asdf #########</part>'),
(1, 260, '<part:100:1></part><part:101:2>##########</part><part:101:2>##########</part>'),
(1, 261, '<part:100:1>ad</part><part:101:2>#sadf#########</part><part:101:2>#sadf#########</part>'),
(1, 262, '<part:100:1></part><part:101:2>##########</part>'),
(1, 263, '<part:100:1></part><part:101:2>##########</part><part:101:2>##########</part>'),
(1, 273, '<part:105:1>NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#B#D#A#C</part>'),
(1, 275, '<part:106:1>dsdsad s\r\nsaf </part><part:107:1>A#C#B#C#B#B#A#asdfsda f#d asdf as #sa sfd asd sdaf </part><part:108:5>C#C#B#B#D#B#B#A</part><part:109:5>A#C#B#C</part>'),
(1, 274, '<part:110:1>asdf#saf#dfsg#dsfg#dsfg#dsfg#dfsg#dfsgs df gsd dsfg ds dfg sdf #dsf #dsg #hdf gh</part><part:111:5>C#D#D#A#C</part><part:112:3>NULL#B#C#NULL#NULL#NULL#NULL#B#NULL#NULL#NULL#C#D#NULL#NULL#NULL#NULL#NULL#NULL#C</part><part:113:4>dsafs d # sad # asdasd sdf a#sd sa #d as sa d sdf sad </part>'),
(1, 279, '<part:106:1></part><part:107:1>NULL#NULL#NULL#NULL#NULL#NULL###</part><part:108:5>NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL</part><part:109:5>NULL#NULL#NULL#NULL</part>'),
(1, 281, '<part:115:1>sad asd s </part><part:116:1>NULL#NULL#B#NULL#NULL#NULL#B#123 ##13 </part><part:117:5>NULL#NULL#NULL#C#B#NULL#C#B</part><part:118:5>B#C#B#C</part>'),
(1, 282, '<part:119:1>adf#asdf###sd #sdaf ##asd fsd # asdf #sa #asd </part><part:120:5>NULL#NULL#C#B#B</part><part:121:3>NULL#NULL#NULL#B#NULL#NULL#NULL#NULL#NULL#NULL#NULL#C#B#B#NULL#NULL#B#NULL#NULL#NULL</part><part:122:4>fds asd#as d ###</part>'),
(1, 283, '<part:123:1></part>'),
(1, 284, '<part:124:1></part><part:125:5>NULL#B#NULL#NULL#NULL#NULL#C#C</part><part:126:5>NULL#NULL#NULL#NULL#NULL</part><part:126:5>NULL#NULL#NULL#NULL#NULL</part>'),
(1, 286, '<part:132:5>NULL#NULL#NULL#NULL</part><part:133:2>##########</part><part:134:3>NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#####</part>'),
(1, 285, '<part:124:1></part><part:125:5>NULL#NULL#NULL#NULL#NULL#NULL#NULL#C</part><part:126:5>NULL#NULL#NULL#NULL#NULL</part><part:127:4>NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL</part>'),
(1, 308, '<part:141:1></part><part:142:1>NULL#NULL#NULL#NULL#NULL#D#C###</part><part:143:5>NULL#NULL#NULL#NULL#NULL#C#A#B</part><part:144:5>NULL#NULL#NULL#NULL</part>'),
(1, 309, '<part:145:1>##########</part><part:146:5>NULL#B#A#NULL#B</part><part:147:3>NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL</part>'),
(1, 287, '<part:132:5>NULL#NULL#NULL#NULL</part><part:133:2>##########</part><part:133:2>##########</part>'),
(1, 311, '<part:137:1></part>'),
(1, 316, '<part:136:1></part>'),
(1, 317, '<part:136:1>height:150px;\r\n\r\nbackground:#999999;\r\n\r\n}\r\n\r\n.content{\r\n\r\nmargin:-100px 0 0 100px;\r\n\r\nwidth:100px;\r\n\r\nheight:100px;\r\n\r\nbackground:#cccccc;\r\n\r\n}\r\n\r\n实现效果是:子元素的上边界-100px,而父元素有50个像素的补白,故子元素将会向上移动50个像素.\r\n\r\n但ie会隐藏子元素中的超出部分,而firefox则显示超出的部分.\r\n\r\n \r\n\r\n2.使用overflow来固定长度和宽度\r\n\r\noverflow:visible|hidden|auto|sroll;\r\n\r\nvisible:不剪切内容也不产生滚动条;\r\n\r\nhidden:不显示超出的内容部分;\r\n\r\nauto:在需要的时候产生滚动条;\r\n\r\nsroll:总是显示滚动条;background:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#ccccccbackground:#cccccc</part>'),
(1, 319, '<part:232:1>sdas \r\nsdaf \r\nsd fa\r\nsd </part><part:233:2>asfds#adfsf#dasfdsaf#adsf#adsf#dasf#saf#fas#sfa#sdfsaf#dgf</part><part:234:5>B#D#C#D#A</part>'),
(2, 320, '<part:232:1></part><part:233:2>##########</part><part:234:5>NULL#NULL#NULL#NULL#NULL</part>'),
(1, 321, '<part:232:1>123 123 12 1 1123 12 1 1232sd sa 1</part><part:233:2>##########</part><part:234:5>NULL#NULL#C#B#A</part>'),
(1, 320, '<part:232:1></part><part:233:2>##########</part><part:233:2>##########</part>'),
(1, 322, '<part:232:1></part><part:233:2>##########</part><part:234:5>NULL#NULL#NULL#NULL#NULL</part>'),
(1, 323, '<part:232:1></part><part:233:2>##########</part><part:234:5>NULL#NULL#NULL#C#B</part>'),
(1, 324, '<part:232:1></part><part:233:2>##########</part><part:234:5>NULL#B#B#A#C</part>'),
(1, 325, '<part:232:1>d</part><part:233:2>######d####</part><part:234:5>NULL#A#D#B#C</part>'),
(1, 326, '<part:232:1>cc</part><part:233:2>######c####</part><part:234:5>NULL#NULL#NULL#D#D</part>'),
(1, 327, '<part:232:1></part><part:233:2>######dfs#sf###</part><part:234:5>A#NULL#NULL#A#C</part>'),
(1, 328, '<part:232:1>c</part><part:233:2>##c########</part><part:234:5>A#NULL#NULL#C#NULL</part>'),
(1, 329, '<part:232:1>ds</part><part:233:2>#######dsaf###</part><part:234:5>NULL#A#B#NULL#NULL</part>'),
(2, 329, '<part:232:1>121</part><part:233:2>#asd#########</part><part:234:5>NULL#NULL#A#B#C</part>'),
(2, 328, '<part:232:1></part><part:232:1></part><part:232:1></part>'),
(2, 327, '<part:232:1></part><part:233:2>##########</part><part:234:5>NULL#NULL#NULL#NULL#NULL</part>'),
(1, 331, '<part:232:1>fads ads </part><part:233:2>a s#sdaf #####sd ####</part><part:234:5>B#C#D#A#C</part>');

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL auto_increment,
  `username` char(16) NOT NULL,
  `password` char(16) NOT NULL,
  `name` char(10) NOT NULL,
  `sex` char(10) NOT NULL,
  `level_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`id`, `username`, `password`, `name`, `sex`, `level_id`) VALUES
(1, 'teacher', '123', '之滨', '男', 1),
(2, 'leader', '123', 'leader', '男', 2),
(3, 'admin', '123', '淘神', '男', 3),
(20, '123', '1', 'aa', '男', 2),
(21, '234', '2431', '1234', '男', 2),
(13, 'teacher1', '123', 'tea', '女', 1),
(26, 'dasf', 'adsf', 'a', '男', 2),
(19, '213', '123', '123', '男', 2),
(22, '我是系主任', '123', 'fds', '男', 2),
(23, 'a', '12', '1313', '男', 2),
(25, 'aads', '1', '231e', '男', 2),
(24, '23425', '123', '435243', '男', 2),
(32, 'sdf', 'asd', 'adsf', '女', 2),
(31, 'asdf', 'fdgs', 'dgsf', '女', 2),
(29, '撒', 'ewr', 'wqer', '男', 2),
(30, 'fds', 'ads', 'adsf', '女', 2),
(33, 'sdafdasf', ' sdf', 'sfdf', '女', 2);

-- --------------------------------------------------------

--
-- 表的结构 `temporary_part`
--

CREATE TABLE IF NOT EXISTS `temporary_part` (
  `id` int(11) NOT NULL auto_increment,
  `selorfill_id` int(11) NOT NULL,
  `overview` text NOT NULL,
  `name` text NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `temporary_part`
--

INSERT INTO `temporary_part` (`id`, `selorfill_id`, `overview`, `name`, `teacher_id`, `type`) VALUES
(1, 1, '<exam:flag=writing><p>\r\n	<stro', 'writing1', 1, 'fillblank'),
(2, 1, '<exam:flag=fastReading><es:con', 'fastReading1', 1, 'selection'),
(3, 2, '<exam:flag=shortListening><es:', 'shortListening1', 1, 'selection'),
(4, 3, '<exam:flag=longListening><es:c', 'longListening1', 1, 'selection'),
(15, 10, '<exam:flag=writing><p>\r\n	11</p', 'writing1', 3, 'fillblank'),
(14, 6, '<exam:flag=translation><p>\r\n	<', 'translation1', 1, 'selection'),
(13, 5, '<exam:flag=cloze><es:content><', 'cloze1', 1, 'selection'),
(12, 4, '<exam:flag=reading><es:content', 'reading1', 1, 'selection'),
(11, 9, '<exam:flag=dictation><p>\r\n	<st', 'dictation1', 1, 'fillblank'),
(17, 8, '<exam:flag=reading><es:content', 'reading1', 3, 'selection'),
(18, 11, '<exam:flag=writing><p>\r\n	<stro', 'writing2', 1, 'fillblank'),
(19, 9, '<exam:flag=reading><es:content', 'reading2', 1, 'selection');
