CREATE TABLE `STUDENT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `SSNLast4` varchar(4) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10000001 DEFAULT CHARSET=latin1



CREATE TABLE `STAFF` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `password` varchar(500) NOT NULL,
  `title` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10000001 DEFAULT CHARSET=latin1



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
) ENGINE=InnoDB AUTO_INCREMENT=1000000001 DEFAULT CHARSET=latin1

