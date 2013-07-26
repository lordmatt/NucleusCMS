CREATE TABLE `nucleus_actionlog` (
  `timestamp` datetime NOT NULL default '0000-00-00 00:00:00',
  `message` varchar(255) NOT NULL default ''
) ENGINE=MyISAM;

CREATE TABLE `nucleus_activation` (
  `vkey` varchar(40) NOT NULL default '',
  `vtime` datetime NOT NULL default '0000-00-00 00:00:00',
  `vmember` int(11) NOT NULL default '0',
  `vtype` varchar(15) NOT NULL default '',
  `vextra` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`vkey`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_ban` (
  `iprange` varchar(15) NOT NULL default '',
  `reason` varchar(255) NOT NULL default '',
  `blogid` int(11) NOT NULL default '0'
) ENGINE=MyISAM;

CREATE TABLE `nucleus_blog` (
  `bnumber` int(11) NOT NULL auto_increment,
  `bname` varchar(60) NOT NULL default '',
  `bshortname` varchar(15) NOT NULL default '',
  `bdesc` varchar(200) default NULL,
  `bcomments` tinyint(2) NOT NULL default '1',
  `bmaxcomments` int(11) NOT NULL default '0',
  `btimeoffset` decimal(3,1) NOT NULL default '0.0',
  `bnotify` varchar(128) default NULL,
  `burl` varchar(100) default NULL,
  `bupdate` varchar(60) default NULL,
  `bdefskin` int(11) NOT NULL default '1',
  `bpublic` tinyint(2) NOT NULL default '1',
  `bconvertbreaks` tinyint(2) NOT NULL default '1',
  `bdefcat` int(11) default NULL,
  `bnotifytype` int(11) NOT NULL default '15',
  `ballowpast` tinyint(2) NOT NULL default '0',
  `bincludesearch` tinyint(2) NOT NULL default '0',
  `breqemail` TINYINT( 2 ) DEFAULT '0' NOT NULL,
  `bfuturepost` TINYINT(2) DEFAULT '0' NOT NULL,
  PRIMARY KEY  (`bnumber`),
--  UNIQUE KEY `bnumber` (`bnumber`),
  UNIQUE KEY `bshortname` (`bshortname`)
) ENGINE=MyISAM;

INSERT INTO `nucleus_blog` VALUES (1, 'My Nucleus CMS', 'mynucleuscms', '', 1, 0, 0.0, '', 'http://localhost:8080/nucleus/', '', 5, 1, 1, 1, 1, 1, 0, 0, 0);

CREATE TABLE `nucleus_category` (
  `catid` int(11) NOT NULL auto_increment,
  `cblog` int(11) NOT NULL default '0',
  `cname` varchar(200) default NULL,
  `cdesc` varchar(200) default NULL,
  PRIMARY KEY  (`catid`)
) ENGINE=MyISAM;

INSERT INTO `nucleus_category` VALUES (1, 1, 'General', 'Items that do not readily fit in the other categories');

CREATE TABLE `nucleus_comment` (
  `cnumber` int(11) NOT NULL auto_increment,
  `cbody` text NOT NULL,
  `cuser` varchar(40) default NULL,
  `cmail` varchar(100) default NULL,
  `cemail` VARCHAR( 100 ),
  `cmember` int(11) default NULL,
  `citem` int(11) NOT NULL default '0',
  `ctime` datetime NOT NULL default '0000-00-00 00:00:00',
  `chost` varchar(60) default NULL,
  `cip` varchar(15) NOT NULL default '',
  `cblog` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cnumber`),
