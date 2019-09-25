/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 100135
 Source Host           : localhost:3306
 Source Schema         : jsquiz

 Target Server Type    : MySQL
 Target Server Version : 100135
 File Encoding         : 65001

 Date: 24/09/2019 03:23:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers`  (
  `id` int(11) NOT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `correct` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES (1, 1, '1992', 0);
INSERT INTO `answers` VALUES (2, 1, '1995', 1);
INSERT INTO `answers` VALUES (3, 1, '1997', 0);
INSERT INTO `answers` VALUES (4, 1, '1999', 0);
INSERT INTO `answers` VALUES (5, 2, 'Nolan Bushnell', 0);
INSERT INTO `answers` VALUES (6, 2, 'Steve Wozniak', 0);
INSERT INTO `answers` VALUES (7, 2, 'Brendan Eich', 1);
INSERT INTO `answers` VALUES (8, 2, 'Alan Turing', 0);
INSERT INTO `answers` VALUES (9, 3, 'Javascript is een clientside scripttaal', 1);
INSERT INTO `answers` VALUES (10, 3, 'Javascript is een serverside scripttaal', 0);
INSERT INTO `answers` VALUES (11, 3, 'Javascript is een esoterische scripttaal', 0);
INSERT INTO `answers` VALUES (12, 3, 'Javascript is een serverside opmaaktaal', 0);
INSERT INTO `answers` VALUES (13, 4, 'Assembler', 0);
INSERT INTO `answers` VALUES (14, 4, 'Actionscript', 1);
INSERT INTO `answers` VALUES (15, 4, 'Python', 0);
INSERT INTO `answers` VALUES (16, 4, 'Java', 0);
INSERT INTO `answers` VALUES (17, 5, 'De tekst \"Hallo\" wordt zichtbaar in de pop-up.<br>- De tekst \"Hoi\" wordt zichtbaar in de console.<br>- De tekst \"Hey\" wordt zichtbaar in de browser.', 0);
INSERT INTO `answers` VALUES (18, 5, 'De tekst \"Hallo\" wordt zichtbaar in de browser.<br>- De tekst \"Hoi\" wordt zichtbaar in de console.<br>- De tekst \"Hey\" wordt zichtbaar in de pop-up.', 1);
INSERT INTO `answers` VALUES (19, 5, 'De tekst \"Hallo\" wordt zichtbaar in de console.<br>- De tekst \"Hoi\" wordt zichtbaar in de browser.<br>- De tekst \"Hey\" wordt zichtbaar in de pop-up.', 0);
INSERT INTO `answers` VALUES (20, 5, 'De tekst \"Hallo\" wordt zichtbaar in de console.<br>- De tekst \"Hoi\" wordt zichtbaar in de pop-up.<br>- De tekst \"Hey\" wordt zichtbaar in de browser.', 0);
INSERT INTO `answers` VALUES (21, 6, 'Henk', 0);
INSERT INTO `answers` VALUES (22, 6, 'Karel', 1);
INSERT INTO `answers` VALUES (23, 6, '\"Henk\"', 0);
INSERT INTO `answers` VALUES (24, 6, '\"Karel\"', 0);
INSERT INTO `answers` VALUES (25, 7, 'Een string is een (geheel) getal, een boolean is een stukje tekst en een integer is true of false.', 0);
INSERT INTO `answers` VALUES (26, 7, 'Een string is een (geheel) getal, een integer is een stukje tekst en een boolean is true of false.', 0);
INSERT INTO `answers` VALUES (27, 7, 'Een integer is een (geheel) getal, een boolean is een stukje tekst en een string is true of false.', 0);
INSERT INTO `answers` VALUES (28, 7, 'Een integer is een (geheel) getal, een string is een stukje tekst en een boolean is true of false.', 1);
INSERT INTO `answers` VALUES (29, 8, '23', 0);
INSERT INTO `answers` VALUES (30, 8, '24', 0);
INSERT INTO `answers` VALUES (31, 8, '25', 1);
INSERT INTO `answers` VALUES (32, 8, '27', 0);
INSERT INTO `answers` VALUES (33, 9, 'pagina dynamisch maken, formulier valideren, interactiviteit toevoegen, spel maken.', 1);
INSERT INTO `answers` VALUES (34, 9, 'hacken, DDOS aanval uitvoeren, database manipulatie, bedreigde diersoort redden.', 0);
INSERT INTO `answers` VALUES (35, 9, 'hacken, database manipulatie, naar olie boren.', 0);
INSERT INTO `answers` VALUES (36, 9, 'pagina dynamisch maken, formulier valideren, massavernietigingswapens maken.', 0);
INSERT INTO `answers` VALUES (37, 10, 'Brainfuck, A, Cobol, C--', 0);
INSERT INTO `answers` VALUES (38, 10, 'Lisp, C#, Prolog, C', 0);
INSERT INTO `answers` VALUES (39, 10, 'P-cake, CocaCode, TwixDB', 1);
INSERT INTO `answers` VALUES (40, 10, 'Tcl/Tk, Tea, Lingo', 0);

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` int(11) NOT NULL,
  `question` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 'In welk jaar is Javascript voor het eerst verschenen?');
INSERT INTO `questions` VALUES (2, 'Wie heeft Javascript ontworpen?');
INSERT INTO `questions` VALUES (3, 'Welke van de onderstaande uitspraken is waar?');
INSERT INTO `questions` VALUES (4, 'Welke van de onderstaande talen lijkt het meeste op Javascript?');
INSERT INTO `questions` VALUES (5, 'Bekijk het onderstaande script en beantwoord daarna de vraag.<br><br>document.write(\"Hallo\");<br>console.log(\"Hoi\");<br>alert(\"Hey\");<br><br>Welke van de onderstaande uitspraken is waar?<br>');
INSERT INTO `questions` VALUES (6, 'Bekijk het onderstaande script en beantwoord daarna de vraag.<br><br>var naam = \"Henk\";<br>naam = \"Karel\";<br><br>Welke waarde zit er uiteindelijk in de variabele naam?');
INSERT INTO `questions` VALUES (7, 'Welke van de onderstaande stellingen is juist?');
INSERT INTO `questions` VALUES (8, 'Bekijk de onderstaande afbeelding en beantwoord daarna de vraag.<br><br><img src=\"/img/fruit.png\" alt=\"question8\" /><br>Wat is het juiste antwoord?');
INSERT INTO `questions` VALUES (9, 'Wat kan je met Javascript?');
INSERT INTO `questions` VALUES (10, 'Welke van de onderstaande voorbeelden zijn geen bestaande programmeertaal?');

-- ----------------------------
-- Table structure for responders
-- ----------------------------
DROP TABLE IF EXISTS `responders`;
CREATE TABLE `responders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for responses
-- ----------------------------
DROP TABLE IF EXISTS `responses`;
CREATE TABLE `responses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `responder_id` int(11) NULL DEFAULT NULL,
  `answer_id` int(11) NULL DEFAULT NULL,
  `correct` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
