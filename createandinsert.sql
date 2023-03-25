CREATE TABLE `what_should_i_wear`.`admin` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(100) NULL,
  `resetPasswordToken` VARCHAR(100) NULL,
  `resetPasswordExpires` DATETIME NULL,
  PRIMARY KEY (`admin_id`));
  

 CREATE TABLE `what_should_i_wear`.`clothing_category` (
  `clothing_category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`clothing_category_id`));
  
  
  CREATE TABLE `what_should_i_wear`.`clothing` (
  `clothing_id` INT NOT NULL AUTO_INCREMENT,
  `clothing_type` VARCHAR(40) NOT NULL,
  `clothing_image_path` VARCHAR(200) NOT NULL,
  `clothing_category_id` INT NOT NULL,
  CONSTRAINT fk_category
    FOREIGN KEY (clothing_category_id) 
        REFERENCES clothing_category(clothing_category_id),
  PRIMARY KEY (`clothing_id`)); 
  
  
  
    CREATE TABLE `what_should_i_wear`.`preference` (
  `preference_id` INT NOT NULL AUTO_INCREMENT,
   `preference` VARCHAR(30) NOT NULL,
   `preference_category` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`preference_id`));
  
  
CREATE TABLE `what_should_i_wear`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `postal_code` INT NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NOT NULL,
  `latitude` DECIMAL(10,8) NOT NULL,
  `longitude` DECIMAL(11,8) NOT NULL,
  `isAvailable` TINYINT(1) NOT NULL,
  PRIMARY KEY (`location_id`));
 
 
CREATE TABLE `what_should_i_wear`.`weather` (
  `weather_id` INT NOT NULL AUTO_INCREMENT,
  `time_of_day` TIME NOT NULL,
  `postal_code` INT NOT NULL,
  `temperature` DECIMAL(4,2) NOT NULL,
  `dew_point` DECIMAL(4,2) NOT NULL,
  `heat_index` DECIMAL(4,2) NULL,
  `wind_chill` DECIMAL(4,2) NULL,
  `surface_wind` DECIMAL(4,2) NULL,
  `wind_direction` DECIMAL(4,2) NULL,
  `gust` DECIMAL(4,2) NULL,
  `sky_cover` DECIMAL(4,2) NULL,
  `precipitation` DECIMAL(4,2) NOT NULL,
  `relative_humidity` DECIMAL(4,2) NOT NULL,
  `day` VARCHAR(100) NOT NULL,
  `time_zone` VARCHAR(100) NOT NULL,
  `date` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`weather_id`));
  
  
  
  
  CREATE TABLE `what_should_i_wear`.`recommended` (
  `recommended_id` INT NOT NULL AUTO_INCREMENT,
  `clothing_id` INT NOT NULL,
  `clothing_category_id` INT NOT NULL,
  `apparent_temp_range_start` INT NOT NULL,
  `apparent_temp_range_end` INT NOT NULL,
  CONSTRAINT fk_categoryID
    FOREIGN KEY (clothing_category_id) 
        REFERENCES clothing_category(clothing_category_id),
  CONSTRAINT fk_clothing
    FOREIGN KEY (clothing_id) 
        REFERENCES clothing(clothing_id),
  PRIMARY KEY (`recommended_id`)) 
ENGINE = MyISAM;



INSERT INTO clothing_category (clothing_category_id, category_name)
VALUES
(1, 'T-Shirts'),
(2, 'Jeans'),
(3, 'Jackets'),
(4, 'Sweaters'),
(5, 'Dresses');


INSERT INTO clothing (clothing_id, clothing_type, clothing_image_path, clothing_category_id) 
VALUES (1, 'shirt', '/images/shirt1.jpg', 2),
	(2, 'pants', '/images/pants1.jpg', 1),
               (3, 'dress', '/images/dress1.jpg', 2),
              (4, 'jacket', '/images/jacket1.jpg', 1),
              (5, 'light pants', '/images/shoes1.jpg', 5);


INSERT INTO preference (preference_id,  preference,preference_category)
VALUES
(1,  'run','Sport'),
(2,  'walk','Sport'),
(3,  'casual','Sport'),
(4,  'hot','Feel'),
(5,  'cold','Feel');

INSERT INTO location (location_id, postal_code, city, state, latitude, longitude, isAvailable)
VALUES
(1, 12345, 'New York', 'NY', 40.71277600, -74.00597400, 1),
(2, 23456, 'Los Angeles', 'CA', 34.05223500, -118.24368300, 1),
(3, 34567, 'Chicago', 'IL', 41.87811300, -87.62979900, 1),
(4, 45678, 'Houston', 'TX', 29.76042700, -95.36980300, 1),
(5, 56789, 'Philadelphia', 'PA', 39.95258300, -75.16522200, 1);

INSERT INTO weather (weather_id, time_of_day, postal_code, temperature, dew_point, heat_index, wind_chill, surface_wind, wind_direction, gust, sky_cover, precipitation, relative_humidity, day, time_zone, date)
VALUES
(1, '19:30:00', 12345, 12.5, 8.7, 15.2, 10.3, 6.7, 10.5, 8.2, 70.0, 0.2, 72.5, 'Monday', 'EST', '2023-02-27'),
(2, '11:30:00', 23456, 20.3, 15.4, 22.1, 18.0, 8.5, 10.2, 12.1, 50.0, 0.6, 62.0, 'Tuesday', 'PST', '2023-02-28'),
(3, '09:30:00', 34567, 18.2, 12.8, 20.5, 16.0, 5.6, 80.3, 6.5, 80.0, 0.3, 78.3, 'Wednesday', 'CST', '2023-03-01'),
(4, '08:30:00', 45678, 14.7, 10.5, 16.8, 12.5, 7.2, 10.1, 9.3, 60.0, 0.4, 68.9, 'Thursday', 'MST', '2023-03-02'),
(5, '05:30:00', 56789, 23.6, 18.9, 25.3, 21.0, 10.8, 20.5, 14.2, 40.0, 0.8, 55.1, 'Friday', 'PST', '2023-03-03');



INSERT INTO recommended (recommended_id, clothing_id, clothing_category_id, apparent_temp_range_start, apparent_temp_range_end)
VALUES
(1, 1, 1, 0, 10),
(2, 2, 1, 11, 20),
(3, 3, 2, 0, 10),
(4, 4, 2, 11, 20),
(5, 5, 3, 0, 10);
