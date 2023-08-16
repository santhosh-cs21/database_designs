/* create a database */

DROP DATABASE IF EXISTS skfp;
CREATE DATABASE skfp;
USE skfp;

/*  create tables */

CREATE TABLE skfp.`batch_master` (
  `batch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `manufactured_date` date DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
);

CREATE TABLE skfp.`item_master` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `package_id` int(10) unsigned DEFAULT NULL,
  `quantity` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`item_id`)
);

CREATE TABLE skfp.`items_returned` (
  `return_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `quantity_returned` int(11) DEFAULT NULL,
  PRIMARY KEY (`return_id`)
);

CREATE TABLE skfp.`items_supplied` (
  `supply_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned DEFAULT NULL,
  `shop_id` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`supply_id`)
);

CREATE TABLE skfp.`package_master` (
  `package_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_type` varchar(100)  DEFAULT NULL,
  PRIMARY KEY (`package_id`)
);

CREATE TABLE skfp.`product_master` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100)  DEFAULT NULL,
  `shelf_life` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`product_id`)
);

CREATE TABLE skfp.`shop_master` (
  `shop_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(100)  DEFAULT NULL,
  `address_line1` varchar(100)  DEFAULT NULL,
  `address_line2` varchar(100)  DEFAULT NULL,
  `address_line3` varchar(100)  DEFAULT NULL,
  `pincode` varchar(6)  DEFAULT NULL,
  `contact_no` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
);

/*  Add appropriate foreign keys  */

ALTER TABLE `skfp`.`item_master` ADD FOREIGN KEY (`package_id`) REFERENCES `skfp`.`package_master`(`package_id`);
ALTER TABLE `skfp`.`batch_master` ADD FOREIGN KEY (`product_id`) REFERENCES `skfp`.`product_master`(`product_id`);
ALTER TABLE `skfp`.`items_supplied` ADD FOREIGN KEY (`shop_id`) REFERENCES `skfp`.`shop_master`(`shop_id`);
ALTER TABLE `skfp`.`item_master` ADD FOREIGN KEY (`batch_id`) REFERENCES `skfp`.`batch_master`(`batch_id`);


/* include WHO columns and Soft Delete Attributes */

ALTER TABLE skfp.`batch_master` ADD COLUMN (
  `status` tinyint(4) DEFAULT NULL,
  `created_by` varchar(21) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` varchar(21) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`item_master` ADD COLUMN (
  `status` tinyint(4) DEFAULT NULL,
  `created_by` varchar(21) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` varchar(21) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`items_returned` ADD COLUMN (
  `status` tinyint(4) DEFAULT NULL,
  `created_by` varchar(21) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` varchar(21) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`items_supplied` ADD COLUMN (
  `status` tinyint(4) DEFAULT NULL,
  `created_by` varchar(21) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` varchar(21) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`package_master` ADD COLUMN (
  `status` tinyint(4) DEFAULT NULL,
  `created_by` varchar(21) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` varchar(21) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`product_master` ADD COLUMN (
  `status` tinyint(4) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` varchar(20) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);

ALTER TABLE skfp.`shop_master` ADD COLUMN (
  `status` tinyint(4) DEFAULT NULL,
  `created_by` varchar(21) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` varchar(21) DEFAULT NULL, 
  `last_updated_date` datetime DEFAULT NULL);


/*shop master*/

insert into skfp.shop_master(shop_name,address_line1,address_line2,address_line3,pincode,contact_no,created_by,created_date,last_updated_by,last_updated_date,status)values('Anbu Maligai','DG puthur','Gobi','Erode','638503','7689655643','mownika',NOW(),'mownika',NOW(),'1');
insert into skfp.shop_master(shop_name,address_line1,address_line2,address_line3,pincode,contact_no,created_by,created_date,last_updated_by,last_updated_date,status)values('SPAS Bakery','Sakthi Nagar','Anthiyur','Erode','638314','7698543498','mownika',NOW(),'mownika',NOW(),'1');
insert into skfp.shop_master(shop_name,address_line1,address_line2,address_line3,pincode,contact_no,created_by,created_date,last_updated_by,last_updated_date,status)values('MS Bakery','Gandhi Nagar','Bhavani','Erode','638312','8754680190','mownika',NOW(),'mownika',NOW(),'1');
insert into skfp.shop_master(shop_name,address_line1,address_line2,address_line3,pincode,contact_no,created_by,created_date,last_updated_by,last_updated_date,status)values('Kasturi Bakes','4 Road','Sathy','Erode','635087','8790654567','mownika',NOW(),'mownika',NOW(),'1');
insert into skfp.shop_master(shop_name,address_line1,address_line2,address_line3,pincode,contact_no,created_by,created_date,last_updated_by,last_updated_date,status)values('Indian Store','Appakudal','Bhavani','Erode','638315','9878654576','mownika',NOW(),'mownika',NOW(),'1');
insert into skfp.shop_master(shop_name,address_line1,address_line2,address_line3,pincode,contact_no,created_by,created_date,last_updated_by,last_updated_date,status)values('Kutty Bakery','Athani','Anthiyur','Erode','638315','7865439876','mownika',NOW(),'mownika',NOW(),'1'); 


/*Package master*/

SET time_zone = '+05:30';
insert into skfp.package_master (package_type,created_by,created_date,last_updated_date,last_updated_by,status) values ('1 KG','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.package_master (package_type,created_by,created_date,last_updated_date,last_updated_by,status) values ('500 G','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.package_master (package_type,created_by,created_date,last_updated_date,last_updated_by,status) values ('250 G','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.package_master (package_type,created_by,created_date,last_updated_date,last_updated_by,status) values ('100 G','Santhosh',NOW(),NOW(),'Santhosh','1');


/*product master*/


insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Gulab Jamun','3','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Rasagulla','3','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Laddu','5','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Halwa','4','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Kaju Katli','5','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Mixture','9','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Soan papdi','15','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Boondi','5','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Murukku','12','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Potato Chips ','7','Santhosh',NOW(),NOW(),'Santhosh','1');
insert into skfp.product_master(product_name,shelf_life,created_by,created_date,last_updated_date,last_updated_by,status)values('Banana Chips','9','Santhosh',NOW(),NOW(),'Santhosh','1');


/*batch master*/

insert into skfp.batch_master(product_id,manufactured_date,quantity,status,created_by,created_date,last_updated_by,last_updated_date) values('3','2023-08-16','10','1','Santhosh',NOW(),'Santhosh',NOW());
insert into skfp.batch_master(product_id,manufactured_date,quantity,status,created_by,created_date,last_updated_by,last_updated_date) values('1','2023-08-16','10','1','Santhosh',NOW(),'Santhosh',NOW());
insert into skfp.batch_master(product_id,manufactured_date,quantity,status,created_by,created_date,last_updated_by,last_updated_date) values('4','2023-08-17','10','1','Santhosh',NOW(),'Santhosh',NOW());
insert into skfp.batch_master(product_id,manufactured_date,quantity,status,created_by,created_date,last_updated_by,last_updated_date) values('9','2023-08-17','10','1','Santhosh',NOW(),'Santhosh',NOW());
insert into skfp.batch_master(product_id,manufactured_date,quantity,status,created_by,created_date,last_updated_by,last_updated_date) values('8','2023-08-17','10','1','Santhosh',NOW(),'Santhosh',NOW());

