CREATE TABLE `STUDENT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `SSNLast4` varchar(4) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=98578945 DEFAULT CHARSET=latin1


CREATE TABLE `STAFF` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `password` varchar(500) NOT NULL,
  `title` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12345680 DEFAULT CHARSET=latin1


CREATE TABLE `APPLICATION` (
  `applicationID` int(11) NOT NULL AUTO_INCREMENT,
  `requestTime` datetime DEFAULT NULL,
  `applicationStatus` varchar(10) DEFAULT NULL,
  `staffID` int(11) DEFAULT NULL,
  `studentID` int(11) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `career` varchar(20) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `processedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`applicationID`),
  KEY `staffID` (`staffID`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `APPLICATION_ibfk_1` FOREIGN KEY (`staffID`) REFERENCES `STAFF` (`ID`),
  CONSTRAINT `APPLICATION_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `STUDENT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000105 DEFAULT CHARSET=latin1



/*
-- Query: select * from STUDENT
LIMIT 0, 1000

-- Date: 2021-05-04 23:06
*/
INSERT INTO `STUDENT` (`ID`,`firstName`,`lastName`,`SSNLast4`,`Email`,`password`) VALUES 
(10000001,'Jungtae','Lee','1234','Jungtae.Lee01@qmail.cuny.edu','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),
(10000002,'Asif','Talukder','2211','Asif.Talukder02@qmail.cuny.edu','bb6285a84466762a50a1f983a885e19411a759c8f70b87290654a0b8ec3bc2f7'),
(10000003,'John','Smith','2900','John.Smith03@qmail.cuny.edu','a66264486cdfa6c812b05eac9c8d99fbf6faf3ddf6461d0e9a041720f2a70656'),
(10000004,'Mark','Zuker','3911','Mark.Zuker04@qmail.cuny.edu','ab9c385e80791bca43787f9e53c029a713458265fc21c3a02be63dd545f2dbd8'),
(10000005,'Forrest','Gump','1190','Forrest.Gump05@qmail.cuny.edu','ee0dda23fb64c99fb18da49897ba3b9baa1d2dd7aeeb81f22e3cb4051693505f'),
(10000006,'Scarlet','Johanson','1191','Scarlet.Johanson06@qmail.cuny.edu','5a872494b82c851cdd519ce6a5fc2f7b0135bb99b2c0de03f9d7de2d93a93381'),
(10000007,'Dave','Beckham','2910','Dave.Beckham07@qmail.cuny.edu','5ff8966a6f06af0ceae462a283f7655865dfa881e3e4738de3a02e46359f353e'),
(10000008,'Andrew','Harris','9080','Andrew.Harris08@qmail.cuny.edu','5cdd2e33595a96785978b4f40d7772f3fd36a8914ed280f4f50436ee9857652a'),
(10000009,'John','Lennon','7911','John.Lennon09@qmail.cuny.edu','e6b2694e9ef285961bac826113d0d8ca1f83f1b029c9b66a3c72d2211d50f3bf'),
(10000011,'Elon','Musk','1234','Elon.Musk11@qmail.cuny.edu','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),
(10000012,'Bill','Gates','1234','Bill.Gates12@qmail.cuny.edu','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),
(10000013,'Simon','Says','4314','Simon.Says13@qmail.cuny.edu','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),
(10000014,'James','Lee','1244','James.Lee14@qmail.cuny.edu','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),
(10000015,'Michael','Scott','1234','Michael.Scott15@qmail.cuny.edu','7570b0efeddf0f8711aab73fa709e11f647edf9658d62745191cc006f0eed875'),
(10000016,'Karen','Martinez','1234','Karen.Martinez16@qmail.cuny.edu','0ff0a7603818d8b8ebce5ada45f2fdcc7bf1126e2da4f23cde2b3cd3f42c5f3c'),
(10000017,'Michelle','Lee','1234','Michelle.Lee17@qmail.cuny.edu','abf5c8932b051e00dbd8ff09e727a8bf52246609e07f8bb864182a7a63ec51d8'),
(10000018,'James','Corden','5455','James.Corden18@qmail.cuny.edu','c553d46c734e84d7f31177127404e379afbd44c47ab6719259c77f5e2f7bae88'),
(10000019,'Jimmy','Fallon','1231','Jimmy.Fallon19@qmail.cuny.edu','d61ca80256bd8207c7d720cdfe60f8b3482d13b45a22b282783ab158d6d4b2e7'),
(10000020,'Jeff','Bezos','69','Jeff.Bezos20@qmail.cuny.edu','6ef61a00a5e9a3c1dbcc1984df88649a82c6e054e47daeef5cb656f6813e9630'),
(10000021,'Eli','Manning','10','Eli.Manning21@qmail.cuny.edu','6525b8480d7680651437c90db632c544162ebd4cbf99b2f0f6d1f400f7de90cc'),
(10000023,'Tom','Brady','10','Tom.Brady23@qmail.cuny.edu','6deeada1b805f29e606d729bd1c49cfc3d8b9c482d9ddf5556ce83f3f1758fde'),
(10000024,'Mad','Max','10','Mad.Max24@qmail.cuny.edu','289cee40e277d5c80e392e46d61a48de441d4bbec6d166f396b73810417d7f72'),
(10000025,'Don','Lemon','10','Don.Lemon25@qmail.cuny.edu','47b6ae4b7c448002c850673a91b5b0cb1880beca563ba8469a432862907e3f4b'),
(10000026,'Mathew','Perez','10','Mathew.Perez26@qmail.cuny.edu','ee7b17d0e2913d95ad990f28e453c1fad43dd9860c00f4fdcdfea18e77320601'),
(10000027,'Melinda','Gates','10','Melinda.Gates27@qmail.cuny.edu','eb98ea410cdd290d4fc45612b3d084c052964f586a9b46d7ea64a7a37a779d2c'),
(10000028,'Makenzie','Scott','10','Makenzie.Scott28@qmail.cuny.edu','953d0fb3ef7cec2d34b3645d8d03bb0ce98b60e0af033b363670daabcda974b0'),
(10000029,'George','Washington','10','George.Washington29@qmail.cuny.edu','d70685d9de099c65c6da1cf3b02c011e3df9f861f7b8bff4b86fa2cdf7eaf35e'),
(10000030,'Barack','Obama','10','Barack.Obama30@qmail.cuny.edu','7585591b122f7ce60ef560f0ff02ba6071bf7495d8661aee3fe6757aef70ff85'),
(10000050,'Susan','Smith','1234','Susan.Smith50@qmail.cuny.edu','fbc1944a145fa4749512e466fd960828f5beebc0a40a3965f9d8f92f29c2fbbe'),
(10000051,'Nancy','Johnson','1234','Nancy.Johnson51@qmail.cuny.edu','ef1715935fc6a5b4669b02be9f5999232b190214ad8ab49d8aff0a6c73d0a38d'),
(10000052,'Mila','Brown','1234','Mila.Brown52@qmail.cuny.edu','ee2c00524c2526bedf967201d2a78afec55c0c5c499a2cf8cba38ece0bb5160b'),
(10000053,'Jacob','Rodriguez','1234','Jacob.Rodriguez53@qmail.cuny.edu','ed94e0ab8b2b67a4902b888be914250ae4ea5bfcc2baa36d91f8c56686efc963'),
(10000054,'Olive','Martinez','1234','Olive.Martinez54@qmail.cuny.edu','dcc5023231e94acb9b082b0e7323954ccdccf4de5bb86ded1f51ff9cf9149fd3'),
(10000055,'Daisy','Lopez','1234','Daisy.Lopez55@qmail.cuny.edu','1f74ce1cf9fa05197e8c758f90fcf20dd021c1e5b1d44cff014ccc99567b21ee'),
(10000056,'Anne','Thompson','1234','Anne.Thompson56@qmail.cuny.edu','981071b112d0b87829970113c78e74c14dd33cdf95eeccb67ae504561eb1666c'),
(10000057,'Jayden','White','1234','Jayden.White57@qmail.cuny.edu','de0d94ca20dd73b5b22cb01439cb5bb5053cc1459a36c093e42ab754c3d83bbc'),
(10000058,'Ethan','Clark','1234','Ethan.Clark58@qmail.cuny.edu','17586c891065cd855e11c06d6e04e9b91089b8c4273acffd5d2dd35279937e80'),
(10000059,'Lucia','Sanchez','1234','Lucia.Sanchez59@qmail.cuny.edu','8ef46e3e6595bffd81986747f4408e3dd8bf736d4e0966a502cde27a30f3a04b'),
(10000069,'Eshwar','Muneshar','1','Eshwar.Muneshar69@qmail.cuny.edu','07151d2924af4a87738487c93879f454f1857b827acd47fcf61921d9a888e3dc'),
(10000300,'Michelle','Lee','1234','Michelle.Lee00@qmail.cuny.edu','abf5c8932b051e00dbd8ff09e727a8bf52246609e07f8bb864182a7a63ec51d8'),
(10000318,'Michelle','Lee','9945','Michelle.Lee18@qmail.cuny.edu','893f463d074ab96adb0bf64302267d0ce17494b88bc9891e2140ce23d5281655'),
(10000609,'Kelly','Liv','609','Kelly.Liv09@qmail.cuny.edu','d72eadd5b314a139b9b7a6f5db049bd761e36803fac4f53f0cdcef9be979ad32'),
(10000986,'Lilah','Angle','986','Lilah.Angle86@qmail.cuny.edu','e584d69066ab017fe64fea4bc4a87d430a8b9be42df70614f2e1980c8f3c8a9a'),
(12300045,'Michelle','Lee','1234','Michelle.Lee45@qmail.cuny.edu','893f463d074ab96adb0bf64302267d0ce17494b88bc9891e2140ce23d5281655'),
(12321412,'Natali','Perez','3413','Natali.Perez12@qmail.cuny.edu','2ee81d95a31e46e7a06d29f85042c9e8b115c6b4dbc3a1b1c4133c12dcd8184f'),
(12321415,'Bobby','Russo','3416','Bobby.Russo15@qmail.cuny.edu','dd86c8b9dcefb4cbba79079683f8751a0490046cdae838a089037ebb08d6bba7'),
(12321416,'Amari','Furuya','3417','Amari.Furuya16@qmail.cuny.edu','d9a9fdf30c9e9a31bb6e85abbdb636e6835c22a8fd31348eec8d890687392d7d'),
(12321417,'Eto','Hirai','3418','Eto.Hirai17@qmail.cuny.edu','bbdc9a83ae67b183b80061eb19602f0101d6c561898f78c87641e23f42088206'),
(12321418,'Hira','Johar','3419','Hira.Johar18@qmail.cuny.edu','c6a42932e6276577cbe47f0e4775271317b459392e11a316890ad6933bf01802'),
(12321420,'Wang','Wei','3421','Wang.Wei20@qmail.cuny.edu','bcabb81ff0b5241ff2ed9c2a3558b6a11838081a2a388c747cd09ab7ea701d8e'),
(12321421,'Li','Na','3422','Li.Na21@qmail.cuny.edu','662232fa045ef227059dc9d7cafb88ce6d3931a1361cae94ba2aedaac91347a1'),
(12321424,'Julien','Loren','3425','Julien.Loren24@qmail.cuny.edu','96dea5845721e9116b846b28ac901de1fbf5df6416925b2c3ca0d49c924b52fb'),
(12321425,'Dan','Tomas','3426','Dan.Tomas25@qmail.cuny.edu','f0fc9c75c920268d2b46b27adf4527761946fb747704aedf60f5308063349fa2'),
(12321429,'Roberto','Alberto','3430','Roberto.Alberto29@qmail.cuny.edu','ead8780b64baa3a347a554633c5de8cc7130c6c63fa17f30937910161b06c99b'),
(12345000,'Nyla','Cali','5000','Nyla.Cali00@qmail.cuny.edu','b94133446bdc5c96ca9e883e901da5ef5495d5e9f5d2837689537607598c8ab3'),
(12345178,'Zuri','Kang','5178','Zuri.Kang78@qmail.cuny.edu','ab8dbdd080b2de3cec28ee3b7da3d26069e30f051b0e992c3ba54af62cf1b556'),
(12345788,'Lena','Ken','5788','Lena.Ken88@qmail.cuny.edu','3f97ea597380d4d89d110291fe2403948ce459e889a7b3ddbdc3406760c7461c'),
(13245633,'Scarlett','Lu','5633','Scarlett.Lu33@qmail.cuny.edu','089066d42ecbdbe496d5e0345d753f4c8a98e782910174ccd5a1594009fd62e7'),
(50004011,'Brooklynn','Jones','4011','Brooklynn.Jones11@qmail.cuny.edu','211cf98ca6008d6ed7fff9a03553066d6568c4a0f57288f685a428b81f26d12c'),
(63924300,'Grace','Pe','4300','Grace.Pe00@qmail.cuny.edu','e02babc15238af75d8b33806d784bcf8611bfc83b268fa8205ef35c90e2ce9d9'),
(78646735,'Ellen','Li','6735','Ellen.Li35@qmail.cuny.edu','61f4e6bc8f0ed0cf34ba4eb17c048058e77774c9f7fc6576af66bb91c9d7c1ec'),
(98578944,'Meina','Lin','8944','Meina.Lin44@qmail.cuny.edu','1d14001308539e9464f4b3391a0542de930ba69d00f05a3688a0e8cea50b6fe5');




/*
-- Query: select * from STAFF
LIMIT 0, 1000

-- Date: 2021-05-04 23:07
*/
INSERT INTO `STAFF` (`ID`,`firstName`,`lastName`,`password`,`title`,`email`) VALUES
(10000000,'Admin','Admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','admin','admin'),
(10000001,'Aria','Harris','e769890c09ff1e26189f795647f899e6d68dbae8fae5e1fd826c29ddc871dc14','staff','Aria.Harris01@qc.cuny.edu'),
(10000002,'Lily','Perez','76f075f83e9f6648db420b641f2a5aeb46532736b6f142f36d703512e6e4b910','staff','Lily.Perez02@qc.cuny.edu'),
(10000003,'Tat','Lee','f3074a1a3f1529882489ef587a83983592b688f02fef7d83115afa20fc254316','staff','Tat.Lee03@qc.cuny.edu'),
(10000004,'Nielson','Jackson','06e849780a94e70899fe43016502357bc3d8d51f865ba9ce3e85442407a45278','staff','Nielson.Jackson04@qc.cuny.edu'),
(10000005,'Mason','Lewis','d17f483db435a67ff8e1700fb17d2c7f656d14137df742702dfd3e058d39b345','staff','Mason.Lewis05@qc.cuny.edu'),
(10000006,'Nessa','Moore','64b3a7b48b42e3fd42a73211b1666b36ef04d234aa23db15d5ce1c9eea8cf37f','staff','Nessa.Moore06@qc.cuny.edu'),
(10000007,'Calliope','Perez','2eec5087254eec79d9f867f76cb335c5a215d54c87174ee7caa3d0bb9adf9cfa','staff','Calliope.Perez07@qc.cuny.edu'),
(10000008,'Annika','Moore','187ed98ca1de347f913670b11756563604ed019106ecf92384ecf748cf1b083e','staff','Annika.Moore08@qc.cuny.edu'),
(10000009,'Sky','Taylor','1a1056f2b65db4aa405087e156f3eff5bb08445adf7f17d3e83653f5946d46fb','staff','Sky.Taylor09@qc.cuny.edu'),
(10000010,'Chaya','Jo','820fc7c3ba4638aa794cca1f23c1bc439854c6c1c04618f5ba32da9a095cc8e5','staff','Chaya.Jo10@qc.cuny.edu'),
(10000011,'Julissa','White','ef2d78ebf1d297ee485b27f1324d9ad9fe9513258beda2a0c92621b2add7f6cb','staff','Julissa.White11@qc.cuny.edu');



/*
-- Query: select * from APPLICATION
LIMIT 0, 1000

-- Date: 2021-05-04 23:07
*/
INSERT INTO `APPLICATION` (`applicationID`,`requestTime`,`applicationStatus`,`staffID`,`studentID`,`semester`,`year`,`career`,`reason`,`phone`,`feedback`,`processedTime`) VALUES 
(1000000047,'2021-05-04 21:34:33','Pending',NULL,10000014,'Spring',2021,'Undergraduate','I would like to retake a course','8192393293',NULL,NULL),
(1000000048,'2021-05-04 21:38:31','Pending',NULL,10000015,'Spring',2021,'Undergraduate','I want to drop out and become regional manager of Dunder Mifflin','1231331234',NULL,NULL),
(1000000049,'2021-05-04 21:53:45','Pending',NULL,10000001,'Spring',2021,'Undergraduate','I would like to take more classes','9172939933',NULL,NULL),
(1000000050,'2021-05-04 22:02:29','Pending',NULL,10000050,'Spring',2021,'Undergraduate','I failed to many courses.','6466462290',NULL,NULL),
(1000000051,'2021-05-04 22:04:17','Approved',10000006,10000051,'Fall',2021,'Undergraduate','The remote class is not good.','9179179178','Approved.','2021-05-04 22:30:27'),
(1000000052,'2021-05-04 22:05:01','Approved',10000003,10000052,'Summer',2023,'Graduate','Too hard!','321794196','OK GOOD LUCK','2021-05-04 22:31:31'),
(1000000053,'2021-05-04 22:05:39','Denied',10000009,10000011,'Spring',2021,'Undergraduate','I will need more time as I am too busy running a company. idk if u heard but i own tesla ','9172229939','','2021-05-04 22:27:58'),
(1000000054,'2021-05-04 22:05:50','Pending',NULL,10000053,'Spring',2021,'Undergraduate','I dropped to many classes','1289236791',NULL,NULL),
(1000000055,'2021-05-04 22:05:51','Approved',10000009,12321429,'Spring',2021,'Undergraduate','','9174339082','','2021-05-04 22:27:34'),
(1000000056,'2021-05-04 22:06:45','Pending',NULL,12321425,'Spring',2021,'Undergraduate','','7180092345',NULL,NULL),
(1000000057,'2021-05-04 22:07:02','Approved',10000011,10000054,'Spring',2021,'Undergraduate','balabadwioahbwakjb','12309175107','good','2021-05-04 22:27:55'),
(1000000058,'2021-05-04 22:07:08','Pending',NULL,13245633,'Spring',2021,'Undergraduate','missing one class','1111111234',NULL,NULL),
(1000000059,'2021-05-04 22:07:34','Pending',NULL,12321424,'Spring',2021,'Undergraduate','','3478990021',NULL,NULL),
(1000000060,'2021-05-04 22:07:50','Approved',10000008,10000055,'Spring',2022,'Undergraduate','Changed major','9037251057','ok','2021-05-04 22:29:29'),
(1000000061,'2021-05-04 22:08:20','Approved',10000009,12321420,'Spring',2021,'Undergraduate','','9138887167','','2021-05-04 22:27:47'),
(1000000062,'2021-05-04 22:08:43','Denied',10000002,10000056,'Fall',2021,'Undergraduate','My professor doesn\'t like me','01975100660','No valid reason.','2021-05-04 22:31:53'),
(1000000063,'2021-05-04 22:08:46','Approved',10000010,10000012,'Spring',2021,'Undergraduate','I got depressed because of my divorce. I need more time','6460002293','cool','2021-05-04 22:28:37'),
(1000000064,'2021-05-04 22:09:12','Approved',10000009,12321421,'Spring',2021,'Undergraduate','','7187770091','','2021-05-04 22:28:07'),
(1000000065,'2021-05-04 22:09:35','Pending',NULL,63924300,'Fall',2021,'Undergraduate','fail a required class for graduation','1111114321',NULL,NULL),
(1000000066,'2021-05-04 22:09:47','Approved',10000005,10000057,'Summer',2021,'Undergraduate','Summer classes are gone!!!!','203957107','ok','2021-05-04 22:32:03'),
(1000000067,'2021-05-04 22:09:52','Pending',NULL,12321418,'Spring',2021,'Undergraduate','','9120009921',NULL,NULL),
(1000000068,'2021-05-04 22:10:36','Denied',10000002,12321417,'Spring',2021,'Undergraduate','','3475559901','No valid reason.','2021-05-04 22:31:39'),
(1000000069,'2021-05-04 22:10:43','Denied',10000003,10000058,'Fall',2022,'Undergraduate','I am groot!','2109851057','I am groot!!!','2021-05-04 22:30:07'),
(1000000070,'2021-05-04 22:10:47','Pending',NULL,50004011,'Fall',2021,'Undergraduate','missing one class','1111113214',NULL,NULL),
(1000000071,'2021-05-04 22:11:20','Pending',NULL,12321416,'Spring',2021,'Undergraduate','','2120098878',NULL,NULL),
(1000000072,'2021-05-04 22:11:26','Pending',NULL,10000059,'Spring',2021,'Graduate','Plan changed.','257189708',NULL,NULL),
(1000000073,'2021-05-04 22:12:08','Pending',NULL,12321415,'Spring',2021,'Undergraduate','','7189998825',NULL,NULL),
(1000000074,'2021-05-04 22:12:21','Approved',10000009,12321412,'Fall',2021,'Undergraduate','I need to study more!','5237895327','Approved.','2021-05-04 22:28:49'),
(1000000075,'2021-05-04 22:12:30','Pending',NULL,12345000,'Summer',2021,'Undergraduate','just fail a required course','1111111125',NULL,NULL),
(1000000076,'2021-05-04 22:12:41','Approved',10000004,10000021,'Spring',2021,'Undergraduate','I need one more class','1234556890','OK, good luck','2021-05-04 22:33:11'),
(1000000077,'2021-05-04 22:13:16','Pending',NULL,12321412,'Spring',2021,'Undergraduate','','9174994578',NULL,NULL),
(1000000078,'2021-05-04 22:13:46','Pending',NULL,10000013,'Summer',2021,'Undergraduate','I need more time to finish my classes due to pandemic','9178883338',NULL,NULL),
(1000000079,'2021-05-04 22:13:57','Approved',10000011,12345788,'Spring',2021,'Undergraduate','still missing one required class','1111114364','','2021-05-04 22:27:35'),
(1000000080,'2021-05-04 22:14:53','Pending',NULL,12345178,'Spring',2021,'Undergraduate','still missing one required class','1112223432',NULL,NULL),
(1000000081,'2021-05-04 22:15:07','Pending',NULL,10000016,'Summer',2021,'Graduate','I need more time to take more classes.','0123939993',NULL,NULL),
(1000000082,'2021-05-04 22:15:49','Pending',NULL,10000986,'Spring',2021,'Undergraduate','still missing one required class','1111115432',NULL,NULL),
(1000000083,'2021-05-04 22:16:09','Approved',10000005,10000023,'Spring',2021,'Undergraduate','The courses are too difficult.','239842696','','2021-05-04 22:31:54'),
(1000000084,'2021-05-04 22:16:24','Pending',NULL,10000018,'Fall',2022,'Graduate','I didn\'t finish taking my classes. I need more time.','9178882288',NULL,NULL),
(1000000085,'2021-05-04 22:16:41','Pending',NULL,10000024,'Spring',2021,'Undergraduate','','516999888',NULL,NULL),
(1000000086,'2021-05-04 22:16:43','Approved',10000008,10000609,'Spring',2021,'Undergraduate','still missing one required class ','1111115435','ok','2021-05-04 22:29:49'),
(1000000087,'2021-05-04 22:16:48','Approved',10000003,10000026,'Spring',2024,'Undergraduate','Too early to graduate lol','84539527','You must be kidding me!','2021-05-04 22:29:08'),
(1000000088,'2021-05-04 22:17:12','Pending',NULL,10000019,'Spring',2021,'Undergraduate','I dropped a course because I was too busy with my show. ','9282228828',NULL,NULL),
(1000000089,'2021-05-04 22:17:30','Pending',NULL,10000025,'Summer',2021,'Undergraduate','The summer session is harder than I thought','78296729',NULL,NULL),
(1000000090,'2021-05-04 22:17:54','Pending',NULL,10000028,'Spring',2021,'Undergraduate','','7182223443',NULL,NULL),
(1000000091,'2021-05-04 22:19:27','Pending',NULL,10000009,'Fall',2021,'Undergraduate','I am moving out from the city','929323456',NULL,NULL),
(1000000092,'2021-05-04 22:19:52','Pending',NULL,10000027,'Spring',2021,'Undergraduate','I\'m too rich','1234576890',NULL,NULL),
(1000000093,'2021-05-04 22:20:27','Pending',NULL,12300045,'Spring',2021,'Undergraduate','','2123445687',NULL,NULL),
(1000000094,'2021-05-04 22:21:18','Pending',NULL,98578944,'Fall',2022,'Undergraduate','I want to do another major.','74297296',NULL,NULL),
(1000000095,'2021-05-04 22:21:27','Approved',10000007,10000029,'Spring',2021,'Undergraduate','I\'m the first president of the US. Do I need to graduate?','0000000001','fair enough','2021-05-04 22:30:59'),
(1000000096,'2021-05-04 22:21:42','Pending',NULL,98578944,'Spring',2021,'Undergraduate','still missing one required class','1112223333',NULL,NULL),
(1000000097,'2021-05-04 22:22:31','Pending',NULL,10000002,'Fall',2021,'Undergraduate','All the classes I need are gone!','239856289',NULL,NULL),
(1000000098,'2021-05-04 22:22:34','Approved',10000002,10000030,'Spring',2021,'Undergraduate','I\'m Obama... nough said. ','0000000044','Approved','2021-05-04 22:32:15'),
(1000000099,'2021-05-04 22:23:18','Approved',10000010,10000008,'Spring',2021,'Undergraduate','still missing one required class ','1111111111','ok','2021-05-04 22:28:50'),
(1000000100,'2021-05-04 22:23:19','Pending',NULL,10000006,'Spring',2021,'Graduate','I\'m giving up on my degree...','987234961',NULL,NULL),
(1000000101,'2021-05-04 22:23:23','Approved',10000007,10000004,'Spring',2021,'Undergraduate','','0001112233','ok','2021-05-04 22:31:14'),
(1000000102,'2021-05-04 22:24:03','Pending',NULL,10000005,'Fall',2021,'Undergraduate','I messed up the midterm...','23758969',NULL,NULL),
(1000000103,'2021-05-04 22:24:10','Pending',NULL,10000007,'Spring',2021,'Undergraduate','still missing one required class ','1113332222',NULL,NULL),
(1000000104,'2021-05-04 22:24:32','Pending',NULL,10000003,'Spring',2021,'Undergraduate','','3474560099',NULL,NULL);