--  UNIQUE KEY `cnumber` (`cnumber`),
  KEY `citem` (`citem`),
  FULLTEXT KEY `cbody` (`cbody`),
  INDEX `cblog` (`cblog`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_config` (
  `name` varchar(20) NOT NULL default '',
  `value` varchar(128) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM;

INSERT INTO `nucleus_config` VALUES ('DefaultBlog', '1');
INSERT INTO `nucleus_config` VALUES ('AdminEmail', 'example@example.org');
INSERT INTO `nucleus_config` VALUES ('IndexURL', 'http://localhost:8080/nucleus/');
INSERT INTO `nucleus_config` VALUES ('Language', 'english');
INSERT INTO `nucleus_config` VALUES ('SessionCookie', '');
INSERT INTO `nucleus_config` VALUES ('AllowMemberCreate', '');
INSERT INTO `nucleus_config` VALUES ('AllowMemberMail', '1');
INSERT INTO `nucleus_config` VALUES ('SiteName', 'My (Branched) Nucleus CMS');
INSERT INTO `nucleus_config` VALUES ('AdminURL', 'http://localhost:8080/nucleus/nucleus/');
INSERT INTO `nucleus_config` VALUES ('NewMemberCanLogon', '1');
INSERT INTO `nucleus_config` VALUES ('DisableSite', '');
INSERT INTO `nucleus_config` VALUES ('DisableSiteURL', 'http://www.this-page-intentionally-left-blank.org/');
INSERT INTO `nucleus_config` VALUES ('LastVisit', '');
INSERT INTO `nucleus_config` VALUES ('MediaURL', 'http://localhost:8080/nucleus/media/');
INSERT INTO `nucleus_config` VALUES ('AllowedTypes', 'jpg,jpeg,gif,mpg,mpeg,avi,mov,mp3,swf,png');
INSERT INTO `nucleus_config` VALUES ('AllowLoginEdit', '');
INSERT INTO `nucleus_config` VALUES ('AllowUpload', '1');
INSERT INTO `nucleus_config` VALUES ('DisableJsTools', '2');
INSERT INTO `nucleus_config` VALUES ('CookiePath', '/');
INSERT INTO `nucleus_config` VALUES ('CookieDomain', '');
INSERT INTO `nucleus_config` VALUES ('CookieSecure', '');
INSERT INTO `nucleus_config` VALUES ('CookiePrefix', '');
INSERT INTO `nucleus_config` VALUES ('MediaPrefix', '1');
INSERT INTO `nucleus_config` VALUES ('MaxUploadSize', '1048576');
INSERT INTO `nucleus_config` VALUES ('NonmemberMail', '');
INSERT INTO `nucleus_config` VALUES ('PluginURL', 'http://localhost:8080/nucleus/nucleus/plugins/');
INSERT INTO `nucleus_config` VALUES ('ProtectMemNames', '1');
INSERT INTO `nucleus_config` VALUES ('BaseSkin', '5');
INSERT INTO `nucleus_config` VALUES ('SkinsURL', 'http://localhost:8080/nucleus/skins/');
INSERT INTO `nucleus_config` VALUES ('ActionURL', 'http://localhost:8080/nucleus/action.php');
INSERT INTO `nucleus_config` VALUES ('URLMode', 'normal');
INSERT INTO `nucleus_config` VALUES ('DatabaseVersion', '350');
INSERT INTO `nucleus_config` VALUES ('DebugVars', '0');
INSERT INTO `nucleus_config` VALUES ('DefaultListSize', '10');
INSERT INTO `nucleus_config` VALUES ('AdminCSS', 'original');

CREATE TABLE `nucleus_item` (
  `inumber` int(11) NOT NULL auto_increment,
  `ititle` varchar(160) default NULL,
  `ibody` text NOT NULL,
  `imore` text,
  `iblog` int(11) NOT NULL default '0',
  `iauthor` int(11) NOT NULL default '0',
  `itime` datetime NOT NULL default '0000-00-00 00:00:00',
  `iclosed` tinyint(2) NOT NULL default '0',
  `idraft` tinyint(2) NOT NULL default '0',
  `icat` int(11) default NULL,
  `iposted` tinyint(2) NOT NULL default '1',
  PRIMARY KEY  (`inumber`),
--  UNIQUE KEY `inumber` (`inumber`),
  KEY `itime` (`itime`),
  INDEX `iblog` (`iblog`),
  INDEX `idraft` (`idraft`),
  INDEX `icat` (`icat`),
  FULLTEXT KEY `ibody` (`ibody`,`ititle`,`imore`)
) ENGINE=MyISAM PACK_KEYS=0;


CREATE TABLE `nucleus_member` (
  `mnumber` int(11) NOT NULL auto_increment,
  `mname` varchar(32) NOT NULL default '',
  `mrealname` varchar(60) default NULL,
  `mpassword` varchar(40) NOT NULL default '',
  `memail` varchar(60) default NULL,
  `murl` varchar(100) default NULL,
  `mnotes` varchar(100) default NULL,
  `madmin` tinyint(2) NOT NULL default '0',
  `mcanlogin` tinyint(2) NOT NULL default '1',
  `mcookiekey` varchar(40) default NULL,
  `deflang` varchar(20) NOT NULL default '',
  `mautosave` tinyint(2) NOT NULL default '1',
  PRIMARY KEY  (`mnumber`),
--  UNIQUE KEY `mnumber` (`mnumber`),
  UNIQUE KEY `mname` (`mname`)
) ENGINE=MyISAM;

INSERT INTO `nucleus_member` VALUES (1, 'example', 'example', '1a79a4d60de6718e8e5b326e338ae533', 'example@example.org', 'http://localhost:8080/nucleus/', '', 1, 1, 'd767aefc60415859570d64c649257f19', '', 1);

CREATE TABLE `nucleus_plugin` (
  `pid` int(11) NOT NULL auto_increment,
  `pfile` varchar(40) NOT NULL default '',
  `porder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pid`),
--  KEY `pid` (`pid`),
  KEY `porder` (`porder`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_plugin_event` (
  `pid` int(11) NOT NULL default '0',
  `event` varchar(40) default NULL,
  KEY `pid` (`pid`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_plugin_option` (
  `ovalue` text NOT NULL,
  `oid` int(11) NOT NULL auto_increment,
  `ocontextid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`oid`,`ocontextid`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_plugin_option_desc` (
  `oid` int(11) NOT NULL auto_increment,
  `opid` int(11) NOT NULL default '0',
  `oname` varchar(20) NOT NULL default '',
  `ocontext` varchar(20) NOT NULL default '',
  `odesc` varchar(255) default NULL,
  `otype` varchar(20) default NULL,
  `odef` text,
  `oextra` text,
  PRIMARY KEY  (`opid`,`oname`,`ocontext`),
  UNIQUE KEY `oid` (`oid`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_skin` (
  `sdesc` int(11) NOT NULL default '0',
  `stype` varchar(20) NOT NULL default '',
  `scontent` text NOT NULL,
  PRIMARY KEY  (`sdesc`,`stype`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_skin_desc` (
  `sdnumber` int(11) NOT NULL auto_increment,
  `sdname` varchar(20) NOT NULL default '',
  `sddesc` varchar(200) default NULL,
  `sdtype` varchar(40) NOT NULL default 'text/html',
  `sdincmode` varchar(10) NOT NULL default 'normal',
  `sdincpref` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`sdnumber`),
--  UNIQUE KEY `sdnumber` (`sdnumber`),
  UNIQUE KEY `sdname` (`sdname`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_team` (
  `tmember` int(11) NOT NULL default '0',
  `tblog` int(11) NOT NULL default '0',
  `tadmin` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`tmember`,`tblog`)
) ENGINE=MyISAM;

INSERT INTO `nucleus_team` VALUES (1, 1, 1);

CREATE TABLE `nucleus_template` (
  `tdesc` int(11) NOT NULL default '0',
  `tpartname` varchar(64) NOT NULL default '',
  `tcontent` text NOT NULL,
  PRIMARY KEY  (`tdesc`,`tpartname`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_template_desc` (
  `tdnumber` int(11) NOT NULL auto_increment,
  `tdname` varchar(64) NOT NULL default '',
  `tddesc` varchar(200) default NULL,
  PRIMARY KEY  (`tdnumber`),
--  UNIQUE KEY `tdnumber` (`tdnumber`),
  UNIQUE KEY `tdname` (`tdname`)
) ENGINE=MyISAM;

CREATE TABLE `nucleus_tickets` (
  `ticket` varchar(40) NOT NULL default '',
  `ctime` datetime NOT NULL default '0000-00-00 00:00:00',
  `member` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ticket`,`member`)
) ENGINE=MyISAM;