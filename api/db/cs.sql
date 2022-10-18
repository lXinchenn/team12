/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : cs

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 04/09/2022 14:08:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 用户', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change 用户', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 用户', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view 用户', 7, 'view_user');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$390000$F7Nn2SIaJddmyt709OR9Uo$GXW35kkhJShJlYyt1qFem9kWbw6mJ1ARcr/Pwlmn694=', '2022-09-03 05:18:08.178825', 1, 'admin', '', '', '465296275@qq.com', 1, 1, '2022-09-02 05:24:53.940805');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint NOT NULL,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `course_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `course_number` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Prerequisite` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Restriction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_course_index`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (0, 'Anthropology', 'ANTHRO 103', 'Musics of the World in Everyday Life', 'ANTHRO 103 - Musics of the World in Everyday Life', NULL, NULL);
INSERT INTO `course` VALUES (1, 'Anthropology', 'ANTHRO 104(G)', 'Peoples and Cultures of the Pacific', 'ANTHRO 104(G) - Peoples and Cultures of the Pacific', NULL, NULL);
INSERT INTO `course` VALUES (2, 'Anthropology', 'ANTHRO 106(G)', 'Global Sound Cultures Musics, Places and People', 'ANTHRO 106(G) - Global Sound Cultures: Musics, Places and People', NULL, NULL);
INSERT INTO `course` VALUES (3, 'Anthropology', 'ANTHRO 107', 'The Humanmade Planet?', 'ANTHRO 107 - The Human-made Planet?', NULL, NULL);
INSERT INTO `course` VALUES (4, 'Anthropology', 'ANTHRO 108', 'Being Human', 'ANTHRO 108 - Being Human', NULL, 'ANTHRO 102');
INSERT INTO `course` VALUES (5, 'Anthropology', 'ANTHRO 109', 'Future Generations Anthropology', 'ANTHRO 109 - Future Generations Anthropology', NULL, NULL);
INSERT INTO `course` VALUES (6, 'Anthropology', 'ANTHRO 200', 'Archaeology Understanding the Past', 'ANTHRO 200 - Archaeology: Understanding the Past', '30 points in Anthropology or 60 points passed', NULL);
INSERT INTO `course` VALUES (7, 'Anthropology', 'ANTHRO 201', 'Human Evolution', 'ANTHRO 201 - Human Evolution', '30 points in Anthropology or 60 points passed', NULL);
INSERT INTO `course` VALUES (8, 'Anthropology', 'ANTHRO 202', 'Music and Identity in World Music Cultures', 'ANTHRO 202 - Music and Identity in World Music Cultures', '30 points passed', NULL);
INSERT INTO `course` VALUES (9, 'Anthropology', 'ANTHRO 205', 'Primate Behaviour, Ecology and Conservation', 'ANTHRO 205 - Primate Behaviour, Ecology and Conservation', '15 points in Anthropology or 60 points passed', 'ANTHRO 349');
INSERT INTO `course` VALUES (10, 'Anthropology', 'ANTHRO 206', 'Origins of Civilisation', 'ANTHRO 206 - Origins of Civilisation', '15 points in Anthropology or 60 points passed', 'ANTHRO 332');
INSERT INTO `course` VALUES (11, 'Anthropology', 'ANTHRO 207', 'Archaeological History of Aotearoa New Zealand', 'ANTHRO 207 - Archaeological History of Aotearoa New Zealand', '60 points passed', 'ANTHRO 365');
INSERT INTO `course` VALUES (12, 'Anthropology', 'ANTHRO 208', 'Biosocial Medical Anthropology', 'ANTHRO 208 - Biosocial Medical Anthropology', 'ANTHRO 100 or 102 or 60 points passed at Stage I', 'ANTHRO 324、372');
INSERT INTO `course` VALUES (13, 'Anthropology', 'ANTHRO 212', 'Ethnographic Film and Photography', 'ANTHRO 212 - Ethnographic Film and Photography', 'ANTHRO 100 or ARTHIST 115 or 30 points in Anthropology, Sociology, Media Film and Television, or Communication', 'ANTHRO 320、373');
INSERT INTO `course` VALUES (14, 'Anthropology', 'ANTHRO 213', 'Questioning Race and Racism', 'ANTHRO 213 - Questioning Race and Racism', '15 points at Stage I in Anthropology and 15 points in BA courses', 'ANTHRO 105');
INSERT INTO `course` VALUES (15, 'Anthropology', 'ANTHRO 217', 'Rhythm, Blues and Rock', 'ANTHRO 217 - Rhythm, Blues and Rock', '30 points passed', 'POPMUS 206');
INSERT INTO `course` VALUES (16, 'Anthropology', 'ANTHRO 220', 'Kaumātuatanga Ageing in Aotearoa', 'ANTHRO 220 - Kaumātuatanga: Ageing in Aotearoa', '30 points from Anthropology, Māori Studies or Sociology', 'ANTHRO 376');
INSERT INTO `course` VALUES (17, 'Anthropology', 'ANTHRO 234', 'Popular Musics of the Pacific', 'ANTHRO 234 - Popular Musics of the Pacific', '30 points passed', NULL);
INSERT INTO `course` VALUES (18, 'Anthropology', 'ANTHRO 235', 'The Anthropology of Human Remains', 'ANTHRO 235 - The Anthropology of Human Remains', '15 points in Anthropology or 60 points passed', 'ANTHRO 367');
INSERT INTO `course` VALUES (19, 'Anthropology', 'ANTHRO 236', 'Special Topic(*** This course has not been scheduled. ***)', 'ANTHRO 236 - Special Topic(*** This course has not been scheduled. ***)', NULL, NULL);
INSERT INTO `course` VALUES (20, 'Anthropology', 'ANTHRO 237', 'Economy and Culture', 'ANTHRO 237 - Economy and Culture', '15 points at Stage I in Anthropology or Employment Relations and Organisational Studies', 'ANTHRO 374');
INSERT INTO `course` VALUES (21, 'Anthropology', 'ANTHRO 241', 'Anthropology of the Body', 'ANTHRO 241 - Anthropology of the Body', 'ANTHRO 100 or 30 points in Anthropology', 'ANTHRO 354');
INSERT INTO `course` VALUES (22, 'Anthropology', 'ANTHRO 248', 'Special Topic(*** This course has not been scheduled. ***)', 'ANTHRO 248 - Special Topic(*** This course has not been scheduled. ***)', NULL, NULL);
INSERT INTO `course` VALUES (23, 'Anthropology', 'ANTHRO 250', 'Worldview and Religion', 'ANTHRO 250 - World-view and Religion', 'ANTHRO 100 or 30 points in Anthropology or Theological and Religious Studies or Sociology', 'ANTHRO 319');
INSERT INTO `course` VALUES (24, 'Anthropology', 'ANTHRO 251', 'Special Topic(*** This course has not been scheduled. ***)', 'ANTHRO 251 - Special Topic(*** This course has not been scheduled. ***)', NULL, NULL);
INSERT INTO `course` VALUES (25, 'Anthropology', 'ANTHRO 252', 'Global Heritage Management(available as of 01/01/2023)', 'ANTHRO 252 - Global Heritage Management(available as of 01/01/2023)', 'ANTHRO 100 or 101 or 102 or 103 or 104 or 60 points passed', NULL);
INSERT INTO `course` VALUES (26, 'Anthropology', 'ANTHRO 301', 'Contemporary Research in Music and Culture', 'ANTHRO 301 - Contemporary Research in Music and Culture', 'ANTHRO 202 or 30 points at Stage II in Transnational Cultures and Creative Practice', 'ANTHRO 219');
INSERT INTO `course` VALUES (27, 'Anthropology', 'ANTHRO 306', 'Pacific Archaeology', 'ANTHRO 306 - Pacific Archaeology', '60 points at Stage II', 'ANTHRO 706');
INSERT INTO `course` VALUES (28, 'Anthropology', 'ANTHRO 309', 'Quantitative Methods in Anthropology', 'ANTHRO 309 - Quantitative Methods in Anthropology', 'ANTHRO 200 or 201 or 203 or 120 points passed', 'SOCSCRES 300');
INSERT INTO `course` VALUES (29, 'Anthropology', 'ANTHRO 317', 'Field Methods in Archaeology', 'ANTHRO 317 - Field Methods in Archaeology', 'ANTHRO 200 passed with a grade of B– or higher', 'ANTHRO 737');
INSERT INTO `course` VALUES (30, 'Anthropology', 'ANTHRO 319', 'Worldview and Religion(This course has not been scheduled)', 'ANTHRO 319 - World-view and Religion(This course has not been scheduled)', 'ANTHRO 203 or 30 points at Stage II', 'ANTHRO 250');
INSERT INTO `course` VALUES (31, 'Anthropology', 'ANTHRO 321', 'Equality and Inequality', 'ANTHRO 321 - Equality and Inequality', 'ANTHRO 203 or 30 points at Stage II', NULL);
INSERT INTO `course` VALUES (32, 'Anthropology', 'ANTHRO 327', 'Music and Culture in Bollywood', 'ANTHRO 327 - Music and Culture in Bollywood', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (33, 'Anthropology', 'ANTHRO 329', 'Music of East Asia Tradition, Modernity and Globalisation', 'ANTHRO 329 - Music of East Asia: Tradition, Modernity and Globalisation', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (34, 'Anthropology', 'ANTHRO 337', 'Birth, Death, and Disease Anthropological Demography', 'ANTHRO 337 - Birth, Death, and Disease: Anthropological Demography', 'ANTHRO 201 or 30 points in Anthropology at Stage II or above', NULL);
INSERT INTO `course` VALUES (35, 'Anthropology', 'ANTHRO 340', 'Heritage Conservation in Aotearoa(This course has not been scheduled)', 'ANTHRO 340 - Heritage Conservation in Aotearoa(This course has not been scheduled)', '30 points at Stage II in Anthropology', NULL);
INSERT INTO `course` VALUES (36, 'Anthropology', 'ANTHRO 345', 'Directed Study in Anthropology', 'ANTHRO 345 - Directed Study in Anthropology', 'ANTHRO 200 or 201 or 219 or 203 and Head of Disciplinary Area approval', NULL);
INSERT INTO `course` VALUES (37, 'Anthropology', 'ANTHRO 347', 'Special Topic in Anthropology(This course has not been scheduled)', 'ANTHRO 347 - Special Topic in Anthropology(This course has not been scheduled)', '30 points at Stage II in Anthropology including either ANTHRO 200 or 201', NULL);
INSERT INTO `course` VALUES (38, 'Anthropology', 'ANTHRO 348', 'Perspectives on Human Growth(This course has not been scheduled)', 'ANTHRO 348 - Perspectives on Human Growth(This course has not been scheduled)', 'ANTHRO 201 or 60 points in Anthropology', NULL);
INSERT INTO `course` VALUES (39, 'Anthropology', 'ANTHRO 349', 'Primate Behaviour, Ecology and Conservation( This course has not been scheduled.)', 'ANTHRO 349 - Primate Behaviour, Ecology and Conservation( This course has not been scheduled.)', 'ANTHRO 201 or 60 points in Anthropology', 'ANTHRO 205');
INSERT INTO `course` VALUES (40, 'Anthropology', 'ANTHRO 351', 'Special Topic(This course has not been scheduled)', 'ANTHRO 351 - Special Topic(This course has not been scheduled)', 'ANTHRO 203 or 30 points at Stage II in Anthropology', NULL);
INSERT INTO `course` VALUES (41, 'Anthropology', 'ANTHRO 352', 'Special Topic Applied Anthropology(This course has not been scheduled)', 'ANTHRO 352 - Special Topic: Applied Anthropology(This course has not been scheduled)', '60 points in Anthropology', NULL);
INSERT INTO `course` VALUES (42, 'Anthropology', 'ANTHRO 353', 'Archaeology in Practice', 'ANTHRO 353 - Archaeology in Practice', 'B- or higher in ANTHRO 200 or 201', NULL);
INSERT INTO `course` VALUES (43, 'Anthropology', 'ANTHRO 354', 'Anthropology of the Body(This course has not been scheduled)', 'ANTHRO 354 - Anthropology of the Body(This course has not been scheduled)', 'ANTHRO 203 or 30 points at Stage II in Anthropology', 'ANTHRO 241');
INSERT INTO `course` VALUES (44, 'Anthropology', 'ANTHRO 357', 'Gender, Sexuality and Popular Music(This course has not been scheduled)(available as of 01/01/2023)', 'ANTHRO 357 - Gender, Sexuality and Popular Music(This course has not been scheduled)(available as of 01/01/2023)', '30 points at Stage II', 'POPMUS 306');
INSERT INTO `course` VALUES (45, 'Anthropology', 'ANTHRO 358', 'Gender and Colonialism in the Pacific(This course has not been scheduled)', 'ANTHRO 358 - Gender and Colonialism in the Pacific(This course has not been scheduled)', 'ANTHRO 203 or 30 points at Stage II', NULL);
INSERT INTO `course` VALUES (46, 'Anthropology', 'ANTHRO 360', 'Special Topic(This course has not been scheduled)', 'ANTHRO 360 - Special Topic(This course has not been scheduled)', 'ANTHRO 200 or 201 or 203 or 219 or 120 points passed', NULL);
INSERT INTO `course` VALUES (47, 'Anthropology', 'ANTHRO 365', 'Coming of the Māori Archaeology of Aotearoa(This course has not been scheduled)', 'ANTHRO 365 - Coming of the Māori: Archaeology of Aotearoa(This course has not been scheduled)', '60 points at Stage II', 'ANTHRO 207');
INSERT INTO `course` VALUES (48, 'Anthropology', 'ANTHRO 366', 'Medicine, Power and Politics', 'ANTHRO 366 - Medicine, Power and Politics', 'ANTHRO 203 or 30 points at Stage II', NULL);
INSERT INTO `course` VALUES (49, 'Anthropology', 'ANTHRO 367', 'The Anthropology of Human Remains', 'ANTHRO 367 - The Anthropology of Human Remains', 'ANTHRO 200 or 201 with a minimum B– grade', 'ANTHRO 235');
INSERT INTO `course` VALUES (50, 'Anthropology', 'ANTHRO 370', 'Special Topic(This course has not been scheduled)', 'ANTHRO 370 - Special Topic(This course has not been scheduled)', 'ANTHRO 200 or 120 points passed', NULL);
INSERT INTO `course` VALUES (51, 'Anthropology', 'ANTHRO 372', 'Biosocial Medical Anthropology(This course has not been scheduled)', 'ANTHRO 372 - Biosocial Medical Anthropology(This course has not been scheduled)', 'ANTHRO 201 or 203 or 30 points at Stage II in Anthropology', 'ANTHRO 208、324');
INSERT INTO `course` VALUES (52, 'Anthropology', 'ANTHRO 373', 'Anthropological Images(This course has not been scheduled)', 'ANTHRO 373 - Anthropological Images(This course has not been scheduled)', '15 points at Stage I in Anthropology', 'ANTHRO 212、320');
INSERT INTO `course` VALUES (53, 'Anthropology', 'ANTHRO 374', 'Economy and Culture(This course has not been scheduled)', 'ANTHRO 374 - Economy and Culture(This course has not been scheduled)', '15 points at Stage I in Anthropology or Stage II in Employment Relations and Organisational Studies', 'ANTHRO 237');
INSERT INTO `course` VALUES (54, 'Anthropology', 'ANTHRO 376', 'Kaumātuatanga Ageing in Aotearoa(This course has not been scheduled)', 'ANTHRO 376 - Kaumātuatanga: Ageing in Aotearoa(This course has not been scheduled)', '45 points from Anthropology, Māori Studies or Sociology including 30 points at Stage II', 'ANTHRO 220');
INSERT INTO `course` VALUES (55, 'Anthropology', 'ANTHRO 399', 'Capstone Anthropological Science', 'ANTHRO 399 - Capstone: Anthropological Science', '30 points passed at Stage III in Anthropological Science or Academic Head approval', NULL);
INSERT INTO `course` VALUES (56, 'Biomedical Science', 'BIOMED 399', 'Capstone Biomedical Science', 'BIOMED 399 - Capstone: Biomedical Science', '30 points from BIOSCI 347-358, MEDSCI 300-320, MEDIMAGE 300, 302', NULL);
INSERT INTO `course` VALUES (57, 'Biological Sciences', 'BIOSCI 100(G)', 'Antarctica The Frozen Continent', 'BIOSCI 100(G) - Antarctica: The Frozen Continent', NULL, NULL);
INSERT INTO `course` VALUES (58, 'Biological Sciences', 'BIOSCI 101', 'Life! Origins and Mechanisms', 'BIOSCI 101 - Life! Origins and Mechanisms', NULL, NULL);
INSERT INTO `course` VALUES (59, 'Biological Sciences', 'BIOSCI 106', 'Foundations of Biochemistry', 'BIOSCI 106 - Foundations of Biochemistry', NULL, NULL);
INSERT INTO `course` VALUES (60, 'Biological Sciences', 'BIOSCI 107', 'Biology for Biomedical Science Cellular Processes（This course has not been scheduled）', 'BIOSCI 107 - Biology for Biomedical Science: Cellular Processes（This course has not been scheduled）', NULL, NULL);
INSERT INTO `course` VALUES (61, 'Biological Sciences', 'BIOSCI 108', 'Biodiversity Patterns of Life（This course has not been scheduled）', 'BIOSCI 108 - Biodiversity: Patterns of Life（This course has not been scheduled）', NULL, NULL);
INSERT INTO `course` VALUES (62, 'Biological Sciences', 'BIOSCI 109', 'Ecology and Evolution The Continuum of Life（This course has not been scheduled）', 'BIOSCI 109 - Ecology and Evolution: The Continuum of Life（This course has not been scheduled）', NULL, 'BIOSCI 104');
INSERT INTO `course` VALUES (63, 'Biological Sciences', 'BIOSCI 201', 'Cellular and Molecular Biology（This course has not been scheduled）', 'BIOSCI 201 - Cellular and Molecular Biology（This course has not been scheduled）', 'BIOSCI 101, and 15 points from BIOSCI 106-109, MEDSCI 142, and 15 points from CHEM 110, 120, 150', NULL);
INSERT INTO `course` VALUES (64, 'Biological Sciences', 'BIOSCI 202', 'Genetics', 'BIOSCI 202 - Genetics', 'BIOSCI 101 and 15 points from BIOSCI 106-109', NULL);
INSERT INTO `course` VALUES (65, 'Biological Sciences', 'BIOSCI 203', 'Biochemistry', 'BIOSCI 203 - Biochemistry', 'BIOSCI 101, 106 and 15 points from CHEM 110, 120', NULL);
INSERT INTO `course` VALUES (66, 'Biological Sciences', 'BIOSCI 204', 'Principles of Microbiology（This course has not been scheduled）', 'BIOSCI 204 - Principles of Microbiology（This course has not been scheduled）', 'BIOSCI 101 and 15 points from BIOSCI 106-109', NULL);
INSERT INTO `course` VALUES (67, 'Biological Sciences', 'BIOSCI 205', 'Plant, Cell and Environment', 'BIOSCI 205 - Plant, Cell and Environment', 'BIOSCI 101, 108', NULL);
INSERT INTO `course` VALUES (68, 'Biological Sciences', 'BIOSCI 206', 'Principles of Ecology（This course has not been scheduled）', 'BIOSCI 206 - Principles of Ecology（This course has not been scheduled）', 'BIOSCI 108, 109 and STATS 101 or 108', NULL);
INSERT INTO `course` VALUES (69, 'Biological Sciences', 'BIOSCI 207', 'Adaptive Form and Function', 'BIOSCI 207 - Adaptive Form and Function', 'BIOSCI 108, and BIOSCI 101 or 109', NULL);
INSERT INTO `course` VALUES (70, 'Biological Sciences', 'BIOSCI 208', 'Invertebrate Diversity（This course has not been scheduled）', 'BIOSCI 208 - Invertebrate Diversity（This course has not been scheduled）', 'BIOSCI 108, and BIOSCI 101 or 109', NULL);
INSERT INTO `course` VALUES (71, 'Biological Sciences', 'BIOSCI 210', 'Evolution and the Biological Origin of Life', 'BIOSCI 210 - Evolution and the Biological Origin of Life', 'BIOSCI 109, and 15 points from BIOSCI 101-108', NULL);
INSERT INTO `course` VALUES (72, 'Biological Sciences', 'BIOSCI 220', 'Quantitative Biology', 'BIOSCI 220 - Quantitative Biology', '30 points from BIOSCI 101-109', NULL);
INSERT INTO `course` VALUES (73, 'Biological Sciences', 'BIOSCI 300', 'Directed Study（This course has not been scheduled）（available as of 01/11/2022)', 'BIOSCI 300 - Directed Study（This course has not been scheduled）（available as of 01/11/2022)', 'BIOSCI 210', NULL);
INSERT INTO `course` VALUES (74, 'Biological Sciences', 'BIOSCI 322', 'Evolution of Genes, Populations and Species', 'BIOSCI 322 - Evolution of Genes, Populations and Species', NULL, NULL);
INSERT INTO `course` VALUES (75, 'Biological Sciences', 'BIOSCI 324', 'Plant Pathology and Symbiosis（This course has not been scheduled）', 'BIOSCI 324 - Plant Pathology and Symbiosis（This course has not been scheduled）', 'BIOSCI 204 or 205', 'BIOSCI 321');
INSERT INTO `course` VALUES (76, 'Biological Sciences', 'BIOSCI 325', 'Plant Diversity and Function', 'BIOSCI 325 - Plant Diversity and Function', 'BIOSCI 108, and BIOSCI 205 or 206', 'BIOSCI 323');
INSERT INTO `course` VALUES (77, 'Biological Sciences', 'BIOSCI 326', 'Plant Biotechnology for Crops and Health', 'BIOSCI 326 - Plant Biotechnology for Crops and Health', '15 points from BIOSCI 202, 203, 205', 'BIOSCI 340');
INSERT INTO `course` VALUES (78, 'Biological Sciences', 'BIOSCI 328', 'Fisheries and Aquaculture（This course has not been scheduled）', 'BIOSCI 328 - Fisheries and Aquaculture（This course has not been scheduled）', 'BIOSCI 207 or 208', NULL);
INSERT INTO `course` VALUES (79, 'Biological Sciences', 'BIOSCI 333', 'Marine Ecology and Conservation', 'BIOSCI 333 - Marine Ecology and Conservation', 'BIOSCI 220, and BIOSCI 206 or MARINE 202', NULL);
INSERT INTO `course` VALUES (80, 'Biological Sciences', 'BIOSCI 334', 'Biology of Marine Organisms（This course has not been scheduled）', 'BIOSCI 334 - Biology of Marine Organisms（This course has not been scheduled）', 'BIOSCI 108, 109 and 15 points from BIOSCI 206, 207, 208', NULL);
INSERT INTO `course` VALUES (81, 'Biological Sciences', 'BIOSCI 335', 'Ecological Physiology', 'BIOSCI 335 - Ecological Physiology', '15 points from BIOSCI 207, 208', NULL);
INSERT INTO `course` VALUES (82, 'Biological Sciences', 'BIOSCI 337', 'Animal Behaviour', 'BIOSCI 337 - Animal Behaviour', 'BIOSCI 209 or 220, and 207 or 208', NULL);
INSERT INTO `course` VALUES (83, 'Biological Sciences', 'BIOSCI 338', 'Biology of Terrestrial Animals（This course has not been scheduled）', 'BIOSCI 338 - Biology of Terrestrial Animals（This course has not been scheduled）', '15 points from BIOSCI 206-208', 'BIOSCI 320');
INSERT INTO `course` VALUES (84, 'Biological Sciences', 'BIOSCI 347', 'Environmental Microbiology and Biotechnology', 'BIOSCI 347 - Environmental Microbiology and Biotechnology', 'BIOSCI 204 or MEDSCI 202', NULL);
INSERT INTO `course` VALUES (85, 'Biological Sciences', 'BIOSCI 348', 'Food and Industrial Microbiology', 'BIOSCI 348 - Food and Industrial Microbiology', 'BIOSCI 106 and 15 points from BIOSCI 204, MEDSCI 202', NULL);
INSERT INTO `course` VALUES (86, 'Biological Sciences', 'BIOSCI 349', 'Biomedical Microbiology（This course has not been scheduled）', 'BIOSCI 349 - Biomedical Microbiology（This course has not been scheduled）', 'BIOSCI 201 and either BIOSCI 204 or MEDSCI 202', NULL);
INSERT INTO `course` VALUES (87, 'Biological Sciences', 'BIOSCI 350', 'Protein Structure and Function（This course has not been scheduled）', 'BIOSCI 350 - Protein Structure and Function（This course has not been scheduled）', 'BIOSCI 201, 203', NULL);
INSERT INTO `course` VALUES (88, 'Biological Sciences', 'BIOSCI 351', 'Molecular Genetics（This course has not been scheduled）', 'BIOSCI 351 - Molecular Genetics（This course has not been scheduled）', 'BIOSCI 201, 202', NULL);
INSERT INTO `course` VALUES (89, 'Biological Sciences', 'BIOSCI 353', 'Molecular and Cellular Regulation', 'BIOSCI 353 - Molecular and Cellular Regulation', 'BIOSCI 201, 203', NULL);
INSERT INTO `course` VALUES (90, 'Biological Sciences', 'BIOSCI 355', 'Genomics and Genome Biology', 'BIOSCI 355 - Genomics and Genome Biology', 'BIOSCI 202', 'BIOINF 301、354');
INSERT INTO `course` VALUES (91, 'Biological Sciences', 'BIOSCI 356', 'Developmental Biology and Cancer', 'BIOSCI 356 - Developmental Biology and Cancer', 'BIOSCI 201', NULL);
INSERT INTO `course` VALUES (92, 'Biological Sciences', 'BIOSCI 358', 'Nutritional Science', 'BIOSCI 358 - Nutritional Science', 'BIOSCI 203', NULL);
INSERT INTO `course` VALUES (93, 'Biological Sciences', 'BIOSCI 394', 'Terrestrial Ecology and Conservation（This course has not been scheduled）', 'BIOSCI 394 - Terrestrial Ecology and Conservation（This course has not been scheduled）', 'BIOSCI 206 and 220, or 104 and 30 points at Stage II in either Biological Sciences or Geography', NULL);
INSERT INTO `course` VALUES (94, 'Biological Sciences', 'BIOSCI 395', 'Pacific Biogeography and Biodiversity', 'BIOSCI 395 - Pacific Biogeography and Biodiversity', 'BIOSCI 109 or GEOG 101', NULL);
INSERT INTO `course` VALUES (95, 'Biological Sciences', 'BIOSCI 399', 'Capstone Biology The Science of the 21st Century', 'BIOSCI 399 - Capstone: Biology: The Science of the 21st Century', '30 points at Stage III in Biological Sciences', NULL);
INSERT INTO `course` VALUES (96, 'Chemistry', 'CHEM 91P', 'Preparatory Chemistry 1', 'CHEM 91P - Preparatory Chemistry 1', NULL, NULL);
INSERT INTO `course` VALUES (97, 'Chemistry', 'CHEM 100', '', 'CHEM 100 ', NULL, NULL);
INSERT INTO `course` VALUES (98, 'Chemistry', 'CHEM 100G', 'Molecules that Changed the World', 'CHEM 100G - Molecules that Changed the World', NULL, NULL);
INSERT INTO `course` VALUES (99, 'Chemistry', 'CHEM 110', 'Chemistry of the Living World', 'CHEM 110 - Chemistry of the Living World', NULL, NULL);
INSERT INTO `course` VALUES (100, 'Chemistry', 'CHEM 120', 'Chemistry of the Material World', 'CHEM 120 - Chemistry of the Material World', NULL, NULL);
INSERT INTO `course` VALUES (101, 'Chemistry', 'CHEM 150', 'Concepts in Chemistry', 'CHEM 150 - Concepts in Chemistry', NULL, 'Restriction: Cannot be taken at the same time as any other chemistry course、or after any successfully completed chemistry course、other than CHEM 100/CHEM 100G');
INSERT INTO `course` VALUES (102, 'Chemistry', 'CHEM 200', 'Special Topic', 'CHEM 200 - Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (103, 'Chemistry', 'CHEM 251', 'Structure and Spectroscopy', 'CHEM 251 - Structure and Spectroscopy', 'CHEM 120 and 15 points from MATHS 108, 110, 120, 130, 150, 153, PHYSICS 120, 160, STATS 101, 108', 'CHEM 220');
INSERT INTO `course` VALUES (104, 'Chemistry', 'CHEM 252', 'Properties and Analysis of Matter', 'CHEM 252 - Properties and Analysis of Matter', 'CHEM 110, 120, and 15 points from MATHS 108, 110, 120, 130, 150, 153, PHYSICS 120, 160, STATS 101, 108', 'CHEM 240');
INSERT INTO `course` VALUES (105, 'Chemistry', 'CHEM 253', 'Making Molecules Synthesis and Isolation', 'CHEM 253 - Making Molecules: Synthesis and Isolation', 'CHEM 110', 'CHEM 230');
INSERT INTO `course` VALUES (106, 'Chemistry', 'CHEM 254', '', 'CHEM 254', NULL, NULL);
INSERT INTO `course` VALUES (107, 'Chemistry', 'CHEM 254A', '', 'CHEM 254A', NULL, NULL);
INSERT INTO `course` VALUES (108, 'Chemistry', 'CHEM 254B', 'Modelling Chemical Processes', 'CHEM 254B - Modelling Chemical Processes', 'CHEM 110, 120 and 15 points from MATHS 108, 110, 130, 150, PHYSICS 120', NULL);
INSERT INTO `course` VALUES (109, 'Chemistry', 'CHEM 260', 'Introduction to Green Chemistry', 'CHEM 260 - Introduction to Green Chemistry', 'Either CHEM 110 and 120, or at least B- in CHEM 110 or 120', NULL);
INSERT INTO `course` VALUES (110, 'Chemistry', 'CHEM 300', 'Speical Topic', 'CHEM 300 - Speical Topic', NULL, NULL);
INSERT INTO `course` VALUES (111, 'Chemistry', 'CHEM 310', 'Structural Chemistry and Spectroscopy', ' CHEM 310 - Structural Chemistry and Spectroscopy', '15 points from CHEM 210, 251', NULL);
INSERT INTO `course` VALUES (112, 'Chemistry', 'CHEM 320', 'Design and Reactivity of Inorganic Compounds', 'CHEM 320 - Design and Reactivity of Inorganic Compounds', '15 points from CHEM 220, 251, 253', NULL);
INSERT INTO `course` VALUES (113, 'Chemistry', 'CHEM 330', 'Contemporary Organic Chemistry', 'CHEM 330 - Contemporary Organic Chemistry', '15 points from CHEM 230, 253', NULL);
INSERT INTO `course` VALUES (114, 'Chemistry', 'CHEM 340', 'Advanced Analytical Chemistry', 'CHEM 340  - Advanced Analytical Chemistry', '15 points from CHEM 240, 252', NULL);
INSERT INTO `course` VALUES (115, 'Chemistry', 'CHEM 350', '', 'CHEM 350', NULL, NULL);
INSERT INTO `course` VALUES (116, 'Chemistry', 'CHEM 350A', '', 'CHEM 350A', NULL, NULL);
INSERT INTO `course` VALUES (117, 'Chemistry', 'CHEM 350B', 'Topics in Chemistry', 'CHEM 350B - Topics in Chemistry', '30 points at Stage II in Chemistry To complete this course students must enrol in CHEM 350 A and B, or CHEM 350', NULL);
INSERT INTO `course` VALUES (118, 'Chemistry', 'CHEM 351', 'Chemicals Big and Small Nanomaterial to Biomacromolecules', 'CHEM 351 - Chemicals Big and Small: Nano-material to Bio-macromolecules', '30 points from CHEM 251, 252, 253', 'CHEM 350');
INSERT INTO `course` VALUES (119, 'Chemistry', 'CHEM 352', '', 'CHEM 352', NULL, NULL);
INSERT INTO `course` VALUES (120, 'Chemistry', 'CHEM 352A', '', 'CHEM 352A', NULL, NULL);
INSERT INTO `course` VALUES (121, 'Chemistry', 'CHEM 352B', 'Advanced Concepts in Chemistry', 'CHEM 352B - Advanced Concepts in Chemistry', 'CHEM 251 or 253 with a GPA of 4.5 or higher To complete this course students must enrol in CHEM 352 A and B, or CHEM 352', NULL);
INSERT INTO `course` VALUES (122, 'Chemistry', 'CHEM 360', 'Contemporary Green Chemistry', 'CHEM 360 - Contemporary Green Chemistry', 'CHEM 260', NULL);
INSERT INTO `course` VALUES (123, 'Chemistry', 'CHEM 380', 'Materials Chemistry', 'CHEM 380 - Materials Chemistry', '15 points from CHEM 210, 220, 251, CHEMMAT 121', NULL);
INSERT INTO `course` VALUES (124, 'Chemistry', 'CHEM 390', 'Medicinal Chemistry', 'CHEM 390 - Medicinal Chemistry', 'CHEM 110 and a minimum of 165 points passed', NULL);
INSERT INTO `course` VALUES (125, 'Chemistry', 'CHEM 392', 'Issues in Drug Design and Development', 'CHEM 392 - Issues in Drug Design and Development', 'CHEM 110 and a further 150 points passed', NULL);
INSERT INTO `course` VALUES (126, 'Chemistry', 'CHEM 397', 'Capstone Green Chemical Science', 'CHEM 397 - Capstone: Green Chemical Science', '30 points from CHEM 351, 360, ENVSCI 301', NULL);
INSERT INTO `course` VALUES (127, 'Chemistry', 'CHEM 398', 'Capstone Medicinal Chemistry', 'CHEM 398 - Capstone: Medicinal Chemistry', 'CHEM 390 and 15 points from CHEM 310, 320, 330, 340, 351, 360, 380, 392', NULL);
INSERT INTO `course` VALUES (128, 'Chemistry', 'CHEM 399', 'Capstone Chemistry', 'CHEM 399 - Capstone: Chemistry', '45 points from CHEM 251, 252, 253, 260', NULL);
INSERT INTO `course` VALUES (129, 'Computer Science', 'COMPSCI 101', 'Principles of Programming', 'COMPSCI 101 - Principles of Programming', NULL, 'Cannot be taken with or after COMPSCI 105、107、130、210-220、230-289、313-399');
INSERT INTO `course` VALUES (130, 'Computer Science', 'COMPSC 110', 'Introduction to Computer Systems', 'COMPSC 110 - Introduction to Computer Systems', NULL, 'Cannot be taken with or after COMPSCI 210');
INSERT INTO `course` VALUES (131, 'Computer Science', 'COMPSCI 111', '', 'COMPSCI 111', NULL, 'Cannot be taken with or after COMPSCI 210、220、230');
INSERT INTO `course` VALUES (132, 'Computer Science', 'COMPSCI 111G', 'An Introduction to Practical Computing', 'COMPSCI 111G - An Introduction to Practical Computing', 'MATHS 102 or at least 13 credits in Mathematics at NCEA Level 3 or D in CIE A2 Mathematics or C in CIE AS Mathematics or 3 out of 7 in IB Mathematics', 'Cannot be taken with or after COMPSCI 225, MATHS 254、255');
INSERT INTO `course` VALUES (133, 'Computer Science', 'COMPSCI 120', 'Mathematics for Computer Science', 'COMPSCI 120 - Mathematics for Computer Science', NULL, 'COMPSCI 105、107');
INSERT INTO `course` VALUES (134, 'Computer Science', 'COMPSCI 130', 'Introduction to Software Fundamentals', 'COMPSCI 130 - Introduction to Software Fundamentals', NULL, NULL);
INSERT INTO `course` VALUES (135, 'Computer Science', 'COMPSCI 210', 'Computer Organisation', 'COMPSCI  210 - Computer Organisation', 'COMPSCI 110, and 15 points from COMPSCI 105, 107, 130', NULL);
INSERT INTO `course` VALUES (136, 'Computer Science', 'COMPSCI 215', 'Data Communications and Security', 'COMPSCI  215 - Data Communications and Security', 'COMPSCI 110 and PHYSICS 140 and 15 points from COMPSCI 105, 107, 130', NULL);
INSERT INTO `course` VALUES (137, 'Computer Science', 'COMPSCI 220', 'Algorithms and Data Structures', 'COMPSCI 220 - Algorithms and Data Structures', 'COMPSCI 120 and 15 points from COMPSCI 105, 107, 130', NULL);
INSERT INTO `course` VALUES (138, 'Computer Science', 'COMPSCI 225', 'Discrete Structures in Mathematics and Computer Science', 'COMPSCI 225 - Discrete Structures in Mathematics and Computer Science', '15 points from COMPSCI 120, MATHS 120, 150, 153', 'MATHS 255');
INSERT INTO `course` VALUES (139, 'Computer Science', 'COMPSCI 230', 'Object Oriented Software Development', 'COMPSCI 230 - Object Oriented Software Development', '15 points from COMPSCI 105, 107, 130', NULL);
INSERT INTO `course` VALUES (140, 'Computer Science', 'COMPSCI  235', 'Software Development Methodologies', 'COMPSCI  235 - Software Development Methodologies', '15 points from COMPSCI 105, 107, 130', 'COMPSCI 280');
INSERT INTO `course` VALUES (141, 'Computer Science', 'COMPSCI 289', 'Research Seminar in Computer Science', 'COMPSCI 289 - Research Seminar in Computer Science', 'Minimum GPA of 5.0 and COMPSCI 110, 120, 130', NULL);
INSERT INTO `course` VALUES (142, 'Computer Science', 'COMPSCI 290', 'Special Topic', 'COMPSCI 290 - Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (143, 'Computer Science', 'COMPSCI 313', 'Computer Architecture', 'COMPSCI 313 - Computer Architecture', 'COMPSCI 210, 215, PHYSICS 140', 'SOFTENG 363, COMPSYS 304');
INSERT INTO `course` VALUES (144, 'Computer Science', 'COMPSCI 315', 'Data Communications Technologies', 'COMPSCI 315 - Data Communications Technologies', 'COMPSCI 210, 215', 'COMPSCI 314');
INSERT INTO `course` VALUES (145, 'Computer Science', 'COMPSCI 316', 'Cyber Security', 'COMPSCI 316 - Cyber Security', 'COMPSCI 210, 215', NULL);
INSERT INTO `course` VALUES (146, 'Computer Science', 'COMPSCI 320', 'Applied Algorithmics', 'COMPSCI 320 - Applied Algorithmics', 'COMPSCI 220 and 15 points from COMPSCI 225, MATHS 254, 255', NULL);
INSERT INTO `course` VALUES (147, 'Computer Science', 'COMPSCI 331', 'LargeScale Software Development', 'COMPSCI 331 - Large-Scale Software Development', 'COMPSCI 230, 235', NULL);
INSERT INTO `course` VALUES (148, 'Computer Science', 'COMPSCI 335', 'Functional Programming and Distributed Services', 'COMPSCI 335 - Functional Programming and Distributed Services', 'COMPSCI 230 and 15 points at Stage II in Computer Science', NULL);
INSERT INTO `course` VALUES (149, 'Computer Science', 'COMPSCI 340', 'Operating Systems', 'COMPSCI 340 - Operating Systems', 'COMPSCI 210, 230', 'SOFTENG 370');
INSERT INTO `course` VALUES (150, 'Computer Science', 'COMPSCI 345', 'Humancomputer Interaction', 'COMPSCI 345 - Human-computer Interaction', 'COMPSCI 230 or SOFTENG 206', 'SOFTENG 350');
INSERT INTO `course` VALUES (151, 'Computer Science', 'COMPSCI 350', 'Mathematical Foundations of Computer Science', 'COMPSCI 350 - Mathematical Foundations of Computer Science', 'COMPSCI 220 or PHIL 222, and 15 points from COMPSCI 225, MATHS 254, 255', NULL);
INSERT INTO `course` VALUES (152, 'Computer Science', 'COMPSCI 351', 'Fundamentals of Database Systems', 'COMPSCI 351 - Fundamentals of Database Systems', 'COMPSCI 220 and 15 points from COMPSCI 225, MATHS 254, 255', 'COMPSCI 751, SOFTENG 351');
INSERT INTO `course` VALUES (153, 'Computer Science', 'COMPSCI 361', 'Machine Learning', 'COMPSCI 361 - Machine Learning', 'COMPSCI 220, and 15 points from DATASCI 100, STATS 101, 108, and 15 points from COMPSCI 225, MATHS 254, 255', 'COMPSCI 762');
INSERT INTO `course` VALUES (154, 'Computer Science', 'COMPSCI 367', 'Artificial Intelligence', 'COMPSCI 367 - Artificial Intelligence', 'COMPSCI 220 and 15 points from COMPSCI 225, MATHS 254, 255', 'COMPSCI 761');
INSERT INTO `course` VALUES (155, 'Computer Science', 'COMPSCI 369', 'Computational Methods in Interdisciplinary Science', 'COMPSCI 369 - Computational Methods in Interdisciplinary Science', 'COMPSCI 220 and 15 points from COMPSCI 225, MATHS 254, 255', NULL);
INSERT INTO `course` VALUES (156, 'Computer Science', 'COMPSCI 373', 'Computer Graphics and Image Processing', 'COMPSCI 373 - Computer Graphics and Image Processing', 'COMPSCI 210, 230', 'COMPSCI 771');
INSERT INTO `course` VALUES (157, 'Computer Science', 'COMPSCI 380', '', 'COMPSCI 380', 'Approval of Academic Head or nominee', 'COMPSCI 690');
INSERT INTO `course` VALUES (158, 'Computer Science', 'COMPSCI 380A', '', 'COMPSCI 380A', NULL, NULL);
INSERT INTO `course` VALUES (159, 'Computer Science', 'COMPSCI 380B', 'Project in Computer Science', 'COMPSCI 380B - Project in Computer Science', NULL, NULL);
INSERT INTO `course` VALUES (160, 'Computer Science', 'COMPSCI 389', 'Research Methods in Computer Science', 'COMPSCI 389 - Research Methods in Computer Science', 'GPA of 5.0 or higher and COMPSCI 289 and 30 points at Stage II in Computer Science', NULL);
INSERT INTO `course` VALUES (161, 'Computer Science', 'COMPSCI 390', 'Special Topic', 'COMPSCI 390 - Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (162, 'Computer Science', 'COMPSCI 391', 'Special Topic', 'COMPSCI 391 - Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (163, 'Computer Science', 'COMPSCI 392', 'Special Topic', 'COMPSCI 392 - Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (164, 'Computer Science', 'COMPSCI 393', 'Special Topic', 'COMPSCI 393 - Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (165, 'Computer Science', 'COMPSCI 399', 'Capstone Computer Science', 'COMPSCI 399 - Capstone: Computer Science', '30 points at Stage III in Computer Science and COMPSCI 210, 220, 230', NULL);
INSERT INTO `course` VALUES (166, 'Data Science', 'DATASCI 100', 'Data Science for Everyone', 'DATASCI 100 - Data Science for Everyone', NULL, NULL);
INSERT INTO `course` VALUES (167, 'Data Science', 'DATASCI 399', 'Capstone Creating Value from Data', 'DATASCI 399 - Capstone: Creating Value from Data', '30 points at Stage III in Data Science', NULL);
INSERT INTO `course` VALUES (168, 'Earth Science', 'EARTHSCI 102', 'Foundation for Earth Sciences', 'EARTHSCI 102: Foundation for Earth Sciences', NULL, 'EARTHSCI 263');
INSERT INTO `course` VALUES (169, 'Earth Science', 'EARTHSCI 105(G)', 'Earth’s Natural Hazards', 'EARTHSCI 105(G): Earth’s Natural Hazards', NULL, NULL);
INSERT INTO `course` VALUES (170, 'Earth Science', 'EARTHSCI 120', 'Planet Earth', 'EARTHSCI 120 : Planet Earth', NULL, 'EARTHSCI 103');
INSERT INTO `course` VALUES (171, 'Earth Science', 'EARTHSCI 202', 'Earth History', 'EARTHSCI 202: Earth History', '75 points, including at least 15 points from EARTHSCI 103, 120', NULL);
INSERT INTO `course` VALUES (172, 'Earth Science', 'EARTHSCI 203', 'Rock and Minerals', 'EARTHSCI 203: Rock and Minerals', '15 points from EARTHSCI 103, 120', NULL);
INSERT INTO `course` VALUES (173, 'Earth Science', 'EARTHSCI 205(G)', 'New Zealand Half a Billion Years on the Edge', 'EARTHSCI 205(G): New Zealand: Half a Billion Years on the Edge', '75 points passed', 'GEOLOGY 205、205G');
INSERT INTO `course` VALUES (174, 'Earth Science', 'EARTHSCI 208', 'Earth Structure', 'EARTHSCI 208: Earth Structure', '15 points at Stage I in Earth Sciences', 'EARTHSCI 204');
INSERT INTO `course` VALUES (175, 'Earth Science', 'EARTHSCI 209', 'Special Topic', 'EARTHSCI 209: Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (176, 'Earth Science', 'EARTHSCI 220', 'Practice in Earth Sciences 1', 'EARTHSCI 220: Practice in Earth Sciences 1', '15 points from EARTHSCI 120, GEOG 101', 'EARTHSCI 201、260');
INSERT INTO `course` VALUES (177, 'Earth Science', 'EARTHSCI 261', 'Climate and Society', 'EARTHSCI 261: Climate and Society', 'GEOG 101', 'GEOG 261');
INSERT INTO `course` VALUES (178, 'Earth Science', 'EARTHSCI 262', 'Geomorphology', 'EARTHSCI 262: Geomorphology', 'GEOG 101', 'GEOG 262');
INSERT INTO `course` VALUES (179, 'Earth Science', 'EARTHSCI 303', 'Sedimentary Systems', 'EARTHSCI 303: Sedimentary Systems', 'Any 30 points at Stage II in Earth Sciences or Biological Sciences, plus an understanding equivalent to EARTHSCI 202 will be assumed', NULL);
INSERT INTO `course` VALUES (180, 'Earth Science', 'EARTHSCI 307', 'Dynamic Quaternary Environments', 'EARTHSCI 307: Dynamic Quaternary Environments', '45 points at Stage II, including 15 points from EARTHSCI 201, 202, 220, GEOG 260-263, or equivalent', NULL);
INSERT INTO `course` VALUES (181, 'Earth Science', 'EARTHSCI 308', 'Tectonic and Magmatic Systems', 'EARTHSCI 308: Tectonic and Magmatic Systems', NULL, 'EARTHSCI 304、305');
INSERT INTO `course` VALUES (182, 'Earth Science', 'EARTHSCI 309', 'Special Topic', 'EARTHSCI 309: Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (183, 'Earth Science', 'EARTHSCI 315', 'Analytical Skills in Geology', 'EARTHSCI 315: Analytical Skills in Geology', 'EARTHSCI 220, 30 points from EARTHSCI 202, 203, 208, 262 and a Grade Point Average of 5.0 or higher', NULL);
INSERT INTO `course` VALUES (184, 'Earth Science', 'EARTHSCI 320', 'Practice in Earth Sciences 2', 'EARTHSCI 320: Practice in Earth Sciences 2', 'EARTHSCI 220', 'EARTHSCI 301, GEOG 330');
INSERT INTO `course` VALUES (185, 'Earth Science', 'EARTHSCI 361', 'Imaging the Subsurface', 'EARTHSCI 361: Imaging the Subsurface', '15 points at Stage II in Earth Sciences, Environmental Physics, Geophysics', 'GEOLOGY 361, GEOPHYS 361');
INSERT INTO `course` VALUES (186, 'Earth Science', 'EARTHSCI 372', 'Engineering Geology', 'EARTHSCI 372 : Engineering Geology', 'CIVIL 220 or EARTHSCI 201 or 220 or GEOLOGY 201, and 30 points from EARTHSCI 201-263, GEOG 260-263, GEOLOGY 202-205', 'CIVIL 726, GEOLOGY 372');
INSERT INTO `course` VALUES (187, 'Earth Science', 'EARTHSCI 388', 'Field Focused Research in Earth System Science', 'EARTHSCI 388: Field Focused Research in Earth System Science', 'Permission of Academic Head', NULL);
INSERT INTO `course` VALUES (188, 'Earth Science', 'EARTHSCI 390', 'Directed Study', 'EARTHSCI 390: Directed Study', 'Permission of Academic Head', NULL);
INSERT INTO `course` VALUES (189, 'Earth Science', 'EARTHSCI 399', 'Capstone Earth Sciences', 'EARTHSCI 399: Capstone: Earth Sciences', '30 points at Stage III in Earth Sciences', NULL);
INSERT INTO `course` VALUES (190, 'Environmental Change', 'ENVCHG 100', 'Global Climate Change', 'ENVCHG 100: Global Climate Change', NULL, NULL);
INSERT INTO `course` VALUES (191, 'Environmental Change', 'ENVCHG 300', 'Environmental Change', 'ENVCHG 300: Environmental Change', 'Programme Coordinator approval', 'GEOG 334');
INSERT INTO `course` VALUES (192, 'Environmental Physics', 'ENVPHYS 100(G)', 'Sun, Sand, Surf Science of Aotearoa', 'ENVPHYS 100(G): Sun, Sand, Surf: Science of Aotearoa', NULL, NULL);
INSERT INTO `course` VALUES (193, 'Environmental Physics', 'ENVPHYS 200', 'Earth Observations and Models', 'ENVPHYS 200: Earth Observations and Models', '15 points from ENVPHYS 100, PHYSICS 100, 102, 120, 121, 160, EARTHSCI 120 and 15 points from MATHS 108, 110, 120, 130, 199, STATS 101-120', 'GEOPHYS 213');
INSERT INTO `course` VALUES (194, 'Environmental Physics', 'ENVPHYS 300', 'Atmosphere, Ocean and Earth Physics', 'ENVPHYS 300: Atmosphere, Ocean and Earth Physics', 'PHYSICS 201, and ENVPHYS 200 or GEOPHYS 213, and 15 points from ENGSCI 211, MATHS 253, 260', 'GEOPHYS 310、311');
INSERT INTO `course` VALUES (195, 'Environmental Physics', 'ENVPHYS 301', 'Special Topic', 'ENVPHYS 301: Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (196, 'Environmental Physics', 'ENVPHYS 370', 'Directed Study', 'ENVPHYS 370: Directed Study', 'Departmental approval', NULL);
INSERT INTO `course` VALUES (197, 'Environmental Physics', 'ENVPHYS 399', 'Capstone Environmental Physics', 'ENVPHYS 399: Capstone: Environmental Physics', 'ENVPHYS 300', 'EARTHSCI 399, GEOG 399, PHYSICS 399');
INSERT INTO `course` VALUES (198, 'Environmental Science', 'ENVSCI 101(G)', 'Environment, Science and Management', 'ENVSCI 101(G): Environment, Science and Management', NULL, NULL);
INSERT INTO `course` VALUES (199, 'Environmental Science', 'ENVSCI 201', 'Natural and Human Environmental Systems', 'ENVSCI 201: Natural and Human Environmental Systems', 'At least 45 points at Stage I', NULL);
INSERT INTO `course` VALUES (200, 'Environmental Science', 'ENVSCI 203', 'Modelling Environmental Systems', 'ENVSCI 203: Modelling Environmental Systems', 'STATS 101 or 108', 'ENVSCI 310');
INSERT INTO `course` VALUES (201, 'Environmental Science', 'ENVSCI 204', 'Special Topic', 'ENVSCI 204: Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (202, 'Environmental Science', 'ENVSCI 301', 'Environmental Science in Practice', 'ENVSCI 301 : Environmental Science in Practice', 'ENVSCI 201 or equivalent', NULL);
INSERT INTO `course` VALUES (203, 'Environmental Science', 'ENVSCI 303', 'Environmental Science, Risk and Society', 'ENVSCI 303 : Environmental Science, Risk and Society', NULL, NULL);
INSERT INTO `course` VALUES (204, 'Environmental Science', 'ENVSCI 304', 'Special Topic', 'ENVSCI 304: Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (205, 'Environmental Science', 'ENVSCI 390', 'Directed Study', 'ENVSCI 390: Directed Study', 'Academic Head approval', NULL);
INSERT INTO `course` VALUES (206, 'Environmental Science', 'ENVSCI 399', 'Capstone Environmental Science', 'ENVSCI 399 : Capstone: Environmental Science', '30 points at Stage III in Environmental Science or 15 points at Stage III in Environmental Science and 15 points from other Stage III courses included in the major', NULL);
INSERT INTO `course` VALUES (207, 'Exercise Sciences', 'EXERSCI 100G', 'Exercise and Fitness Myths and Reality', 'EXERSCI 100G: Exercise and Fitness: Myths and Reality', NULL, 'BIOSCI 107, EXERSCI 101、105, SPORTSCI 100G、101、105, MEDSCI 142');
INSERT INTO `course` VALUES (208, 'Exercise Sciences', 'EXERSCI 101', 'Foundations of Exercise and Sport Sciences', 'EXERSCI 101 : Foundations of Exercise and Sport Sciences', NULL, 'SPORTSCI 101');
INSERT INTO `course` VALUES (209, 'Exercise Sciences', 'EXERSCI 103', 'Human Anatomy', 'EXERSCI 103 : Human Anatomy', NULL, 'SPORTSCI 103');
INSERT INTO `course` VALUES (210, 'Exercise Sciences', 'EXERSCI 105', 'Exercise Prescription', 'EXERSCI 105 : Exercise Prescription', NULL, 'SPORTSCI 105、205');
INSERT INTO `course` VALUES (211, 'Exercise Sciences', 'EXERSCI 201', 'Exercise Physiology 1', 'EXERSCI 201 : Exercise Physiology 1', '15 points from BIOSCI 107, EXERSCI 101, 103, MEDSCI 142, SPORTSCI 101, 103', 'SPORTSCI 201');
INSERT INTO `course` VALUES (212, 'Exercise Sciences', 'EXERSCI 202', 'Principles of Tissue Adaptation', 'EXERSCI 202 : Principles of Tissue Adaptation', '30 points from MEDSCI 100-320 or BSc courses', 'SPORTSCI 202');
INSERT INTO `course` VALUES (213, 'Exercise Sciences', 'EXERSCI 203', 'Biomechanics 1', 'EXERSCI 203 : Biomechanics 1', NULL, 'SPORTSCI 203');
INSERT INTO `course` VALUES (214, 'Exercise Sciences', 'EXERSCI 204', 'Psychology of Physical Activity', 'EXERSCI 204 : Psychology of Physical Activity', NULL, 'SPORTSCI 204');
INSERT INTO `course` VALUES (215, 'Exercise Sciences', 'EXERSCI 205', 'Motor Learning', 'EXERSCI 205 : Motor Learning', NULL, NULL);
INSERT INTO `course` VALUES (216, 'Exercise Sciences', 'EXERSCI 206', 'Exercise Nutrition', 'EXERSCI 206 : Exercise Nutrition', '30 points from MEDSCI 100-320 or BSc courses', 'SPORTSCI 206');
INSERT INTO `course` VALUES (217, 'Exercise Sciences', 'EXERSCI 207', 'Sport Psychology', 'EXERSCI 207 : Sport Psychology', '45 points passed at Stage I or II', 'EXERSCI 304, SPORTSCI 304');
INSERT INTO `course` VALUES (218, 'Exercise Sciences', 'EXERSCI 210', 'Special Topic', 'EXERSCI 210: Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (219, 'Exercise Sciences', 'EXERSCI 271', 'Advanced Exercise Assessment and Prescription', 'EXERSCI 271 : Advanced Exercise Assessment and Prescription', '45 points: EXERSCI 101, 103, 105', NULL);
INSERT INTO `course` VALUES (220, 'Exercise Sciences', 'EXERSCI 301', 'Exercise Physiology 2', 'EXERSCI 301 : Exercise Physiology 2', '15 points from EXERSCI 201, MEDSCI 205, SPORTSCI 201', 'SPORTSCI 301');
INSERT INTO `course` VALUES (221, 'Exercise Sciences', 'EXERSCI 302', 'Exercise Physiology for Special Populations', 'EXERSCI 302 : Exercise Physiology for Special Populations', 'EXERSCI 301 or SPORTSCI 301', 'SPORTSCI 302');
INSERT INTO `course` VALUES (222, 'Exercise Sciences', 'EXERSCI 303', 'Biomechanics 2', 'EXERSCI 303 : Biomechanics 2', '15 points from ENGGEN 121, PHYSICS 160, EXERSCI 203, SPORTSCI 203', 'SPORTSCI 303');
INSERT INTO `course` VALUES (223, 'Exercise Sciences', 'EXERSCI 304', 'Sport Psychology', 'EXERSCI 304 : Sport Psychology', 'EXERSCI 204 or SPORTSCI 204, or 45 points passed at Stage II or III', 'EXERSCI 207, SPORTSCI 304');
INSERT INTO `course` VALUES (224, 'Exercise Sciences', 'EXERSCI 305', 'Movement Neuroscience', 'EXERSCI 305 : Movement Neuroscience', '15 points from EXERSCI 201, 205, MEDSCI 206, 309, 320, PSYCH 202, SPORTSCI 201', 'SPORTSCI 305');
INSERT INTO `course` VALUES (225, 'Exercise Sciences', 'EXERSCI 307', 'Psychology of Physical Activity', 'EXERSCI 307 : Psychology of Physical Activity', '45 points passed at Stage II or III', 'EXERSCI 204, SPORTSCI 204');
INSERT INTO `course` VALUES (226, 'Exercise Sciences', 'EXERSCI 309', 'Project in Exercise Sciences', 'EXERSCI 309 : Project in Exercise Sciences', '15 points at Stage II or III in Exercise Sciences and Departmental approval', 'SPORTSCI 309 To complete this course students must enrol in EXERSCI 309 A and B, or EXERSCI 309');
INSERT INTO `course` VALUES (227, 'Exercise Sciences', 'EXERSCI 371', 'Practicum in Exercise and Sport Sciences', 'EXERSCI 371: Practicum in Exercise and Sport Sciences', 'EXERSCI 271', NULL);
INSERT INTO `course` VALUES (228, 'Exercise Sciences', 'EXERSCI 399', 'Capstone Applying Exercise Sciences', 'EXERSCI 399 : Capstone: Applying Exercise Sciences', '15 points from EXERSCI 301, 303, 304 Corequisite: EXERSCI 305', NULL);
INSERT INTO `course` VALUES (229, 'Food Science', 'FOODSCI 100', 'Foundations of Food and Nutrition', 'FOODSCI 100 : Foundations of Food and Nutrition', NULL, 'FOODSCI 201');
INSERT INTO `course` VALUES (230, 'Food Science', 'FOODSCI 110', 'Concepts in Food and Nutrition', 'FOODSCI 110 : Concepts in Food and Nutrition', NULL, 'FOODSCI 100');
INSERT INTO `course` VALUES (231, 'Food Science', 'FOODSCI 200', 'Food Composition and Nutrition', 'FOODSCI 200 : Food Composition and Nutrition', '15 points from BIOSCI 106, CHEM 110, FOODSCI 100', 'FOODSCI 201');
INSERT INTO `course` VALUES (232, 'Food Science', 'FOODSCI 202', 'Food Preservation', 'FOODSCI 202 : Food Preservation', '15 points from FOODSCI 200, 201, 15 points from MATHS 108, 110', 'FOODSCI 302');
INSERT INTO `course` VALUES (233, 'Food Science', 'FOODSCI 301', 'Food Quality Attributes', 'FOODSCI 301 : Food Quality Attributes', 'FOODSCI 200 or 201', NULL);
INSERT INTO `course` VALUES (234, 'Food Science', 'FOODSCI 302', 'Food Preservation', 'FOODSCI 302 : Food Preservation', 'FOODSCI 201', 'FOODSCI 202');
INSERT INTO `course` VALUES (235, 'Food Science', 'FOODSCI 303', 'Sensory Science', 'FOODSCI 303 : Sensory Science', '15 points from STATS 101, 108 and 15 points from FOODSCI 200, 201 Corequisite: FOODSCI 301 or Permission of the Programme Director/Course Coordinator', NULL);
INSERT INTO `course` VALUES (236, 'Food Science', 'FOODSCI 304', 'Food Product Development', 'FOODSCI 304 : Food Product Development', 'FOODSCI 301 and 303 Corequisite: FOODSCI 302 or Permission of the Programme Director/Course Coordinator', NULL);
INSERT INTO `course` VALUES (237, 'Food Science', 'FOODSCI 306', 'Principles of Food Processing', 'FOODSCI 306 : Principles of Food Processing', 'FOODSCI 202', 'CHEMMAT 756');
INSERT INTO `course` VALUES (238, 'Food Science', 'FOODSCI 310', 'Theory of Food Product Design', 'FOODSCI 310 : Theory of Food Product Design', 'FOODSCI 100, 200 and STATS 101 or 108', 'FOODSCI 303、304');
INSERT INTO `course` VALUES (239, 'Food Science', 'FOODSCI 399', 'Capstone Food and Nutrition', 'FOODSCI 399 : Capstone: Food and Nutrition', 'FOODSCI 303 or 310 and a further 30 points at Stage III in Food Science and Nutrition', NULL);
INSERT INTO `course` VALUES (240, 'Geographic Information Science', 'GISCI 241', 'Principles of Remote Sensing', 'GISCI 241 : Principles of Remote Sensing', '60 points passed', NULL);
INSERT INTO `course` VALUES (241, 'Geographic Information Science', 'GISCI 242', 'Principles of GIScience', 'GISCI 242 : Principles of GIScience', '60 points passed', 'GEOG 318');
INSERT INTO `course` VALUES (242, 'Geographic Information Science', 'GISCI 341', 'Remote Sensing of Surface Processes', 'GISCI 341 : Remote Sensing of Surface Processes', 'GISCI 241', 'GEOG 317');
INSERT INTO `course` VALUES (243, 'Geographic Information Science', 'GISCI 343', 'GIScience Programming and Development', 'GISCI 343 : GIScience Programming and Development', '15 points from GISCI 241, 242, GEOG 317, 318', NULL);
INSERT INTO `course` VALUES (244, 'Geographic Information Science', 'GISCI 399', 'Capstone GIScience', 'GISCI 399 : Capstone: GIScience', '30 points at Stage III in Geographic Information Science', NULL);
INSERT INTO `course` VALUES (245, 'Geography', 'GEOG 101', 'Earth Surface Processes and Landforms', 'GEOG 101 : Earth Surface Processes and Landforms', NULL, NULL);
INSERT INTO `course` VALUES (246, 'Geography', 'GEOG 102', 'Geography of the Human Environment', 'GEOG 102 : Geography of the Human Environment', NULL, NULL);
INSERT INTO `course` VALUES (247, 'Geography', 'GEOG 103 (G)', 'Mapping Our World', 'GEOG 103 (G): Mapping Our World', NULL, 'GEOG 140, GISCI 140');
INSERT INTO `course` VALUES (248, 'Geography', 'GEOG 104 (G)', 'Cities and Urbanism', 'GEOG 104 (G): Cities and Urbanism', NULL, NULL);
INSERT INTO `course` VALUES (249, 'Geography', 'GEOG 140', 'Geographic Information and Spatial Thinking', 'GEOG 140 : Geographic Information and Spatial Thinking', NULL, 'EARTHSCI 210, GEOG 210, GISCI 140');
INSERT INTO `course` VALUES (250, 'Geography', 'GEOG 202', 'Cities, Regions and Communities', 'GEOG 202 : Cities, Regions and Communities', '60 points', NULL);
INSERT INTO `course` VALUES (251, 'Geography', 'GEOG 205', 'Environment and Society', 'GEOG 205 : Environment and Society', '60 points', NULL);
INSERT INTO `course` VALUES (252, 'Geography', 'GEOG 250', 'Geographical Research in Practice', 'GEOG 250 : Geographical Research in Practice', '60 points', NULL);
INSERT INTO `course` VALUES (253, 'Geography', 'GEOG 261', 'Climate and Society', 'GEOG 261 : Climate and Society', 'GEOG 101', 'EARTHSCI 261');
INSERT INTO `course` VALUES (254, 'Geography', 'GEOG 262', 'Geomorphology', 'GEOG 262 : Geomorphology', 'GEOG 101', 'EARTHSCI 262');
INSERT INTO `course` VALUES (255, 'Geography', 'GEOG 305', 'Population, Health and Society', 'GEOG 305 : Population, Health and Society', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (256, 'Geography', 'GEOG 307', 'Urban Geography', 'GEOG 307 : Urban Geography', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (257, 'Geography', 'GEOG 308', 'Geopolitics and Indigenous Rights', 'GEOG 308 : Geopolitics and Indigenous Rights', '30 points at Stage II', 'GEOG 312');
INSERT INTO `course` VALUES (258, 'Geography', 'GEOG 315', 'Research Design and Methods in Human Geography', 'GEOG 315 : Research Design and Methods in Human Geography', 'GEOG 250 and either GEOG 202 or 205 and 15 points from GEOG 302, 305, 307, 312, 320, 322-327, 352, or equivalent', NULL);
INSERT INTO `course` VALUES (259, 'Geography', 'GEOG 317', 'Remote Sensing and GIS', 'GEOG 317 : Remote Sensing and GIS', '15 points from EARTHSCI 210, GEOG 210, GISCI 140 and 45 points at Stage II', NULL);
INSERT INTO `course` VALUES (260, 'Geography', 'GEOG 320', 'Resources and Environmental Management', 'GEOG 320 : Resources and Environmental Management', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (261, 'Geography', 'GEOG 322', 'Culture and Environment in East Asia', 'GEOG 322 : Culture and Environment in East Asia', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (262, 'Geography', 'GEOG 325', 'The Human Dimension of Disasters', 'GEOG 325 : The Human Dimension of Disasters', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (263, 'Geography', 'GEOG 327', 'Politics, Markets and Economies', 'GEOG 327 : Politics, Markets and Economies', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (264, 'Geography', 'GEOG 330', 'Research Methods in Physical Geography', 'GEOG 330 : Research Methods in Physical Geography', 'GEOG 250 and 15 points from GEOG 331, 332, 334, 351', 'EARTHSCI 330');
INSERT INTO `course` VALUES (265, 'Geography', 'GEOG 331', 'Fluvial Geomorphology', 'GEOG 331 : Fluvial Geomorphology', '45 points at Stage II, including EARTHSCI 262 or GEOG 262, or equivalent', NULL);
INSERT INTO `course` VALUES (266, 'Geography', 'GEOG 332', 'Climate and Environment', 'GEOG 332 : Climate and Environment', '45 points at Stage II, including EARTHSCI 261 or GEOG 261, or equivalent', NULL);
INSERT INTO `course` VALUES (267, 'Geography', 'GEOG 332', 'Climate and Environment', 'GEOG 332 : Climate and Environment', '45 points at Stage II, including EARTHSCI 261 or GEOG 261, or equivalent', NULL);
INSERT INTO `course` VALUES (268, 'Geography', 'GEOG 333', 'Special Topic', 'GEOG 333 : Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (269, 'Geography', 'GEOG 334', 'Environmental Change', 'GEOG 334 : Environmental Change', '45 points at Stage II, including EARTHSCI 261 or GEOG 261, or equivalent', NULL);
INSERT INTO `course` VALUES (270, 'Geography', 'GEOG 335', 'Applied Physical Geography', 'GEOG 335 : Applied Physical Geography', '45 points at Stage II in Geography', 'GEOG 331、332');
INSERT INTO `course` VALUES (271, 'Geography', 'GEOG 342', 'Technology, Power and Social Change', 'GEOG 342 : Technology, Power and Social Change', '45 points at Stage II', NULL);
INSERT INTO `course` VALUES (272, 'Geography', 'GEOG 351', 'Coastal and Marine Studies', 'GEOG 351 : Coastal and Marine Studies', '45 points at Stage II, including EARTHSCI 262 or GEOG 262, or equivalent', NULL);
INSERT INTO `course` VALUES (273, 'Geography', 'GEOG 352', 'Landscape, Environment and Heritage', 'GEOG 352 : Landscape, Environment and Heritage', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (274, 'Geography', 'GEOG 399', 'Capstone Geography', 'GEOG 399 : Capstone: Geography', 'GEOG 250 and 30 points at Stage III in Geography', NULL);
INSERT INTO `course` VALUES (275, 'Geophysics', 'GEOPHYS 213', 'The Geophysical Environment', 'GEOPHYS 213 : The Geophysical Environment', '15 points from PHYSICS 120, 121, 150, 160, and either 15 points from ENGSCI 111, MATHS 108, 150, 153, or MATHS 120 and 130', 'PHYSICS 213');
INSERT INTO `course` VALUES (276, 'Geophysics', 'GEOPHYS 310', 'Physics of the Earth', 'GEOPHYS 310 : Physics of the Earth', '15 points from EARTHSCI 103, 120, GEOLOGY 103, and 15 points from GEOPHYS 213, PHYSICS 213, and 15 points from ENGSCI 211, MATHS 253, 260, PHYSICS 211', 'GEOPHYS 330');
INSERT INTO `course` VALUES (277, 'Geophysics', 'GEOPHYS 311', 'Atmosphere, Ocean, and Climate Physics', 'GEOPHYS 311 : Atmosphere, Ocean, and Climate Physics', '15 points from PHYSICS 201, 231, and 15 points from GEOPHYS 213, PHYSICS 213, and 15 points from ENGSCI 211, MATHS 253, 260, PHYSICS 211', 'GEOPHYS 331');
INSERT INTO `course` VALUES (278, 'Geophysics', 'GEOPHYS 361', 'Fundamentals and Applications of Geophysical Exploration', 'GEOPHYS 361 : Fundamentals and Applications of Geophysical Exploration', '15 points from EARTHSCI 103, 120, GEOLOGY 103, and GEOPHYS 213 or PHYSICS 213 and MATHS 208 or equivalent', 'EARTHSCI 361, GEOLOGY 361');
INSERT INTO `course` VALUES (279, 'Geophysics', 'GEOPHYS 399', 'Capstone Geophysics', 'GEOPHYS 399 : Capstone: Geophysics', '30 points from GEOPHYS 310, 311, 361', 'EARTHSCI 399, PHYSICS 399');
INSERT INTO `course` VALUES (280, 'Pharmacology', 'PHARMCOL 399', 'Capstone Integrated Pharmacology', 'PHARMCOL 399 - Capstone: Integrated Pharmacology', 'MEDSCI 204 and 30 points from MEDSCI 203, 205, 206, BIOSCI 203, and 30 points from MEDSCI 318-320', NULL);
INSERT INTO `course` VALUES (281, 'Pharmacology', 'PHARMCOL 787', 'Dissertation', 'PHARMCOL 787 - Dissertation', 'PHARMCOL 788, 789 To complete this course students must enrol in PHARMCOL 787 A and B, or PHARMCOL 787', NULL);
INSERT INTO `course` VALUES (282, 'Pharmacology', 'PHARMCOL 787A', 'Dissertation', 'PHARMCOL 787A - Dissertation', 'PHARMCOL 788, 789 To complete this course students must enrol in PHARMCOL 787 A and B, or PHARMCOL 787', NULL);
INSERT INTO `course` VALUES (283, 'Pharmacology', 'PHARMCOL 787B', 'Dissertation', 'PHARMCOL 787B - Dissertation', 'PHARMCOL 788, 789 To complete this course students must enrol in PHARMCOL 787 A and B, or PHARMCOL 787', NULL);
INSERT INTO `course` VALUES (284, 'Pharmacology', 'PHARMCOL 788', 'BSc(Hons) Dissertation', 'PHARMCOL 788 - BSc(Hons) Dissertation', 'PHARMCOL 789 To complete this course students must enrol in PHARMCOL 788 A and B, or PHARMCOL 788', NULL);
INSERT INTO `course` VALUES (285, 'Pharmacology', 'PHARMCOL 788A', 'BSc(Hons) Dissertation', 'PHARMCOL 788A - BSc(Hons) Dissertation', 'PHARMCOL 789 To complete this course students must enrol in PHARMCOL 788 A and B, or PHARMCOL 788', NULL);
INSERT INTO `course` VALUES (286, 'Pharmacology', 'PHARMCOL 788B', 'BSc(Hons) Dissertation', 'PHARMCOL 788B - BSc(Hons) Dissertation', 'PHARMCOL 789 To complete this course students must enrol in PHARMCOL 788 A and B, or PHARMCOL 788', NULL);
INSERT INTO `course` VALUES (287, 'Pharmacology', 'PHARMCOL 796A', 'MSc Thesis in Pharmacology', 'PHARMCOL 796A - MSc Thesis in Pharmacology', 'To complete this course students must enrol in PHARMCOL 796 A and B', NULL);
INSERT INTO `course` VALUES (288, 'Pharmacology', 'PHARMCOL 796B', 'MSc Thesis in Pharmacology', 'PHARMCOL 796B - MSc Thesis in Pharmacology', 'To complete this course students must enrol in PHARMCOL 796 A and B', NULL);
INSERT INTO `course` VALUES (289, 'Physics', 'PHYSICS 91P', 'Preparatory Physics 1', 'PHYSICS 91P - Preparatory Physics 1', NULL, NULL);
INSERT INTO `course` VALUES (290, 'Physics', 'PHYSICS 100', 'Models and Reality', 'PHYSICS 100 - Models and Reality', NULL, NULL);
INSERT INTO `course` VALUES (291, 'Physics', 'PHYSICS 100G', 'Models and Reality', 'PHYSICS 100G - Models and Reality', NULL, NULL);
INSERT INTO `course` VALUES (292, 'Physics', 'PHYSICS 102', 'Basic Concepts of Physics', 'PHYSICS 102 - Basic Concepts of Physics', NULL, NULL);
INSERT INTO `course` VALUES (293, 'Physics', 'PHYSICS 120', 'Advancing Physics 1', 'PHYSICS 120 - Advancing Physics 1', NULL, NULL);
INSERT INTO `course` VALUES (294, 'Physics', 'PHYSICS 121', 'Advancing Physics 2', 'PHYSICS 121 - Advancing Physics 2', NULL, NULL);
INSERT INTO `course` VALUES (295, 'Physics', 'PHYSICS 140', 'Digital Fundamentals', 'PHYSICS 140 - Digital Fundamentals', NULL, NULL);
INSERT INTO `course` VALUES (296, 'Physics', 'PHYSICS 160', 'Physics for the Life Sciences', 'PHYSICS 160 - Physics for the Life Sciences', NULL, NULL);
INSERT INTO `course` VALUES (297, 'Physics', 'PHYSICS 201', 'Classical and Thermal Physics', 'PHYSICS 201 - Classical and Thermal Physics', '15 points from PHYSICS 120, 121, 150, 160 and 15 points from ENGSCI 211, MATHS 130, 208, PHYSICS 211 Restriction: PHYSICS 230, 231', NULL);
INSERT INTO `course` VALUES (298, 'Physics', 'PHYSICS 202', 'Electromagnetism', 'PHYSICS 202 - Electromagnetism', '15 points from PHYSICS 121, 150 and 15 points from ENGSCI 211, MATHS 130, 208, PHYSICS 211 Restriction: PHYSICS 260, 261', NULL);
INSERT INTO `course` VALUES (299, 'Physics', 'PHYSICS 203', 'Relativity and Quantum Physics', 'PHYSICS 203 - Relativity and Quantum Physics', '15 points from PHYSICS 121, 150 and 15 points from ENGSCI 211, MATHS 130, 208, PHYSICS 211 Restriction: PHYSICS 250, 251', NULL);
INSERT INTO `course` VALUES (300, 'Physics', 'PHYSICS 244', 'Electronics and Imaging', 'PHYSICS 244 - Electronics and Imaging', '15 points from PHYSICS 120, 121, 160 and 15 points from ENGGEN 150, ENGSCI 111, MATHS 108, 110, 120, 130, 150 Restriction: PHYSICS 240', NULL);
INSERT INTO `course` VALUES (301, 'Physics', 'PHYSICS 309', 'Special Study', 'PHYSICS 309 - Special Study', NULL, NULL);
INSERT INTO `course` VALUES (302, 'Physics', 'PHYSICS 331', 'Classical Mechanics and Electrodynamics', 'PHYSICS 331 - Classical Mechanics and Electrodynamics', '15 points from PHYSICS 201, 231, 15 points from PHYSICS 202, 261 and 15 points from PHYSICS 211, MATHS 253, 260, ENGSCI 211 Restriction: PHYSICS 315, 325', NULL);
INSERT INTO `course` VALUES (303, 'Physics', 'PHYSICS 332', 'Fluid Mechanics', 'PHYSICS 332 - Fluid Mechanics', '15 points from PHYSICS 201, 231 and 15 points from PHYSICS 211, MATHS 253, 260, ENGSCI 211', NULL);
INSERT INTO `course` VALUES (304, 'Physics', 'PHYSICS 333', 'Lasers and Electromagnetic Waves', 'PHYSICS 333 - Lasers and Electromagnetic Waves', '15 points from PHYSICS 202, 261 and 15 points from PHYSICS 211, MATHS 253, 260, ENGSCI 211 Restriction: PHYSICS 326', NULL);
INSERT INTO `course` VALUES (305, 'Physics', 'PHYSICS 334', 'Statistical Physics and Condensed Matter', 'PHYSICS 334 - Statistical Physics and Condensed Matter', '15 points from PHYSICS 201, 231, 15 points from PHYSICS 203, 251 and 15 points from PHYSICS 211, MATHS 253, 260, ENGSCI 211 Restriction: PHYSICS 315, 354', NULL);
INSERT INTO `course` VALUES (306, 'Physics', 'PHYSICS 335', 'Quantum Mechanics', 'PHYSICS 335 - Quantum Mechanics', '15 points from PHYSICS 203, 251 and 15 points from PHYSICS 211, MATHS 253, 260, ENGSCI 211 Restriction: PHYSICS 350', NULL);
INSERT INTO `course` VALUES (307, 'Physics', 'PHYSICS 340', 'Electronics and Signal Processing', 'PHYSICS 340 - Electronics and Signal Processing', '15 points from PHYSICS 240, 244 and 15 points from PHYSICS 211, MATHS 253, 260, ENGSCI 211 Concurrent enrolment in PHYSICS 390 is recommended Restriction: PHYSICS 341', NULL);
INSERT INTO `course` VALUES (308, 'Physics', 'PHYSICS 356', 'Particle Physics and Astrophysics', 'PHYSICS 356 - Particle Physics and Astrophysics', '15 points from PHYSICS 201, 231, 15 points from PHYSICS 203, 251 and 15 points from PHYSICS 211, MATHS 253, 260, ENGSCI 211 Concurrent enrolment in PHYSICS 390 is recommended Restriction: PHYSICS 355', NULL);
INSERT INTO `course` VALUES (309, 'Physics', 'PHYSICS 371', 'Special Topic', 'PHYSICS 371 - Special Topic', NULL, NULL);
INSERT INTO `course` VALUES (310, 'Physics', 'PHYSICS 390', 'Experimental Physics', 'PHYSICS 390 - Experimental Physics', '15 points from PHYSICS 201, 202, 203, 231, 240, 244, 251, 261', NULL);
INSERT INTO `course` VALUES (311, 'Physics', 'PHYSICS 399', 'Capstone Physics', 'PHYSICS 399 - Capstone: Physics', '30 points from PHYSICS 201, 202, 203, 231, 240, 244, 251, 261', NULL);
INSERT INTO `course` VALUES (312, 'Physiology', 'PHYSIOL 399', 'Capstone Physiology', 'PHYSIOL 399 - Capstone: Physiology', '30 points at Stage III in Physiology Restriction: BIOMED 399, PHARMCOL 399', NULL);
INSERT INTO `course` VALUES (313, 'Physiology', 'PHYSIOL 787', 'Dissertation', 'PHYSIOL 787 - Dissertation', NULL, NULL);
INSERT INTO `course` VALUES (314, 'Physiology', 'PHYSIOL 787A', 'Dissertation', 'PHYSIOL 787A - Dissertation', NULL, NULL);
INSERT INTO `course` VALUES (315, 'Physiology', 'PHYSIOL 787B', 'Dissertation', 'PHYSIOL 787B - Dissertation', NULL, NULL);
INSERT INTO `course` VALUES (316, 'Physiology', 'PHYSIOL 788', 'BSc(Hons) Dissertation', 'PHYSIOL 788 - BSc(Hons) Dissertation', NULL, NULL);
INSERT INTO `course` VALUES (317, 'Physiology', 'PHYSIOL 788A', 'BSc(Hons) Dissertation', 'PHYSIOL 788A - BSc(Hons) Dissertation', NULL, NULL);
INSERT INTO `course` VALUES (318, 'Physiology', 'PHYSIOL 788B', 'BSc(Hons) Dissertation', 'PHYSIOL 788B - BSc(Hons) Dissertation', NULL, NULL);
INSERT INTO `course` VALUES (319, 'Physiology', 'PHYSIOL 796A', 'MSc Thesis in Physiology', 'PHYSIOL 796A - MSc Thesis in Physiology', 'To complete this course students must enrol in PHYSIOL 796 A and B', NULL);
INSERT INTO `course` VALUES (320, 'Physiology', 'PHYSIOL 796B', 'MSc Thesis in Physiology', 'PHYSIOL 796B - MSc Thesis in Physiology', 'To complete this course students must enrol in PHYSIOL 796 A and B', NULL);
INSERT INTO `course` VALUES (321, 'Information System', 'INFOSYS 110', 'Digital Systems', 'INFOSYS 110 - Digital Systems', NULL, NULL);
INSERT INTO `course` VALUES (322, 'Information System', 'INFOSYS 220', 'Business Systems Analysis', 'INFOSYS 220 - Business Systems Analysis', ' 15 points from COMPSCI 101, 105, 107, 130, INFOMGMT 192, INFOSYS 110', 'INFOMGMT 291');
INSERT INTO `course` VALUES (323, 'Information System', 'INFOSYS 221', 'Programming for Business', 'INFOSYS 221 - Programming for Business', '15 points from COMPSCI 101, 107, INFOSYS 110', 'COMPSCI 130');
INSERT INTO `course` VALUES (324, 'Information System', 'INFOSYS 222', 'Database Systems', 'INFOSYS 222  - Database Systems', '15 points from COMPSCI 101, 105, 107, 130, INFOSYS 110', NULL);
INSERT INTO `course` VALUES (325, 'Information System', 'INFOSYS 280', 'Business Systems Construction', 'INFOSYS 280 - Business Systems Construction', '15 points from COMPSCI 101, 107, INFOSYS 110', 'COMPSCI 110、130');
INSERT INTO `course` VALUES (326, 'Information System', 'INFOSYS 300', 'Special Topic Robotics Process Automation', 'INFOSYS 300 -  Special Topic: Robotics Process Automation', NULL, NULL);
INSERT INTO `course` VALUES (327, 'Information System', 'INFOSYS 303', 'Solutions Architecture', 'INFOSYS 303 - Solutions Architecture', 'INFOMGMT 291 or INFOSYS 220, and BUSAN 201 or INFOMGMT 292 or INFOSYS 222, and COMPSCI 130 or INFOSYS 221', ' INFOSYS 320');
INSERT INTO `course` VALUES (328, 'Information System', 'INFOSYS 304', 'IT Infrastructure', 'INFOSYS 304 - IT Infrastructure', 'INFOSYS 220 and 15 points from BUSAN 200, 201, COMPSCI 215, 230, 235, INNOVENT 203, OPSMGT 258, SCIGEN 201', ' INFOSYS 224、322、339');
INSERT INTO `course` VALUES (329, 'Information System', 'INFOSYS 305', 'Digital Strategy and Transformation', 'INFOSYS 305  - Digital Strategy and Transformation', 'INFOSYS 220 ', 'INFOSYS 323');
INSERT INTO `course` VALUES (330, 'Information System', 'INFOSYS 306', 'Digital Business and Innovation', 'INFOSYS 306  - Digital Business and Innovation', NULL, 'INFOSYS 323、338、344');
INSERT INTO `course` VALUES (331, 'Information System', 'INFOSYS 310A', 'Business Project', 'INFOSYS 310A  - Business Project', NULL, 'INFOSYS 340、342、345 To complete this course students must enrol in INFOSYS 310 A and B');
INSERT INTO `course` VALUES (332, 'Information System', 'INFOSYS 320', 'Information Systems Design', 'INFOSYS 320 - Information Systems Design', 'INFOMGMT 291 or INFOSYS 220, and BUSAN 201 or INFOMGMT 292 or INFOSYS 222, and INFOSYS 280 or COMPSCI 235 or 280 or equivalent', NULL);
INSERT INTO `course` VALUES (333, 'Information System', 'INFOSYS 321', 'Enterprise Systems', 'INFOSYS 321 -  Enterprise Systems', '15 points at Stage II in Accounting, Business Analytics, Computer Science, Engineering Science, Information Management, Information Systems, Marketing, Operations Management, Software Engineering', NULL);
INSERT INTO `course` VALUES (334, 'Information System', 'INFOSYS 322', 'Data Communications and the Internet', 'INFOSYS 322 -  Data Communications and the Internet', '15 points from COMPSCI 101, 107, 130, INFOMGMT 192, INFOSYS 110', 'INFOSYS 224');
INSERT INTO `course` VALUES (335, 'Information System', 'INFOSYS 323', 'Management of Information Systems', 'INFOSYS 323 - Management of Information Systems', '15 points at Stage II in Accounting, Business Analytics, Computer Science, Engineering Science, Information Management, Information Systems, Marketing, Operations and Supply Chain Management, Software Engineering', ' INFOMGMT 391');
INSERT INTO `course` VALUES (336, 'Information System', 'INFOSYS 330', 'Databases and Business Intelligence', 'INFOSYS 330 - Databases and Business Intelligence', 'BUSAN 201 or INFOMGMT 292 or INFOSYS 222 and 15 points from COMPSCI 101, 107, 130, INFOMGMT 192, INFOSYS 280, or equivalent', 'BUSAN 302, INFOMGMT 393');
INSERT INTO `course` VALUES (337, 'Information System', 'INFOSYS 338', 'Contemporary Issues in Information Systems', 'INFOSYS 338 - Contemporary Issues in Information Systems', 'INFOSYS 110 or equivalent and 30 points at Stage II in ACCTG, COMPSCI, ENGSCI, INFOMGMT, INFOSYS, MKTG, OPSMGT, SOFTENG', NULL);
INSERT INTO `course` VALUES (338, 'Information System', 'INFOSYS 341', 'Information Security in Business', 'INFOSYS 341 - Information Security in Business', '30 points at Stage II in either Business Analytics, Computer Science, Information Systems', NULL);
INSERT INTO `course` VALUES (339, 'Information System', 'INFOSYS 344', 'Customer Relationship Management', 'INFOSYS 344 - Customer Relationship Management', 'INFOSYS 220 and 15 points at Stage II in Accounting, Computer Science, Engineering science, Business analytics, Information Systems, Marketing, Operations and Supply Chain Management or Software Engineering', 'MKTG 304、314');
INSERT INTO `course` VALUES (340, 'Marine', 'MARINE 100', 'The Oceans Around Us', 'MARINE 100 - The Oceans Around Us', NULL, NULL);
INSERT INTO `course` VALUES (341, 'Marine', 'MARINE 202', 'Principles of Marine Science', 'MARINE 202 - Principles of Marine Science', 'MARINE 100 or 30 points at Stage I in BSc courses', NULL);
INSERT INTO `course` VALUES (342, 'Marine', 'MARINE 302', 'Dynamics of Marine Systems', 'MARINE 302 - Dynamics of Marine Systems', 'MARINE 202 or 30 points at Stage II in BSc courses', NULL);
INSERT INTO `course` VALUES (343, 'Marine', 'MARINE 303', 'Freshwater and Estuarine Ecology', 'MARINE 303 - Freshwater and Estuarine Ecology', 'BIOSCI 206 or MARINE 202 or 30 points at Stage II in BSc courses', 'BIOSCI 330');
INSERT INTO `course` VALUES (344, 'Marine', 'MARINE 305', 'Practical Skills in Marine Science', 'MARINE 305 - Practical Skills in Marine Science', 'MARINE 202 or 30 points at Stage II in BSc courses', NULL);
INSERT INTO `course` VALUES (345, 'Marine', 'MARINE 399', 'Capstone Marine Science', 'MARINE 399 -  Capstone: Marine Science', 'MARINE 202 and 30 points at Stage III in BSc courses', 'MARINE 304');
INSERT INTO `course` VALUES (346, 'Mathematics', 'MATHS 102', 'Functioning in Mathematics', 'MATHS 102 - Functioning in Mathematics', NULL, ' MATHS 102 may not be taken concurrently with any other Mathematics course, except MATHS 190 and may not be taken after ENGSCI 111 or any Mathematics course at Stage I or above, except MATHS 190、190G');
INSERT INTO `course` VALUES (347, 'Mathematics', 'MATHS 108', 'General Mathematics 1', 'MATHS 108 - General Mathematics 1', NULL, 'ENGGEN 150, ENGSCI 111, MATHS 120、130、150、153、208、250');
INSERT INTO `course` VALUES (348, 'Mathematics', 'MATHS 110', 'Mathematics for Natural Sciences', 'MATHS 110 -  Mathematics for Natural Sciences', NULL, 'ENGEN 150, ENGSCI 111, MATHS 150、153、208、250, More than 15 points from MATHS 120 and 130');
INSERT INTO `course` VALUES (349, 'Mathematics', 'MATHS 120', 'Algebra', 'MATHS 120 -  Algebra', NULL, NULL);
INSERT INTO `course` VALUES (350, 'Mathematics', 'MATHS 130', 'Calculus', 'MATHS 130 - Calculus', NULL, NULL);
INSERT INTO `course` VALUES (351, 'Mathematics', 'MATHS 162', 'Computational Mathematics', 'MATHS 162 - Computational Mathematics', 'ENGGEN 150 or ENGSCI 111 or MATHS 108 or 120 or 150 or 153 (corequisite)', 'MATHS 199');
INSERT INTO `course` VALUES (352, 'Mathematics', 'MATHS 190', 'Great Ideas Shaping our World', 'MATHS 190 -  Great Ideas Shaping our World', NULL, 'MATHS 190 may not be taken after any Mathematics course at Stage III');
INSERT INTO `course` VALUES (353, 'Mathematics', 'MATHS 199', 'Advancing in Mathematics', 'MATHS 199  -  Advancing in Mathematics', 'Departmental approval', NULL);
INSERT INTO `course` VALUES (354, 'Mathematics', 'MATHS 208', 'General Mathematics 2', 'MATHS 208  - General Mathematics 2', '15 points from MATHS 108, 150, 153, ENGSCI 111, ENGGEN 150, or MATHS 120 and MATHS 130, or B- or higher in MATHS 110', 'Cannot be taken, concurrently with, or after MATHS 250、253');
INSERT INTO `course` VALUES (355, 'Mathematics', 'MATHS 250', 'Algebra and Calculus 2', 'MATHS 250 -  Algebra and Calculus 2', 'MATHS 120 and 130, or 15 points from ENGGEN 150, ENGSCI 111, MATHS 150, 153', NULL);
INSERT INTO `course` VALUES (356, 'Mathematics', 'MATHS 253', 'Algebra and Calculus 3', 'MATHS 253 -  Algebra and Calculus 3', 'MATHS 250', NULL);
INSERT INTO `course` VALUES (357, 'Mathematics', 'MATHS 254', 'Fundamental Concepts of Mathematics', 'MATHS 254 -  Fundamental Concepts of Mathematics', 'MATHS 250  (corequisite)', 'MATHS 255');
INSERT INTO `course` VALUES (358, 'Mathematics', 'MATHS 260', 'Differential Equations', 'MATHS 260 -  Differential Equations', 'MATHS 208 or 250 or ENGSCI 211 or a concurrent enrolment in MATHS 250', NULL);
INSERT INTO `course` VALUES (359, 'Mathematics', 'MATHS 270', 'Numerical Computation', 'MATHS 270 -  Numerical Computation', 'MATHS 120 and 130, or 15 points from ENGGEN 150, ENGSCI 111, MATHS 108, 110, 150, 153, and 15 points from COMPSCI 101, 105, 130, INFOSYS 110, 120, MATHS 162, 199', NULL);
INSERT INTO `course` VALUES (360, 'Mathematics', 'MATHS 302', 'Perspectives in Mathematics Education', 'MATHS 302 -  Perspectives in Mathematics Education', NULL, NULL);
INSERT INTO `course` VALUES (361, 'Mathematics', 'MATHS 315', 'Mathematical Logic', 'MATHS 315 - Mathematical Logic', 'B+ or higher in COMPSCI 225 or MATHS 254 or 255 or PHIL 222', NULL);
INSERT INTO `course` VALUES (362, 'Mathematics', 'MATHS 320', 'Algebraic Structures', 'MATHS 320 -  Algebraic Structures', 'MATHS 250, and MATHS 254 or 255', NULL);
INSERT INTO `course` VALUES (363, 'Mathematics', 'MATHS 326', 'Combinatorics', 'MATHS 326 - Combinatorics', 'MATHS 254 or 255, or MATHS 250 and a B+ or higher in COMPSCI 225', NULL);
INSERT INTO `course` VALUES (364, 'Mathematics', 'MATHS 328', 'Algebra and Applications', 'MATHS 328 -  Algebra and Applications', 'MATHS 250, and 254 or 255, or a B+ or higher in COMPSCI 225 and 15 points from MATHS 250, 253', NULL);
INSERT INTO `course` VALUES (365, 'Mathematics', 'MATHS 332', 'Real Analysis', 'MATHS 332 -  Real Analysis', 'MATHS 250 and 254 or 255', NULL);
INSERT INTO `course` VALUES (366, 'Mathematics', 'MATHS 333', 'Analysis in Higher Dimensions', 'MATHS 333 - Analysis in Higher Dimensions', 'MATHS 332 or a B or higher in MATHS 254', NULL);
INSERT INTO `course` VALUES (367, 'Mathematics', 'MATHS 334', 'Algebraic Geometry', 'MATHS 334 -  Algebraic Geometry', 'MATHS 332, and at least one of MATHS 320, 328 and Departmental approval', 'MATHS 734');
INSERT INTO `course` VALUES (368, 'Mathematics', 'MATHS 340', 'Real and Complex Calculus', 'MATHS 340 -  Real and Complex Calculus', NULL, 'MATHS 250');
INSERT INTO `course` VALUES (369, 'Mathematics', 'MATHS 341', 'Complex Analysis', 'MATHS 341 -  Complex Analysis', 'MATHS 332 and Departmental approval', 'MATHS 740');
INSERT INTO `course` VALUES (370, 'Mathematics', 'MATHS 350', 'Topology', 'MATHS 350 -  Topology', 'MATHS 332 and Departmental approval', 'MATHS 750');
INSERT INTO `course` VALUES (371, 'Mathematics', 'MATHS 361', 'Partial Differential Equations', 'MATHS 361 -  Partial Differential Equations', 'MATHS 250, 260', NULL);
INSERT INTO `course` VALUES (372, 'Mathematics', 'MATHS 362', 'Methods in Applied Mathematics', 'MATHS 362 -  Methods in Applied Mathematics', 'MATHS 250, 260', NULL);
INSERT INTO `course` VALUES (373, 'Mathematics', 'MATHS 363', 'Advanced Modelling and Computation', 'MATHS 363 -  Advanced Modelling and Computation', 'MATHS 260 and 270', NULL);
INSERT INTO `course` VALUES (374, 'Mathematics', 'MATHS 399', 'Capstone Mathematics', 'MATHS 399 -  Capstone: Mathematics', 'MATHS 250 and 30 points at Stage III in Mathematics', NULL);
INSERT INTO `course` VALUES (375, 'Psychology', 'PSYCH 108', 'Individual, Social and Applied Psychology', 'PSYCH 108 Individual, Social and Applied Psychology', NULL, NULL);
INSERT INTO `course` VALUES (376, 'Psychology', 'PSYCH 109', 'Mind, Brain and Behaviour', 'PSYCH 109 Mind, Brain and Behaviour', NULL, NULL);
INSERT INTO `course` VALUES (377, 'Psychology', 'PSYCH 200', 'Special Topic Foundations of Developmental Psychology', 'PSYCH 200 Special Topic: Foundations of Developmental Psychology', '30 points at Stage I in Psychology', NULL);
INSERT INTO `course` VALUES (378, 'Psychology', 'PSYCH 201', 'Perception and Cognition', 'PSYCH 201 Perception and Cognition', '30 points at Stage I in Psychology', NULL);
INSERT INTO `course` VALUES (379, 'Psychology', 'PSYCH 202', 'Biopsychology', 'PSYCH 202 Biopsychology', '30 points at Stage I Psychology or 15 points from BIOSCI 101, 103', NULL);
INSERT INTO `course` VALUES (380, 'Psychology', 'PSYCH 203', 'Learning and Behaviour', 'PSYCH 203 Learning and Behaviour', '30 points at Stage I Psychology or 15 points from BIOSCI 101, 103', NULL);
INSERT INTO `course` VALUES (381, 'Psychology', 'PSYCH 204', 'Social Psychology', 'PSYCH 204 Social Psychology', '30 points at Stage I Psychology', NULL);
INSERT INTO `course` VALUES (382, 'Psychology', 'PSYCH 207', 'Theories of Personality and Development', 'PSYCH 207 Theories of Personality and Development', '30 points at Stage I Psychology', NULL);
INSERT INTO `course` VALUES (383, 'Psychology', 'PSYCH 208', 'Producing Psychological Knowledge', 'PSYCH 208 Producing Psychological Knowledge', NULL, NULL);
INSERT INTO `course` VALUES (384, 'Psychology', 'STATS 100', 'Concepts in Statistics', 'STATS 100 Concepts in Statistics', NULL, 'May not be taken with, or after passing, any other Statistics course');
INSERT INTO `course` VALUES (385, 'Psychology', 'STATS 101', 'Introduction to Statistics', 'STATS 101 Introduction to Statistics', NULL, 'STATS 102、107、108、191');
INSERT INTO `course` VALUES (386, 'Psychology', 'STATS 108', 'Statistics for Commerce', 'STATS 108 Statistics for Commerce', NULL, 'STATS 101、102、107、191');
INSERT INTO `course` VALUES (387, 'Psychology', 'STATS 125', 'Probability and its Applications', 'STATS 125 Probability and its Applications', NULL, 'STATS 210');
INSERT INTO `course` VALUES (388, 'Psychology', 'EXERSCI 304', 'Sport Psychology', 'EXERSCI 304 Sport Psychology', 'EXERSCI 204 or SPORTSCI 204, or 45 points passed at Stage II or III', 'EXERSCI 207, SPORTSCI 304');
INSERT INTO `course` VALUES (389, 'Psychology', 'PSYCH 300', 'Applied Psychology', 'PSYCH 300 Applied Psychology', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (390, 'Psychology', 'PSYCH 303', 'Cognitive Science', 'PSYCH 303 Cognitive Science', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (391, 'Psychology', 'PSYCH 305', 'Human Neuroscience', 'PSYCH 305 Human Neuroscience', '45 points at Stage II in Psychology and 15 points from STATS 100-125, or MEDSCI 206 or PHYSIOL 220', NULL);
INSERT INTO `course` VALUES (392, 'Psychology', 'PSYCH 306', 'Research Methods in Psychology', 'PSYCH 306 Research Methods in Psychology', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (393, 'Psychology', 'PSYCH 308A', 'and 308B Directed Study', 'PSYCH 308A and 308B Directed Study', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (394, 'Psychology', 'PSYCH 309', 'Learning', 'PSYCH 309 Learning', '45 points at Stage II in Psychology and 15 points from STATS 100-125, or 45 points at Stage II in Biological Sciences', 'PSYCH 362');
INSERT INTO `course` VALUES (395, 'Psychology', 'PSYCH 310', 'Introduction to Clinical Psychology', 'PSYCH 310 Introduction to Clinical Psychology', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (396, 'Psychology', 'PSYCH 311', 'Advanced Topics in Social Psychology', 'PSYCH 311 Advanced Topics in Social Psychology', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (397, 'Psychology', 'PSYCH 313', 'Psychology of Communication Disorders', 'PSYCH 313 Psychology of Communication Disorders', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (398, 'Psychology', 'PSYCH 317', 'Evolution, Behaviour and Cognition', 'PSYCH 317 Evolution, Behaviour and Cognition', '45 points at Stage II in Psychology and 15 points from STATS 100-125, or 45 points at Stage II in Biological Sciences', NULL);
INSERT INTO `course` VALUES (399, 'Psychology', 'PSYCH 319', 'Psychology and Gender', 'PSYCH 319 Psychology and Gender', '45 points at Stage II in Psychology and 15 points from STATS 100-125, or 30 points at Stage II in Gender Studies', NULL);
INSERT INTO `course` VALUES (400, 'Psychology', 'PSYCH 320', 'Culture and Psychology', 'PSYCH 320 Culture and Psychology', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (401, 'Psychology', 'PSYCH 326', 'Life Span Development', 'PSYCH 326 Life Span Development', '45 points at Stage II in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (402, 'Psychology', 'THEOREL 314', 'Special Topic The Evolution and Psychology of Religion', 'THEOREL 314 Special Topic: The Evolution and Psychology of Religion', '30 points at Stage II', NULL);
INSERT INTO `course` VALUES (403, 'Psychology', 'PSYCH 399', 'Capstone Communicating Psychology', 'PSYCH 399 Capstone: Communicating Psychology', '30 points at Stage III in Psychology and 15 points from STATS 100-125', NULL);
INSERT INTO `course` VALUES (404, 'Statistics', 'STATS 101', 'Introduction to Statistics', 'STATS 101 Introduction to Statistics', NULL, 'STATS 102、107、108、191');
INSERT INTO `course` VALUES (405, 'Statistics', 'STATS 108', 'Statistics for Commerce', 'STATS 108 Statistics for Commerce', NULL, 'STATS 101、102、107、191');
INSERT INTO `course` VALUES (406, 'Statistics', 'STATS 125', 'Probability and its Applications', 'STATS 125 Probability and its Applications', NULL, 'STATS 210');
INSERT INTO `course` VALUES (407, 'Statistics', 'STATS 150', 'Lies, Damned Lies, and Statistics', 'STATS 150 Lies, Damned Lies, and Statistics', NULL, NULL);
INSERT INTO `course` VALUES (408, 'Statistics', 'STATS 201', 'Data Analysis', 'STATS 201 Data Analysis', '15 points from STATS 101-108, 191', 'STATS 207、208, BIOSCI 209');
INSERT INTO `course` VALUES (409, 'Statistics', 'STATS 208', 'Data Analysis for Commerce', 'STATS 208 Data Analysis for Commerce', '15 points from STATS 101-108, 191', 'STATS 201、207, BIOSCI 209');
INSERT INTO `course` VALUES (410, 'Statistics', 'STATS 210', 'Statistical Theory', 'STATS 210 Statistical Theory', '15 points from ENGSCI 111, ENGGEN 150, STATS 125', '15 points from MATHS 208、250, ENGSCI 211 or equivalent');
INSERT INTO `course` VALUES (411, 'Statistics', 'STATS 220', 'Data Technologies', 'STATS 220 Data Technologies', '15 points at Stage I in Computer Science or Statistics', NULL);
INSERT INTO `course` VALUES (412, 'Statistics', 'STATS 225', 'Probability Theory and Applications', 'STATS 225 Probability: Theory and Applications', 'B+ or higher in ENGGEN 150 or ENGSCI 111 or STATS 125, or a B+ or higher in MATHS 120 and 130', NULL);
INSERT INTO `course` VALUES (413, 'Statistics', 'STATS 240', 'Design and Structured Data', 'STATS 240 Design and Structured Data', 'STATS 101 or 108', 'STATS 340');
INSERT INTO `course` VALUES (414, 'Statistics', 'STATS 255', 'Optimisation and Datadriven Decision Making', 'STATS 255 Optimisation and Data-driven Decision Making', 'ENGSCI 211 or STATS 201 or 208, or a B+ or higher in either MATHS 108 or 120 or 130 or 150 or 153 or 162 or 199 or STATS 101 or 108, or a concurrent enrolment in either ENGSCI 211 or STATS 201 or 208', 'ENGSCI 255');
INSERT INTO `course` VALUES (415, 'Statistics', 'STATS 302', 'Applied Multivariate Analysis', 'STATS 302 Applied Multivariate Analysis', '15 points from STATS 201, 207, 208, BIOSCI 209', 'STATS 767');
INSERT INTO `course` VALUES (416, 'Statistics', 'STATS 310', 'Introduction to Statistical Inference', 'STATS 310 Introduction to Statistical Inference', 'STATS 210 or 225, and 15 points from MATHS 208, 250 or equivalent', 'STATS 732');
INSERT INTO `course` VALUES (417, 'Statistics', 'STATS 313', 'Advanced Topics in Probability', 'STATS 313 Advanced Topics in Probability', 'STATS 225', 'STATS 710');
INSERT INTO `course` VALUES (418, 'Statistics', 'STATS 320', 'Applied Stochastic Modelling', 'STATS 320 Applied Stochastic Modelling', '15 points from STATS 125, 210, 225 and 15 points from STATS 201, 207, 208, 220, BIOSCI 209', NULL);
INSERT INTO `course` VALUES (419, 'Statistics', 'STATS 325', 'Stochastic Processes', 'STATS 325 Stochastic Processes', 'B+ or higher in STATS 125 or B or higher in STATS 210 or 225 or 320, and 15 points from ENGSCI 211, MATHS 208, 250', 'STATS 721');
INSERT INTO `course` VALUES (420, 'Statistics', 'STATS 326', 'Applied Time Series Analysis', 'STATS 326 Applied Time Series Analysis', '15 points from BIOSCI 209, ECON 211, STATS 201, 207, 208', 'STATS 727');
INSERT INTO `course` VALUES (421, 'Statistics', 'STATS 330', 'Statistical Modelling', 'STATS 330 Statistical Modelling', '15 points from STATS 201, 207, 208, BIOSCI 209', NULL);
INSERT INTO `course` VALUES (422, 'Statistics', 'STATS 331', 'Introduction to Bayesian Statistics', 'STATS 331 Introduction to Bayesian Statistics', '15 points from STATS 201, 207, 208, BIOSCI 209', NULL);
INSERT INTO `course` VALUES (423, 'Statistics', 'STATS 369', 'Data Science Practice', 'STATS 369 Data Science Practice', 'STATS 220, and STATS 210 or 225, and 15 points from BIOSCI 209, ECON 221, STATS 201, 207, 208', 'STATS 765');
INSERT INTO `course` VALUES (424, 'Statistics', 'STATS 370', 'Financial Mathematics', 'STATS 370 Financial Mathematics', '15 points at Stage II in Statistics or BIOSCI 209; 15 points at Stage II in Mathematics', NULL);
INSERT INTO `course` VALUES (425, 'Statistics', 'STATS 380', 'Statistical Computing', 'STATS 380 Statistical Computing', '15 points from STATS 201, 207, 208, 220, BIOSCI 209', NULL);
INSERT INTO `course` VALUES (426, 'Statistics', 'STATS 383', 'The Science and Craft of Data Management', 'STATS 383 The Science and Craft of Data Management', 'STATS 201, 207, or 208 or BIOSCI 209; and STATS 220 or COMPSCI 101', NULL);
INSERT INTO `course` VALUES (427, 'Statistics', 'STATS 399', 'Capstone Statistics in Action', 'STATS 399 Capstone: Statistics in Action', '30 points at Stage III in Statistics', NULL);

-- ----------------------------
-- Table structure for direction
-- ----------------------------
DROP TABLE IF EXISTS `direction`;
CREATE TABLE `direction`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `course` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 611 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of direction
-- ----------------------------
INSERT INTO `direction` VALUES (1, 'Anthropology', 'Anthropological Science (BSc)', 'ANTHRO 107-109');
INSERT INTO `direction` VALUES (2, 'Anthropology', 'Anthropological Science (BSc)', 'ANTHRO 200');
INSERT INTO `direction` VALUES (3, 'Anthropology', 'Anthropological Science (BSc)', 'ANTHRO 201');
INSERT INTO `direction` VALUES (4, 'Anthropology', 'Anthropological Science (BSc)', 'ANTHRO 205–208, 235, 252');
INSERT INTO `direction` VALUES (5, 'Anthropology', 'Anthropological Science (BSc)', 'ANTHRO 399');
INSERT INTO `direction` VALUES (6, 'Biological Sciences', 'Biological Sciences(BSc)', 'BIOSCI 101');
INSERT INTO `direction` VALUES (7, 'Biological Sciences', 'Biological Sciences(BSc)', 'BIOSCI 108');
INSERT INTO `direction` VALUES (8, 'Biological Sciences', 'Biological Sciences(BSc)', 'BIOSCI 109');
INSERT INTO `direction` VALUES (9, 'Biological Sciences', 'Biological Sciences(BSc)', 'STATS 101');
INSERT INTO `direction` VALUES (10, 'Biological Sciences', 'Biological Sciences(BSc)', 'BIOSCI 220');
INSERT INTO `direction` VALUES (11, 'Biological Sciences', 'Biological Sciences(BSc)', 'BIOSCI 201-290');
INSERT INTO `direction` VALUES (12, 'Biological Sciences', 'Biological Sciences(BSc)', 'BIOSCI 301-395, MARINE 303');
INSERT INTO `direction` VALUES (13, 'Biological Sciences', 'Biological Sciences(BSc)', 'BIOSCI 399');
INSERT INTO `direction` VALUES (14, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 101');
INSERT INTO `direction` VALUES (15, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 106');
INSERT INTO `direction` VALUES (16, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 108');
INSERT INTO `direction` VALUES (17, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 109');
INSERT INTO `direction` VALUES (18, 'Biological Sciences', 'Biochemistry and Cell Biology', 'STATS 101');
INSERT INTO `direction` VALUES (19, 'Biological Sciences', 'Biochemistry and Cell Biology', 'CHEM 110, 120');
INSERT INTO `direction` VALUES (20, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 201');
INSERT INTO `direction` VALUES (21, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 203');
INSERT INTO `direction` VALUES (22, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 220');
INSERT INTO `direction` VALUES (23, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 350');
INSERT INTO `direction` VALUES (24, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 353');
INSERT INTO `direction` VALUES (25, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 326,349,351,355,356');
INSERT INTO `direction` VALUES (26, 'Biological Sciences', 'Biochemistry and Cell Biology', 'BIOSCI 399');
INSERT INTO `direction` VALUES (27, 'Biological Sciences', 'Biotechnology', 'BIOSCI 101');
INSERT INTO `direction` VALUES (28, 'Biological Sciences', 'Biotechnology', 'BIOSCI 106');
INSERT INTO `direction` VALUES (29, 'Biological Sciences', 'Biotechnology', 'BIOSCI 108');
INSERT INTO `direction` VALUES (30, 'Biological Sciences', 'Biotechnology', 'BIOSCI 109');
INSERT INTO `direction` VALUES (31, 'Biological Sciences', 'Biotechnology', 'STATS 101');
INSERT INTO `direction` VALUES (32, 'Biological Sciences', 'Biotechnology', 'CHEM 110,120,150');
INSERT INTO `direction` VALUES (33, 'Biological Sciences', 'Biotechnology', 'BIOSCI 203');
INSERT INTO `direction` VALUES (34, 'Biological Sciences', 'Biotechnology', 'BIOSCI 204');
INSERT INTO `direction` VALUES (35, 'Biological Sciences', 'Biotechnology', 'BIOSCI 220');
INSERT INTO `direction` VALUES (36, 'Biological Sciences', 'Biotechnology', 'INNOVENT 203');
INSERT INTO `direction` VALUES (37, 'Biological Sciences', 'Biotechnology', 'SCIGEN 201');
INSERT INTO `direction` VALUES (38, 'Biological Sciences', 'Biotechnology', 'INNOVENT 307');
INSERT INTO `direction` VALUES (39, 'Biological Sciences', 'Biotechnology', 'BIOSCI 324, 326,347,348');
INSERT INTO `direction` VALUES (40, 'Biological Sciences', 'Biotechnology', 'BIOSCI 399');
INSERT INTO `direction` VALUES (41, 'Biological Sciences', 'Ecology', 'BIOSCI 101');
INSERT INTO `direction` VALUES (42, 'Biological Sciences', 'Ecology', 'BIOSCI 108');
INSERT INTO `direction` VALUES (43, 'Biological Sciences', 'Ecology', 'BIOSCI 109');
INSERT INTO `direction` VALUES (44, 'Biological Sciences', 'Ecology', 'STATS 101');
INSERT INTO `direction` VALUES (45, 'Biological Sciences', 'Ecology', 'BIOSCI 206');
INSERT INTO `direction` VALUES (46, 'Biological Sciences', 'Ecology', 'BIOSCI 220');
INSERT INTO `direction` VALUES (47, 'Biological Sciences', 'Ecology', 'BIOSCI 204,205,207,208');
INSERT INTO `direction` VALUES (48, 'Biological Sciences', 'Ecology', 'BIOSCI 333');
INSERT INTO `direction` VALUES (49, 'Biological Sciences', 'Ecology', 'BIOSCI 394');
INSERT INTO `direction` VALUES (50, 'Biological Sciences', 'Ecology', 'BIOSCI 325,334,338,347,MARINE 303');
INSERT INTO `direction` VALUES (51, 'Biological Sciences', 'Ecology', 'BIOSCI 399');
INSERT INTO `direction` VALUES (52, 'Biological Sciences', 'Evolution', 'BIOSCI 101');
INSERT INTO `direction` VALUES (53, 'Biological Sciences', 'Evolution', 'BIOSCI 108');
INSERT INTO `direction` VALUES (54, 'Biological Sciences', 'Evolution', 'BIOSCI 109');
INSERT INTO `direction` VALUES (55, 'Biological Sciences', 'Evolution', 'STATS 101');
INSERT INTO `direction` VALUES (56, 'Biological Sciences', 'Evolution', 'BIOSCI 202');
INSERT INTO `direction` VALUES (57, 'Biological Sciences', 'Evolution', 'BIOSCI 210');
INSERT INTO `direction` VALUES (58, 'Biological Sciences', 'Evolution', 'BIOSCI 220');
INSERT INTO `direction` VALUES (59, 'Biological Sciences', 'Evolution', 'BIOSCI 322');
INSERT INTO `direction` VALUES (60, 'Biological Sciences', 'Evolution', 'BIOSCI 355');
INSERT INTO `direction` VALUES (61, 'Biological Sciences', 'Evolution', 'BIOSCI 395');
INSERT INTO `direction` VALUES (62, 'Biological Sciences', 'Evolution', 'BIOSCI 399');
INSERT INTO `direction` VALUES (63, 'Biological Sciences', 'Genetics', 'BIOSCI 101');
INSERT INTO `direction` VALUES (64, 'Biological Sciences', 'Genetics', 'BIOSCI 108');
INSERT INTO `direction` VALUES (65, 'Biological Sciences', 'Genetics', 'BIOSCI 109');
INSERT INTO `direction` VALUES (66, 'Biological Sciences', 'Genetics', 'STATS 101');
INSERT INTO `direction` VALUES (67, 'Biological Sciences', 'Genetics', 'CHEM 110,120,150');
INSERT INTO `direction` VALUES (68, 'Biological Sciences', 'Genetics', 'BIOSCI 201');
INSERT INTO `direction` VALUES (69, 'Biological Sciences', 'Genetics', 'BIOSCI 202');
INSERT INTO `direction` VALUES (70, 'Biological Sciences', 'Genetics', 'BIOSCI 220');
INSERT INTO `direction` VALUES (71, 'Biological Sciences', 'Genetics', 'BIOSCI 351');
INSERT INTO `direction` VALUES (72, 'Biological Sciences', 'Genetics', 'BIOSCI 355');
INSERT INTO `direction` VALUES (73, 'Biological Sciences', 'Genetics', 'BIOSCI 399');
INSERT INTO `direction` VALUES (74, 'Biological Sciences', 'Marine Biology', 'BIOSCI 101');
INSERT INTO `direction` VALUES (75, 'Biological Sciences', 'Marine Biology', 'BIOSCI 108');
INSERT INTO `direction` VALUES (76, 'Biological Sciences', 'Marine Biology', 'BIOSCI 109');
INSERT INTO `direction` VALUES (77, 'Biological Sciences', 'Marine Biology', 'STATS 101');
INSERT INTO `direction` VALUES (78, 'Biological Sciences', 'Marine Biology', 'BIOSCI 206');
INSERT INTO `direction` VALUES (79, 'Biological Sciences', 'Marine Biology', 'BIOSCI 220');
INSERT INTO `direction` VALUES (80, 'Biological Sciences', 'Marine Biology', 'BIOSCI 207,208');
INSERT INTO `direction` VALUES (81, 'Biological Sciences', 'Marine Biology', 'BIOSCI 328');
INSERT INTO `direction` VALUES (82, 'Biological Sciences', 'Marine Biology', 'BIOSCI 333');
INSERT INTO `direction` VALUES (83, 'Biological Sciences', 'Marine Biology', 'BIOSCI 334');
INSERT INTO `direction` VALUES (84, 'Biological Sciences', 'Marine Biology', 'BIOSCI 399');
INSERT INTO `direction` VALUES (85, 'Biological Sciences', 'Microbiology', 'BIOSCI 101');
INSERT INTO `direction` VALUES (86, 'Biological Sciences', 'Microbiology', 'BIOSCI 106');
INSERT INTO `direction` VALUES (87, 'Biological Sciences', 'Microbiology', 'BIOSCI 108');
INSERT INTO `direction` VALUES (88, 'Biological Sciences', 'Microbiology', 'BIOSCI 109');
INSERT INTO `direction` VALUES (89, 'Biological Sciences', 'Microbiology', 'STATS 101');
INSERT INTO `direction` VALUES (90, 'Biological Sciences', 'Microbiology', 'CHEM 110, 120, 150');
INSERT INTO `direction` VALUES (91, 'Biological Sciences', 'Microbiology', 'BIOSCI 201,202,203');
INSERT INTO `direction` VALUES (92, 'Biological Sciences', 'Microbiology', 'BIOSCI 204');
INSERT INTO `direction` VALUES (93, 'Biological Sciences', 'Microbiology', 'BIOSCI 220');
INSERT INTO `direction` VALUES (94, 'Biological Sciences', 'Microbiology', 'BIOSCI 347');
INSERT INTO `direction` VALUES (95, 'Biological Sciences', 'Microbiology', 'BIOSCI 348');
INSERT INTO `direction` VALUES (96, 'Biological Sciences', 'Microbiology', 'BIOSCI 324,329');
INSERT INTO `direction` VALUES (97, 'Biological Sciences', 'Microbiology', 'BIOSCI 399');
INSERT INTO `direction` VALUES (98, 'Biological Sciences', 'Plant Biology', 'BIOSCI 101');
INSERT INTO `direction` VALUES (99, 'Biological Sciences', 'Plant Biology', 'BIOSCI 108');
INSERT INTO `direction` VALUES (100, 'Biological Sciences', 'Plant Biology', 'BIOSCI 109');
INSERT INTO `direction` VALUES (101, 'Biological Sciences', 'Plant Biology', 'STATS 101');
INSERT INTO `direction` VALUES (102, 'Biological Sciences', 'Plant Biology', 'BIOSCI 205');
INSERT INTO `direction` VALUES (103, 'Biological Sciences', 'Plant Biology', 'BIOSCI 220');
INSERT INTO `direction` VALUES (104, 'Biological Sciences', 'Plant Biology', 'BIOSCI 202,203,204,206');
INSERT INTO `direction` VALUES (105, 'Biological Sciences', 'Plant Biology', 'BIOSCI 324');
INSERT INTO `direction` VALUES (106, 'Biological Sciences', 'Plant Biology', 'BIOSCI 325');
INSERT INTO `direction` VALUES (107, 'Biological Sciences', 'Plant Biology', 'BIOSCI 326');
INSERT INTO `direction` VALUES (108, 'Biological Sciences', 'Plant Biology', 'BIOSCI 399');
INSERT INTO `direction` VALUES (109, 'Biological Sciences', 'Zoology', 'BIOSCI 101');
INSERT INTO `direction` VALUES (110, 'Biological Sciences', 'Zoology', 'BIOSCI 108');
INSERT INTO `direction` VALUES (111, 'Biological Sciences', 'Zoology', 'BIOSCI 109');
INSERT INTO `direction` VALUES (112, 'Biological Sciences', 'Zoology', 'STATS 101');
INSERT INTO `direction` VALUES (113, 'Biological Sciences', 'Zoology', 'BIOSCI 207');
INSERT INTO `direction` VALUES (114, 'Biological Sciences', 'Zoology', 'BIOSCI 208');
INSERT INTO `direction` VALUES (115, 'Biological Sciences', 'Zoology', 'BIOSCI 210');
INSERT INTO `direction` VALUES (116, 'Biological Sciences', 'Zoology', 'BIOSCI 220');
INSERT INTO `direction` VALUES (117, 'Biological Sciences', 'Zoology', 'BIOSCI 335');
INSERT INTO `direction` VALUES (118, 'Biological Sciences', 'Zoology', 'BIOSCI 337');
INSERT INTO `direction` VALUES (119, 'Biological Sciences', 'Zoology', 'BIOSCI 334,338');
INSERT INTO `direction` VALUES (120, 'Biological Sciences', 'Zoology', 'BIOSCI 399');
INSERT INTO `direction` VALUES (121, 'Biomedical Science', 'Anatomical Imaging Science', 'BIOSCI 107');
INSERT INTO `direction` VALUES (122, 'Biomedical Science', 'Anatomical Imaging Science', 'CHEM 110');
INSERT INTO `direction` VALUES (123, 'Biomedical Science', 'Anatomical Imaging Science', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (124, 'Biomedical Science', 'Anatomical Imaging Science', 'BIOSCI 106');
INSERT INTO `direction` VALUES (125, 'Biomedical Science', 'Anatomical Imaging Science', 'PHYSICS 160');
INSERT INTO `direction` VALUES (126, 'Biomedical Science', 'Anatomical Imaging Science', 'BIOSCI 101');
INSERT INTO `direction` VALUES (127, 'Biomedical Science', 'Anatomical Imaging Science', 'MEDSCI 142');
INSERT INTO `direction` VALUES (128, 'Biomedical Science', 'Anatomical Imaging Science', 'BIOSCI 201-203');
INSERT INTO `direction` VALUES (129, 'Biomedical Science', 'Anatomical Imaging Science', 'BIOSCI 220');
INSERT INTO `direction` VALUES (130, 'Biomedical Science', 'Anatomical Imaging Science', 'MEDSCI 201');
INSERT INTO `direction` VALUES (131, 'Biomedical Science', 'Anatomical Imaging Science', 'MEDSCI 203');
INSERT INTO `direction` VALUES (132, 'Biomedical Science', 'Anatomical Imaging Science', 'MEDSCI 206');
INSERT INTO `direction` VALUES (133, 'Biomedical Science', 'Anatomical Imaging Science', 'BIOSCI 201-204,EXERCISE 206,MEDSCI 201-206');
INSERT INTO `direction` VALUES (134, 'Biomedical Science', 'Anatomical Imaging Science', 'MEDIMAGE 300');
INSERT INTO `direction` VALUES (135, 'Biomedical Science', 'Anatomical Imaging Science', 'MEDIMAGE 302');
INSERT INTO `direction` VALUES (136, 'Biomedical Science', 'Anatomical Imaging Science', 'MEDSCI 300');
INSERT INTO `direction` VALUES (137, 'Biomedical Science', 'Anatomical Imaging Science', 'BIOMED 399');
INSERT INTO `direction` VALUES (138, 'Biomedical Science', 'Anatomical Imaging Science', 'BIOMED 347-359,MEDSCI 300-320');
INSERT INTO `direction` VALUES (139, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOSCI 107');
INSERT INTO `direction` VALUES (140, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'CHEM 110');
INSERT INTO `direction` VALUES (141, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (142, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOSCI 106');
INSERT INTO `direction` VALUES (143, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'PHYSICS 160');
INSERT INTO `direction` VALUES (144, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOSCI 101');
INSERT INTO `direction` VALUES (145, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'MEDSCI 142');
INSERT INTO `direction` VALUES (146, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOSCI 201');
INSERT INTO `direction` VALUES (147, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOSCI 202');
INSERT INTO `direction` VALUES (148, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOSCI 220');
INSERT INTO `direction` VALUES (149, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'MEDSCI 203');
INSERT INTO `direction` VALUES (150, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'MEDSCI 204');
INSERT INTO `direction` VALUES (151, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOSCI 203,MEDSCI 205');
INSERT INTO `direction` VALUES (152, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOSCI 356');
INSERT INTO `direction` VALUES (153, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'MEDSCI 302');
INSERT INTO `direction` VALUES (154, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'MDDSCI 319');
INSERT INTO `direction` VALUES (155, 'Biomedical Science', 'Cancer Biology and Therapeutics', 'BIOMED 399');
INSERT INTO `direction` VALUES (156, 'Biomedical Science', 'Cardiovascular Biology', 'BIOSCI 107');
INSERT INTO `direction` VALUES (157, 'Biomedical Science', 'Cardiovascular Biology', 'CHEM 110');
INSERT INTO `direction` VALUES (158, 'Biomedical Science', 'Cardiovascular Biology', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (159, 'Biomedical Science', 'Cardiovascular Biology', 'BIOSCI 106');
INSERT INTO `direction` VALUES (160, 'Biomedical Science', 'Cardiovascular Biology', 'PHYSICS 160');
INSERT INTO `direction` VALUES (161, 'Biomedical Science', 'Cardiovascular Biology', 'BIOSCI 101');
INSERT INTO `direction` VALUES (162, 'Biomedical Science', 'Cardiovascular Biology', 'MEDSCI 142');
INSERT INTO `direction` VALUES (163, 'Biomedical Science', 'Cardiovascular Biology', 'BIOSCI 220');
INSERT INTO `direction` VALUES (164, 'Biomedical Science', 'Cardiovascular Biology', 'MEDSCI 205');
INSERT INTO `direction` VALUES (165, 'Biomedical Science', 'Cardiovascular Biology', 'MEDSCI 206');
INSERT INTO `direction` VALUES (166, 'Biomedical Science', 'Cardiovascular Biology', 'BIOSCI 201,203');
INSERT INTO `direction` VALUES (167, 'Biomedical Science', 'Cardiovascular Biology', 'BIOSCI 201,203,MEDSCI 204');
INSERT INTO `direction` VALUES (168, 'Biomedical Science', 'Cardiovascular Biology', 'BIOSCI 201-204,EXERCISE 206,MEDSCI 201-206');
INSERT INTO `direction` VALUES (169, 'Biomedical Science', 'Cardiovascular Biology', 'MEDSCI309');
INSERT INTO `direction` VALUES (170, 'Biomedical Science', 'Cardiovascular Biology', 'MEDSCI311');
INSERT INTO `direction` VALUES (171, 'Biomedical Science', 'Cardiovascular Biology', 'BIOSCI 353,MEDSCI320');
INSERT INTO `direction` VALUES (172, 'Biomedical Science', 'Cardiovascular Biology', 'BIOMED 399');
INSERT INTO `direction` VALUES (173, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 107');
INSERT INTO `direction` VALUES (174, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'CHEM 110');
INSERT INTO `direction` VALUES (175, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (176, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 106');
INSERT INTO `direction` VALUES (177, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'PHYSICS 160');
INSERT INTO `direction` VALUES (178, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 101');
INSERT INTO `direction` VALUES (179, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'MEDSCI 142');
INSERT INTO `direction` VALUES (180, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 201');
INSERT INTO `direction` VALUES (181, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 203');
INSERT INTO `direction` VALUES (182, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 220');
INSERT INTO `direction` VALUES (183, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'MEDSCI 201-206');
INSERT INTO `direction` VALUES (184, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 201-204,EXERCISE 206,MEDSCI 201-206');
INSERT INTO `direction` VALUES (185, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 350');
INSERT INTO `direction` VALUES (186, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOSCI 353');
INSERT INTO `direction` VALUES (187, 'Biomedical Science', 'Cellular and Molecular Biomedicine', 'BIOMED 399');
INSERT INTO `direction` VALUES (188, 'Biomedical Science', 'Genetics', 'BIOSCI 107');
INSERT INTO `direction` VALUES (189, 'Biomedical Science', 'Genetics', 'CHEM 110');
INSERT INTO `direction` VALUES (190, 'Biomedical Science', 'Genetics', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (191, 'Biomedical Science', 'Genetics', 'BIOSCI 106');
INSERT INTO `direction` VALUES (192, 'Biomedical Science', 'Genetics', 'PHYSICS 160');
INSERT INTO `direction` VALUES (193, 'Biomedical Science', 'Genetics', 'BIOSCI 101');
INSERT INTO `direction` VALUES (194, 'Biomedical Science', 'Genetics', 'MEDSCI 142');
INSERT INTO `direction` VALUES (195, 'Biomedical Science', 'Genetics', 'BIOSCI 201');
INSERT INTO `direction` VALUES (196, 'Biomedical Science', 'Genetics', 'BIOSCI 202');
INSERT INTO `direction` VALUES (197, 'Biomedical Science', 'Genetics', 'BIOSCI 220');
INSERT INTO `direction` VALUES (198, 'Biomedical Science', 'Genetics', 'MEDSCI 201-206');
INSERT INTO `direction` VALUES (199, 'Biomedical Science', 'Genetics', 'BIOSCI 201-204,EXERCISE 206,MEDSCI 201-206');
INSERT INTO `direction` VALUES (200, 'Biomedical Science', 'Genetics', 'BIOSCI 351');
INSERT INTO `direction` VALUES (201, 'Biomedical Science', 'Genetics', 'BIOSCI 355');
INSERT INTO `direction` VALUES (202, 'Biomedical Science', 'Genetics', 'MED 399');
INSERT INTO `direction` VALUES (203, 'Biomedical Science', 'Infection and Immunity', 'BIOSCI 107');
INSERT INTO `direction` VALUES (204, 'Biomedical Science', 'Infection and Immunity', 'CHEM 110');
INSERT INTO `direction` VALUES (205, 'Biomedical Science', 'Infection and Immunity', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (206, 'Biomedical Science', 'Infection and Immunity', 'BIOSCI 106');
INSERT INTO `direction` VALUES (207, 'Biomedical Science', 'Infection and Immunity', 'PHYSICS 160');
INSERT INTO `direction` VALUES (208, 'Biomedical Science', 'Infection and Immunity', 'BIOSCI 101');
INSERT INTO `direction` VALUES (209, 'Biomedical Science', 'Infection and Immunity', 'MEDSCI 142');
INSERT INTO `direction` VALUES (210, 'Biomedical Science', 'Infection and Immunity', 'BIOSCI 201');
INSERT INTO `direction` VALUES (211, 'Biomedical Science', 'Infection and Immunity', 'BIOSCI 220');
INSERT INTO `direction` VALUES (212, 'Biomedical Science', 'Infection and Immunity', 'MEDSCI 202');
INSERT INTO `direction` VALUES (213, 'Biomedical Science', 'Infection and Immunity', 'MEDSCI 203');
INSERT INTO `direction` VALUES (214, 'Biomedical Science', 'Infection and Immunity', 'BIOSCI 201-204,EXERCISE 206,MEDSCI 201-206');
INSERT INTO `direction` VALUES (215, 'Biomedical Science', 'Infection and Immunity', 'BIOSCI 349');
INSERT INTO `direction` VALUES (216, 'Biomedical Science', 'Infection and Immunity', 'MEDSCI 301');
INSERT INTO `direction` VALUES (217, 'Biomedical Science', 'Infection and Immunity', 'MEDSCI 314');
INSERT INTO `direction` VALUES (218, 'Biomedical Science', 'Infection and Immunity', 'BIOMED 399');
INSERT INTO `direction` VALUES (219, 'Biomedical Science', 'Neuroscience', 'BIOSCI 107');
INSERT INTO `direction` VALUES (220, 'Biomedical Science', 'Neuroscience', 'CHEM 110');
INSERT INTO `direction` VALUES (221, 'Biomedical Science', 'Neuroscience', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (222, 'Biomedical Science', 'Neuroscience', 'BIOSCI 106');
INSERT INTO `direction` VALUES (223, 'Biomedical Science', 'Neuroscience', 'PHYSICS 160');
INSERT INTO `direction` VALUES (224, 'Biomedical Science', 'Neuroscience', 'BIOSCI 101');
INSERT INTO `direction` VALUES (225, 'Biomedical Science', 'Neuroscience', 'MEDSCI 142');
INSERT INTO `direction` VALUES (226, 'Biomedical Science', 'Neuroscience', 'BIOSCI 220');
INSERT INTO `direction` VALUES (227, 'Biomedical Science', 'Neuroscience', 'MEDSCI 201');
INSERT INTO `direction` VALUES (228, 'Biomedical Science', 'Neuroscience', 'MEDSCI 204');
INSERT INTO `direction` VALUES (229, 'Biomedical Science', 'Neuroscience', 'MEDSCI 205');
INSERT INTO `direction` VALUES (230, 'Biomedical Science', 'Neuroscience', 'MEDSCI 206');
INSERT INTO `direction` VALUES (231, 'Biomedical Science', 'Neuroscience', 'BIOSCI 201-203');
INSERT INTO `direction` VALUES (232, 'Biomedical Science', 'Neuroscience', 'MEDSCI 317');
INSERT INTO `direction` VALUES (233, 'Biomedical Science', 'Neuroscience', 'MEDSCI 320');
INSERT INTO `direction` VALUES (234, 'Biomedical Science', 'Neuroscience', 'MEDSCI 309,316');
INSERT INTO `direction` VALUES (235, 'Biomedical Science', 'Neuroscience', 'BIOMED 399');
INSERT INTO `direction` VALUES (236, 'Biomedical Science', 'Nutrition and Metabolism', 'BIOSCI 107');
INSERT INTO `direction` VALUES (237, 'Biomedical Science', 'Nutrition and Metabolism', 'CHEM 110');
INSERT INTO `direction` VALUES (238, 'Biomedical Science', 'Nutrition and Metabolism', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (239, 'Biomedical Science', 'Nutrition and Metabolism', 'BIOSCI 106');
INSERT INTO `direction` VALUES (240, 'Biomedical Science', 'Nutrition and Metabolism', 'PHYSICS 160');
INSERT INTO `direction` VALUES (241, 'Biomedical Science', 'Nutrition and Metabolism', 'BIOSCI 101');
INSERT INTO `direction` VALUES (242, 'Biomedical Science', 'Nutrition and Metabolism', 'MEDSCI 142');
INSERT INTO `direction` VALUES (243, 'Biomedical Science', 'Nutrition and Metabolism', 'BIOSCI 202');
INSERT INTO `direction` VALUES (244, 'Biomedical Science', 'Nutrition and Metabolism', 'BIOSCI 203');
INSERT INTO `direction` VALUES (245, 'Biomedical Science', 'Nutrition and Metabolism', 'BIOSCI 220');
INSERT INTO `direction` VALUES (246, 'Biomedical Science', 'Nutrition and Metabolism', 'EXERCISE 206');
INSERT INTO `direction` VALUES (247, 'Biomedical Science', 'Nutrition and Metabolism', 'MEDSCI 203');
INSERT INTO `direction` VALUES (248, 'Biomedical Science', 'Nutrition and Metabolism', 'MEDSCI 205');
INSERT INTO `direction` VALUES (249, 'Biomedical Science', 'Nutrition and Metabolism', 'BIOSCI 358');
INSERT INTO `direction` VALUES (250, 'Biomedical Science', 'Nutrition and Metabolism', 'MEDSCI 312');
INSERT INTO `direction` VALUES (251, 'Biomedical Science', 'Nutrition and Metabolism', 'MEDSCI 315');
INSERT INTO `direction` VALUES (252, 'Biomedical Science', 'Nutrition and Metabolism', 'BIOMED 399');
INSERT INTO `direction` VALUES (253, 'Biomedical Science', 'Reproduction and Development', 'BIOSCI 107');
INSERT INTO `direction` VALUES (254, 'Biomedical Science', 'Reproduction and Development', 'CHEM 110');
INSERT INTO `direction` VALUES (255, 'Biomedical Science', 'Reproduction and Development', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (256, 'Biomedical Science', 'Reproduction and Development', 'BIOSCI 106');
INSERT INTO `direction` VALUES (257, 'Biomedical Science', 'Reproduction and Development', 'PHYSICS 160');
INSERT INTO `direction` VALUES (258, 'Biomedical Science', 'Reproduction and Development', 'BIOSCI 101');
INSERT INTO `direction` VALUES (259, 'Biomedical Science', 'Reproduction and Development', 'MEDSCI 142');
INSERT INTO `direction` VALUES (260, 'Biomedical Science', 'Reproduction and Development', 'BIOSCI 201');
INSERT INTO `direction` VALUES (261, 'Biomedical Science', 'Reproduction and Development', 'BIOSCI 202');
INSERT INTO `direction` VALUES (262, 'Biomedical Science', 'Reproduction and Development', 'BIOSCI 203');
INSERT INTO `direction` VALUES (263, 'Biomedical Science', 'Reproduction and Development', 'BIOSCI 220');
INSERT INTO `direction` VALUES (264, 'Biomedical Science', 'Reproduction and Development', 'MEDSCI 201');
INSERT INTO `direction` VALUES (265, 'Biomedical Science', 'Reproduction and Development', 'MEDSCI 205');
INSERT INTO `direction` VALUES (266, 'Biomedical Science', 'Reproduction and Development', 'BIOSCI 356');
INSERT INTO `direction` VALUES (267, 'Biomedical Science', 'Reproduction and Development', 'MEDSCI 312');
INSERT INTO `direction` VALUES (268, 'Biomedical Science', 'Reproduction and Development', 'MEDSCI 313');
INSERT INTO `direction` VALUES (269, 'Biomedical Science', 'Reproduction and Development', 'BIOMED 399');
INSERT INTO `direction` VALUES (270, 'Biomedical Science', 'Biomedical Science(Bsc)', 'BIOSCI 107');
INSERT INTO `direction` VALUES (271, 'Biomedical Science', 'Biomedical Science(Bsc)', 'CHEM 110');
INSERT INTO `direction` VALUES (272, 'Biomedical Science', 'Biomedical Science(Bsc)', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (273, 'Biomedical Science', 'Biomedical Science(Bsc)', 'BIOSCI 106');
INSERT INTO `direction` VALUES (274, 'Biomedical Science', 'Biomedical Science(Bsc)', 'PHYSICS 160');
INSERT INTO `direction` VALUES (275, 'Biomedical Science', 'Biomedical Science(Bsc)', 'BIOSCI 101');
INSERT INTO `direction` VALUES (276, 'Biomedical Science', 'Biomedical Science(Bsc)', 'MEDSCI 142');
INSERT INTO `direction` VALUES (277, 'Biomedical Science', 'Biomedical Science(Bsc)', 'BIOSCI 201-203');
INSERT INTO `direction` VALUES (278, 'Biomedical Science', 'Biomedical Science(Bsc)', 'MEDSCI 201-206');
INSERT INTO `direction` VALUES (279, 'Biomedical Science', 'Biomedical Science(Bsc)', 'BIOSCI 201-204,EXERCISE 206,MEDSCI 201-206');
INSERT INTO `direction` VALUES (280, 'Biomedical Science', 'Biomedical Science(Bsc)', 'BIOSCI 220');
INSERT INTO `direction` VALUES (281, 'Biomedical Science', 'Biomedical Science(Bsc)', 'BIOMED 399');
INSERT INTO `direction` VALUES (282, 'Chemistry', 'Chemistry(BSc)', 'CHEM 110');
INSERT INTO `direction` VALUES (283, 'Chemistry', 'Chemistry(BSc)', 'CHEM 120');
INSERT INTO `direction` VALUES (284, 'Chemistry', 'Chemistry(BSc)', 'MATHS 108, 110, 130, PHYSICS 120');
INSERT INTO `direction` VALUES (285, 'Chemistry', 'Chemistry(BSc)', 'CHEM 251');
INSERT INTO `direction` VALUES (286, 'Chemistry', 'Chemistry(BSc)', 'CHEM 252');
INSERT INTO `direction` VALUES (287, 'Chemistry', 'Chemistry(BSc)', 'CHEM 253');
INSERT INTO `direction` VALUES (288, 'Chemistry', 'Chemistry(BSc)', 'CHEM 351');
INSERT INTO `direction` VALUES (289, 'Chemistry', 'Chemistry(BSc)', 'CHEM 310, 320, 330, 340, 360, 380, 390');
INSERT INTO `direction` VALUES (290, 'Chemistry', 'Chemistry(BSc)', 'CHEM 399');
INSERT INTO `direction` VALUES (291, 'Computer Science', 'Computer Science(BSc)', 'COMPSCI 110');
INSERT INTO `direction` VALUES (292, 'Computer Science', 'Computer Science(BSc)', 'COMPSCI 120');
INSERT INTO `direction` VALUES (293, 'Computer Science', 'Computer Science(BSc)', 'COMPSCI 130');
INSERT INTO `direction` VALUES (294, 'Computer Science', 'Computer Science(BSc)', 'COMPSCI 210');
INSERT INTO `direction` VALUES (295, 'Computer Science', 'Computer Science(BSc)', 'COMPSCI 220');
INSERT INTO `direction` VALUES (296, 'Computer Science', 'Computer Science(BSc)', 'COMPSCI 230');
INSERT INTO `direction` VALUES (297, 'Computer Science', 'Computer Science(BSc)', 'COMPSCI 300–379');
INSERT INTO `direction` VALUES (298, 'Computer Science', 'Computer Science(BSc)', 'COMPSCI 399');
INSERT INTO `direction` VALUES (299, 'Data Science', 'Data Science(BSc)', 'COMPSCI 120');
INSERT INTO `direction` VALUES (300, 'Data Science', 'Data Science(BSc)', 'COMPSCI 130');
INSERT INTO `direction` VALUES (301, 'Data Science', 'Data Science(BSc)', 'STATS 101');
INSERT INTO `direction` VALUES (302, 'Data Science', 'Data Science(BSc)', 'STATS 125');
INSERT INTO `direction` VALUES (303, 'Data Science', 'Data Science(BSc)', 'MATHS Elective');
INSERT INTO `direction` VALUES (304, 'Data Science', 'Data Science(BSc)', 'COMPSCI 220');
INSERT INTO `direction` VALUES (305, 'Data Science', 'Data Science(BSc)', 'COMPSCI 225');
INSERT INTO `direction` VALUES (306, 'Data Science', 'Data Science(BSc)', 'MATHS 208 or 250');
INSERT INTO `direction` VALUES (307, 'Data Science', 'Data Science(BSc)', 'STATS 201');
INSERT INTO `direction` VALUES (308, 'Data Science', 'Data Science(BSc)', 'STATS 210 or 225');
INSERT INTO `direction` VALUES (309, 'Data Science', 'Data Science(BSc)', 'STATS 220');
INSERT INTO `direction` VALUES (310, 'Data Science', 'Data Science(BSc)', 'COMPSCI 320');
INSERT INTO `direction` VALUES (311, 'Data Science', 'Data Science(BSc)', 'COMPSCI 351');
INSERT INTO `direction` VALUES (312, 'Data Science', 'Data Science(BSc)', 'COMPSCI 367 or 361');
INSERT INTO `direction` VALUES (313, 'Data Science', 'Data Science(BSc)', 'STATS 330');
INSERT INTO `direction` VALUES (314, 'Data Science', 'Data Science(BSc)', 'STATS 369');
INSERT INTO `direction` VALUES (315, 'Data Science', 'Data Science(BSc)', 'STATS 380');
INSERT INTO `direction` VALUES (316, 'Data Science', 'Data Science(BSc)', 'COMPSCI 399, DATASCI 399, STATS 399');
INSERT INTO `direction` VALUES (317, 'Earth Science', 'Earth Sciences(BSc)', 'EARTHSCI 120');
INSERT INTO `direction` VALUES (318, 'Earth Science', 'Earth Sciences(BSc)', 'GEOG 101');
INSERT INTO `direction` VALUES (319, 'Earth Science', 'Earth Sciences(BSc)', 'EARTHSCI 220');
INSERT INTO `direction` VALUES (320, 'Earth Science', 'Earth Sciences(BSc)', 'EARTHSCI 202, 203, 208, 261, 262');
INSERT INTO `direction` VALUES (321, 'Earth Science', 'Earth Sciences(BSc)', 'ARTHSCI 320');
INSERT INTO `direction` VALUES (322, 'Earth Science', 'Earth Sciences(BSc)', 'EARTHSCI 399');
INSERT INTO `direction` VALUES (323, 'Environmental Physics', 'Environmental Physics(BSc)', 'ENVPHYS 100');
INSERT INTO `direction` VALUES (324, 'Environmental Physics', 'Environmental Physics(BSc)', 'PHYSICS 120 or 160');
INSERT INTO `direction` VALUES (325, 'Environmental Physics', 'Environmental Physics(BSc)', 'MATHS 253, 260');
INSERT INTO `direction` VALUES (326, 'Environmental Physics', 'Environmental Physics(BSc)', 'ENVPHYS 200');
INSERT INTO `direction` VALUES (327, 'Environmental Physics', 'Environmental Physics(BSc)', 'PHYSICS 201');
INSERT INTO `direction` VALUES (328, 'Environmental Physics', 'Environmental Physics(BSc)', 'EARTHSCI 361 or PHYSICS 332');
INSERT INTO `direction` VALUES (329, 'Environmental Physics', 'Environmental Physics(BSc)', 'ENVPHYS 300');
INSERT INTO `direction` VALUES (330, 'Environmental Science', 'Environmental Science(BSc)', 'ENVSCI 101');
INSERT INTO `direction` VALUES (331, 'Environmental Science', 'Environmental Science(BSc)', 'STATS 101 or 108');
INSERT INTO `direction` VALUES (332, 'Environmental Science', 'Environmental Science(BSc)', 'ENVSCI 201');
INSERT INTO `direction` VALUES (333, 'Environmental Science', 'Environmental Science(BSc)', 'ENVSCI 203');
INSERT INTO `direction` VALUES (334, 'Environmental Science', 'Environmental Science(BSc)', 'ENVSCI 301');
INSERT INTO `direction` VALUES (335, 'Environmental Science', 'Environmental Science(BSc)', 'ENVSCI 303');
INSERT INTO `direction` VALUES (336, 'Exercise Sciences', 'Exercise Sciences(BSc)', 'EXERSCI 101');
INSERT INTO `direction` VALUES (337, 'Exercise Sciences', 'Exercise Sciences(BSc)', 'EXERSCI 103');
INSERT INTO `direction` VALUES (338, 'Exercise Sciences', 'Exercise Sciences(BSc)', 'EXERSCI 105');
INSERT INTO `direction` VALUES (339, 'Exercise Sciences', 'Exercise Sciences(BSc)', 'EXERSCI 201, 203, 205, or 207');
INSERT INTO `direction` VALUES (340, 'Exercise Sciences', 'Exercise Sciences(BSc)', 'EXERSCI 301, 303, 304, 305, or 307');
INSERT INTO `direction` VALUES (341, 'Exercise Sciences', 'Exercise Sciences(BSc)', 'EXERSCI 399');
INSERT INTO `direction` VALUES (342, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 101');
INSERT INTO `direction` VALUES (343, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 103');
INSERT INTO `direction` VALUES (344, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 105');
INSERT INTO `direction` VALUES (345, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 201');
INSERT INTO `direction` VALUES (346, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 203');
INSERT INTO `direction` VALUES (347, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 205');
INSERT INTO `direction` VALUES (348, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 206');
INSERT INTO `direction` VALUES (349, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 207');
INSERT INTO `direction` VALUES (350, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 271');
INSERT INTO `direction` VALUES (351, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 301');
INSERT INTO `direction` VALUES (352, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 303');
INSERT INTO `direction` VALUES (353, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 305');
INSERT INTO `direction` VALUES (354, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 307');
INSERT INTO `direction` VALUES (355, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 371');
INSERT INTO `direction` VALUES (356, 'Exercise Sciences', 'Applied Exercise and Sport Sciences', 'EXERSCI 399');
INSERT INTO `direction` VALUES (357, 'Food Science', 'Food Science', 'BIOSCI 101');
INSERT INTO `direction` VALUES (358, 'Food Science', 'Food Science', 'BIOSCI 106');
INSERT INTO `direction` VALUES (359, 'Food Science', 'Food Science', 'CHEM 110');
INSERT INTO `direction` VALUES (360, 'Food Science', 'Food Science', 'CHEM 120');
INSERT INTO `direction` VALUES (361, 'Food Science', 'Food Science', 'FOODSCI 100');
INSERT INTO `direction` VALUES (362, 'Food Science', 'Food Science', 'MATHS 110');
INSERT INTO `direction` VALUES (363, 'Food Science', 'Food Science', 'STATS 108');
INSERT INTO `direction` VALUES (364, 'Food Science', 'Food Science', 'BIOSCI 203');
INSERT INTO `direction` VALUES (365, 'Food Science', 'Food Science', 'BIOSCI 204');
INSERT INTO `direction` VALUES (366, 'Food Science', 'Food Science', 'FOODSCI 200');
INSERT INTO `direction` VALUES (367, 'Food Science', 'Food Science', 'FOODSCI 202');
INSERT INTO `direction` VALUES (368, 'Food Science', 'Food Science', 'BIOSCI 348');
INSERT INTO `direction` VALUES (369, 'Food Science', 'Food Science', 'FOODSCI 301');
INSERT INTO `direction` VALUES (370, 'Food Science', 'Food Science', 'FOODSCI 306');
INSERT INTO `direction` VALUES (371, 'Food Science', 'Food Science', 'FOODSCI 310');
INSERT INTO `direction` VALUES (372, 'Food Science', 'Food Science', 'FOODSCI 399');
INSERT INTO `direction` VALUES (373, 'Food Science', 'Nutrition', 'BIOSCI 101');
INSERT INTO `direction` VALUES (374, 'Food Science', 'Nutrition', 'BIOSCI 106');
INSERT INTO `direction` VALUES (375, 'Food Science', 'Nutrition', 'BIOSCI 107');
INSERT INTO `direction` VALUES (376, 'Food Science', 'Nutrition', 'CHEM 110');
INSERT INTO `direction` VALUES (377, 'Food Science', 'Nutrition', 'FOODSCI 100');
INSERT INTO `direction` VALUES (378, 'Food Science', 'Nutrition', 'MEDSCI 142');
INSERT INTO `direction` VALUES (379, 'Food Science', 'Nutrition', 'POPLHLTH 111');
INSERT INTO `direction` VALUES (380, 'Food Science', 'Nutrition', 'STATS 108');
INSERT INTO `direction` VALUES (381, 'Food Science', 'Nutrition', 'BIOSCI 202');
INSERT INTO `direction` VALUES (382, 'Food Science', 'Nutrition', 'BIOSCI 203');
INSERT INTO `direction` VALUES (383, 'Food Science', 'Nutrition', 'EXERSCI 206');
INSERT INTO `direction` VALUES (384, 'Food Science', 'Nutrition', 'FOODSCI 200');
INSERT INTO `direction` VALUES (385, 'Food Science', 'Nutrition', 'MEDSCI 203');
INSERT INTO `direction` VALUES (386, 'Food Science', 'Nutrition', 'MEDSCI 205');
INSERT INTO `direction` VALUES (387, 'Food Science', 'Nutrition', 'BIOSCI 358');
INSERT INTO `direction` VALUES (388, 'Food Science', 'Nutrition', 'FOODSCI 310');
INSERT INTO `direction` VALUES (389, 'Food Science', 'Nutrition', 'MEDSCI 315');
INSERT INTO `direction` VALUES (390, 'Food Science', 'Nutrition', 'POPLHLTH 305');
INSERT INTO `direction` VALUES (391, 'Food Science', 'Nutrition', 'FOODSCI 301, MEDSCI 301, 312');
INSERT INTO `direction` VALUES (392, 'Food Science', 'Nutrition', 'FOODSCI 399');
INSERT INTO `direction` VALUES (393, 'Geographic Information Science', 'Geographic Information Science (Bsc)', 'COMPSCI 130, STATS 101, 108, URBPLAN 125');
INSERT INTO `direction` VALUES (394, 'Geographic Information Science', 'Geographic Information Science (Bsc)', 'COMPSCI 130, GEOG 101–140, STATS 101, URBPLAN 103');
INSERT INTO `direction` VALUES (395, 'Geographic Information Science', 'Geographic Information Science (Bsc)', 'BIOSCI 220, COMPSCI 230, ENVSCI 203, STATS 201,220, URBPLAN 203, 205');
INSERT INTO `direction` VALUES (396, 'Geographic Information Science', 'Geographic Information Science (Bsc)', 'GISCI 241');
INSERT INTO `direction` VALUES (397, 'Geographic Information Science', 'Geographic Information Science (Bsc)', 'GISCI 242');
INSERT INTO `direction` VALUES (398, 'Geographic Information Science', 'Geographic Information Science (Bsc)', 'GEOG 342, GISCI 341, 343, 344');
INSERT INTO `direction` VALUES (399, 'Geographic Information Science', 'Geographic Information Science (Bsc)', 'COMPSCI 313–373, GEOG 342, GISCI 341, 343, 390, SCIGEN 301, STATS 301– 389');
INSERT INTO `direction` VALUES (400, 'Geographic Information Science', 'Geographic Information Science (Bsc)', 'GISCI 399');
INSERT INTO `direction` VALUES (401, 'Geography', 'Geography (Bsc)', 'GEOG 101');
INSERT INTO `direction` VALUES (402, 'Geography', 'Geography (Bsc)', 'GEOG 102');
INSERT INTO `direction` VALUES (403, 'Geography', 'Geography (Bsc)', 'GEOG 250');
INSERT INTO `direction` VALUES (404, 'Geography', 'Geography (Bsc)', 'GEOG 202, 205, 261, 262');
INSERT INTO `direction` VALUES (405, 'Geography', 'Geography (Bsc)', 'GEOG 202, 205, 261, 262, GISCI 241, 242');
INSERT INTO `direction` VALUES (406, 'Geography', 'Geography (Bsc)', 'GEOG 302–390, GISCI 341–344');
INSERT INTO `direction` VALUES (407, 'Geography', 'Geography (Bsc)', 'GEOG 399');
INSERT INTO `direction` VALUES (408, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'BIOSCI 106');
INSERT INTO `direction` VALUES (409, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 110');
INSERT INTO `direction` VALUES (410, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 120');
INSERT INTO `direction` VALUES (411, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'ENVSCI 101');
INSERT INTO `direction` VALUES (412, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'PHYSICS 160');
INSERT INTO `direction` VALUES (413, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'MATHS 108, 110, 120, 130, STATS 101, 108');
INSERT INTO `direction` VALUES (414, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'BIOSCI 101, 109, EARTHSCI 120, GEOG 101, MEDSCI 142, SCIGEN 101, SUSTAIN 100');
INSERT INTO `direction` VALUES (415, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 251');
INSERT INTO `direction` VALUES (416, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 252');
INSERT INTO `direction` VALUES (417, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 253');
INSERT INTO `direction` VALUES (418, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 260');
INSERT INTO `direction` VALUES (419, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'ENVSCI 201');
INSERT INTO `direction` VALUES (420, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'BIOSCI 203, 204, 206, EARTHSCI 261, GEOPHYS 213, MEDSCI 204, SCIGEN 201, SUSTAIN 200');
INSERT INTO `direction` VALUES (421, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 351');
INSERT INTO `direction` VALUES (422, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 360');
INSERT INTO `direction` VALUES (423, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'ENVSCI 301');
INSERT INTO `direction` VALUES (424, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 310, 320, 330, 340, 380, 390, SUSTAIN 300');
INSERT INTO `direction` VALUES (425, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'BIOSCI 333, 347, ENVSCI 303, MARINE 303, SCIGEN 301');
INSERT INTO `direction` VALUES (426, 'Green Chemical Science', 'Green Chemical Science (Bsc)', 'CHEM 397');
INSERT INTO `direction` VALUES (427, 'Information System', 'Information and Technology Management (Bsc)', 'COMPSCI 101 or 130');
INSERT INTO `direction` VALUES (428, 'Information System', 'Information and Technology Management (Bsc)', 'INFOMGMT 192');
INSERT INTO `direction` VALUES (429, 'Information System', 'Information and Technology Management (Bsc)', 'INFOSYS 110');
INSERT INTO `direction` VALUES (430, 'Information System', 'Information and Technology Management (Bsc)', 'BUSAN 201, COMPSCI 230 or INFOSYS 220');
INSERT INTO `direction` VALUES (431, 'Information System', 'Information and Technology Management (Bsc)', 'COMPSCI 215, INFOSYS 221, INNOVENT 203, OPSMGT258, SCIGEN 201');
INSERT INTO `direction` VALUES (432, 'Information System', 'Information and Technology Management (Bsc)', 'BUSAN 300–302, 305, COMPSCI 345, INFOSYS 300, 302–306, 321, 341, OPSMGT 357');
INSERT INTO `direction` VALUES (433, 'Logic and Computation', 'Logic and Computation (Bsc)', 'COMPSCI 120');
INSERT INTO `direction` VALUES (434, 'Logic and Computation', 'Logic and Computation (Bsc)', 'PHIL 101');
INSERT INTO `direction` VALUES (435, 'Logic and Computation', 'Logic and Computation (Bsc)', 'COMPSCI 130, LINGUIST 100, PHIL 105');
INSERT INTO `direction` VALUES (436, 'Logic and Computation', 'Logic and Computation (Bsc)', 'COMPSCI 101 (reccom)');
INSERT INTO `direction` VALUES (437, 'Logic and Computation', 'Logic and Computation (Bsc)', 'COMPSCI 220, LINGUIST 200, PHIL 216');
INSERT INTO `direction` VALUES (438, 'Logic and Computation', 'Logic and Computation (Bsc)', 'COMPSCI 225, MATHS 254, 255');
INSERT INTO `direction` VALUES (439, 'Logic and Computation', 'Logic and Computation (Bsc)', 'PHIL 222');
INSERT INTO `direction` VALUES (440, 'Logic and Computation', 'Logic and Computation (Bsc)', 'COMPSCI 350');
INSERT INTO `direction` VALUES (441, 'Logic and Computation', 'Logic and Computation (Bsc)', 'PHIL 315');
INSERT INTO `direction` VALUES (442, 'Logic and Computation', 'Logic and Computation (Bsc)', 'COMPSCI 320, 367, LINGUIST 300, LOGICOMP 301, MATHS 315, PHIL 306, 322, 323');
INSERT INTO `direction` VALUES (443, 'Marine', 'Marine Science (Bsc)', 'MARINE 100');
INSERT INTO `direction` VALUES (444, 'Marine', 'Marine Science (Bsc)', 'STATS 101');
INSERT INTO `direction` VALUES (445, 'Marine', 'Marine Science (Bsc)', 'BIOSCI 108 or 109');
INSERT INTO `direction` VALUES (446, 'Marine', 'Marine Science (Bsc)', 'GEOG 101* or 103');
INSERT INTO `direction` VALUES (447, 'Marine', 'Marine Science (Bsc)', 'MARINE 202');
INSERT INTO `direction` VALUES (448, 'Marine', 'Marine Science (Bsc)', 'BIOSCI 220, ENVSCI 203, STATS 201');
INSERT INTO `direction` VALUES (449, 'Marine', 'Marine Science (Bsc)', 'BIOSCI 206, 208, GEOG 262, GISCI 241');
INSERT INTO `direction` VALUES (450, 'Marine', 'Marine Science (Bsc)', 'MARINE 302');
INSERT INTO `direction` VALUES (451, 'Marine', 'Marine Science (Bsc)', 'BIOSCI 328, 333, 334, EARTHSCI 303, GEOG 351, MARINE 303, 305, 306');
INSERT INTO `direction` VALUES (452, 'Marine', 'Marine Science (Bsc)', 'MARINE 399');
INSERT INTO `direction` VALUES (453, 'Mathematics', 'Pure Mathematics', 'MATHS 120, 130, 162, 199');
INSERT INTO `direction` VALUES (454, 'Mathematics', 'Pure Mathematics', 'MATHS 250, 253, 254, 255');
INSERT INTO `direction` VALUES (455, 'Mathematics', 'Pure Mathematics', 'MATHS 320');
INSERT INTO `direction` VALUES (456, 'Mathematics', 'Pure Mathematics', 'MATHS 332');
INSERT INTO `direction` VALUES (457, 'Mathematics', 'Pure Mathematics', 'MATHS 315, 326, 328, 333, 340');
INSERT INTO `direction` VALUES (458, 'Mathematics', 'Pure Mathematics', 'MATHS 399');
INSERT INTO `direction` VALUES (459, 'Mathematics', 'Applied Mathematics', 'MATHS 120, 130, 162, 199');
INSERT INTO `direction` VALUES (460, 'Mathematics', 'Applied Mathematics', 'MATHS 250');
INSERT INTO `direction` VALUES (461, 'Mathematics', 'Applied Mathematics', 'MATHS 260');
INSERT INTO `direction` VALUES (462, 'Mathematics', 'Applied Mathematics', 'MATHS 270');
INSERT INTO `direction` VALUES (463, 'Mathematics', 'Applied Mathematics', 'MATHS 340');
INSERT INTO `direction` VALUES (464, 'Mathematics', 'Applied Mathematics', 'MATHS 361');
INSERT INTO `direction` VALUES (465, 'Mathematics', 'Applied Mathematics', 'MATHS 362 or 363');
INSERT INTO `direction` VALUES (466, 'Mathematics', 'Applied Mathematics', 'MATHS 399');
INSERT INTO `direction` VALUES (467, 'Mathematics', 'Mathematics (Bsc)', 'MATHS 120, 130, 162, 199');
INSERT INTO `direction` VALUES (468, 'Mathematics', 'Mathematics (Bsc)', 'MATHS 250');
INSERT INTO `direction` VALUES (469, 'Mathematics', 'Mathematics (Bsc)', 'MATHS 253, 254, 255, 260, 270');
INSERT INTO `direction` VALUES (470, 'Mathematics', 'Mathematics (Bsc)', 'MATHS 302–363');
INSERT INTO `direction` VALUES (471, 'Mathematics', 'Mathematics (Bsc)', 'MATHS 399');
INSERT INTO `direction` VALUES (472, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'BIOSCI 101');
INSERT INTO `direction` VALUES (473, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'BIOSCI 106');
INSERT INTO `direction` VALUES (474, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'BIOSCI 107');
INSERT INTO `direction` VALUES (475, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'CHEM 110');
INSERT INTO `direction` VALUES (476, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'CHEM 120');
INSERT INTO `direction` VALUES (477, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'MEDSCI 142');
INSERT INTO `direction` VALUES (478, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'MATHS 108, 110, 130, PHYSICS 120, 160, STATS 101');
INSERT INTO `direction` VALUES (479, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'BIOSCI 201');
INSERT INTO `direction` VALUES (480, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'BIOSCI 203');
INSERT INTO `direction` VALUES (481, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'CHEM 251');
INSERT INTO `direction` VALUES (482, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'CHEM 253');
INSERT INTO `direction` VALUES (483, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'MEDSCI 204');
INSERT INTO `direction` VALUES (484, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'MEDSCI 205');
INSERT INTO `direction` VALUES (485, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'BIOSCI 202, 204, CHEM 252, 260, MEDSCI 202, 203');
INSERT INTO `direction` VALUES (486, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'CHEM 330');
INSERT INTO `direction` VALUES (487, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'CHEM 390');
INSERT INTO `direction` VALUES (488, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'CHEM 392');
INSERT INTO `direction` VALUES (489, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'MEDSCI 318');
INSERT INTO `direction` VALUES (490, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'BIOSCI 349, 351, 353, 355, 356, CHEM 320, 340, 351, 360, MEDSCI 319, 320');
INSERT INTO `direction` VALUES (491, 'Medicinal Chemistry', 'Medicinal Chemistry (Bsc)', 'CHEM 398');
INSERT INTO `direction` VALUES (492, 'Pharmacology', 'Pharmacology (Bsc)', 'CHEM 110');
INSERT INTO `direction` VALUES (493, 'Pharmacology', 'Pharmacology (Bsc)', 'BIOSCI 107');
INSERT INTO `direction` VALUES (494, 'Pharmacology', 'Pharmacology (Bsc)', 'MEDSCI 142');
INSERT INTO `direction` VALUES (495, 'Pharmacology', 'Pharmacology (Bsc)', 'BIOSCI 101 (recomm)');
INSERT INTO `direction` VALUES (496, 'Pharmacology', 'Pharmacology (Bsc)', 'BIOSCI 106 (reccom)');
INSERT INTO `direction` VALUES (497, 'Pharmacology', 'Pharmacology (Bsc)', 'BIOSCI 203, MEDSCI 203 or 205');
INSERT INTO `direction` VALUES (498, 'Pharmacology', 'Pharmacology (Bsc)', 'MEDSCI 204');
INSERT INTO `direction` VALUES (499, 'Pharmacology', 'Pharmacology (Bsc)', 'MEDSCI 318');
INSERT INTO `direction` VALUES (500, 'Pharmacology', 'Pharmacology (Bsc)', 'MEDSCI 319');
INSERT INTO `direction` VALUES (501, 'Pharmacology', 'Pharmacology (Bsc)', 'MEDSCI 320');
INSERT INTO `direction` VALUES (502, 'Pharmacology', 'Pharmacology (Bsc)', 'PHARMCOL 399');
INSERT INTO `direction` VALUES (503, 'Physics', 'Physics (Bsc)', 'PHYSICS 120 or 160');
INSERT INTO `direction` VALUES (504, 'Physics', 'Physics (Bsc)', 'PHYSICS 121');
INSERT INTO `direction` VALUES (505, 'Physics', 'Physics (Bsc)', 'Stage I Elective: either 30 pts: MATHS 108, 110, 208 or 45 pts: 120, 130, 250');
INSERT INTO `direction` VALUES (506, 'Physics', 'Physics (Bsc)', 'Stage I Elective: either 30 pts: MATHS 108, 110, 208 or 45 pts: 120, 130, 250 / Any stage science');
INSERT INTO `direction` VALUES (507, 'Physics', 'Physics (Bsc)', 'MATHS 253 or 260');
INSERT INTO `direction` VALUES (508, 'Physics', 'Physics (Bsc)', 'PHYSICS 201');
INSERT INTO `direction` VALUES (509, 'Physics', 'Physics (Bsc)', 'PHYSICS 202');
INSERT INTO `direction` VALUES (510, 'Physics', 'Physics (Bsc)', 'PHYSICS 203');
INSERT INTO `direction` VALUES (511, 'Physics', 'Physics (Bsc)', 'ELECTENG 303, 331, MEDSCI 309, PHYSICS 331–335, 340, 356, 371, 390');
INSERT INTO `direction` VALUES (512, 'Physics', 'Physics (Bsc)', 'PHYSICS 331–335, 340, 356, 390');
INSERT INTO `direction` VALUES (513, 'Physics', 'Physics (Bsc)', 'PHYSICS 399');
INSERT INTO `direction` VALUES (514, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 120 or 160');
INSERT INTO `direction` VALUES (515, 'Physics', 'Medical Physics and Imaging Technology', 'BIOSCI 107');
INSERT INTO `direction` VALUES (516, 'Physics', 'Medical Physics and Imaging Technology', 'MEDSCI 142');
INSERT INTO `direction` VALUES (517, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 121');
INSERT INTO `direction` VALUES (518, 'Physics', 'Medical Physics and Imaging Technology', 'Stage I Elective: either 30 pts: MATHS 108, 110, 208 or 45 pts: 120, 130, 250');
INSERT INTO `direction` VALUES (519, 'Physics', 'Medical Physics and Imaging Technology', 'Stage I Elective: either 30 pts: MATHS 108, 110, 208 or 45 pts: 120, 130, 250 / Any stage science');
INSERT INTO `direction` VALUES (520, 'Physics', 'Medical Physics and Imaging Technology', 'MEDSCI 205');
INSERT INTO `direction` VALUES (521, 'Physics', 'Medical Physics and Imaging Technology', 'MEDSCI 206');
INSERT INTO `direction` VALUES (522, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 201');
INSERT INTO `direction` VALUES (523, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 202');
INSERT INTO `direction` VALUES (524, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 203');
INSERT INTO `direction` VALUES (525, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 244');
INSERT INTO `direction` VALUES (526, 'Physics', 'Medical Physics and Imaging Technology', 'MATHS 253 or 260');
INSERT INTO `direction` VALUES (527, 'Physics', 'Medical Physics and Imaging Technology', 'MEDSCI 309');
INSERT INTO `direction` VALUES (528, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 333');
INSERT INTO `direction` VALUES (529, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 340');
INSERT INTO `direction` VALUES (530, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 390');
INSERT INTO `direction` VALUES (531, 'Physics', 'Medical Physics and Imaging Technology', 'ELECTENG 303, 331, MEDSCI 309, PHYSICS 331–335, 340, 356, 371, 390');
INSERT INTO `direction` VALUES (532, 'Physics', 'Medical Physics and Imaging Technology', 'PHYSICS 399');
INSERT INTO `direction` VALUES (533, 'Physics', 'Photonics', 'PHYSICS 120 or 160');
INSERT INTO `direction` VALUES (534, 'Physics', 'Photonics', 'PHYSICS 121');
INSERT INTO `direction` VALUES (535, 'Physics', 'Photonics', 'Stage I Elective: either 30 pts: MATHS 108, 110, 208 or 45 pts: 120, 130, 250');
INSERT INTO `direction` VALUES (536, 'Physics', 'Photonics', 'Stage I Elective: either 30 pts: MATHS 108, 110, 208 or 45 pts: 120, 130, 250 / Any stage science');
INSERT INTO `direction` VALUES (537, 'Physics', 'Photonics', 'MATHS 253 or 260');
INSERT INTO `direction` VALUES (538, 'Physics', 'Photonics', 'ELECTENG 210 or 292');
INSERT INTO `direction` VALUES (539, 'Physics', 'Photonics', 'PHYSICS 201');
INSERT INTO `direction` VALUES (540, 'Physics', 'Photonics', 'PHYSICS 202');
INSERT INTO `direction` VALUES (541, 'Physics', 'Photonics', 'PHYSICS 203');
INSERT INTO `direction` VALUES (542, 'Physics', 'Photonics', 'PHYSICS 244');
INSERT INTO `direction` VALUES (543, 'Physics', 'Photonics', 'ELECTENG 209 or 331');
INSERT INTO `direction` VALUES (544, 'Physics', 'Photonics', 'ELECTENG 303');
INSERT INTO `direction` VALUES (545, 'Physics', 'Photonics', 'PHYSICS 333');
INSERT INTO `direction` VALUES (546, 'Physics', 'Photonics', 'PHYSICS 340');
INSERT INTO `direction` VALUES (547, 'Physics', 'Photonics', 'PHYSICS 390');
INSERT INTO `direction` VALUES (548, 'Physics', 'Photonics', 'ELECTENG 303, 331, MEDSCI 309, PHYSICS 331–335, 340, 356, 371, 390');
INSERT INTO `direction` VALUES (549, 'Physics', 'Photonics', 'PHYSICS 399');
INSERT INTO `direction` VALUES (550, 'Physiology', 'Physiology (Bsc)', 'BIOSCI 107');
INSERT INTO `direction` VALUES (551, 'Physiology', 'Physiology (Bsc)', 'MEDSCI 142');
INSERT INTO `direction` VALUES (552, 'Physiology', 'Physiology (Bsc)', 'CHEM 110, PHYSICS 120 or 160');
INSERT INTO `direction` VALUES (553, 'Physiology', 'Physiology (Bsc)', 'MEDSCI 205');
INSERT INTO `direction` VALUES (554, 'Physiology', 'Physiology (Bsc)', 'MEDSCI 206');
INSERT INTO `direction` VALUES (555, 'Physiology', 'Physiology (Bsc)', 'MEDSCI 201, 203, 204');
INSERT INTO `direction` VALUES (556, 'Physiology', 'Physiology (Bsc)', 'MEDSCI 309, 311, 312, 316, 317');
INSERT INTO `direction` VALUES (557, 'Physiology', 'Physiology (Bsc)', 'PHYSIOL 399');
INSERT INTO `direction` VALUES (558, 'Psychology', 'Psychology (Bsc)', 'PSYCH 108');
INSERT INTO `direction` VALUES (559, 'Psychology', 'Psychology (Bsc)', 'PSYCH 109');
INSERT INTO `direction` VALUES (560, 'Psychology', 'Psychology (Bsc)', 'STATS 100–125');
INSERT INTO `direction` VALUES (561, 'Psychology', 'Psychology (Bsc)', 'PSYCH 200–209');
INSERT INTO `direction` VALUES (562, 'Psychology', 'Psychology (Bsc)', 'EDUC 323, EXERSCI 307, PSYCH 300–326');
INSERT INTO `direction` VALUES (563, 'Psychology', 'Psychology (Bsc)', 'PSYCH 399');
INSERT INTO `direction` VALUES (564, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 108');
INSERT INTO `direction` VALUES (565, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 109');
INSERT INTO `direction` VALUES (566, 'Psychology', 'Cognitive Neuroscience', 'STATS 100–125');
INSERT INTO `direction` VALUES (567, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 201');
INSERT INTO `direction` VALUES (568, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 202');
INSERT INTO `direction` VALUES (569, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 203');
INSERT INTO `direction` VALUES (570, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 303');
INSERT INTO `direction` VALUES (571, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 305');
INSERT INTO `direction` VALUES (572, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 306');
INSERT INTO `direction` VALUES (573, 'Psychology', 'Cognitive Neuroscience', 'PSYCH 399');
INSERT INTO `direction` VALUES (574, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'ECON 151');
INSERT INTO `direction` VALUES (575, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'ECON 152');
INSERT INTO `direction` VALUES (576, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'MATHS 120');
INSERT INTO `direction` VALUES (577, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'MATHS 130');
INSERT INTO `direction` VALUES (578, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'MATHS 162');
INSERT INTO `direction` VALUES (579, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'ECON 201');
INSERT INTO `direction` VALUES (580, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'ECON 211');
INSERT INTO `direction` VALUES (581, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'ECON 221');
INSERT INTO `direction` VALUES (582, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'MATHS 250');
INSERT INTO `direction` VALUES (583, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'MATHS 254, 260, 270');
INSERT INTO `direction` VALUES (584, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'ECON 301');
INSERT INTO `direction` VALUES (585, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'ECON 311');
INSERT INTO `direction` VALUES (586, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'ECON 321');
INSERT INTO `direction` VALUES (587, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'MATHS 320-363');
INSERT INTO `direction` VALUES (588, 'Quantitative Economics', 'Quantitative Economics (Bsc)', 'MATHS 399');
INSERT INTO `direction` VALUES (589, 'Statistics', 'Statistics (Bsc)', 'STATS 101–125');
INSERT INTO `direction` VALUES (590, 'Statistics', 'Statistics (Bsc)', 'DATASCI 100, STATS 101–150');
INSERT INTO `direction` VALUES (591, 'Statistics', 'Statistics (Bsc)', 'STATS 201, 208, 210, 225');
INSERT INTO `direction` VALUES (592, 'Statistics', 'Statistics (Bsc)', 'STATS 201–255, MATHS 208 or 250');
INSERT INTO `direction` VALUES (593, 'Statistics', 'Statistics (Bsc)', 'STATS 310, 325, 330, 380');
INSERT INTO `direction` VALUES (594, 'Statistics', 'Statistics (Bsc)', 'STATS 301–389, ENGSCI 391');
INSERT INTO `direction` VALUES (595, 'Statistics', 'Statistics (Bsc)', 'STATS 399');
INSERT INTO `direction` VALUES (596, 'Statistics', 'Applied', 'STATS 101 or 108');
INSERT INTO `direction` VALUES (597, 'Statistics', 'Applied', 'DATASCI 100, STATS 125, 150');
INSERT INTO `direction` VALUES (598, 'Statistics', 'Applied', 'STATS 201 or 208');
INSERT INTO `direction` VALUES (599, 'Statistics', 'Applied', 'STATS 220, 240, 255');
INSERT INTO `direction` VALUES (600, 'Statistics', 'Applied', 'STATS 330 or 380');
INSERT INTO `direction` VALUES (601, 'Statistics', 'Applied', 'STATS 302, 326, 330, 331, 380, 383, MATHS 302');
INSERT INTO `direction` VALUES (602, 'Statistics', 'Applied', 'STATS 399');
INSERT INTO `direction` VALUES (603, 'Statistics', 'Statistics and Probability', 'STATS 101 or 108');
INSERT INTO `direction` VALUES (604, 'Statistics', 'Statistics and Probability', 'STATS 125');
INSERT INTO `direction` VALUES (605, 'Statistics', 'Statistics and Probability', 'MATHS 108–153');
INSERT INTO `direction` VALUES (606, 'Statistics', 'Statistics and Probability', 'STATS 210 or 225');
INSERT INTO `direction` VALUES (607, 'Statistics', 'Statistics and Probability', 'MATHS 208, 250, STATS 201, 208, 210, 220, 225, 240, 255');
INSERT INTO `direction` VALUES (608, 'Statistics', 'Statistics and Probability', 'STATS 310, 325, 330, 380');
INSERT INTO `direction` VALUES (609, 'Statistics', 'Statistics and Probability', 'STATS 301–389, ENGSCI 391');
INSERT INTO `direction` VALUES (610, 'Statistics', 'Statistics and Probability', 'STATS 399');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (8, 'course', 'course');
INSERT INTO `django_content_type` VALUES (9, 'course', 'direction');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-08-25 15:12:25.598958');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-08-25 15:12:35.583118');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-08-25 15:12:37.808602');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-08-25 15:12:37.871551');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-25 15:12:37.948510');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-08-25 15:12:39.517202');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-08-25 15:12:40.366831');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-08-25 15:12:40.507445');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-08-25 15:12:40.563608');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-08-25 15:12:41.234582');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-08-25 15:12:41.282947');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-08-25 15:12:41.330201');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-08-25 15:12:42.176802');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-08-25 15:12:42.876529');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-08-25 15:12:43.175138');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-08-25 15:12:43.222165');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2022-08-25 15:12:44.109867');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2022-08-25 15:12:44.600288');
INSERT INTO `django_migrations` VALUES (19, 'user', '0001_initial', '2022-08-25 15:12:44.965052');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('qgjfsmyj0ya94wvn8z09c7ckg02gz2ji', '.eJzFlElvwjAQhf9K5DNLFgIJty5STz1VnAqKxh4H3CZOZSeXIv57YwJqcQmE0qqnRDOfn_2elzVJoCpXSaW5SgSSKfFI72uNAnvl0jTwBeSyGLBClkrQgUEGu64ePBbIs9sdeyCwAr2qR8cuD9NwApTTOA2pF4Yjz3dTjMYQQ-zT1EM3DDAOUpwEUTCJomAcUfQxHI14PE6NaM5lpWut5_WcSMj5nEydObmpp-KyFAxKUUgHJDqmVCjxvq3MSa-mBDN_hk9BOyn09UrwDPuQlQ2QGwfaIIfyD6qo3nSLiHGo-6xYNv1KZU17CJgLOTQpDJdGYNgAgDhrZ-rujqOKAzJV5fTIin7B8Kbn_MjkZmEILtAAnuv6ttDMsN911F7nRE6mfSamLfJ_KZ03Z-cT2AXP1rwrKqV5iygTimX89PlsBJISaNZFxo6ebYfvP63xH2Idt6CTt-OBdPJjhxvaWvdCcWY2-9p4cC90NqFP8i9DusyYndPYLoyOnfQrzuRTWWF99y5-B7b3-_Q78Il0zLeDFdt9l-XbEUZ2YbJZkM0HC7pcHA:1oULXk:BSyA1JtMCHtFJsPCbsexd0y97THCJqxpiebpMS5ZLbY', '2022-09-17 05:18:08.218825');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
