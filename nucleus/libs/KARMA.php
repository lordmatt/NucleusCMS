<?php
/*
 * Nucleus: PHP/MySQL Weblog CMS (http://nucleuscms.org/)
 * Copyright (C) 2002-2009 The Nucleus Group
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * (see nucleus/documentation/index.html#license for more info)
 */
/**
 * Class representing the karma votes for a certain item
 *
 * @license http://nucleuscms.org/license.txt GNU General Public License
 * @copyright Copyright (C) 2002-2009 The Nucleus Group
 * @version $Id$
 * 
 * **** DEPRICATED ****
 * 
 */
class KARMA {
	var $itemid;
	var $inforead;
	var $karmapos;
	var $karmaneg;
	function KARMA($itemid, $initpos = 0, $initneg = 0, $initread = 0) {}
	function getNbPosVotes() {;
		return 0;
	}
	function getNbNegVotes() {
		return 0;
	}
	function getNbOfVotes() {
		return 0;
	}
	function getTotalScore() {
		return 0;
	}
	function setNbPosVotes($val) {}
	function setNbNegVotes($val) {}
	function votePositive() {}
	function voteNegative() {}
	function readFromDatabase() {}
	function writeToDatabase() {}
	function isVoteAllowed($ip) {}
	function saveIP() {}
}