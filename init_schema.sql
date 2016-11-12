CREATE TABLE `shop` (
  `id_shop` int(11) NOT NULL AUTO_INCREMENT,
  `name_shop` varchar(30) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  PRIMARY KEY (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `order1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` text,
  `product` text,
  `count_product` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `img1` varchar(50) DEFAULT NULL,
  `img2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8