-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-04-05 07:11:44
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erhuo`
--

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_dmsg`
--

CREATE TABLE `erhuo_dmsg` (
  `dmsg_id` int(11) NOT NULL,
  `dmsg_lid` int(11) NOT NULL,
  `dmsg_sid` int(11) NOT NULL,
  `dmsg_rid` int(11) NOT NULL,
  `dmsg_gid` int(11) NOT NULL,
  `dmsg_content` varchar(255) NOT NULL,
  `dmsg_time` int(11) NOT NULL,
  `dmsg_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_dynamic`
--

CREATE TABLE `erhuo_dynamic` (
  `dynamic_id` int(11) NOT NULL,
  `dynamic_uid` int(11) NOT NULL,
  `dynamic_lid` int(11) NOT NULL DEFAULT '0',
  `dynamic_type` int(11) NOT NULL COMMENT '0 全部 1文字 2 商品',
  `dynamic_gid` int(11) NOT NULL,
  `dynamic_content` text NOT NULL,
  `dynamic_share` int(11) NOT NULL DEFAULT '0',
  `dynamic_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态';

--
-- 转存表中的数据 `erhuo_dynamic`
--

INSERT INTO `erhuo_dynamic` (`dynamic_id`, `dynamic_uid`, `dynamic_lid`, `dynamic_type`, `dynamic_gid`, `dynamic_content`, `dynamic_share`, `dynamic_time`) VALUES
(1, 1, 0, 1, 0, '求一个二货~', 0, 1522057530),
(2, 2, 0, 1, 0, '恭喜金彪被重庆理工大学研究生院录取^_^', 0, 1522119708),
(3, 4, 0, 2, 21, '我发布了一个二货，快来看看~', 0, 1522139758),
(6, 5, 0, 2, 25, '我发布了一个二货，快来看看~', 0, 1522142602),
(7, 5, 0, 2, 26, '我发布了一个二货，快来看看~', 0, 1522406503),
(8, 5, 0, 2, 27, '我发布了一个二货，快来看看~', 0, 1522406975),
(9, 5, 0, 2, 28, '我发布了一个二货，快来看看~', 0, 1522407687),
(10, 6, 0, 2, 29, '我发布了一个二货，快来看看~', 0, 1522824784);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_fmsg`
--

CREATE TABLE `erhuo_fmsg` (
  `fmsg_id` int(11) NOT NULL,
  `fmsg_uid` int(11) NOT NULL,
  `fmsg_content` varchar(255) NOT NULL,
  `fmsg_time` int(11) NOT NULL,
  `fmsg_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 未读 2 已读 3 删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言';

--
-- 转存表中的数据 `erhuo_fmsg`
--

INSERT INTO `erhuo_fmsg` (`fmsg_id`, `fmsg_uid`, `fmsg_content`, `fmsg_time`, `fmsg_status`) VALUES
(1, 1, '我是sx我是sx我我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是sx我是s', 1517638511, 0),
(4, 1, '我要反馈', 1517638511, 0),
(5, 2, '删除了我', 1452565822, 3),
(6, 2, '已读', 1523656536, 2),
(7, 2, '你太帅了', 1519545442, 0),
(8, 2, '嘻嘻嘻', 1519545497, 0),
(9, 1, '我要提意见', 1521188339, 0);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_gclassify`
--

CREATE TABLE `erhuo_gclassify` (
  `gclassify_id` int(11) NOT NULL,
  `gclassify_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_gclassify`
--

INSERT INTO `erhuo_gclassify` (`gclassify_id`, `gclassify_name`) VALUES
(1, '图书教材'),
(2, '数码产品'),
(4, '衣物鞋帽'),
(5, '代步工具'),
(6, '运动器材'),
(7, '家用电器'),
(8, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_gicon`
--

CREATE TABLE `erhuo_gicon` (
  `gIcon_id` int(11) NOT NULL,
  `gIcon_gid` int(11) NOT NULL,
  `gIcon_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_gicon`
--

INSERT INTO `erhuo_gicon` (`gIcon_id`, `gIcon_gid`, `gIcon_url`) VALUES
(1, 14, 'http://api.erhuo.com/public/uploads/20180227/123.jpg'),
(2, 15, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(3, 16, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(4, 17, 'http://api.erhuo.com/public/uploads/20180227/123.jpg'),
(5, 17, 'http://api.erhuo.com/public/uploads/20180227/193f126096651e42997ad9356e3ec9bb.png'),
(7, 12, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(9, 12, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(14, 1, 'http://api.erhuo.com/public/uploads/20180227/123.jpg'),
(15, 2, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(16, 1, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(17, 2, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(23, 3, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(24, 10, 'http://api.erhuo.com/public/uploads/20180227/3d7f5dea0a8ccd3a4e5cd9a5dea18e25.jpg'),
(25, 11, 'http://api.erhuo.com/public/uploads/20180227/123.jpg'),
(26, 18, 'http://api.erhuo.com/public/uploads/20180317/c24b56c2b36a666119d79f49d218986d.jpg'),
(27, 18, 'http://api.erhuo.com/public/uploads/20180317/644d4fff06b20063c6553714ad7afefa.jpg'),
(28, 19, 'http://api.erhuo.com/public/uploads/20180321/742cfaec0b10cd1dce6c5b29ccb4b8ea.jpg'),
(29, 20, 'http://api.erhuo.com/public/uploads/20180326/4f8988de1fb4ba55624a0aa2ca856922.jpg'),
(30, 20, 'http://api.erhuo.com/public/uploads/20180326/71612b0990493012c211c9c5559db266.jpg'),
(31, 21, 'http://api.erhuo.com/public/uploads/20180327/8452917e2c9ee2588933c5acec6c0c3a.jpg'),
(35, 25, 'http://api.erhuo.com/public/uploads/20180327/d224df86cef991cebdfc8c343d740cb4.jpg'),
(36, 26, 'http://api.erhuo.com/public/uploads/20180330/e2ff12312e36b2967efb0bb986b9d10a.jpg'),
(37, 27, 'http://api.erhuo.com/public/uploads/20180330/402790e80bf188a998cb924078fd6a51.jpg'),
(38, 28, 'http://api.erhuo.com/public/uploads/20180330/05ec878b578900c66f7fe5d9e89369c8.jpeg'),
(39, 28, 'http://api.erhuo.com/public/uploads/20180330/2e2f43a7de9cda7558e3d6d548f28562.jpeg'),
(40, 29, 'http://api.erhuo.com/public/uploads/20180404/29e4e51e4b1eaa48f3206bab3b5fb06c.jpg'),
(41, 29, 'http://api.erhuo.com/public/uploads/20180404/fc7fdd6776a7a25cf7ea14408569d1f9.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_goods`
--

CREATE TABLE `erhuo_goods` (
  `goods_id` int(11) NOT NULL,
  `goods_uid` int(11) NOT NULL,
  `goods_cid` int(11) NOT NULL COMMENT '分类id',
  `goods_name` char(20) NOT NULL,
  `goods_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0待审核 1 未通过 2通过 3下架',
  `goods_spread` int(11) NOT NULL DEFAULT '0' COMMENT '是否推广',
  `goods_oprice` int(11) NOT NULL COMMENT '原价',
  `goods_nprice` int(11) NOT NULL COMMENT '现价',
  `goods_address` text NOT NULL COMMENT '交易地址',
  `goods_type` int(1) NOT NULL COMMENT '交易方式：0线上 1线下',
  `goods_summary` text NOT NULL COMMENT '简介',
  `phone` char(11) NOT NULL,
  `qq` int(11) DEFAULT NULL,
  `wechat` char(11) NOT NULL,
  `goods_time` int(11) NOT NULL,
  `goods_view` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_goods`
--

INSERT INTO `erhuo_goods` (`goods_id`, `goods_uid`, `goods_cid`, `goods_name`, `goods_status`, `goods_spread`, `goods_oprice`, `goods_nprice`, `goods_address`, `goods_type`, `goods_summary`, `phone`, `qq`, `wechat`, `goods_time`, `goods_view`) VALUES
(1, 2, 1, '好东西1', 2, 0, 1000, 5, '600985', 0, '安安啊啊暗暗爱爱爱啊啊啊啊啊啊啊啊啊让啊啊在正在砸啊啊啊啊啊在正在组织指责则啊啊啊啊啊啊啊啊啊啊啊啊啊', '15574406229', NULL, '', 1517549569, 74),
(2, 2, 1, '好东西2', 2, 0, 10, 5, '600985', 0, '啊啊啊让啊啊在正在砸啊啊啊啊啊在正在组织指责则啊啊啊啊啊啊啊啊啊啊啊啊啊', '', NULL, 'songstar', 1517549717, 2),
(3, 1, 4, '好东西', 2, 0, 10, 5, '&lt;script&gt;arlert(''hello'')&lt;/script&gt;', 0, '修改', '', NULL, 'songstar', 1520574836, 155),
(10, 1, 1, '123', 0, 0, 1000, 2, '', 0, '2145', '', NULL, 'songstar', 1519742735, 22),
(11, 1, 1, '小谈表情', 1, 0, 1, 1, '小谈表情小谈表情', 0, '小谈表情小谈表情', '', NULL, 'songstar', 1519742828, 136),
(12, 1, 1, '123', 2, 0, 1, 2, '', 0, '2145', '', 1043328710, 'songstar', 1519742857, 0),
(14, 1, 1, '123', 2, 0, 1, 2, '', 0, '2145', '', 1043328710, '0songstar', 1519742997, 0),
(15, 1, 1, '小谈表情', 2, 0, 1, 1, '小谈表情小谈表情', 0, '小谈表情小谈表情', '15574406229', NULL, '', 1519743057, 0),
(16, 1, 1, '小谈表情', 1, 0, 1, 1, '小谈表情小谈表情', 0, '小谈表情小谈表情', '', 1043328710, 'songstar', 1519743075, 0),
(17, 1, 1, '小谈表情', 2, 0, 1, 1, '小谈表情小谈表情', 0, '小谈表情小谈表情', '', NULL, '0songstar', 1519743129, 0),
(18, 3, 4, '薄荷绿双肩包', 2, 0, 50, 8, '北校区6区7栋615', 2, '春夏要来了，这个颜色可以说是非常清新了，学姐要毕业了，转手送学妹啊，请学姐喝杯奶茶就行ʚتɞ', '15574406224', 1043328710, '', 1521271843, 26),
(19, 5, 8, '水乳', 2, 0, 50, 30, '南校区2区2栋222', 2, '植物日记水乳套装\n去年九月份买的 闲置到现在 乳液有点少了\n ', '15573318829', 0, '', 1521643841, 27),
(20, 2, 5, '鬼火摩托车', 0, 0, 2600, 2000, '7区1栋222', 2, '上学期中期刚买的新车，进口鬼火入手时2600，到现在骑了不到四百公里。2000出手，全新，加油很给力。', '15574406229', 1043328710, '', 1522041292, 2),
(21, 4, 7, '风扇', 0, 0, 45, 15, '6-7-616', 0, '宿舍用风扇，8成新，原价45，现价15，可讲价', '', 1043328710, '', 1522139168, 0),
(25, 5, 1, '钱理群中国现代文学三十年', 0, 0, 25, 15, '湖南科技大学北校区9教', 0, '钱理群的中国现代文学三十年，图书保存完好，考研很多大学都用这本的哦～有需要的学弟学妹们看过来～', '15573318829', 0, '', 1522142601, 0),
(26, 5, 7, '电热饭盒', 0, 1, 49, 29, '北校区十教学楼', 0, '可以煮面，热饭等等，原价49', '15573318829', 0, '', 1522406503, 1),
(27, 5, 1, '《道德经》', 0, 1, 50, 20, '樱花园', 0, '八成新', '15573318829', 0, '', 1522406975, 1),
(28, 5, 8, '床上书桌', 1, 0, 150, 80, '北校区6-7-616', 2, '原价150，只用了一个学期 无损坏，如果购买女生可以上门帮忙组装，也可以帮助送到您的寝室。', '15573318829', 0, '', 1522407687, 13),
(29, 6, 8, '眼镜框', 0, 0, 50, 35, '6-7-616', 0, '从没带过，几乎全新，可以自配镜片，放着没用低价卖了。', '15673226596', 0, 'zohar', 1522824784, 0);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_goodsrship`
--

CREATE TABLE `erhuo_goodsrship` (
  `goodsrship` int(11) NOT NULL,
  `fans_id` int(11) NOT NULL,
  `followers_id` int(11) NOT NULL,
  `follower_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_goodsrship`
--

INSERT INTO `erhuo_goodsrship` (`goodsrship`, `fans_id`, `followers_id`, `follower_time`) VALUES
(3, 1, 2, 1517586919),
(9, 1, 1, 1520406186),
(10, 1, 11, 1520487443),
(11, 1, 12, 1520487445),
(12, 1, 15, 1520487447),
(17, 1, 3, 1520579650),
(20, 3, 3, 1521267598),
(24, 3, 18, 1521275556),
(25, 1, 18, 1521386053),
(26, 2, 3, 1522040908),
(27, 4, 21, 1522141599);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_grecord`
--

CREATE TABLE `erhuo_grecord` (
  `grecord_id` int(11) NOT NULL,
  `grecord_gid` int(11) NOT NULL,
  `grecord_uid` int(11) NOT NULL,
  `grecord_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品浏览记录';

--
-- 转存表中的数据 `erhuo_grecord`
--

INSERT INTO `erhuo_grecord` (`grecord_id`, `grecord_gid`, `grecord_uid`, `grecord_time`) VALUES
(1, 1, 1, 1521122698),
(4, 1, 2, 1517589457),
(5, 3, 1, 1521621360),
(6, 11, 1, 1521122739),
(7, 3, 3, 1521280746),
(8, 10, 3, 1521271178),
(9, 18, 3, 1521276428),
(10, 18, 1, 1521621341),
(11, 19, 5, 1521647524),
(12, 18, 5, 1521647270),
(13, 3, 2, 1522040740),
(14, 20, 2, 1522041308),
(15, 2, 2, 1522131058),
(16, 19, 2, 1522474028),
(17, 27, 5, 1522407309),
(18, 10, 2, 1522471076),
(19, 11, 2, 1522472110),
(20, 26, 2, 1522472116);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_lmsg`
--

CREATE TABLE `erhuo_lmsg` (
  `lmsg_id` int(11) NOT NULL,
  `lmsg_lid` int(11) NOT NULL,
  `lmsg_type` int(11) NOT NULL COMMENT '0 商品 1 动态',
  `lmsg_sid` int(11) NOT NULL COMMENT '发送者id',
  `lmsg_rid` int(11) NOT NULL COMMENT '接受者id',
  `lmsg_gid` int(11) NOT NULL,
  `lmsg_content` varchar(255) NOT NULL,
  `lmsg_time` int(11) NOT NULL,
  `lmsg_status` int(11) NOT NULL DEFAULT '0' COMMENT '0为未回复1为回复了',
  `lmsg_star` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言';

--
-- 转存表中的数据 `erhuo_lmsg`
--

INSERT INTO `erhuo_lmsg` (`lmsg_id`, `lmsg_lid`, `lmsg_type`, `lmsg_sid`, `lmsg_rid`, `lmsg_gid`, `lmsg_content`, `lmsg_time`, `lmsg_status`, `lmsg_star`) VALUES
(1, 0, 0, 1, 2, 11, '我要留言', 1520847028, 1, 0),
(3, 1, 0, 2, 1, 11, '我要回复', 1520847100, 1, 0),
(4, 0, 0, 1, 2, 11, '增加回复', 1521096955, 0, 0),
(5, 0, 0, 1, 1, 11, '爱数', 1521097689, 0, 0),
(6, 5, 0, 1, 1, 11, '我回复你', 1521099064, 0, 0),
(7, 0, 0, 3, 1, 3, '我是唐新 嘻嘻嘻', 1521264879, 0, 0),
(8, 0, 0, 3, 1, 3, '我是唐新 嘻嘻嘻', 1521264904, 1, 0),
(9, 0, 0, 1, 2, 3, '增加回复', 1521265005, 2, 0),
(10, 0, 0, 1, 2, 3, '增加回复', 1521265079, 2, 0),
(11, 0, 0, 3, 1, 3, '我是唐新 嘻嘻嘻', 1521265103, 1, 0),
(12, 10, 0, 3, 1, 3, '嘤嘤嘤', 1521265931, 0, 0),
(13, 9, 0, 3, 1, 3, '卖竹鼠 三元一只 十元三只', 1521266185, 0, 0),
(16, 0, 1, 2, 2, 2, '恭喜恭喜', 1522131155, 0, 0),
(17, 0, 0, 2, 5, 19, '哇 这个水乳 好漂亮哦', 1522132376, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_main`
--

CREATE TABLE `erhuo_main` (
  `main_id` int(11) NOT NULL,
  `main_gnum` int(11) NOT NULL COMMENT '商品数量',
  `main_unum` int(11) NOT NULL COMMENT '用户数量',
  `main_egnum` int(11) NOT NULL COMMENT '待审核的商品数量',
  `main_fnum` int(11) NOT NULL COMMENT '反馈数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_main`
--

INSERT INTO `erhuo_main` (`main_id`, `main_gnum`, `main_unum`, `main_egnum`, `main_fnum`) VALUES
(0, 19, 6, 7, 7);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_notice`
--

CREATE TABLE `erhuo_notice` (
  `notice_id` int(11) NOT NULL,
  `notice_uid` int(11) NOT NULL,
  `notice_lid` int(11) NOT NULL COMMENT '0 所有人 其他对应用户id',
  `notice_title` char(30) NOT NULL,
  `notice_content` text NOT NULL,
  `notice_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_notice`
--

INSERT INTO `erhuo_notice` (`notice_id`, `notice_uid`, `notice_lid`, `notice_title`, `notice_content`, `notice_time`) VALUES
(1, 1, 0, '《重神机潘多拉》先行上映会重庆场报名开始', '主场观众久等了！3月25日《重神机潘多拉》先行上映会重庆主场报名开始！主场双倍福利！“契约时间”特别活动现场揭晓！我们诚邀B站会员参与先行上映会，让我们共睹河森导演为我们带来的全新世界！详情请戳→<a data-v-facdb7ac="" href="https://www.bilibili.com/blackboard/activity-ZSJPDL.html" target="_blank" title="https://www.bilibili.com/blackboard/activity-ZSJPDL.html" class="link">https://www.bilibili.com/blackboard/activity-ZSJPDL.html</a>', 1521560062),
(2, 1, 0, '哔哩哔哩为你准备了一份除夕大礼包！', '汪星年的拜年祭终于进入最后的倒计时了~ 2月15日除夕夜18:00，记得来bilibili和大家干杯 (゜-゜)つロ', 1521560109),
(4, 1, 0, 'bilibili2018拜年祭来啦！', '大吉大利，今晚看“祭”！一年一度的拜年祭终于要开始啦~今晚18:00，和bilibili的小伙伴一起过年 (ノ≧∇≦)ノ 坐稳这辆去2018拜年祭的车：<a data-v-facdb7ac="" href="https://www.bilibili.com/blackboard/bnj2018.html" target="_blank" title="https://www.bilibili.com/blackboard/bnj2018.html" class="link">https://www.bilibili.com/blackboard/bnj2018.html</a>', 1521608713),
(5, 1, 5, '商品审核通过通知', '恭喜，您发布的商品通过，看快去看看吧~', 1521696667),
(6, 1, 1, '商品审核未通过通知', '亲爱的songstar, 您于2018-03-9 13:53:56发布的商品(好东西)未能通过审核,请修改后等待我们的下一次审核。&lt;br&gt;原因：商品图片不符合&lt;br&gt;审核人:songstar', 1521713700),
(7, 1, 5, '商品审核未通过通知', '亲爱的王玥, 您于2018-03-21 22:50:41发布的商品(水乳)未能通过审核,请修改后等待我们的下一次审核。&lt;br&gt;原因：就是不给你通过&lt;br&gt;审核人:songstar', 1521713777),
(10, 1, 3, '商品审核通过通知', '亲爱的admin@amare, 您于2018-03-17 15:30:43发布的商品(薄荷绿双肩包)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521714324),
(11, 1, 1, '商品审核通过通知', '亲爱的songstar, 您于2018-02-27 22:52:9发布的商品(小谈表情)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521714333),
(12, 1, 1, '商品审核通过通知', '亲爱的songstar, 您于2018-02-27 22:50:57发布的商品(小谈表情)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521714341),
(13, 1, 1, '商品审核通过通知', '亲爱的songstar, 您于2018-02-27 22:49:57发布的商品(123)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521714344),
(14, 1, 2, '商品审核通过通知', '亲爱的songstar1, 您于2018-02-2 13:32:49发布的商品(好东西1)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521714352),
(15, 1, 2, '商品审核通过通知', '亲爱的songstar1, 您于2018-02-2 13:35:17发布的商品(好东西2)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521714354),
(16, 1, 5, '商品审核通过通知', '亲爱的王玥, 您于2018-03-21 22:50:41发布的商品(水乳)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521714365),
(17, 1, 1, '商品已下架通知', '亲爱的songstar, 您于2018-03-9 13:53:56发布的商品(好东西)已下架。感谢您的发布。&lt;br&gt;审核人:songstar', 1521714369),
(18, 1, 1, '商品审核通过通知', '亲爱的songstar, 您于2018-02-27 22:51:15发布的商品(小谈表情)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521714989),
(19, 1, 1, '商品通过审核通知', '亲爱的songstar, 您于2018-02-27 22:47:37发布的商品(123)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521715280),
(20, 1, 1, '商品审核通过通知', '亲爱的songstar, 您于2018-03-9 13:53:56发布的商品(好东西)已通过审核, 快去看一下吧~。&lt;br&gt;审核人:songstar', 1521715341),
(21, 1, 1, '商品审核未通过通知', '亲爱的songstar, 您于2018-02-27 22:51:15发布的商品(小谈表情)未能通过审核,请修改后等待我们的下一次审核。&lt;br&gt;原因：你太菜了&lt;br&gt;审核人:songstar', 1521715390);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_praise`
--

CREATE TABLE `erhuo_praise` (
  `praise_id` int(11) NOT NULL,
  `praise_type` int(11) NOT NULL COMMENT '0 商品 1 动态',
  `praise_mid` int(11) NOT NULL COMMENT '评论id',
  `praise_uid` int(11) NOT NULL COMMENT '用户id',
  `praise_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_praise`
--

INSERT INTO `erhuo_praise` (`praise_id`, `praise_type`, `praise_mid`, `praise_uid`, `praise_time`) VALUES
(3, 0, 1, 2, 1522039567),
(4, 0, 3, 2, 1522039574),
(5, 0, 7, 2, 1522039589),
(6, 0, 11, 2, 1522040520),
(10, 1, 1, 2, 1522122539),
(11, 1, 2, 2, 1522122670),
(12, 0, 14, 2, 1522125191),
(13, 1, 2, 4, 1522135347),
(14, 1, 3, 4, 1522141656),
(15, 1, 7, 5, 1522406689),
(16, 1, 2, 5, 1522406694),
(17, 1, 9, 2, 1522549130);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_report`
--

CREATE TABLE `erhuo_report` (
  `report_id` int(11) NOT NULL,
  `report_type` int(11) NOT NULL COMMENT '1 商品 2 评论 3 是动态',
  `report_gid` int(11) NOT NULL COMMENT '举报对象id',
  `report_uid` int(11) NOT NULL,
  `report_reason` char(10) NOT NULL,
  `report_content` text NOT NULL,
  `report_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_report`
--

INSERT INTO `erhuo_report` (`report_id`, `report_type`, `report_gid`, `report_uid`, `report_reason`, `report_content`, `report_time`) VALUES
(3, 1, 10, 2, '0', '我就是不喜欢', 1522471179),
(5, 1, 11, 2, '其他', '我就是不喜欢', 1522472078),
(6, 1, 26, 2, '垃圾广告', '', 1522472120),
(7, 2, 17, 2, '其他', '测试举报', 1522472431),
(8, 1, 19, 2, '赌博诈骗', '', 1522472435),
(9, 3, 9, 2, '其他', '嗷嗷嗷', 1522548691);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_search`
--

CREATE TABLE `erhuo_search` (
  `search_id` int(11) NOT NULL,
  `search_name` char(11) NOT NULL,
  `search_num` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_search`
--

INSERT INTO `erhuo_search` (`search_id`, `search_name`, `search_num`) VALUES
(1, '四级', 3),
(4, 'jacascript', 1),
(5, 'Vue', 20),
(6, 'Iview', 15),
(7, '小', 24);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_user`
--

CREATE TABLE `erhuo_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(11) NOT NULL,
  `user_psd` varchar(32) NOT NULL,
  `user_phone` char(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_sid` int(5) NOT NULL COMMENT '学校id',
  `user_sex` varchar(20) NOT NULL COMMENT '性别',
  `user_rtime` int(11) NOT NULL COMMENT '注册时间',
  `user_ltime` int(11) NOT NULL COMMENT '上次登陆时间',
  `user_lntime` int(11) NOT NULL COMMENT '上次公告时间',
  `user_icon` varchar(255) NOT NULL,
  `user_ip` varchar(255) NOT NULL,
  `user_sign` varchar(255) NOT NULL COMMENT '个性签名',
  `user_access` int(11) NOT NULL DEFAULT '0' COMMENT '权限 0为普通用户',
  `user_pop` int(11) NOT NULL DEFAULT '0' COMMENT '人气值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_user`
--

INSERT INTO `erhuo_user` (`user_id`, `user_name`, `user_psd`, `user_phone`, `user_email`, `user_sid`, `user_sex`, `user_rtime`, `user_ltime`, `user_lntime`, `user_icon`, `user_ip`, `user_sign`, `user_access`, `user_pop`) VALUES
(1, '二货官方', 'e10adc3949ba59abbe56e057f20f883e', '15574406224', '1043328710@qq.com', 448, 'male', 1519794623, 1522826539, 1522824508, 'http://api.erhuo.com/public/uploads/20180308/0c7d58a57bff751dcc55d36d68c6de33.jpg', '127.0.0.1', '欢迎光临西西书店，有事可以电话联系15152013154', 1, 44),
(2, 'songstar', 'e10adc3949ba59abbe56e057f20f883e', '15574406229', '', 448, 'male', 1519794623, 1522810047, 1522549526, 'http://api.erhuo.com/public/uploads/user_icon/default1.png', '127.0.0.1', '我是猪', 0, 25),
(3, 'admin@amare', 'e10adc3949ba59abbe56e057f20f883e', '', 'admin@amare.cc', 1, 'female', 1519706734, 1521700947, 1521715050, 'http://api.erhuo.com/public/uploads/user_icon/default8.png', '127.0.0.1', '', 0, 15),
(4, '兰兰', 'e10adc3949ba59abbe56e057f20f883e', '18173278879', '', 59, 'female', 1520486498, 1522139043, 0, 'http://api.erhuo.com/public/uploads/user_icon/default7.png', '127.0.0.1', '', 0, 8),
(5, '王玥', 'e10adc3949ba59abbe56e057f20f883e', '15573318829', '', 448, '女生', 1521647852, 1522406228, 1522407079, 'http://api.erhuo.com/public/uploads/user_icon/default4.png', '127.0.0.1', '我是王玥..巴拉巴拉', 0, 6),
(6, '吴志豪', 'e10adc3949ba59abbe56e057f20f883e', '15673226596', '', 448, 'male', 1522822389, 1522824535, 1522824861, 'http://api.erhuo.com/public/uploads/user_icon/default7.png', '127.0.0.1', '', 0, 3);

-- --------------------------------------------------------

--
-- 表的结构 `erhuo_userrship`
--

CREATE TABLE `erhuo_userrship` (
  `usership_id` int(11) NOT NULL,
  `fans_id` int(11) NOT NULL,
  `followers_id` int(11) NOT NULL,
  `follower_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `erhuo_userrship`
--

INSERT INTO `erhuo_userrship` (`usership_id`, `fans_id`, `followers_id`, `follower_time`) VALUES
(11, 2, 2, 1519630670),
(15, 1, 2, 1519636763),
(17, 2, 1, 1520485479),
(19, 4, 1, 1520486540),
(20, 1, 1, 1520599237),
(59, 3, 1, 1521270651),
(71, 3, 3, 1521276431),
(72, 5, 2, 1522406734),
(73, 5, 1, 1522406742),
(74, 5, 5, 1522407317);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `erhuo_dmsg`
--
ALTER TABLE `erhuo_dmsg`
  ADD PRIMARY KEY (`dmsg_id`);

--
-- Indexes for table `erhuo_dynamic`
--
ALTER TABLE `erhuo_dynamic`
  ADD PRIMARY KEY (`dynamic_id`);

--
-- Indexes for table `erhuo_fmsg`
--
ALTER TABLE `erhuo_fmsg`
  ADD PRIMARY KEY (`fmsg_id`);

--
-- Indexes for table `erhuo_gclassify`
--
ALTER TABLE `erhuo_gclassify`
  ADD PRIMARY KEY (`gclassify_id`);

--
-- Indexes for table `erhuo_gicon`
--
ALTER TABLE `erhuo_gicon`
  ADD PRIMARY KEY (`gIcon_id`),
  ADD KEY `gIcon_gid` (`gIcon_gid`);

--
-- Indexes for table `erhuo_goods`
--
ALTER TABLE `erhuo_goods`
  ADD PRIMARY KEY (`goods_id`),
  ADD KEY `goods_cid` (`goods_cid`),
  ADD KEY `goods_uid` (`goods_uid`);

--
-- Indexes for table `erhuo_goodsrship`
--
ALTER TABLE `erhuo_goodsrship`
  ADD PRIMARY KEY (`goodsrship`),
  ADD KEY `fans_id` (`fans_id`),
  ADD KEY `followers_id` (`followers_id`);

--
-- Indexes for table `erhuo_grecord`
--
ALTER TABLE `erhuo_grecord`
  ADD PRIMARY KEY (`grecord_id`);

--
-- Indexes for table `erhuo_lmsg`
--
ALTER TABLE `erhuo_lmsg`
  ADD PRIMARY KEY (`lmsg_id`);

--
-- Indexes for table `erhuo_main`
--
ALTER TABLE `erhuo_main`
  ADD PRIMARY KEY (`main_id`);

--
-- Indexes for table `erhuo_notice`
--
ALTER TABLE `erhuo_notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `erhuo_praise`
--
ALTER TABLE `erhuo_praise`
  ADD PRIMARY KEY (`praise_id`);

--
-- Indexes for table `erhuo_report`
--
ALTER TABLE `erhuo_report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `erhuo_search`
--
ALTER TABLE `erhuo_search`
  ADD PRIMARY KEY (`search_id`);

--
-- Indexes for table `erhuo_user`
--
ALTER TABLE `erhuo_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`user_name`),
  ADD UNIQUE KEY `user_phone` (`user_phone`);

--
-- Indexes for table `erhuo_userrship`
--
ALTER TABLE `erhuo_userrship`
  ADD PRIMARY KEY (`usership_id`),
  ADD KEY `fans_id` (`fans_id`),
  ADD KEY `followers_id` (`followers_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `erhuo_dmsg`
--
ALTER TABLE `erhuo_dmsg`
  MODIFY `dmsg_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `erhuo_dynamic`
--
ALTER TABLE `erhuo_dynamic`
  MODIFY `dynamic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `erhuo_fmsg`
--
ALTER TABLE `erhuo_fmsg`
  MODIFY `fmsg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `erhuo_gclassify`
--
ALTER TABLE `erhuo_gclassify`
  MODIFY `gclassify_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `erhuo_gicon`
--
ALTER TABLE `erhuo_gicon`
  MODIFY `gIcon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- 使用表AUTO_INCREMENT `erhuo_goods`
--
ALTER TABLE `erhuo_goods`
  MODIFY `goods_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `erhuo_goodsrship`
--
ALTER TABLE `erhuo_goodsrship`
  MODIFY `goodsrship` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- 使用表AUTO_INCREMENT `erhuo_grecord`
--
ALTER TABLE `erhuo_grecord`
  MODIFY `grecord_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `erhuo_lmsg`
--
ALTER TABLE `erhuo_lmsg`
  MODIFY `lmsg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `erhuo_notice`
--
ALTER TABLE `erhuo_notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `erhuo_praise`
--
ALTER TABLE `erhuo_praise`
  MODIFY `praise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `erhuo_report`
--
ALTER TABLE `erhuo_report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `erhuo_search`
--
ALTER TABLE `erhuo_search`
  MODIFY `search_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `erhuo_user`
--
ALTER TABLE `erhuo_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `erhuo_userrship`
--
ALTER TABLE `erhuo_userrship`
  MODIFY `usership_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- 限制导出的表
--

--
-- 限制表 `erhuo_gicon`
--
ALTER TABLE `erhuo_gicon`
  ADD CONSTRAINT `erhuo_gicon_ibfk_1` FOREIGN KEY (`gIcon_gid`) REFERENCES `erhuo_goods` (`goods_id`);

--
-- 限制表 `erhuo_goods`
--
ALTER TABLE `erhuo_goods`
  ADD CONSTRAINT `erhuo_goods_ibfk_1` FOREIGN KEY (`goods_cid`) REFERENCES `erhuo_gclassify` (`gclassify_id`),
  ADD CONSTRAINT `erhuo_goods_ibfk_2` FOREIGN KEY (`goods_uid`) REFERENCES `erhuo_user` (`user_id`);

--
-- 限制表 `erhuo_goodsrship`
--
ALTER TABLE `erhuo_goodsrship`
  ADD CONSTRAINT `erhuo_goodsrship_ibfk_1` FOREIGN KEY (`fans_id`) REFERENCES `erhuo_user` (`user_id`),
  ADD CONSTRAINT `erhuo_goodsrship_ibfk_2` FOREIGN KEY (`followers_id`) REFERENCES `erhuo_goods` (`goods_id`);

--
-- 限制表 `erhuo_userrship`
--
ALTER TABLE `erhuo_userrship`
  ADD CONSTRAINT `erhuo_userrship_ibfk_1` FOREIGN KEY (`fans_id`) REFERENCES `erhuo_user` (`user_id`),
  ADD CONSTRAINT `erhuo_userrship_ibfk_2` FOREIGN KEY (`followers_id`) REFERENCES `erhuo_user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
