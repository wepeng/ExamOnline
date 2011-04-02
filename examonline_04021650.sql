-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2011 年 04 月 02 日 08:48
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
(119, '11301491004.mp3'),
(118, '11301490953.mp3');

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL auto_increment,
  `class_name` char(100) NOT NULL,
  `teacher_id` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `class`
--

INSERT INTO `class` (`id`, `class_name`, `teacher_id`) VALUES
(1, '081班', '1'),
(2, '082班', '1'),
(3, '083班', '2');

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
(1, 2);

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
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(100, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

--
-- 转存表中的数据 `examination`
--

INSERT INTO `examination` (`id`, `paper_id`, `name`, `startTime`, `endTime`, `category_id`) VALUES
(132, 220, 'WW ', '0000-00-00 00:00:00', '2011-04-30 14:26:38', 2),
(131, 220, 'WW ', '0000-00-00 00:00:00', '2011-04-30 14:26:38', 2),
(130, 220, 'WW ', '0000-00-00 00:00:00', '2011-04-30 14:26:38', 2),
(129, 220, 'WW ', '0000-00-00 00:00:00', '2011-04-30 14:26:38', 2),
(128, 219, '1', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 1),
(127, 219, '1', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 1),
(126, 219, '1', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 1),
(125, 219, '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(124, 215, '韦鲲鹏3', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2),
(123, 215, '韦鲲鹏3', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2),
(122, 214, '韦鲲鹏2', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2),
(121, 213, '韦鲲鹏1', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2),
(120, 212, '韦鲲鹏', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2),
(118, 208, 'omg', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 1),
(104, 208, 'omg', '0000-00-00 00:00:00', '2011-03-31 00:10:00', 1),
(119, 212, '韦鲲鹏', '0000-00-00 00:00:00', '2011-04-20 20:49:45', 2);

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
(132, 1),
(131, 1),
(130, 1),
(129, 1),
(128, 1),
(127, 1),
(126, 1),
(125, 1),
(124, 1),
(123, 1),
(122, 1),
(121, 1),
(120, 1),
(119, 1),
(118, 1),
(117, 1),
(116, 2),
(116, 1),
(114, 2),
(112, 1),
(111, 1),
(109, 2),
(109, 1),
(105, 2),
(105, 1),
(104, 2),
(102, 2),
(102, 1),
(100, 2),
(100, 1),
(99, 2),
(99, 1);

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
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fillblank`
--

INSERT INTO `fillblank` (`id`, `content`, `answer`, `hasAudio`, `category`) VALUES
(6, '<exam:flag=writing><p>\r\n	<strong>Part I Writing (30 minutes)<br />\r\n	</strong>　　注意：此部分试题在答题卡1上。<br />\r\n	　　Directions: For this part, you are allowed 30 minutes to write a short essay on the topic of Due Attention Should Be Given To Spelling. You should write at least 120 words following the outline given below:<br />\r\n	　　1. 如今不少学生在英语学习中不重视拼写<br />\r\n	　　2. 出现这种情况的原因<br />\r\n	　　3. 为了改变这种状况，我认为&hellip;<br />\r\n	　　Due Attention Should Be Given To Spelling<br />\r\n	&nbsp;</p>\r\n', '<p>\r\n	we</p>\r\n', 0, 'writing'),
(7, '<exam:flag=dictation><p>\r\n	Directions: In this section, you will hear a passage three times When the passage is read for the first time, you should listen carefully for its general idea When the passage is read for the second time, you are required to fill in the blanks numbered from  to  with the exact words you have just heard For blanks numbered from  to  you are required to fill in the missing information For these blanks, you can either use the exact words you have just heard or write down the main points in your own words Finally, when the passage is read for the third time, you should check what you have written<br />\r\n	　　注意：此部分试题请在答题卡上作答。<br />\r\n	　　Almost every child, on the first day he sets foot in a school building, is smarter, more <eo:blank>, less afraid of what he doesn&#;t know, better at finding and  <eo:blank> things out, more confident, resourceful 机敏的, persistent and  <eo:blank> than he will ever be again in his schooling &ndash; or, unless he is very  <eo:blank> and very lucky, for the rest of his life Already, by paying close attention to and  <eo:blank> with the world and people around him, and without any school-type  <eo:blank> instruction, he has done a task far more difficult, complicated and <eo:blank> than anything he will be asked to do in school, or than any of his teachers has done for years He has solved the  <eo:blank> of language He has discovered it &ndash; babies don&#;t even know that language exists &ndash; and  <eo:blank> He has done it by exploring, by experimenting, by developing his own model of the grammar of language,  <eo:blank> until it does work And while he has been doing this, he has been learning other things as well,  <eo:blank>, and many that are more complicated than the ones they do try to teach him</p>\r\n', 'asd##########', 0, 'dictation');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=221 ;

--
-- 转存表中的数据 `paper`
--

INSERT INTO `paper` (`id`, `introduction`, `listening_test`, `title`, `category_id`, `time`) VALUES
(220, NULL, NULL, 'WW ', 2, NULL),
(219, NULL, NULL, '1', 1, NULL),
(218, NULL, NULL, '韦鲲鹏4', 2, NULL),
(217, NULL, NULL, '韦鲲鹏4', 2, NULL),
(216, NULL, NULL, '韦鲲鹏4', 2, NULL),
(215, NULL, NULL, '韦鲲鹏3', 2, NULL),
(214, NULL, NULL, '韦鲲鹏2', 2, NULL),
(213, NULL, NULL, '韦鲲鹏1', 2, NULL),
(212, NULL, NULL, '韦鲲鹏', 2, NULL),
(211, NULL, NULL, '1', 1, NULL),
(210, NULL, NULL, '1', 1, NULL),
(209, NULL, NULL, '1', 1, NULL),
(208, NULL, NULL, 'omg', 1, NULL),
(207, NULL, NULL, 'asd', 1, NULL);

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
(1, '123'),
(120, '<part:134:1><p>\r\n	qe</p>\r\n</part><part:135:2>A#C#C#A#B</part>'),
(121, '<part:136:1>B#BB#A#B#C#C</part><part:137:2>A#D#B#B#AA#C#C#A#B</part>'),
(122, '<part:138:1>B#B#B#A#B#C#C</part><part:139:2>A#D#B#B#A#A#C#C#A#B</part>'),
(123, '<part:140:1><p>\r\n	fhdsffdghfhfdsg</p>\r\n</part>'),
(124, '<part:141:1><p>\r\n	fhdsffdghfhfdsg</p>\r\n</part>'),
(125, '<part:142:1><p>\r\n	fhdsffdghfhfdsg</p>\r\n</part>'),
(126, '<part:143:1><p>\r\n	fhdsffdghfhfdsg</p>\r\n</part>'),
(138, '<part:155:1><p>\r\n	fhdsffdghfhfdsg</p>\r\n</part>'),
(139, '<part:156:1><p>\r\n	fhdsffdghfhfdsg</p>\r\n</part>'),
(140, '<part:157:1>B#A#B#C#D#B#B#B#B#B</part>'),
(141, '<part:158:1>B#A#B#C#D#B#B#B#B#B</part>'),
(142, '<part:159:1>B##C######A#C</part>'),
(144, '<part:161:1>B##C######A#C</part>'),
(145, '<part:162:1>B##C######A#C</part>'),
(150, '<part:167:1>B####</part>'),
(151, '<part:168:1>B####</part>'),
(152, '<part:169:1>B####</part>'),
(153, '<part:170:1>B#B</part>'),
(155, '<part:172:1>########B#</part>'),
(160, '<part:177:1>#C########</part>'),
(161, '<part:178:1>#C########</part>'),
(162, '<part:179:1>#C########</part>'),
(163, '<part:180:1>#C########</part>'),
(164, '<part:181:1>#C########</part>'),
(165, '<part:182:1>#C########</part>'),
(166, '<part:183:1>#C########</part>'),
(167, '<part:184:1>#C########</part>'),
(168, '<part:185:1>#C########</part>'),
(169, '<part:186:1>B##############</part>'),
(170, '<part:187:1>#B##</part>'),
(171, '<part:188:1>#B####B##</part>'),
(172, '<part:189:1>B##########</part>'),
(173, '<part:190:1>answer123##########</part>'),
(174, '<part:191:1>answer123##########</part>'),
(175, '<part:192:1>answer123##########</part>'),
(176, '<part:193:1>B###################</part>'),
(177, '<part:194:1>####</part>'),
(178, '<part:195:1>12####</part>'),
(179, '<part:196:1><p>\r\n	document.getElementById(&quot;partType&quot;).value = flag;&nbsp;&nbsp;&nbsp;</p>\r\n</part><part:197:2>#C########</part><part:198:3>#B###B##########</part><part:199:4>B####################12####</part>'),
(180, '<part:200:1><p>\r\n	we</p>\r\n</part><part:201:2>A###B####8#9##C#######</part><part:202:3>B#######asd##########</part><part:203:4>B#####B####################qwe####</part>'),
(181, '<part:204:1><p>\r\n	we</p>\r\n</part><part:205:2>A###B####8#9##C#######</part><part:206:3>B#######asd##########</part><part:207:4>B#####B####################qwe####</part>'),
(182, '<part:208:1><p>\r\n	we</p>\r\n</part><part:209:2>A###B####8#9##C#######</part>'),
(183, '<part:210:1><p>\r\n	we</p>\r\n</part><part:211:2>A###B####8#9##C#######</part><part:212:3>B#######asd##########</part><part:213:4>B#####B####################qwe####</part>'),
(184, '<part:214:1><p>\r\n	we</p>\r\n</part><part:215:2>A#########</part><part:216:3>asd##########</part><part:217:4>B#####B###################</part><part:218:5>qwe####</part>'),
(205, '<part:239:1>A###################</part>'),
(206, '<part:240:1>qwe####</part><part:241:2>C###################</part><part:242:3>A###################</part>'),
(207, '<part:243:1>C###################</part><part:244:2>A###################</part>'),
(208, '<part:245:1>A###################</part>'),
(209, '<part:246:1>B#A######123##</part>'),
(210, '<part:247:1>B#A######123##</part>'),
(211, '<part:248:1>B#A######123##</part>'),
(212, '<part:249:1>B#A######123##</part><part:250:2>B#A######123##</part>'),
(213, '<part:251:1>B#A######123##</part><part:252:2>B#A######123##</part>'),
(214, '<part:253:1>B#A######123##</part><part:254:2>B#A######123##</part>'),
(215, '<part:255:1>B#A######123##</part><part:256:2>B#A######123##</part>'),
(216, '<part:257:1>B#A######123##</part><part:258:2>B#A######123##</part>'),
(217, '<part:259:1>B#A######123##</part><part:260:2>B#A######123##</part>'),
(218, '<part:261:1>B#A######123##</part><part:262:2>B#A######123##</part>'),
(219, '<part:263:1><p>\r\n	we</p>\r\n</part><part:264:2>A###B####8#9##C#######</part><part:265:3>asd###########A###################</part><part:266:4>B#A######123##</part>'),
(220, '<part:267:1><p>\r\n	we</p>\r\n</part>');

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
(220, 267, 1),
(219, 266, 4),
(219, 265, 3),
(219, 264, 2),
(219, 263, 1),
(218, 262, 2),
(218, 261, 1),
(217, 260, 2),
(217, 259, 1),
(216, 258, 2),
(216, 257, 1),
(215, 256, 2),
(215, 255, 1),
(214, 254, 2),
(214, 253, 1),
(213, 252, 2),
(213, 251, 1),
(212, 250, 2),
(212, 249, 1),
(211, 248, 1),
(210, 247, 1),
(209, 246, 1),
(136, 153, 1),
(137, 154, 1),
(138, 155, 1),
(139, 156, 1),
(140, 157, 1),
(141, 158, 1),
(142, 159, 1),
(143, 160, 1),
(144, 161, 1),
(145, 162, 1),
(146, 163, 1),
(147, 164, 1),
(148, 165, 1),
(149, 166, 1),
(150, 167, 1),
(151, 168, 1),
(152, 169, 1),
(153, 170, 1),
(154, 171, 1),
(155, 172, 1),
(156, 173, 1),
(157, 174, 1),
(158, 175, 1),
(159, 176, 1),
(160, 177, 1),
(161, 178, 1),
(162, 179, 1),
(163, 180, 1),
(164, 181, 1),
(165, 182, 1),
(166, 183, 1),
(167, 184, 1),
(168, 185, 1),
(169, 186, 1),
(170, 187, 1),
(171, 188, 1),
(172, 189, 1),
(173, 190, 1),
(174, 191, 1),
(175, 192, 1),
(176, 193, 1),
(177, 194, 1),
(178, 195, 1),
(179, 196, 1),
(179, 197, 2),
(179, 198, 3),
(179, 199, 4),
(180, 200, 1),
(180, 201, 2),
(180, 202, 3),
(180, 203, 4),
(181, 204, 1),
(181, 205, 2),
(181, 206, 3),
(181, 207, 4),
(182, 208, 1),
(182, 209, 2),
(183, 210, 1),
(183, 211, 2),
(183, 212, 3),
(183, 213, 4),
(184, 214, 1),
(184, 215, 2),
(184, 216, 3),
(184, 217, 4),
(184, 218, 5),
(185, 219, 1),
(186, 220, 1),
(187, 221, 1),
(188, 222, 1),
(189, 223, 1),
(190, 224, 1),
(191, 225, 1),
(192, 226, 1),
(193, 227, 1),
(194, 228, 1),
(195, 229, 1),
(196, 230, 1),
(197, 231, 1),
(198, 232, 1),
(199, 233, 1),
(200, 234, 1),
(201, 235, 1),
(202, 236, 1),
(203, 237, 1),
(204, 238, 1),
(205, 239, 1),
(206, 240, 1),
(206, 241, 2),
(206, 242, 3),
(207, 243, 1),
(207, 244, 2),
(208, 245, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=268 ;

--
-- 转存表中的数据 `part`
--

INSERT INTO `part` (`id`, `direction`, `time`, `name`) VALUES
(53, NULL, NULL, NULL),
(54, NULL, NULL, NULL),
(55, NULL, NULL, NULL),
(56, NULL, NULL, NULL),
(57, NULL, NULL, NULL),
(58, NULL, NULL, NULL),
(59, NULL, NULL, NULL),
(60, NULL, NULL, NULL),
(61, NULL, NULL, NULL),
(62, NULL, NULL, NULL),
(63, NULL, NULL, NULL),
(64, NULL, NULL, NULL),
(65, NULL, NULL, NULL),
(66, NULL, NULL, NULL),
(67, NULL, NULL, NULL),
(68, NULL, NULL, NULL),
(69, NULL, NULL, NULL),
(70, NULL, NULL, NULL),
(71, NULL, NULL, NULL),
(72, NULL, NULL, NULL),
(73, NULL, NULL, NULL),
(74, NULL, NULL, NULL),
(75, NULL, NULL, NULL),
(76, NULL, NULL, NULL),
(77, NULL, NULL, NULL),
(78, NULL, NULL, NULL),
(79, NULL, NULL, NULL),
(80, NULL, NULL, NULL),
(81, NULL, NULL, NULL),
(82, NULL, NULL, NULL),
(267, NULL, NULL, NULL),
(266, NULL, NULL, NULL),
(265, NULL, NULL, NULL),
(264, NULL, NULL, NULL),
(263, NULL, NULL, NULL),
(262, NULL, NULL, NULL),
(261, NULL, NULL, NULL),
(260, NULL, NULL, NULL),
(259, NULL, NULL, NULL),
(258, NULL, NULL, NULL),
(257, NULL, NULL, NULL),
(256, NULL, NULL, NULL),
(255, NULL, NULL, NULL),
(254, NULL, NULL, NULL),
(253, NULL, NULL, NULL),
(252, NULL, NULL, NULL),
(251, NULL, NULL, NULL),
(250, NULL, NULL, NULL),
(249, NULL, NULL, NULL),
(248, NULL, NULL, NULL),
(247, NULL, NULL, NULL),
(246, NULL, NULL, NULL),
(245, NULL, NULL, NULL),
(244, NULL, NULL, NULL),
(243, NULL, NULL, NULL),
(242, NULL, NULL, NULL),
(241, NULL, NULL, NULL),
(240, NULL, NULL, NULL),
(239, NULL, NULL, NULL),
(238, NULL, NULL, NULL),
(237, NULL, NULL, NULL),
(236, NULL, NULL, NULL),
(235, NULL, NULL, NULL),
(234, NULL, NULL, NULL),
(233, NULL, NULL, NULL),
(232, NULL, NULL, NULL),
(231, NULL, NULL, NULL),
(230, NULL, NULL, NULL),
(229, NULL, NULL, NULL),
(228, NULL, NULL, NULL),
(227, NULL, NULL, NULL),
(226, NULL, NULL, NULL),
(225, NULL, NULL, NULL),
(224, NULL, NULL, NULL),
(223, NULL, NULL, NULL),
(222, NULL, NULL, NULL),
(221, NULL, NULL, NULL),
(220, NULL, NULL, NULL),
(219, NULL, NULL, NULL),
(218, NULL, NULL, NULL),
(217, NULL, NULL, NULL),
(216, NULL, NULL, NULL),
(215, NULL, NULL, NULL),
(214, NULL, NULL, NULL),
(213, NULL, NULL, NULL),
(212, NULL, NULL, NULL),
(211, NULL, NULL, NULL),
(210, NULL, NULL, NULL),
(209, NULL, NULL, NULL),
(208, NULL, NULL, NULL),
(207, NULL, NULL, NULL),
(206, NULL, NULL, NULL),
(205, NULL, NULL, NULL),
(204, NULL, NULL, NULL),
(203, NULL, NULL, NULL),
(202, NULL, NULL, NULL),
(201, NULL, NULL, NULL),
(200, NULL, NULL, NULL);

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
(128, 73, 1),
(134, 79, 1),
(140, 80, 1),
(141, 80, 1),
(142, 80, 1),
(143, 80, 1),
(144, 80, 1),
(145, 80, 1),
(146, 80, 1),
(147, 80, 1),
(148, 80, 1),
(149, 80, 1),
(150, 80, 1),
(151, 80, 1),
(152, 80, 1),
(153, 80, 1),
(154, 80, 1),
(155, 80, 1),
(156, 80, 1),
(189, 91, 1),
(190, 92, 1),
(191, 92, 1),
(192, 92, 1),
(196, 73, 1),
(198, 91, 2),
(200, 96, 1),
(202, 100, 2),
(204, 96, 1),
(206, 100, 2),
(208, 96, 1),
(210, 96, 1),
(212, 100, 2),
(214, 96, 1),
(216, 100, 1),
(263, 96, 1),
(265, 100, 1),
(267, 96, 1);

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
(222, 108, 1),
(221, 108, 1),
(220, 107, 1),
(219, 107, 1),
(218, 103, 1),
(217, 102, 2),
(217, 101, 1),
(215, 105, 1),
(213, 103, 3),
(213, 102, 2),
(213, 101, 1),
(212, 99, 1),
(211, 98, 2),
(211, 97, 1),
(209, 98, 2),
(209, 97, 1),
(207, 103, 3),
(207, 102, 2),
(207, 101, 1),
(206, 99, 1),
(205, 98, 2),
(205, 97, 1),
(203, 103, 3),
(203, 102, 2),
(203, 101, 1),
(202, 99, 1),
(201, 98, 2),
(201, 97, 1),
(199, 95, 2),
(199, 93, 1),
(198, 90, 1),
(197, 88, 1),
(195, 95, 1),
(194, 94, 1),
(193, 93, 1),
(188, 90, 2),
(188, 90, 1),
(187, 90, 1),
(186, 89, 1),
(185, 88, 1),
(184, 88, 1),
(183, 88, 1),
(182, 88, 1),
(181, 88, 1),
(180, 88, 1),
(179, 88, 1),
(178, 88, 1),
(177, 88, 1),
(176, 88, 1),
(175, 87, 1),
(174, 87, 1),
(173, 87, 1),
(172, 87, 1),
(171, 86, 1),
(170, 72, 1),
(169, 84, 1),
(168, 85, 1),
(167, 84, 1),
(166, 83, 1),
(165, 83, 1),
(164, 83, 1),
(163, 83, 1),
(162, 82, 1),
(161, 82, 1),
(160, 82, 1),
(159, 82, 1),
(158, 81, 1),
(157, 81, 1),
(139, 77, 2),
(139, 76, 1),
(138, 74, 2),
(138, 72, 1),
(137, 77, 2),
(137, 76, 1),
(136, 74, 2),
(136, 72, 1),
(135, 77, 1),
(133, 77, 2),
(133, 78, 1),
(132, 77, 2),
(132, 76, 1),
(131, 76, 1),
(130, 75, 1),
(129, 74, 2),
(129, 72, 1),
(127, 71, 1),
(126, 70, 1),
(125, 69, 2),
(125, 68, 1),
(124, 68, 2),
(124, 68, 1),
(123, 67, 2),
(123, 67, 1),
(122, 67, 2),
(122, 67, 1),
(121, 66, 2),
(121, 66, 1),
(120, 65, 2),
(120, 65, 1),
(119, 64, 2),
(119, 64, 1),
(118, 63, 2),
(118, 62, 1),
(117, 61, 2),
(117, 60, 1),
(116, 63, 2),
(116, 62, 1),
(115, 61, 2),
(115, 60, 1),
(114, 63, 2),
(114, 62, 1),
(113, 61, 2),
(113, 60, 1),
(223, 108, 1),
(224, 108, 1),
(225, 108, 1),
(226, 108, 1),
(227, 108, 1),
(228, 108, 1),
(229, 108, 1),
(230, 108, 1),
(231, 108, 1),
(232, 108, 1),
(233, 108, 1),
(234, 108, 1),
(235, 108, 1),
(236, 108, 1),
(237, 108, 1),
(238, 108, 1),
(239, 108, 1),
(240, 103, 1),
(241, 106, 1),
(242, 108, 1),
(243, 106, 1),
(244, 108, 1),
(245, 108, 1),
(246, 109, 1),
(247, 109, 1),
(248, 109, 1),
(249, 109, 1),
(250, 109, 1),
(251, 109, 1),
(252, 109, 1),
(253, 109, 1),
(254, 109, 1),
(255, 109, 1),
(256, 109, 1),
(257, 109, 1),
(258, 109, 1),
(259, 109, 1),
(260, 109, 1),
(261, 109, 1),
(262, 109, 1),
(264, 97, 1),
(264, 98, 2),
(265, 108, 2),
(266, 109, 1);

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
(1, 1, '1', 1, '2011-03-26 21:20:28'),
(5, 1, '1#2', 1, '2011-03-26 21:31:38'),
(5, 2, '1#2', 1, '2011-03-26 21:31:38'),
(1, 3, '1', 1, '2011-03-26 21:33:43'),
(1, 4, '1', 1, '2011-03-26 21:33:43');

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
(5, 1, '1,2', 1, '2011-03-25 21:42:18'),
(1, 1, '123', 1, '2011-03-25 23:13:52'),
(1, 1, '1,2', 1, '2011-03-26 23:14:49'),
(1, 1, '1,2', 4, '2011-03-25 23:17:00'),
(2, 1, '1', 1, '2011-03-26 21:35:40');

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
(1, 1, '20#30#50', 100);

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
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- 转存表中的数据 `selection`
--

INSERT INTO `selection` (`id`, `content`, `answer`, `hasAudio`, `category`) VALUES
(128, '<exam:flag=fastReading><es:content><p>\r\n	Physical symptoms listed include dry eyes, backaches, skipping meals, poor personal hygiene (卫生) and sleep disturbances.<br />\r\n	　　People who struggle with excessive Internet use maybe depressed or have other mood disorders, Orzack said. When she discusses Internet habits with her patients, they often report that being online offers a &quot;sense of belonging, and escape, excitement [and] fun,&quot; she said. &quot;Some people say relief&hellip;because they find themselves so relaxed.&quot;<br />\r\n	　　Some parts of the Internet seem to draw people in more than others. Internet gamers spend countless hours competing in games against people from all over the world. One such game, called World of Warcraft, is cited on many sites by posters complaining of a &quot;gaming addiction.&quot;<br />\r\n	　　Andrew Heidrich, an education network administrator from Sacramento, plays World of Warcraft for about two to four hours every other night, but that&#39;s nothing compared with the 40 to 60 hours a week he spent playing online games when he was in college. He cut back only after a full-scale family intervention (干预), in which relatives told him he&#39;d gained weight.<br />\r\n	　　&quot;There&#39;s this whole culture of competition that sucks people in&quot; with online gaming, said Heidrich, now a father of two. &quot;People do it at the expense of everything that was a constant in their lives.&quot; Heidrich now visits websites that discuss gaming addiction regularly &quot;to remind myself to keep my love for online games in check.&quot;<br />\r\n	　　Toebe also regularly visits a site where posters discuss Internet overuse. In August, when she first realized she had a problem, she posted a message on a Yahoo Internet addiction group with the subject line: &quot;I have an Internet Addiction.&quot;<br />\r\n	　　&quot;I&#39;m self-employed and need the Internet for my work, but I&#39;m failing to accomplish my work,to take care of my home, to give attention to my children,&quot; she wrote in a message sent to the group.&quot;I have no money or insurance to get professional help; I can&#39;t even pay my mortgage (抵押贷款) and face losing everything.&quot;<br />\r\n	　　Since then, Toebe said, she has kept her promise to herself to cut back on her Internet use. &quot;I have a boyfriend now, and I&#39;m not interested in online dating,&quot; she said by phone last week. &quot;It&#39;s a lot better now.&quot;<br />\r\n	　　注意：此部分试题请在答题卡1上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What eventually made Carla Toebe realize she was spending too much time on the Internet?<br />\r\n	　　</eo:question><eo:selection>A) Her daughter&#39;s repeated complaints.<br />\r\n	　　</eo:selection><eo:selection>B) Fatigue resulting from lack of sleep.<br />\r\n	　　</eo:selection><eo:selection>C) The poorly managed state of her house.<br />\r\n	　　</eo:selection><eo:selection>D) The high financial costs adding up.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What does the author say about excessive Internet use?<br />\r\n	　　</eo:question><eo:selection>A) People should be warned of its harmful consequences.<br />\r\n	　　</eo:selection><eo:selection>B) It has become virtually inevitable.<br />\r\n	　　</eo:selection><eo:selection>C) It has been somewhat exaggerated.<br />\r\n	　　</eo:selection><eo:selection>D) People haven&#39;t yet reached agreement on its definition.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Jonathan Bishop believes that the Internet overuse problem can be solved if people ______.<br />\r\n	　　</eo:question><eo:selection>A) try to improve the Internet environment<br />\r\n	　　</eo:selection><eo:selection>B) become aware of its serious consequences<br />\r\n	　　</eo:selection><eo:selection>C) can realize what is important in life<br />\r\n	　　</eo:selection><eo:selection>D) can reach a consensus on its definition<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Professor Maressa Orzack, Internet use would be considered excessive if ______.<br />\r\n	　　</eo:question><eo:selection>A) it seriously affected family relationships<br />\r\n	　　</eo:selection><eo:selection>B) one visited porn websites frequently<br />\r\n	　　</eo:selection><eo:selection>C) too much time was spent in chat rooms<br />\r\n	　　</eo:selection><eo:selection>D) people got involved in online gambling<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Orzack, people who struggle with heavy reliance on the Internet may feel ______.<br />\r\n	　　</eo:question><eo:selection>A) discouraged<br />\r\n	　　</eo:selection><eo:selection>B) pressured<br />\r\n	　　</eo:selection><eo:selection>C) depressed<br />\r\n	　　</eo:selection><eo:selection>D) puzzled<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why did Andre Heidrich cut back online gaming?<br />\r\n	　　</eo:question><eo:selection>A) He had lost a lot of money.<br />\r\n	　　</eo:selection><eo:selection>B) His family had intervened.<br />\r\n	　　</eo:selection><eo:selection>C) He had offended his relatives.<br />\r\n	　　</eo:selection><eo:selection>D) His career had been ruined.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Andrew Heidrich now visits websites that discuss online gaming addiction to ______.<br />\r\n	　　</eo:question><eo:selection>A) improve his online gaming skills<br />\r\n	　　</eo:selection><eo:selection>B) curb his desire for online gaming<br />\r\n	　　</eo:selection><eo:selection>C) show how good he is at online gaming<br />\r\n	　　</eo:selection><eo:selection>D) exchange online gaming experience<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:fillblank> In one of the messages she posted on a website, Toebe admitted that she <eo:blank>.<br />\r\n	　　</eo:fillblank></eo:question><eo:question><eo:fillblank> Excessive Internet use had rendered Toebe so poor that she couldn&#39;t afford to seek <eo:blank>.<br />\r\n	　　</eo:fillblank></eo:question><eo:question><eo:fillblank> Now that she&#39;s got a boyfriend, Toebe is no longer crazy about <eo:blank>.</p>\r\n</eo:fillblank></eo:question>', 'B#A######123##', 0, 'fastReading'),
(127, '<exam:flag=cloze><es:content><p>\r\n	The term e-commerce refers to all commercial transactions conducted over the Internet, including transactions by consumers and business-to-business transactions. Conceptually, e-commerce does not <eo:blank> from well-known commercial offerings such as banking by phone, &quot;mail order&quot; catalogs, or sending a purchase order to supplier <eo:blank> fax.E-commerce follows the same model <eo:blank> in other business transactions; the difference <eo:blank> in the details.<br />\r\n	　　To a consumer, the most visible form of e-commerce consists <eo:blank> online ordering. A customer begins with a catalog of possible items, <eo:blank> an item, arranges a form of payment, and <eo:blank> an order. Instead of a physical catalog, e-commerce arranges for catalogs to be <eo:blank> on the Internet. Instead of sending an order on paper or by telephone, e-commerce arranges for orders to be sent <eo:blank> a computer network. Finally, instead of sending a paper representation of payment such as a check, e-commerce <eo:blank> one to send payment information electronically.<br />\r\n	　　In the decade <eo:blank> 1993, e-commerce grew from an <eo:blank> novelty (新奇事物) to a mainstream business influence. In 1993, few <eo:blank> had a web page, and <eo:blank> a handful allowed one to order products or services online. Ten years <eo:blank>, both large and small businesses had web pages, and most <eo:blank> users with the opportunity to place an order. <eo:blank>, many banks added online access, <eo:blank> online banking and bill paying became <eo:blank>. More importantly, the value of goods and services <eo:blank> over the Internet grew dramatically after 1997.<br />\r\n	　　</eo:content><eo:question></eo:question><eo:selection>A) distract&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) descend&nbsp; </eo:selection><eo:selection>C) differ&nbsp; </eo:selection><eo:selection>D) derive<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) with&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) via&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) from&nbsp;&nbsp; </eo:selection><eo:selection>D) off<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) appeared&nbsp; </eo:selection><eo:selection>B) used&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) resorted&nbsp; </eo:selection><eo:selection>D) served<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) situates&nbsp;&nbsp; </eo:selection><eo:selection>B) lies&nbsp; </eo:selection><eo:selection>C) roots&nbsp; </eo:selection><eo:selection>D) locates<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) on&nbsp; </eo:selection><eo:selection>B) of&nbsp; </eo:selection><eo:selection>C) for&nbsp; </eo:selection><eo:selection>D) to<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) reflects&nbsp; </eo:selection><eo:selection>B) detects&nbsp;&nbsp; </eo:selection><eo:selection>C) protects&nbsp; </eo:selection><eo:selection>D) selects<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) sends in&nbsp; </eo:selection><eo:selection>B) puts out&nbsp;&nbsp; </eo:selection><eo:selection>C) stands for&nbsp;&nbsp; </eo:selection><eo:selection>D) carries away<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) visible&nbsp;&nbsp; </eo:selection><eo:selection>B) responsible&nbsp;&nbsp; </eo:selection><eo:selection>C) feasible&nbsp;&nbsp; </eo:selection><eo:selection>D) sensible<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) beside&nbsp;&nbsp; </eo:selection><eo:selection>B) over&nbsp;&nbsp; </eo:selection><eo:selection>C) beyond&nbsp;&nbsp; </eo:selection><eo:selection>D) up<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) appeals&nbsp;&nbsp; </eo:selection><eo:selection>B) admits&nbsp;&nbsp; </eo:selection><eo:selection>C) advocates&nbsp;&nbsp; </eo:selection><eo:selection>D) allows<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) after&nbsp; </eo:selection><eo:selection>B) behind&nbsp;&nbsp; </eo:selection><eo:selection>C) until&nbsp;&nbsp; </eo:selection><eo:selection>D) toward<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) optional&nbsp;&nbsp; </eo:selection><eo:selection>B) invalid&nbsp;&nbsp; </eo:selection><eo:selection>C) occasional&nbsp;&nbsp; </eo:selection><eo:selection>D) insignificant<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) communities&nbsp;&nbsp; </eo:selection><eo:selection>B) corps&nbsp;&nbsp; </eo:selection><eo:selection>C) corporations&nbsp;&nbsp; </eo:selection><eo:selection>D) compounds<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) largely&nbsp;&nbsp; </eo:selection><eo:selection>B) slightly&nbsp;&nbsp; </eo:selection><eo:selection>C) solely&nbsp;&nbsp; </eo:selection><eo:selection>D) only<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) lately&nbsp;&nbsp; </eo:selection><eo:selection>B) later&nbsp;&nbsp; </eo:selection><eo:selection>C) late&nbsp;&nbsp; </eo:selection><eo:selection>D) latter<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) offered&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) convinced&nbsp;&nbsp; </eo:selection><eo:selection>C) equipped&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) provided<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) Instead&nbsp;&nbsp; </eo:selection><eo:selection>B) Nevertheless&nbsp;&nbsp; </eo:selection><eo:selection>C) However&nbsp;&nbsp; </eo:selection><eo:selection>D) Besides<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) and&nbsp;&nbsp; </eo:selection><eo:selection>B) or&nbsp;&nbsp; </eo:selection><eo:selection>C) but&nbsp;&nbsp; </eo:selection><eo:selection>D) though<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) different&nbsp;&nbsp; </eo:selection><eo:selection>B) flexible&nbsp;&nbsp; </eo:selection><eo:selection>C) widespread&nbsp;&nbsp; </eo:selection><eo:selection>D) productive<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) acquired&nbsp;&nbsp; </eo:selection><eo:selection>B) adapted&nbsp;&nbsp; </eo:selection><eo:selection>C) practiced&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) proceeded<br />\r\n	&nbsp;</p>\r\n</eo:selection>', 'A###################', 0, 'cloze'),
(126, '<exam:flag=cloze><es:content><p>\r\n	The term e-commerce refers to all commercial transactions conducted over the Internet, including transactions by consumers and business-to-business transactions. Conceptually, e-commerce does not __67<eo:blank>__ from well-known commercial offerings such as banking by phone, &quot;mail order&quot; catalogs, or sending a purchase order to supplier __68<eo:blank>__ fax.E-commerce follows the same model __69<eo:blank>__ in other business transactions; the difference __70<eo:blank>__ in the details.<br />\r\n	　　To a consumer, the most visible form of e-commerce consists __71<eo:blank>__ online ordering. A customer begins with a catalog of possible items, __72<eo:blank>__ an item, arranges a form of payment, and __73<eo:blank>__ an order. Instead of a physical catalog, e-commerce arranges for catalogs to be __74<eo:blank>__ on the Internet. Instead of sending an order on paper or by telephone, e-commerce arranges for orders to be sent __75<eo:blank>__ a computer network. Finally, instead of sending a paper representation of payment such as a check, e-commerce __76<eo:blank>__ one to send payment information electronically.<br />\r\n	　　In the decade __77<eo:blank>__ 1993, e-commerce grew from an __78<eo:blank>__ novelty (新奇事物) to a mainstream business influence. In 1993, few __79<eo:blank>__ had a web page, and __80<eo:blank>__ a handful allowed one to order products or services online. Ten years __81<eo:blank>__, both large and small businesses had web pages, and most __82<eo:blank>__ users with the opportunity to place an order. __83<eo:blank>__, many banks added online access, __84<eo:blank>__ online banking and bill paying became __85<eo:blank>__. More importantly, the value of goods and services __86<eo:blank>__ over the Internet grew dramatically after 1997.<br />\r\n	　　</eo:content><eo:question></eo:question><eo:selection>A) distract&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) descend&nbsp; </eo:selection><eo:selection>C) differ&nbsp; </eo:selection><eo:selection>D) derive<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) with&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) via&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) from&nbsp;&nbsp; </eo:selection><eo:selection>D) off<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) appeared&nbsp; </eo:selection><eo:selection>B) used&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) resorted&nbsp; </eo:selection><eo:selection>D) served<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) situates&nbsp;&nbsp; </eo:selection><eo:selection>B) lies&nbsp; </eo:selection><eo:selection>C) roots&nbsp; </eo:selection><eo:selection>D) locates<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) on&nbsp; </eo:selection><eo:selection>B) of&nbsp; </eo:selection><eo:selection>C) for&nbsp; </eo:selection><eo:selection>D) to<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) reflects&nbsp; </eo:selection><eo:selection>B) detects&nbsp;&nbsp; </eo:selection><eo:selection>C) protects&nbsp; </eo:selection><eo:selection>D) selects<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) sends in&nbsp; </eo:selection><eo:selection>B) puts out&nbsp;&nbsp; </eo:selection><eo:selection>C) stands for&nbsp;&nbsp; </eo:selection><eo:selection>D) carries away<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) visible&nbsp;&nbsp; </eo:selection><eo:selection>B) responsible&nbsp;&nbsp; </eo:selection><eo:selection>C) feasible&nbsp;&nbsp; </eo:selection><eo:selection>D) sensible<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) beside&nbsp;&nbsp; </eo:selection><eo:selection>B) over&nbsp;&nbsp; </eo:selection><eo:selection>C) beyond&nbsp;&nbsp; </eo:selection><eo:selection>D) up<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) appeals&nbsp;&nbsp; </eo:selection><eo:selection>B) admits&nbsp;&nbsp; </eo:selection><eo:selection>C) advocates&nbsp;&nbsp; </eo:selection><eo:selection>D) allows<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) after&nbsp; </eo:selection><eo:selection>B) behind&nbsp;&nbsp; </eo:selection><eo:selection>C) until&nbsp;&nbsp; </eo:selection><eo:selection>D) toward<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) optional&nbsp;&nbsp; </eo:selection><eo:selection>B) invalid&nbsp;&nbsp; </eo:selection><eo:selection>C) occasional&nbsp;&nbsp; </eo:selection><eo:selection>D) insignificant<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) communities&nbsp;&nbsp; </eo:selection><eo:selection>B) corps&nbsp;&nbsp; </eo:selection><eo:selection>C) corporations&nbsp;&nbsp; </eo:selection><eo:selection>D) compounds<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) largely&nbsp;&nbsp; </eo:selection><eo:selection>B) slightly&nbsp;&nbsp; </eo:selection><eo:selection>C) solely&nbsp;&nbsp; </eo:selection><eo:selection>D) only<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) lately&nbsp;&nbsp; </eo:selection><eo:selection>B) later&nbsp;&nbsp; </eo:selection><eo:selection>C) late&nbsp;&nbsp; </eo:selection><eo:selection>D) latter<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) offered&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) convinced&nbsp;&nbsp; </eo:selection><eo:selection>C) equipped&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) provided<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) Instead&nbsp;&nbsp; </eo:selection><eo:selection>B) Nevertheless&nbsp;&nbsp; </eo:selection><eo:selection>C) However&nbsp;&nbsp; </eo:selection><eo:selection>D) Besides<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) and&nbsp;&nbsp; </eo:selection><eo:selection>B) or&nbsp;&nbsp; </eo:selection><eo:selection>C) but&nbsp;&nbsp; </eo:selection><eo:selection>D) though<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) different&nbsp;&nbsp; </eo:selection><eo:selection>B) flexible&nbsp;&nbsp; </eo:selection><eo:selection>C) widespread&nbsp;&nbsp; </eo:selection><eo:selection>D) productive<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) acquired&nbsp;&nbsp; </eo:selection><eo:selection>B) adapted&nbsp;&nbsp; </eo:selection><eo:selection>C) practiced&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) proceeded<br />\r\n	&nbsp;</p>\r\n</eo:selection>', '#######B############', 0, 'cloze'),
(125, '<exam:flag=cloze><es:content></eo:content><eo:question></eo:question><eo:selection>A) distract&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) descend&nbsp; </eo:selection><eo:selection>C) differ&nbsp; </eo:selection><eo:selection>D) derive<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) with&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) via&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) from&nbsp;&nbsp; </eo:selection><eo:selection>D) off<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) appeared&nbsp; </eo:selection><eo:selection>B) used&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) resorted&nbsp; </eo:selection><eo:selection>D) served<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) situates&nbsp;&nbsp; </eo:selection><eo:selection>B) lies&nbsp; </eo:selection><eo:selection>C) roots&nbsp; </eo:selection><eo:selection>D) locates<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) on&nbsp; </eo:selection><eo:selection>B) of&nbsp; </eo:selection><eo:selection>C) for&nbsp; </eo:selection><eo:selection>D) to<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) reflects&nbsp; </eo:selection><eo:selection>B) detects&nbsp;&nbsp; </eo:selection><eo:selection>C) protects&nbsp; </eo:selection><eo:selection>D) selects<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) sends in&nbsp; </eo:selection><eo:selection>B) puts out&nbsp;&nbsp; </eo:selection><eo:selection>C) stands for&nbsp;&nbsp; </eo:selection><eo:selection>D) carries away<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) visible&nbsp;&nbsp; </eo:selection><eo:selection>B) responsible&nbsp;&nbsp; </eo:selection><eo:selection>C) feasible&nbsp;&nbsp; </eo:selection><eo:selection>D) sensible<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) beside&nbsp;&nbsp; </eo:selection><eo:selection>B) over&nbsp;&nbsp; </eo:selection><eo:selection>C) beyond&nbsp;&nbsp; </eo:selection><eo:selection>D) up<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) appeals&nbsp;&nbsp; </eo:selection><eo:selection>B) admits&nbsp;&nbsp; </eo:selection><eo:selection>C) advocates&nbsp;&nbsp; </eo:selection><eo:selection>D) allows<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) after&nbsp; </eo:selection><eo:selection>B) behind&nbsp;&nbsp; </eo:selection><eo:selection>C) until&nbsp;&nbsp; </eo:selection><eo:selection>D) toward<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) optional&nbsp;&nbsp; </eo:selection><eo:selection>B) invalid&nbsp;&nbsp; </eo:selection><eo:selection>C) occasional&nbsp;&nbsp; </eo:selection><eo:selection>D) insignificant<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) communities&nbsp;&nbsp; </eo:selection><eo:selection>B) corps&nbsp;&nbsp; </eo:selection><eo:selection>C) corporations&nbsp;&nbsp; </eo:selection><eo:selection>D) compounds<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) largely&nbsp;&nbsp; </eo:selection><eo:selection>B) slightly&nbsp;&nbsp; </eo:selection><eo:selection>C) solely&nbsp;&nbsp; </eo:selection><eo:selection>D) only<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) lately&nbsp;&nbsp; </eo:selection><eo:selection>B) later&nbsp;&nbsp; </eo:selection><eo:selection>C) late&nbsp;&nbsp; </eo:selection><eo:selection>D) latter<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) offered&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) convinced&nbsp;&nbsp; </eo:selection><eo:selection>C) equipped&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) provided<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) Instead&nbsp;&nbsp; </eo:selection><eo:selection>B) Nevertheless&nbsp;&nbsp; </eo:selection><eo:selection>C) However&nbsp;&nbsp; </eo:selection><eo:selection>D) Besides<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) and&nbsp;&nbsp; </eo:selection><eo:selection>B) or&nbsp;&nbsp; </eo:selection><eo:selection>C) but&nbsp;&nbsp; </eo:selection><eo:selection>D) though<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) different&nbsp;&nbsp; </eo:selection><eo:selection>B) flexible&nbsp;&nbsp; </eo:selection><eo:selection>C) widespread&nbsp;&nbsp; </eo:selection><eo:selection>D) productive<br />\r\n	　　</eo:selection><eo:question></eo:question><eo:selection>A) acquired&nbsp;&nbsp; </eo:selection><eo:selection>B) adapted&nbsp;&nbsp; </eo:selection><eo:selection>C) practiced&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) proceeded<br />\r\n	&nbsp;</p>\r\n</eo:selection>', 'C###################', 0, 'cloze'),
(124, '<exam:flag=fastReading><es:content><p>\r\n	<strong>Part II Reading Comprehension (Skimming and Scanning) (15 minutes)<br />\r\n	</strong>　　Directions: In this part, you will have 15 minutes to go over the passage quickly and answer the questions on Answer Sheet 1. For questions 1-7, choose the best answer from the four choices marked A), B), C) and D). For questions 8-10, complete the sentences with the information given in the passage.<br />\r\n	　　Caught in the Web<br />\r\n	　　A few months ago, it wasn&#39;t unusual for 47-year-old Carla Toebe to spend 15 hours per day online. She&#39;d wake up early, turn on her laptop and chat on Internet dating sites and instant-messaging programs &ndash; leaving her bed for only brief intervals. Her household bills piled up, along with the dishes and dirty laundry, but it took near-constant complaints from her four daughters before she realized she had a problem.<br />\r\n	　　&quot;I was starting to feel like my whole world was falling apart &ndash; kind of slipping into a depression,&quot; said Carla. &quot;I knew that if I didn&#39;t get off the dating sites, I&#39;d just keep going,&quot; detaching (使脱离) herself further from the outside world.<br />\r\n	　　Toebe&#39;s conclusion: She felt like she was &quot;addicted&quot; to the Internet. She&#39;s not alone.<br />\r\n	　　Concern about excessive Internet use isn&#39;t new. As far back as 1995, articles in medical journals and the establishment of a Pennsylvania treatment center for overusers generated interest in the subject. There&#39;s still no consensus on how much time online constitutes too much or whether addiction is possible.<br />\r\n	　　But as reliance on the Web grows, there are signs that the question is getting more serious attention: Last month, a study published in CNS Spectrums claimed to be the first large-scale look at excessive Internet use. The American Psychiatric Association may consider listing Internet addiction in the next edition of its diagnostic manual. And scores of online discussion boards have popped up on which people discuss negative experiences tied to too much time on the Web.<br />\r\n	　　&quot;There&#39;s no question that there&#39;re people who&#39;re seriously in trouble because they&#39;re overdoing their Internet involvement,&quot; said psychiatrist (精神科医生) Ivan Goldberg. Goldberg calls the problem a disorder rather than a true addiction.<br />\r\n	　　Jonathan Bishop, a researcher in Wales specializing in online communities, is more skeptical. &quot;The Internet is an environment,&quot; he said. &quot;You can&#39;t be addicted to the environment.&quot; Bishop describes the problem as simply a matter of priorities, which can be solved by encouraging people to prioritize other life goals and plans in place of time spent online.<br />\r\n	　　The new CNS Spectrums study was based on results of a nationwide telephone survey of more than 2,500 adults. Like the 2005 survey, this one was conducted by Stanford University researchers.About 6% of respondents reported that &quot;their relationships suffered because of excessive Internet use.&quot; About 9% attempted to conceal &quot;nonessential Internet use,&quot; and nearly 4% reported feeling &quot;preoccupied by the Internet when offline.&quot;<br />\r\n	　　About 8% said they used the Internet as a way to escape problems, and almost 14% reported they &quot;found it hard to stay away from the Internet for several days at a time.&quot;<br />\r\n	　　&quot;The Internet problem is still in its infancy,&quot; said Elias Aboujaoude, a Stanford professor. No single online activity is to blame for excessive use, he said. &quot;They&#39;re online in chat rooms, checking e-mail, or writing blogs. [The problem is] not limited to porn (色情) or gambling&quot; websites.<br />\r\n	　　Excessive Internet use should be defined not by the number of hours spent online but &quot;in terms of losses,&quot; said Maressa Orzack, a Harvard University professor. &quot;If it&#39;s a loss [where] you&#39;re not getting to work, and family relationships are breaking down as a result, then it&#39;s too much.&quot;<br />\r\n	　　Since the early 1990s, several clinics have been established in the U. S. to treat heavy Internet users. They include the Center for Internet Addiction Recovery and the Center for Internet Behavior.<br />\r\n	　　The website for Orzack&#39;s center lists the following among the psychological symptoms of computer addiction:<br />\r\n	　　● Having a sense of well-being (幸福) or excitement while at the computer.<br />\r\n	　　● Longing for more and more time at the computer.<br />\r\n	　　● Neglect of family and friends.<br />\r\n	　　● Feeling empty, depressed or irritable when not at the computer.<br />\r\n	　　● Lying to employers and family about activities.<br />\r\n	　　● Inability to stop the activity.<br />\r\n	　　● Problems with school or job.<br />\r\n	　　Physical symptoms listed include dry eyes, backaches, skipping meals, poor personal hygiene (卫生) and sleep disturbances.<br />\r\n	　　People who struggle with excessive Internet use maybe depressed or have other mood disorders, Orzack said. When she discusses Internet habits with her patients, they often report that being online offers a &quot;sense of belonging, and escape, excitement [and] fun,&quot; she said. &quot;Some people say relief&hellip;because they find themselves so relaxed.&quot;<br />\r\n	　　Some parts of the Internet seem to draw people in more than others. Internet gamers spend countless hours competing in games against people from all over the world. One such game, called World of Warcraft, is cited on many sites by posters complaining of a &quot;gaming addiction.&quot;<br />\r\n	　　Andrew Heidrich, an education network administrator from Sacramento, plays World of Warcraft for about two to four hours every other night, but that&#39;s nothing compared with the 40 to 60 hours a week he spent playing online games when he was in college. He cut back only after a full-scale family intervention (干预), in which relatives told him he&#39;d gained weight.<br />\r\n	　　&quot;There&#39;s this whole culture of competition that sucks people in&quot; with online gaming, said Heidrich, now a father of two. &quot;People do it at the expense of everything that was a constant in their lives.&quot; Heidrich now visits websites that discuss gaming addiction regularly &quot;to remind myself to keep my love for online games in check.&quot;<br />\r\n	　　Toebe also regularly visits a site where posters discuss Internet overuse. In August, when she first realized she had a problem, she posted a message on a Yahoo Internet addiction group with the subject line: &quot;I have an Internet Addiction.&quot;<br />\r\n	　　&quot;I&#39;m self-employed and need the Internet for my work, but I&#39;m failing to accomplish my work,to take care of my home, to give attention to my children,&quot; she wrote in a message sent to the group.&quot;I have no money or insurance to get professional help; I can&#39;t even pay my mortgage (抵押贷款) and face losing everything.&quot;<br />\r\n	　　Since then, Toebe said, she has kept her promise to herself to cut back on her Internet use. &quot;I have a boyfriend now, and I&#39;m not interested in online dating,&quot; she said by phone last week. &quot;It&#39;s a lot better now.&quot;<br />\r\n	　　注意：此部分试题请在答题卡1上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What eventually made Carla Toebe realize she was spending too much time on the Internet?<br />\r\n	　　</eo:question><eo:selection>A) Her daughter&#39;s repeated complaints.<br />\r\n	　　</eo:selection><eo:selection>B) Fatigue resulting from lack of sleep.<br />\r\n	　　</eo:selection><eo:selection>C) The poorly managed state of her house.<br />\r\n	　　</eo:selection><eo:selection>D) The high financial costs adding up.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What does the author say about excessive Internet use?<br />\r\n	　　</eo:question><eo:selection>A) People should be warned of its harmful consequences.<br />\r\n	　　</eo:selection><eo:selection>B) It has become virtually inevitable.<br />\r\n	　　</eo:selection><eo:selection>C) It has been somewhat exaggerated.<br />\r\n	　　</eo:selection><eo:selection>D) People haven&#39;t yet reached agreement on its definition.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Jonathan Bishop believes that the Internet overuse problem can be solved if people ______.<br />\r\n	　　</eo:question><eo:selection>A) try to improve the Internet environment<br />\r\n	　　</eo:selection><eo:selection>B) become aware of its serious consequences<br />\r\n	　　</eo:selection><eo:selection>C) can realize what is important in life<br />\r\n	　　</eo:selection><eo:selection>D) can reach a consensus on its definition<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Professor Maressa Orzack, Internet use would be considered excessive if ______.<br />\r\n	　　</eo:question><eo:selection>A) it seriously affected family relationships<br />\r\n	　　</eo:selection><eo:selection>B) one visited porn websites frequently<br />\r\n	　　</eo:selection><eo:selection>C) too much time was spent in chat rooms<br />\r\n	　　</eo:selection><eo:selection>D) people got involved in online gambling<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Orzack, people who struggle with heavy reliance on the Internet may feel ______.<br />\r\n	　　</eo:question><eo:selection>A) discouraged<br />\r\n	　　</eo:selection><eo:selection>B) pressured<br />\r\n	　　</eo:selection><eo:selection>C) depressed<br />\r\n	　　</eo:selection><eo:selection>D) puzzled<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why did Andre Heidrich cut back online gaming?<br />\r\n	　　</eo:question><eo:selection>A) He had lost a lot of money.<br />\r\n	　　</eo:selection><eo:selection>B) His family had intervened.<br />\r\n	　　</eo:selection><eo:selection>C) He had offended his relatives.<br />\r\n	　　</eo:selection><eo:selection>D) His career had been ruined.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Andrew Heidrich now visits websites that discuss online gaming addiction to ______.<br />\r\n	　　</eo:question><eo:selection>A) improve his online gaming skills<br />\r\n	　　</eo:selection><eo:selection>B) curb his desire for online gaming<br />\r\n	　　</eo:selection><eo:selection>C) show how good he is at online gaming<br />\r\n	　　</eo:selection><eo:selection>D) exchange online gaming experience<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:fillblank> In one of the messages she posted on a website, Toebe admitted that she <eo:blank>.<br />\r\n	　　</eo:fillblank></eo:question><eo:question><eo:fillblank> Excessive Internet use had rendered Toebe so poor that she couldn&#39;t afford to seek <eo:blank>.<br />\r\n	　　</eo:fillblank></eo:question><eo:question><eo:fillblank> Now that she&#39;s got a boyfriend, Toebe is no longer crazy about <eo:blank>.</p>\r\n</eo:fillblank></eo:question>', 'A#########', 0, 'fastReading'),
(122, '<exam:flag=translation><p>\r\n	<strong>Part VI Translation  minutes</strong><br />\r\n	　　Directions: Complete the sentences by translating into English the Chinese given in bracketsPlease write you translation on Answer Sheet <br />\r\n	　　注意：此部分试题请在答题卡上作答，只需写出译文部分。<br />\r\n	　　 Because of the noise outside, Nancy had great difficulty <eo:blank> 集中注意力在实验上<br />\r\n	　　 The manager never laughed; neither <eo:blank> 她也从来没有发过脾气<br />\r\n	　　 We look forward to <eo:blank> 被邀请出席开幕式<br />\r\n	　　 It is suggested that the air conditioner <eo:blank> 要安装在窗户旁<br />\r\n	　　 The -year-old girl decided to travel abroad on her own despite <eo:blank> 她父母的强烈反对</p>\r\n', 'qwe####', 0, 'translation'),
(123, '<exam:flag=fastReading><es:content><p>\r\n	<strong>Part II Reading Comprehension (Skimming and Scanning) (15 minutes)<br />\r\n	</strong>　　Directions: In this part, you will have 15 minutes to go over the passage quickly and answer the questions on Answer Sheet 1. For questions 1-7, choose the best answer from the four choices marked A), B), C) and D). For questions 8-10, complete the sentences with the information given in the passage.<br />\r\n	　　Caught in the Web<br />\r\n	　　A few months ago, it wasn&#39;t unusual for 47-year-old Carla Toebe to spend 15 hours per day online. She&#39;d wake up early, turn on her laptop and chat on Internet dating sites and instant-messaging programs &ndash; leaving her bed for only brief intervals. Her household bills piled up, along with the dishes and dirty laundry, but it took near-constant complaints from her four daughters before she realized she had a problem.<br />\r\n	　　&quot;I was starting to feel like my whole world was falling apart &ndash; kind of slipping into a depression,&quot; said Carla. &quot;I knew that if I didn&#39;t get off the dating sites, I&#39;d just keep going,&quot; detaching (使脱离) herself further from the outside world.<br />\r\n	　　Toebe&#39;s conclusion: She felt like she was &quot;addicted&quot; to the Internet. She&#39;s not alone.<br />\r\n	　　Concern about excessive Internet use isn&#39;t new. As far back as 1995, articles in medical journals and the establishment of a Pennsylvania treatment center for overusers generated interest in the subject. There&#39;s still no consensus on how much time online constitutes too much or whether addiction is possible.<br />\r\n	　　But as reliance on the Web grows, there are signs that the question is getting more serious attention: Last month, a study published in CNS Spectrums claimed to be the first large-scale look at excessive Internet use. The American Psychiatric Association may consider listing Internet addiction in the next edition of its diagnostic manual. And scores of online discussion boards have popped up on which people discuss negative experiences tied to too much time on the Web.<br />\r\n	　　&quot;There&#39;s no question that there&#39;re people who&#39;re seriously in trouble because they&#39;re overdoing their Internet involvement,&quot; said psychiatrist (精神科医生) Ivan Goldberg. Goldberg calls the problem a disorder rather than a true addiction.<br />\r\n	　　Jonathan Bishop, a researcher in Wales specializing in online communities, is more skeptical. &quot;The Internet is an environment,&quot; he said. &quot;You can&#39;t be addicted to the environment.&quot; Bishop describes the problem as simply a matter of priorities, which can be solved by encouraging people to prioritize other life goals and plans in place of time spent online.<br />\r\n	　　The new CNS Spectrums study was based on results of a nationwide telephone survey of more than 2,500 adults. Like the 2005 survey, this one was conducted by Stanford University researchers.About 6% of respondents reported that &quot;their relationships suffered because of excessive Internet use.&quot; About 9% attempted to conceal &quot;nonessential Internet use,&quot; and nearly 4% reported feeling &quot;preoccupied by the Internet when offline.&quot;<br />\r\n	　　About 8% said they used the Internet as a way to escape problems, and almost 14% reported they &quot;found it hard to stay away from the Internet for several days at a time.&quot;<br />\r\n	　　&quot;The Internet problem is still in its infancy,&quot; said Elias Aboujaoude, a Stanford professor. No single online activity is to blame for excessive use, he said. &quot;They&#39;re online in chat rooms, checking e-mail, or writing blogs. [The problem is] not limited to porn (色情) or gambling&quot; websites.<br />\r\n	　　Excessive Internet use should be defined not by the number of hours spent online but &quot;in terms of losses,&quot; said Maressa Orzack, a Harvard University professor. &quot;If it&#39;s a loss [where] you&#39;re not getting to work, and family relationships are breaking down as a result, then it&#39;s too much.&quot;<br />\r\n	　　Since the early 1990s, several clinics have been established in the U. S. to treat heavy Internet users. They include the Center for Internet Addiction Recovery and the Center for Internet Behavior.<br />\r\n	　　The website for Orzack&#39;s center lists the following among the psychological symptoms of computer addiction:<br />\r\n	　　● Having a sense of well-being (幸福) or excitement while at the computer.<br />\r\n	　　● Longing for more and more time at the computer.<br />\r\n	　　● Neglect of family and friends.<br />\r\n	　　● Feeling empty, depressed or irritable when not at the computer.<br />\r\n	　　● Lying to employers and family about activities.<br />\r\n	　　● Inability to stop the activity.<br />\r\n	　　● Problems with school or job.<br />\r\n	　　Physical symptoms listed include dry eyes, backaches, skipping meals, poor personal hygiene (卫生) and sleep disturbances.<br />\r\n	　　People who struggle with excessive Internet use maybe depressed or have other mood disorders, Orzack said. When she discusses Internet habits with her patients, they often report that being online offers a &quot;sense of belonging, and escape, excitement [and] fun,&quot; she said. &quot;Some people say relief&hellip;because they find themselves so relaxed.&quot;<br />\r\n	　　Some parts of the Internet seem to draw people in more than others. Internet gamers spend countless hours competing in games against people from all over the world. One such game, called World of Warcraft, is cited on many sites by posters complaining of a &quot;gaming addiction.&quot;<br />\r\n	　　Andrew Heidrich, an education network administrator from Sacramento, plays World of Warcraft for about two to four hours every other night, but that&#39;s nothing compared with the 40 to 60 hours a week he spent playing online games when he was in college. He cut back only after a full-scale family intervention (干预), in which relatives told him he&#39;d gained weight.<br />\r\n	　　&quot;There&#39;s this whole culture of competition that sucks people in&quot; with online gaming, said Heidrich, now a father of two. &quot;People do it at the expense of everything that was a constant in their lives.&quot; Heidrich now visits websites that discuss gaming addiction regularly &quot;to remind myself to keep my love for online games in check.&quot;<br />\r\n	　　Toebe also regularly visits a site where posters discuss Internet overuse. In August, when she first realized she had a problem, she posted a message on a Yahoo Internet addiction group with the subject line: &quot;I have an Internet Addiction.&quot;<br />\r\n	　　&quot;I&#39;m self-employed and need the Internet for my work, but I&#39;m failing to accomplish my work,to take care of my home, to give attention to my children,&quot; she wrote in a message sent to the group.&quot;I have no money or insurance to get professional help; I can&#39;t even pay my mortgage (抵押贷款) and face losing everything.&quot;<br />\r\n	　　Since then, Toebe said, she has kept her promise to herself to cut back on her Internet use. &quot;I have a boyfriend now, and I&#39;m not interested in online dating,&quot; she said by phone last week. &quot;It&#39;s a lot better now.&quot;<br />\r\n	　　注意：此部分试题请在答题卡1上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What eventually made Carla Toebe realize she was spending too much time on the Internet?<br />\r\n	　　</eo:question><eo:selection>A) Her daughter&#39;s repeated complaints.<br />\r\n	　　</eo:selection><eo:selection>B) Fatigue resulting from lack of sleep.<br />\r\n	　　</eo:selection><eo:selection>C) The poorly managed state of her house.<br />\r\n	　　</eo:selection><eo:selection>D) The high financial costs adding up.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What does the author say about excessive Internet use?<br />\r\n	　　</eo:question><eo:selection>A) People should be warned of its harmful consequences.<br />\r\n	　　</eo:selection><eo:selection>B) It has become virtually inevitable.<br />\r\n	　　</eo:selection><eo:selection>C) It has been somewhat exaggerated.<br />\r\n	　　</eo:selection><eo:selection>D) People haven&#39;t yet reached agreement on its definition.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Jonathan Bishop believes that the Internet overuse problem can be solved if people ______.<br />\r\n	　　</eo:question><eo:selection>A) try to improve the Internet environment<br />\r\n	　　</eo:selection><eo:selection>B) become aware of its serious consequences<br />\r\n	　　</eo:selection><eo:selection>C) can realize what is important in life<br />\r\n	　　</eo:selection><eo:selection>D) can reach a consensus on its definition<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Professor Maressa Orzack, Internet use would be considered excessive if ______.<br />\r\n	　　</eo:question><eo:selection>A) it seriously affected family relationships<br />\r\n	　　</eo:selection><eo:selection>B) one visited porn websites frequently<br />\r\n	　　</eo:selection><eo:selection>C) too much time was spent in chat rooms<br />\r\n	　　</eo:selection><eo:selection>D) people got involved in online gambling<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Orzack, people who struggle with heavy reliance on the Internet may feel ______.<br />\r\n	　　</eo:question><eo:selection>A) discouraged<br />\r\n	　　</eo:selection><eo:selection>B) pressured<br />\r\n	　　</eo:selection><eo:selection>C) depressed<br />\r\n	　　</eo:selection><eo:selection>D) puzzled<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why did Andre Heidrich cut back online gaming?<br />\r\n	　　</eo:question><eo:selection>A) He had lost a lot of money.<br />\r\n	　　</eo:selection><eo:selection>B) His family had intervened.<br />\r\n	　　</eo:selection><eo:selection>C) He had offended his relatives.<br />\r\n	　　</eo:selection><eo:selection>D) His career had been ruined.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Andrew Heidrich now visits websites that discuss online gaming addiction to ______.<br />\r\n	　　</eo:question><eo:selection>A) improve his online gaming skills<br />\r\n	　　</eo:selection><eo:selection>B) curb his desire for online gaming<br />\r\n	　　</eo:selection><eo:selection>C) show how good he is at online gaming<br />\r\n	　　</eo:selection><eo:selection>D) exchange online gaming experience<br />\r\n	　　8. In one of the messages she posted on a website, Toebe admitted that she ______.<br />\r\n	　　9. Excessive Internet use had rendered Toebe so poor that she couldn&#39;t afford to seek ______.<br />\r\n	　　10. Now that she&#39;s got a boyfriend, Toebe is no longer crazy about ______.</p>\r\n</eo:selection></eo:question>', 'A#######1#22#', 0, 'fastReading');
INSERT INTO `selection` (`id`, `content`, `answer`, `hasAudio`, `category`) VALUES
(121, '<exam:flag=cloze><es:content><p>\r\n	Directions: There are 20 blanks in the following passage. For each blank there are four choices marked A), B), C) and D) on the right side of the paper. You should choose the ONE that best fits into the passage. Then mark the corresponding letter on Answer Sheet 2 with a single line through the centre.<br />\r\n	　　注意：此部分试题请在答题卡2上作答。<br />\r\n	　　The term e-commerce refers to all commercial transactions conducted over the Internet, including transactions by consumers and business-to-business transactions. Conceptually, e-commerce does not __67__ from well-known commercial offerings such as banking by phone, &quot;mail order&quot; catalogs, or sending a purchase order to supplier __68__ fax.E-commerce follows the same model __69__ in other business transactions; the difference __70__ in the details.<br />\r\n	　　To a consumer, the most visible form of e-commerce consists __71__ online ordering. A customer begins with a catalog of possible items, __72__ an item, arranges a form of payment, and __73__ an order. Instead of a physical catalog, e-commerce arranges for catalogs to be __74__ on the Internet. Instead of sending an order on paper or by telephone, e-commerce arranges for orders to be sent __75__ a computer network. Finally, instead of sending a paper representation of payment such as a check, e-commerce __76__ one to send payment information electronically.<br />\r\n	　　In the decade __77__ 1993, e-commerce grew from an __78__ novelty (新奇事物) to a mainstream business influence. In 1993, few __79__ had a web page, and __80__ a handful allowed one to order products or services online. Ten years __81__, both large and small businesses had web pages, and most __82__ users with the opportunity to place an order. __83__, many banks added online access, __84__ online banking and bill paying became __85__. More importantly, the value of goods and services __86__ over the Internet grew dramatically after 1997.<br />\r\n	　　</eo:content><eo:question><eo:question></eo:question><eo:selection>A) distract&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) descend&nbsp; </eo:selection><eo:selection>C) differ&nbsp; </eo:selection><eo:selection>D) derive<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) with&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) via&nbsp;&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) from&nbsp;&nbsp; </eo:selection><eo:selection>D) off<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) appeared&nbsp; </eo:selection><eo:selection>B) used&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>C) resorted&nbsp; </eo:selection><eo:selection>D) served<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) situates&nbsp;&nbsp; </eo:selection><eo:selection>B) lies&nbsp; </eo:selection><eo:selection>C) roots&nbsp; </eo:selection><eo:selection>D) locates<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) on&nbsp; </eo:selection><eo:selection>B) of&nbsp; </eo:selection><eo:selection>C) for&nbsp; </eo:selection><eo:selection>D) to<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) reflects&nbsp; </eo:selection><eo:selection>B) detects&nbsp;&nbsp; </eo:selection><eo:selection>C) protects&nbsp; </eo:selection><eo:selection>D) selects<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) sends in&nbsp; </eo:selection><eo:selection>B) puts out&nbsp;&nbsp; </eo:selection><eo:selection>C) stands for&nbsp;&nbsp; </eo:selection><eo:selection>D) carries away<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) visible&nbsp;&nbsp; </eo:selection><eo:selection>B) responsible&nbsp;&nbsp; </eo:selection><eo:selection>C) feasible&nbsp;&nbsp; </eo:selection><eo:selection>D) sensible<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) beside&nbsp;&nbsp; </eo:selection><eo:selection>B) over&nbsp;&nbsp; </eo:selection><eo:selection>C) beyond&nbsp;&nbsp; </eo:selection><eo:selection>D) up<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) appeals&nbsp;&nbsp; </eo:selection><eo:selection>B) admits&nbsp;&nbsp; </eo:selection><eo:selection>C) advocates&nbsp;&nbsp; </eo:selection><eo:selection>D) allows<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) after&nbsp; </eo:selection><eo:selection>B) behind&nbsp;&nbsp; </eo:selection><eo:selection>C) until&nbsp;&nbsp; </eo:selection><eo:selection>D) toward<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) optional&nbsp;&nbsp; </eo:selection><eo:selection>B) invalid&nbsp;&nbsp; </eo:selection><eo:selection>C) occasional&nbsp;&nbsp; </eo:selection><eo:selection>D) insignificant<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) communities&nbsp;&nbsp; </eo:selection><eo:selection>B) corps&nbsp;&nbsp; </eo:selection><eo:selection>C) corporations&nbsp;&nbsp; </eo:selection><eo:selection>D) compounds<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) largely&nbsp;&nbsp; </eo:selection><eo:selection>B) slightly&nbsp;&nbsp; </eo:selection><eo:selection>C) solely&nbsp;&nbsp; </eo:selection><eo:selection>D) only<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) lately&nbsp;&nbsp; </eo:selection><eo:selection>B) later&nbsp;&nbsp; </eo:selection><eo:selection>C) late&nbsp;&nbsp; </eo:selection><eo:selection>D) latter<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) offered&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>B) convinced&nbsp;&nbsp; </eo:selection><eo:selection>C) equipped&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) provided<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Instead&nbsp;&nbsp; </eo:selection><eo:selection>B) Nevertheless&nbsp;&nbsp; </eo:selection><eo:selection>C) However&nbsp;&nbsp; </eo:selection><eo:selection>D) Besides<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) and&nbsp;&nbsp; </eo:selection><eo:selection>B) or&nbsp;&nbsp; </eo:selection><eo:selection>C) but&nbsp;&nbsp; </eo:selection><eo:selection>D) though<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) different&nbsp;&nbsp; </eo:selection><eo:selection>B) flexible&nbsp;&nbsp; </eo:selection><eo:selection>C) widespread&nbsp;&nbsp; </eo:selection><eo:selection>D) productive<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) acquired&nbsp;&nbsp; </eo:selection><eo:selection>B) adapted&nbsp;&nbsp; </eo:selection><eo:selection>C) practiced&nbsp;&nbsp;&nbsp; </eo:selection><eo:selection>D) proceeded<br />\r\n	&nbsp;</p>\r\n</eo:selection></eo:question>', 'B###################', 0, 'cloze'),
(120, '<exam:flag=reading><es:content><p>\r\n	<strong>Passage One<br />\r\n	</strong>　　Questions 57 to 61 are based on the following passage.<br />\r\n	　　You never see him, but they&#39;re with you every time you fly. They record where you are going,how fast you&#39;re traveling and whether everything on your airplane is functioning normally. Their ability to withstand almost any disaster makes them seem like something out of a comic book.They&#39;re known as the black box.<br />\r\n	　　When planes fall from the sky, as a Yemeni airliner did on its way to Comoros Islands in the India ocean June 30, 2009, the black box is the best bet for identifying what went wrong. So when a French submarine (潜水艇) detected the device&#39;s homing signal five days later, the discovery marked a huge step toward determining the cause of a tragedy in which 152 passengers were killed.<br />\r\n	　　In 1958, Australian scientist David Warren developed a flight-memory recorder that would track basic information like altitude and direction. That was the first mode for a black box, which became a requirement on all U.S. commercial flights by 1960. Early models often failed to withstand crashes, however, so in 1965 the device was completely redesigned and moved to the rear of the plane &ndash; the area least subject to impact &ndash; from its original position in the landing wells (起落架舱). The same year, the Federal Aviation Authority required that the boxes, which were never actually black, be painted orange or yellow to aid visibility.<br />\r\n	　　Modern airplanes have two black boxes: a voice recorder, which tracks pilots&#39; conversations,and a flight-data recorder, which monitors fuel levels, engine noises and other operating functions that help investigators reconstruct the aircraft&#39;s final moments. Placed in an insulated (隔绝的) case and surrounded by a quarter-inch-thick panels of stainless steel, the boxes can withstand massive force and temperatures up to 2,000℉. When submerged, they&#39;re also able to emit signals from depths of 20,000 ft. Experts believe the boxes from Air France Flight 447, which crashed near Brazil on June 1,2009, are in water nearly that deep, but statistics say they&#39;re still likely to turn up. In the approximately 20 deep-sea crashes over the past 30 years, only one plane&#39;s black boxes were never recovered.<br />\r\n	　　注意：此部分试题请在答题卡2上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What does the author say about the black box?<br />\r\n	　　</eo:question><eo:selection>A) It ensures the normal functioning of an airplane.<br />\r\n	　　</eo:selection><eo:selection>B) The idea for its design comes from a comic book.<br />\r\n	　　</eo:selection><eo:selection>C) Its ability to ward off disasters is incredible.<br />\r\n	　　</eo:selection><eo:selection>D) It is an indispensable device on an airplane.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What information could be found from the black box on the Yemeni airliner?<br />\r\n	　　</eo:question><eo:selection>A) Data for analyzing the cause of the crash.<br />\r\n	　　</eo:selection><eo:selection>B) The total number of passengers on board.<br />\r\n	　　</eo:selection><eo:selection>C) The scene of the crash and extent of the damage.<br />\r\n	　　</eo:selection><eo:selection>D) Homing signals sent by the pilot before the crash.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why was the black box redesigned in 1965?<br />\r\n	　　</eo:question><eo:selection>A) New materials became available by that time.<br />\r\n	　　</eo:selection><eo:selection>B) Too much space was needed for its installation.<br />\r\n	　　</eo:selection><eo:selection>C) The early models often got damaged in the crash.<br />\r\n	　　</eo:selection><eo:selection>D) The early models didn&#39;t provide the needed data.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why did the Federal Aviation Authority require the black boxes be painted orange or yellow?<br />\r\n	　　</eo:question><eo:selection>A) To distinguish them from the colour of the plane.<br />\r\n	　　</eo:selection><eo:selection>B) To caution people to handle them with care.<br />\r\n	　　</eo:selection><eo:selection>C) To make them easily identifiable.<br />\r\n	　　</eo:selection><eo:selection>D) To conform to international standards.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What do we know about the black boxes from Air France Flight 447?<br />\r\n	　　</eo:question><eo:selection>A) There is still a good chance of their being recovered.<br />\r\n	　　</eo:selection><eo:selection>B) There is an urgent need for them to be reconstructed.<br />\r\n	　　</eo:selection><eo:selection>C) They have stopped sending homing signals.<br />\r\n	　　</eo:selection><eo:selection>D) They were destroyed somewhere near Brazil.</p>\r\n</eo:selection></eo:question>', 'B####', 0, 'reading'),
(118, '<exam:flag=shortListening><es:content><p>\r\n	<strong>Part III Listening Comprehension (35 minutes)<br />\r\n	</strong><strong>　　</strong><strong>Section A</strong><br />\r\n	　　Directions: In this section, you will hear 8 short conversations and 2 long conversations. At the end of each conversation, one or more questions will be asked about what was said.Both the conversation and the questions will be spoken only once. After each question there will be a pause. During the pause, you must read the four choices marked A), B),C) and D), and decide which is the best answer. Then mark the corresponding letter on Answer Sheet 2 with a single line through the centre.<br />\r\n	　　</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	注意：此部分试题请在答题卡2上作答。<br />\r\n	　　</eo:content><eo:question><eo:question></eo:question><eo:selection>A) He has proved to be a better reader than the woman.<br />\r\n	　　</eo:selection><eo:selection>B) He has difficulty understanding the book.<br />\r\n	　　</eo:selection><eo:selection>C) He cannot get access to the assigned book.<br />\r\n	　　</eo:selection><eo:selection>D) He cannot finish his assignment before the deadline.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) She will drive the man to the supermarket.<br />\r\n	　　</eo:selection><eo:selection>B) The man should buy a car of his own.<br />\r\n	　　</eo:selection><eo:selection>C) The man needn&#39;t go shopping every week.<br />\r\n	　　</eo:selection><eo:selection>D) She can pick the man up at the grocery store.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Get more food and drinks.<br />\r\n	　　</eo:selection><eo:selection>B) Ask his friend to come over.<br />\r\n	　　</eo:selection><eo:selection>C) Tidy up the place.<br />\r\n	　　</eo:selection><eo:selection>D) Hold a party.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) The talks can be held any day except this Friday.<br />\r\n	　　</eo:selection><eo:selection>B) He could change his schedule to meet John Smith.<br />\r\n	　　</eo:selection><eo:selection>C) The first-round talks should start as soon as possible.<br />\r\n	　　</eo:selection><eo:selection>D) The woman should contact John Smith first.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) He understands the woman&#39;s feelings.<br />\r\n	　　</eo:selection><eo:selection>B) He has gone through a similar experience.<br />\r\n	　　</eo:selection><eo:selection>C) The woman should have gone on the field trip.<br />\r\n	　　</eo:selection><eo:selection>D) The teacher is just following the regulations.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) She will meet the man halfway.<br />\r\n	　　</eo:selection><eo:selection>B) She will ask David to talk less.<br />\r\n	　　</eo:selection><eo:selection>C) She is sorry the man will not come.<br />\r\n	　　</eo:selection><eo:selection>D) She has to invite David to the party.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Few students understand Prof. Johnson&#39;s lectures.<br />\r\n	　　</eo:selection><eo:selection>B) Few students meet Prof. Jonson&#39;s requirements.<br />\r\n	　　</eo:selection><eo:selection>C) Many students find Prof. Johnson&#39;s lectures boring.<br />\r\n	　　</eo:selection><eo:selection>D) Many students have dropped Prof. Johnson&#39;s class.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Check their computer files.<br />\r\n	　　</eo:selection><eo:selection>B) Make some computations.<br />\r\n	　　</eo:selection><eo:selection>C) Study a computer program.<br />\r\n	　　</eo:selection><eo:selection>D) Assemble a computer.<br />\r\n	<br />\r\n	&nbsp;</p>\r\n</eo:selection></eo:question>', 'C#######', 1, 'shortListening'),
(119, '<exam:flag=longListening><es:content><p>\r\n	<strong>Passage One<br />\r\n	　　</strong>Questions 26 to 29 are based on the conversation you have just heard.<br />\r\n	　　</eo:content><eo:question><eo:question></eo:question><eo:selection>A) District managers.<br />\r\n	　　</eo:selection><eo:selection>B) Regular customers.<br />\r\n	　　</eo:selection><eo:selection>C) Sales directors.<br />\r\n	　　</eo:selection><eo:selection>D) Senior clerks.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) The support provided by the regular clients.<br />\r\n	　　</eo:selection><eo:selection>B) The initiative shown by the sales representatives.<br />\r\n	　　</eo:selection><eo:selection>C) The urgency of implementing the company&#39;s plans.<br />\r\n	　　</eo:selection><eo:selection>D) The important part played by district managers.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Some of them were political-minded.<br />\r\n	　　</eo:selection><eo:selection>B) Fifty percent of them were female.<br />\r\n	　　</eo:selection><eo:selection>C) One third of them were senior managers.<br />\r\n	　　</eo:selection><eo:selection>D) Most of them were rather conservative.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) He used too many quotations.<br />\r\n	　　</eo:selection><eo:selection>B) He was not gender sensitive.<br />\r\n	　　</eo:selection><eo:selection>C) He did not keep to the point.<br />\r\n	　　</eo:selection><eo:selection>D) He spent too much time on details.<br />\r\n	　<strong>　</strong><strong>Passage Two<br />\r\n	</strong>　　Questions 30 to 32 are based on the passage you have just heard.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) State your problem to the head waiter.<br />\r\n	　　</eo:selection><eo:selection>B) Demand a discount on the dishes ordered.<br />\r\n	　　</eo:selection><eo:selection>C) Ask to see the manager politely but firmly.<br />\r\n	　　</eo:selection><eo:selection>D) Ask the name of the person waiting on you.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) You problem may not be understood correctly.<br />\r\n	　　</eo:selection><eo:selection>B) You don&#39;t know if you are complaining at the right time.<br />\r\n	　　</eo:selection><eo:selection>C) Your complaint may not reach the person in charge.<br />\r\n	　　</eo:selection><eo:selection>D) You can&#39;t tell how the person on the line is reacting.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question></eo:question><eo:selection>A) Demand a prompt response.<br />\r\n	　　</eo:selection><eo:selection>B) Provide all the details.<br />\r\n	　　</eo:selection><eo:selection>C) Send it by express mail.<br />\r\n	　　</eo:selection><eo:selection>D) Stick to the point.<br />\r\n	&nbsp;</p>\r\n</eo:selection></eo:question>', 'B######', 1, 'longListening'),
(117, '<exam:flag=fastReading><es:content><p>\r\n	<strong>Part II Reading Comprehension (Skimming and Scanning) (15 minutes)<br />\r\n	</strong>　　Directions: In this part, you will have 15 minutes to go over the passage quickly and answer the questions on Answer Sheet 1. For questions 1-7, choose the best answer from the four choices marked A), B), C) and D). For questions 8-10, complete the sentences with the information given in the passage.<br />\r\n	　　Caught in the Web<br />\r\n	　　A few months ago, it wasn&#39;t unusual for 47-year-old Carla Toebe to spend 15 hours per day online. She&#39;d wake up early, turn on her laptop and chat on Internet dating sites and instant-messaging programs &ndash; leaving her bed for only brief intervals. Her household bills piled up, along with the dishes and dirty laundry, but it took near-constant complaints from her four daughters before she realized she had a problem.<br />\r\n	　　&quot;I was starting to feel like my whole world was falling apart &ndash; kind of slipping into a depression,&quot; said Carla. &quot;I knew that if I didn&#39;t get off the dating sites, I&#39;d just keep going,&quot; detaching (使脱离) herself further from the outside world.<br />\r\n	　　Toebe&#39;s conclusion: She felt like she was &quot;addicted&quot; to the Internet. She&#39;s not alone.<br />\r\n	　　Concern about excessive Internet use isn&#39;t new. As far back as 1995, articles in medical journals and the establishment of a Pennsylvania treatment center for overusers generated interest in the subject. There&#39;s still no consensus on how much time online constitutes too much or whether addiction is possible.<br />\r\n	　　But as reliance on the Web grows, there are signs that the question is getting more serious attention: Last month, a study published in CNS Spectrums claimed to be the first large-scale look at excessive Internet use. The American Psychiatric Association may consider listing Internet addiction in the next edition of its diagnostic manual. And scores of online discussion boards have popped up on which people discuss negative experiences tied to too much time on the Web.<br />\r\n	　　&quot;There&#39;s no question that there&#39;re people who&#39;re seriously in trouble because they&#39;re overdoing their Internet involvement,&quot; said psychiatrist (精神科医生) Ivan Goldberg. Goldberg calls the problem a disorder rather than a true addiction.<br />\r\n	　　Jonathan Bishop, a researcher in Wales specializing in online communities, is more skeptical. &quot;The Internet is an environment,&quot; he said. &quot;You can&#39;t be addicted to the environment.&quot; Bishop describes the problem as simply a matter of priorities, which can be solved by encouraging people to prioritize other life goals and plans in place of time spent online.<br />\r\n	　　The new CNS Spectrums study was based on results of a nationwide telephone survey of more than 2,500 adults. Like the 2005 survey, this one was conducted by Stanford University researchers.About 6% of respondents reported that &quot;their relationships suffered because of excessive Internet use.&quot; About 9% attempted to conceal &quot;nonessential Internet use,&quot; and nearly 4% reported feeling &quot;preoccupied by the Internet when offline.&quot;<br />\r\n	　　About 8% said they used the Internet as a way to escape problems, and almost 14% reported they &quot;found it hard to stay away from the Internet for several days at a time.&quot;<br />\r\n	　　&quot;The Internet problem is still in its infancy,&quot; said Elias Aboujaoude, a Stanford professor. No single online activity is to blame for excessive use, he said. &quot;They&#39;re online in chat rooms, checking e-mail, or writing blogs. [The problem is] not limited to porn (色情) or gambling&quot; websites.<br />\r\n	　　Excessive Internet use should be defined not by the number of hours spent online but &quot;in terms of losses,&quot; said Maressa Orzack, a Harvard University professor. &quot;If it&#39;s a loss [where] you&#39;re not getting to work, and family relationships are breaking down as a result, then it&#39;s too much.&quot;<br />\r\n	　　Since the early 1990s, several clinics have been established in the U. S. to treat heavy Internet users. They include the Center for Internet Addiction Recovery and the Center for Internet Behavior.<br />\r\n	　　The website for Orzack&#39;s center lists the following among the psychological symptoms of computer addiction:<br />\r\n	　　● Having a sense of well-being (幸福) or excitement while at the computer.<br />\r\n	　　● Longing for more and more time at the computer.<br />\r\n	　　● Neglect of family and friends.<br />\r\n	　　● Feeling empty, depressed or irritable when not at the computer.<br />\r\n	　　● Lying to employers and family about activities.<br />\r\n	　　● Inability to stop the activity.<br />\r\n	　　● Problems with school or job.<br />\r\n	　　Physical symptoms listed include dry eyes, backaches, skipping meals, poor personal hygiene (卫生) and sleep disturbances.<br />\r\n	　　People who struggle with excessive Internet use maybe depressed or have other mood disorders, Orzack said. When she discusses Internet habits with her patients, they often report that being online offers a &quot;sense of belonging, and escape, excitement [and] fun,&quot; she said. &quot;Some people say relief&hellip;because they find themselves so relaxed.&quot;<br />\r\n	　　Some parts of the Internet seem to draw people in more than others. Internet gamers spend countless hours competing in games against people from all over the world. One such game, called World of Warcraft, is cited on many sites by posters complaining of a &quot;gaming addiction.&quot;<br />\r\n	　　Andrew Heidrich, an education network administrator from Sacramento, plays World of Warcraft for about two to four hours every other night, but that&#39;s nothing compared with the 40 to 60 hours a week he spent playing online games when he was in college. He cut back only after a full-scale family intervention (干预), in which relatives told him he&#39;d gained weight.<br />\r\n	　　&quot;There&#39;s this whole culture of competition that sucks people in&quot; with online gaming, said Heidrich, now a father of two. &quot;People do it at the expense of everything that was a constant in their lives.&quot; Heidrich now visits websites that discuss gaming addiction regularly &quot;to remind myself to keep my love for online games in check.&quot;<br />\r\n	　　Toebe also regularly visits a site where posters discuss Internet overuse. In August, when she first realized she had a problem, she posted a message on a Yahoo Internet addiction group with the subject line: &quot;I have an Internet Addiction.&quot;<br />\r\n	　　&quot;I&#39;m self-employed and need the Internet for my work, but I&#39;m failing to accomplish my work,to take care of my home, to give attention to my children,&quot; she wrote in a message sent to the group.&quot;I have no money or insurance to get professional help; I can&#39;t even pay my mortgage (抵押贷款) and face losing everything.&quot;<br />\r\n	　　Since then, Toebe said, she has kept her promise to herself to cut back on her Internet use. &quot;I have a boyfriend now, and I&#39;m not interested in online dating,&quot; she said by phone last week. &quot;It&#39;s a lot better now.&quot;<br />\r\n	　　注意：此部分试题请在答题卡1上作答。<br />\r\n	　　</eo:content><eo:question><eo:question> What eventually made Carla Toebe realize she was spending too much time on the Internet?<br />\r\n	　　</eo:question><eo:selection>A) Her daughter&#39;s repeated complaints.<br />\r\n	　　</eo:selection><eo:selection>B) Fatigue resulting from lack of sleep.<br />\r\n	　　</eo:selection><eo:selection>C) The poorly managed state of her house.<br />\r\n	　　</eo:selection><eo:selection>D) The high financial costs adding up.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> What does the author say about excessive Internet use?<br />\r\n	　　</eo:question><eo:selection>A) People should be warned of its harmful consequences.<br />\r\n	　　</eo:selection><eo:selection>B) It has become virtually inevitable.<br />\r\n	　　</eo:selection><eo:selection>C) It has been somewhat exaggerated.<br />\r\n	　　</eo:selection><eo:selection>D) People haven&#39;t yet reached agreement on its definition.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Jonathan Bishop believes that the Internet overuse problem can be solved if people ______.<br />\r\n	　　</eo:question><eo:selection>A) try to improve the Internet environment<br />\r\n	　　</eo:selection><eo:selection>B) become aware of its serious consequences<br />\r\n	　　</eo:selection><eo:selection>C) can realize what is important in life<br />\r\n	　　</eo:selection><eo:selection>D) can reach a consensus on its definition<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Professor Maressa Orzack, Internet use would be considered excessive if ______.<br />\r\n	　　</eo:question><eo:selection>A) it seriously affected family relationships<br />\r\n	　　</eo:selection><eo:selection>B) one visited porn websites frequently<br />\r\n	　　</eo:selection><eo:selection>C) too much time was spent in chat rooms<br />\r\n	　　</eo:selection><eo:selection>D) people got involved in online gambling<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> According to Orzack, people who struggle with heavy reliance on the Internet may feel ______.<br />\r\n	　　</eo:question><eo:selection>A) discouraged<br />\r\n	　　</eo:selection><eo:selection>B) pressured<br />\r\n	　　</eo:selection><eo:selection>C) depressed<br />\r\n	　　</eo:selection><eo:selection>D) puzzled<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Why did Andre Heidrich cut back online gaming?<br />\r\n	　　</eo:question><eo:selection>A) He had lost a lot of money.<br />\r\n	　　</eo:selection><eo:selection>B) His family had intervened.<br />\r\n	　　</eo:selection><eo:selection>C) He had offended his relatives.<br />\r\n	　　</eo:selection><eo:selection>D) His career had been ruined.<br />\r\n	　　</eo:selection></eo:question><eo:question><eo:question> Andrew Heidrich now visits websites that discuss online gaming addiction to ______.<br />\r\n	　　</eo:question><eo:selection>A) improve his online gaming skills<br />\r\n	　　</eo:selection><eo:selection>B) curb his desire for online gaming<br />\r\n	　　</eo:selection><eo:selection>C) show how good he is at online gaming<br />\r\n	　　</eo:selection><eo:selection>D) exchange online gaming experience<br />\r\n	　　8. In one of the messages she posted on a website, Toebe admitted that she ______.<br />\r\n	　　9. Excessive Internet use had rendered Toebe so poor that she couldn&#39;t afford to seek ______.<br />\r\n	　　10. Now that she&#39;s got a boyfriend, Toebe is no longer crazy about ______.</p>\r\n</eo:selection></eo:question>', 'A###B####8#9#', 0, 'fastReading');

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
(1, 1, '123'),
(1, 124, '<part:255:1>B#A#A#NULL#NULL#NULL##33#12</part><part:255:1>B#A#A#NULL#NULL#NULL##33#12</part><part:255:1>B#A#A#NULL#NULL#NULL##33#12</part>'),
(1, 126, '<part</part><part:264:5>C#D#NULL#NULL#NULL#C#C#C#NULL#NULL#NULL#NULL#NULL#A#C</part><part:265:3>过后、##########</part><part:266:1>C#NULL#NULL#NULL#NULL#NULL#C#11111111111##</part>'),
(1, 127, '<part</part><part:264:5>NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL#NULL</part><part:265:3>##########</part><part:266:1>NULL#NULL#NULL#NULL#NULL#NULL###</part>'),
(1, 128, '<part</part><part</part><part</part><part</part><part</part><part</part>'),
(1, 129, '<part:267:1><p>\r\n	FDFSDAF</p>\r\n</part>'),
(1, 130, '<part:267:1><p>\r\n	FGSDFGDSF</p>\r\n</part>'),
(1, 131, '<part:267:1><p>\r\n	FGDFASGSDF JAC</p></part>');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`id`, `username`, `password`, `name`, `sex`, `level_id`) VALUES
(1, 'teacher', '123', '之滨', '男', 1),
(2, 'leader', '123', 'leader', '男', 2),
(3, 'admin', '123', '淘神', '男', 3),
(4, '12', '12', 'L4', '男', 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=110 ;

--
-- 转存表中的数据 `temporary_part`
--

INSERT INTO `temporary_part` (`id`, `selorfill_id`, `overview`, `name`, `teacher_id`, `type`) VALUES
(108, 127, '<exam:flag=cloze><es:content><', 'cloze4', 1, 'selection'),
(107, 126, '<exam:flag=cloze><es:content><', 'cloze3', 1, 'selection'),
(106, 125, '<exam:flag=cloze><es:content><', 'cloze2', 1, 'selection'),
(105, 124, '<exam:flag=fastReading><es:con', 'fastReading3', 1, 'selection'),
(104, 123, '<exam:flag=fastReading><es:con', 'fastReading2', 1, 'selection'),
(103, 122, '<exam:flag=translation><p>\r\n	<', 'translation1', 1, 'selection'),
(102, 121, '<exam:flag=cloze><es:content><', 'cloze1', 1, 'selection'),
(101, 120, '<exam:flag=reading><es:content', 'reading1', 1, 'selection'),
(100, 7, '<exam:flag=dictation><p>\r\n	Dir', 'dictation1', 1, 'fillblank'),
(96, 6, '<exam:flag=writing><p>\r\n	<stro', 'writing1', 1, 'fillblank'),
(99, 119, '<exam:flag=longListening><es:c', 'longListening1', 1, 'selection'),
(98, 118, '<exam:flag=shortListening><es:', 'shortListening1', 1, 'selection'),
(97, 117, '<exam:flag=fastReading><es:con', 'fastReading1', 1, 'selection'),
(109, 128, '<exam:flag=fastReading><es:con', 'fastReading4', 1, 'selection');
