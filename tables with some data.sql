-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2018 at 06:26 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `askme1`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(20) UNSIGNED NOT NULL,
  `post_id` int(20) UNSIGNED NOT NULL,
  `ans_content` varchar(2000) NOT NULL,
  `ans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ansby` varchar(100) NOT NULL,
  `vote` tinyint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `post_id`, `ans_content`, `ans_date`, `ansby`, `vote`) VALUES
(2, 4, 'To be able to completely stop and unload a loaded SWF, you need to invoke unloadAndStop() method on the Loader instance, that holds the loaded content. Like:\r\n&lt;pre&gt;var outerSwf:Loader = new Loader;\r\n\r\n// Load.\r\nouterSwf.load(new URLRequest(&quot;outer.swf&quot;));\r\naddChild(outerSwf);\r\n\r\n// ...\r\n// Unload.\r\nremoveChild(outerSwf);\r\nouterSwf.unloadAndStop();&lt;/pre&gt;', '2018-04-22 15:39:34', 'rahul', 1),
(3, 5, 'With bash I suggest:\r\n&lt;pre&gt;counter=$(($counter + $?))&lt;/pre&gt;\r\nThis is also possible:\r\n&lt;pre&gt;counter=$((counter + $?))&lt;/pre&gt;\r\nOr:\r\n\r\n&lt;pre&gt;declare -i counter=0     # set integer attribute\r\n&lt;your command&gt;\r\ncounter=counter+$?&lt;/pre&gt;\r\nOr:\r\n&lt;pre&gt;declare -i counter=0\r\n&lt;your command&gt;\r\ncounter=+$?&lt;/pre&gt;', '2018-04-22 15:50:54', 'paul', 1),
(4, 5, 'You can assign the value of &lt;pre&gt;$?&lt;/pre&gt;to an intermediate variable then use arithmetic context to add:\r\n\r\nSet&lt;pre&gt; $?&lt;/pre&gt;to 22:\r\n&lt;pre&gt;$ awk \'BEGIN {exit 22}\'\r\n$ rtr=$?\r\n$ counter=1\r\n$ echo $((counter+rtr))\r\n23&lt;/pre&gt;', '2018-04-22 15:50:23', 'michael', 0),
(5, 6, 'It\'s a pull down resistor, its purpose is to set the voltage of the arduino input to 0v when the button is open. It just set a default voltage value to the connected node.\r\n\r\nBut, why such a resistor in needed? Well, when the button is open, the voltage is not totally equals to zero due to antenna effect or surrounding component. It is then possible that the arduino input is trigger for no reason.\r\n\r\nNote that the value of pull up or pull down resistors use to be around 10k - 100k. If the value is to low, it\'s going to draw to much current when the button is close. If the value is too high, the resistor will behave as a open circuit, making the pull down resistor useless.\r\n\r\nAs it is widely used in electronics, I recommend you to read some more about this concept.', '2018-04-22 15:55:45', 'dilip', 0),
(6, 6, 'This looks like a pull-down resistor.\r\n\r\nTo learn what that is and what it does, see\r\n\r\nhttps://en.wikipedia.org/wiki/Pull-up_resistor\r\nSee also\r\n\r\nhttps://playground.arduino.cc/CommonTopics/PullUpDownResistor\r\nhttp://www.resistorguide.com/pull-up-resistor_pull-down-resistor/\r\nBy the way, as your LED seems to lack a current limiting resistor, it will likely burn out pretty quickly, unless it has some integrated current limiting circuitry that is not visible in the drawing.', '2018-04-22 15:58:24', 'Abhinas', 0),
(7, 7, 'Perhaps he really needed to\r\n\r\n&lt;blockquote&gt;use the restroom, but the store has a strict customer-only policy.&lt;/blockquote&gt;\r\n\r\nIn this case, what he bought was\r\n\r\n&lt;blockquote&gt;completely inconsequential.&lt;/blockquote&gt;', '2018-04-22 16:10:07', 'mate', 1),
(8, 7, 'He bought a newspaper, turned to the classifieds section, and read an ad. Then he threw away the newspaper. The ad could be anything: a secret spy communication, or a response to a proposal, or a code that\'s part of some puzzle game.', '2018-04-22 16:10:43', 'abhishek', 1),
(9, 7, 'Yes, this is clearly the intended solution...\r\n\r\nThe man went into a dollar store in Australia, and bought one of those cheap souvenir boomerangs. He was justified in throwing it away on his way out as he expected it to return to him.', '2018-04-22 16:10:38', 'Scott', 0),
(10, 8, 'Open the Alexa app. It\'s the app that resembles a blue speech bubble with a white outline.\r\nIf you haven\'t done so already, you can download the Alexa app on your Android phone from the Google Play (http://play.google.com) Store or on your iPhone from the App Store, then log in with the email address and password for your Amazon account.', '2018-04-22 16:23:50', 'max', 1),
(11, 9, 'You really should fix whatever\'s causing the warning, but you can control visibility of errors with error_reporting. To skip warning messages, you could use something like:\r\n&lt;pre&gt;error_reporting(E_ERROR | E_PARSE);&lt;/pre&gt;', '2018-04-22 16:23:26', 'Tatu', 2),
(12, 9, 'You can put an @ in front of your function call to suppress all error messages.\r\n\r\n&lt;pre@yourFunctionHere();&lt;/pre&gt;', '2018-04-22 16:23:29', 'Pet Paulsen', 1),
(13, 9, 'To suppress warnings while leaving all other error reporting enabled:\r\n\r\nerror_reporting(E_ALL ^ E_WARNING);', '2018-04-22 16:21:10', 'Karthik', 0),
(14, 9, 'If you don\'t want to show warnings as well as errors use\r\n\r\n// Turn off all error reporting\r\nerror_reporting(0);', '2018-04-22 16:21:41', 'mohan gade', 0);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(20) UNSIGNED NOT NULL,
  `post_title` varchar(300) NOT NULL,
  `post_content` varchar(2000) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `askedby` varchar(100) NOT NULL,
  `seen` int(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `post_title`, `post_content`, `post_date`, `askedby`, `seen`) VALUES
(3, 'How to dynamically generate queues in Laravel Horizon?', 'My application requires to have dynamically generated queues with some prefix like\r\n<pre>&quot;process_user_1&quot;, \r\n&quot;process_user_2&quot;, \r\n&quot;process_user_n&quot;</pre>\r\nThe main idea is to separate execution of some jobs depends on model ID.\r\n\r\nBecause the api that I connect allows only 1 connection for a user\r\n\r\nNormally I can configure in horizon.php but it should be dynamic e.g. I can have 1000 users so I must have 1000 different queues\r\n\r\nWhat could be the solution?\r\n\r\nThis is my configuration\r\n&lt;pre&gt;\'User-1\' =&gt; [\r\n                \'connection\' =&gt; \'redis\',\r\n                \'queue\' =&gt; [\'User-1\'],\r\n                \'balance\' =&gt; \'simple\',\r\n                \'processes\' =&gt; 1,\r\n                \'tries\' =&gt; 10,\r\n            ],\r\n            \'User-2\' =&gt; [\r\n                \'connection\' =&gt; \'redis\',\r\n                \'queue\' =&gt; [\'User-2\'],\r\n                \'balance\' =&gt; \'simple\',\r\n                \'processes\' =&gt; 1,\r\n                \'tries\' =&gt; 10,&lt;/pre&gt;', '2018-04-22 15:37:46', 'Adarsh', 1),
(4, 'Air for Android. Swf not geting removed from memory i guess', 'I am having an issue with an app I am developing using adobe flash with Air for android support. I deployed the apk on to android device and played the files which are .swf file loaded onto my parent swf. There is a next and previous button which loads the swf files in succession. Now what happens exactly is that when I load my next file the sound from my previous file still plays in the background even though I have completely removed the swf file from stage. I have no ides why this is happening as this hapens only when i install the app on android device and play it.. During the publishing of the swf in Falsh I do not face this problem. So I am unable to figure out the reason. Can anybody guide me regarding this? Thank you', '2018-04-22 15:38:56', 'Dilip', 1),
(5, 'UNIX shell: increment a variable with value of last returned exit code', '\r\n0\r\ndown vote\r\nfavorite\r\nLet\'s say I have a counter initialised by &lt;pre&gt;counter=0&lt;/pre&gt;\r\n\r\nNow I want to run a command and increment the value of counter by its returned exit code.\r\n\r\nIn a natural language I want to do &lt;pre&gt;counter = $counter + $?&lt;/pre&gt;\r\n\r\nI am trying stuff like &lt;pre&gt;counter=$((counter+$((?)))); &lt;/pre&gt;but with no success. What is the correct way to do it in a single line?', '2018-04-22 15:46:27', 'Cyrus', 1),
(6, 'What is the purpose of the 10kÎ© resistor in this circuit?', 'A simple circuit involving an Arduino, a push-button, and an LED. However, I don\'t quite understand what the purpose of the resistor is. Wouldn\'t the circuit function without it?\r\nNote: Since this question is concerning the behaviour of the circuit rather than the functioning of the Arduino.', '2018-04-22 15:55:25', 'Siddart', 1),
(7, 'Man buys item, throws it away on his way out', 'I thought of this lateral thinking puzzle. Hopefully, it\'s not too broad and hasn\'t been asked before.\r\n\r\n&lt;blockquote&gt;A man walks into a store, buys an item for $1, and throws it away along with the receipt on his way out. What item did he buy?&lt;blockquote&gt;\r\n\r\nNotes:\r\n\r\nHis decision to throw the item away on his way out was completely justified.\r\nHe did not put anything in his mouth between buying the item and throwing it away.\r\nEDIT: To make this question less broad, here are some notes that I should\'ve had in the beginning:\r\n\r\nHe bought the item because he wanted the item.\r\n&quot;Throw away&quot; means he put the item and the receipt in the trash can.\r\nThe item was reasonably priced at 1 USD in 2018.\r\nHe threw the item away because his perception of the item\'s intrinsic value changed.', '2018-04-22 16:07:00', 'shree', 1),
(8, 'How to Use the Alexa App', 'This wikiHow teaches you how to use the Alexa app on your iPhone or Android phone. You may have already used the Alexa App to set up your Echo or customize its settings, but the Alexa app can be used to make Alexa calls and messages, control music playback, as well as see more detail for the questions you ask Alexa.', '2018-04-22 16:23:47', 'minute', 2),
(9, 'Remove warning messages in PHP', 'I have some PHP code. When I run it, a warning message appears.\r\n\r\nHow can I remove/suppress/ignore these warning messages?', '2018-04-22 16:23:22', 'Alireza', 2);

-- --------------------------------------------------------

--
-- Table structure for table `seen`
--

CREATE TABLE `seen` (
  `id` int(20) UNSIGNED NOT NULL,
  `post_id` int(20) UNSIGNED NOT NULL,
  `seen_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seen`
--

INSERT INTO `seen` (`id`, `post_id`, `seen_date`, `ip_address`) VALUES
(4, 3, '2018-04-22 15:34:30', '::1'),
(5, 4, '2018-04-22 15:38:56', '::1'),
(7, 5, '2018-04-22 15:46:26', '::1'),
(10, 6, '2018-04-22 15:55:25', '::1'),
(13, 7, '2018-04-22 16:07:00', '::1'),
(17, 8, '2018-04-22 16:13:36', '::1'),
(19, 9, '2018-04-22 16:18:53', '::1'),
(24, 9, '2018-04-22 16:23:22', '10.1.33.51'),
(25, 8, '2018-04-22 16:23:47', '10.1.33.51');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(20) UNSIGNED NOT NULL,
  `ans_id` int(20) UNSIGNED NOT NULL,
  `vote_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(255) NOT NULL,
  `rank` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `ans_id`, `vote_date`, `ip_address`, `rank`) VALUES
(2, 2, '2018-04-22 15:39:34', '::1', 1),
(3, 3, '2018-04-22 15:50:54', '::1', 1),
(4, 7, '2018-04-22 16:10:07', '::1', 1),
(5, 8, '2018-04-22 16:10:43', '::1', 1),
(6, 11, '2018-04-22 16:21:47', '::1', 1),
(7, 11, '2018-04-22 16:23:26', '10.1.33.51', 1),
(8, 12, '2018-04-22 16:23:29', '10.1.33.51', 1),
(9, 10, '2018-04-22 16:23:50', '10.1.33.51', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seen`
--
ALTER TABLE `seen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ans_id` (`ans_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seen`
--
ALTER TABLE `seen`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seen`
--
ALTER TABLE `seen`
  ADD CONSTRAINT `seen_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`ans_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
