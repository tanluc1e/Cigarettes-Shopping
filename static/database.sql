CREATE TABLE `Brands` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR COMMENT 'Brand name',
  `image` TEXT
);

CREATE TABLE `Products` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR,
  `price` INTEGER,
  `oldprice` INTEGER,
  `image` TEXT,
  `description` TEXT,
  `specification` TEXT,
  `buyturn` INTEGER,
  `quantity` INTEGER,
  `brand_id` INTEGER,
  `category_id` INTEGER
);

CREATE TABLE `Users` (
  `id` SERIAL PRIMARY KEY,
  `email` VARCHAR,
  `password` VARCHAR,
  `name` VARCHAR,
  `role` INTEGER,
  `avatar` VARCHAR,
  `phone` INTEGER
);

CREATE TABLE `Orders` (
  `id` SERIAL PRIMARY KEY,
  `user_id` INTEGER,
  `status` INTEGER,
  `note` TEXT,
  `total` INTEGER
);

CREATE TABLE `Order_detail` (
  `id` SERIAL PRIMARY KEY,
  `order_id` INTEGER,
  `product_id` INTEGER,
  `price` INTEGER,
  `quantity` INTEGER
);

CREATE TABLE `News` (
  `id` SERIAL PRIMARY KEY,
  `title` VARCHAR,
  `image` TEXT,
  `content` TEXT
);

CREATE TABLE `News_detail` (
  `id` SERIAL PRIMARY KEY,
  `news_id` INTEGER,
  `product_id` INTEGER
);

CREATE TABLE `Feedback` (
  `id` SERIAL PRIMARY KEY,
  `product_id` INTEGER,
  `user_id` INTEGER,
  `star` INTEGER,
  `content` TEXT
);

CREATE TABLE `Categories` (
  `id` SERIAL PRIMARY KEY,
  `name` VARCHAR,
  `image` TEXT
);

CREATE TABLE `Banner` (
  `id` SERIAL PRIMARY KEY,
  `image` TEXT,
  `name` VARCHAR,
  `status` INTEGER
);

CREATE TABLE `Banner_detail` (
  `id` SERIAL PRIMARY KEY,
  `banner_id` INTEGER,
  `product_id` INTEGER
);

ALTER TABLE `Products` ADD FOREIGN KEY (`brand_id`) REFERENCES `Brands` (`id`);

ALTER TABLE `Products` ADD FOREIGN KEY (`category_id`) REFERENCES `Categories` (`id`);

ALTER TABLE `Orders` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Order_detail` ADD FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`);

ALTER TABLE `Order_detail` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `News_detail` ADD FOREIGN KEY (`news_id`) REFERENCES `News` (`id`);

ALTER TABLE `News_detail` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

ALTER TABLE `Banner_detail` ADD FOREIGN KEY (`banner_id`) REFERENCES `Banner` (`id`);

ALTER TABLE `Banner_detail` ADD FOREIGN KEY (`product_id`) REFERENCES `Products` (`id`);


-- Insert
INSERT INTO brand (name, image) VALUES
  ('Thuốc Lá', './assets/danhmuc/thuocla.jpg'),
  ('Cigar', './assets/danhmuc/cigar.jpg'),
  ('Zippo', './assets/danhmuc/zippo.jpg');

INSERT INTO category (name, image) VALUES
  ('Thuốc Lá', './assets/danhmuc/thuocla.jpg'),
  ('Cigar', './assets/danhmuc/cigar.jpg'),
  ('Zippo', './assets/danhmuc/zippo.jpg');

INSERT INTO product (name, price, oldprice, image, description, specification, buyturn, quantity, brand_id, category_id) VALUES
  ('Canyon Đỏ', 23000, 28000, './assets/thuocla/canyonDo.jpg', 'Xuất xứ tại Singapore với số lượng 20 điếu/gói. Mùi thuốc mộc, mang tính sang chảnh, hút khói thơm không bám mùi gây khô miệng. Nam nữ đều có thể dễ hút', 'Specs for Product 1', 5, 50, 1, 1),
  ('Canyon Vanilla', 25000, 32000, './assets/thuocla/canyonVanilla.jpg', 'Thuốc lá canyon vanilla thơm mùi vani sữa cafe, Điếu thuốc sang chảnh. Gói nâu đen và điếu cũng nâu đen, đầu lọc quắn lá vàng nâu vô cùng hợp thời trang. Hút khói thơm không bám mùi gây hôi miệng', 'Xuất xứ: Singapore.Số lượng: 20 điếu/gói', 7, 30, 1, 1),
  ('Esse Change', 27000, 30000, './assets/thuocla/esse1.jpg', 'Thuốc lá esse hộp cứng gọn, điếu nhỏ sang chảnh. Dòng này nhỏ nhưng có võ, hút thấm, không lo nhẹ đâu anh em nhé. Lá thuốc mùi thơm nồng nàn kết hợp với viên bấm bạc hà refresh tốt lắm.', 'Xuất xứ tại Singapore với số lượng 20 điếu/gói.', 7, 30, 1, 1),
  ('Chapman Coffee', 22000, 31000, './assets/thuocla/chapman1.jpg', 'Thuốc Chapman là dòng sản phẩm đặc biệt từ Đức với bao bì bắt mắt, gói đẹp dài, điếu Slim nhỏ màu nâu nhìn cực sang…Chapman hút môi ngọt lịm, không bám mùi, khói thơm theo hương vị lựa chọn. Hút đậm đà, hương thơm bay xa tận 5m ngồi phòng kín hay máy lạnh sẽ thành tâm điểm', 'Xuất xứ tại Đức với số lượng 20 điếu/gói. ', 5, 50, 1, 1),
  ('Zouk Chocolate', 30000, 43000, './assets/thuocla/zouk-special1.jpg', 'Thuốc lá Zouk Chocolate hương vị socola sữa thơm, hình dạng được bao bọc 1 màu đen tuyền sang trọng. Khi hút có 1 chút vị ngọt nhẹ ở môi, điều đặc biệt tạo lên sự khác biệt của chúng khi hút không để lại mùi hôi ở miệng hay quần áo. Là dòng thuốc lá nhẹ và thơm phù hợp dành cho cả Nam và Nữ thích sự nhẹ nhàng rất đáng để thử.', 'Xuất xứ tại Wales với số lượng 20 điếu/gói. ', 5, 50, 1, 1),
  ('Mond Blueberry', 32000, 45000, './assets/thuocla/mond-blueberry1.jpg', 'Thuốc lá mond (tím) bì trẻ trung bắt mắt. Điếu thuốc slim trắng dài thời thượng sang chảnh. Đầu lọc có 2 viên bấm. Viên bấm tím vị việt quất, viên bấm xanh vị bạc hà. Hút khá lạ và êm', 'Xuất xứ tại Anh với số lượng 20 điếu/gói. ', 5, 50, 1, 1),
  ('Mond Applemint', 28000, 28000, './assets/thuocla/mond-applemint1.jpg', 'Thuốc lá mond bao bì trẻ trung bắt mắt. Điếu thuốc slim dài thời thượng sang chảnh. Phù hợp cho cả nam và nữ.  Hương vị mát lạnh sảng khoái với 2 viên bấm. 1 là vị hương táo thơm ngây ngất và 1 là vị bạc hà the mát.', 'Xuất xứ tại Anh với số lượng 20 điếu/gói.', 5, 50, 1, 1),
  ('Raison Ice Cafe', 32000, 45000, './assets/thuocla/raison-ice-cafe.jpg', 'Dòng thuốc lá mang vị cốm, cafe, bạc hà. Hút không hôi miệng , không ám mùi quần áo mùi thơm thoang thoảng không gây khó chịu cho người ngồi cạnh.', 'Xuất xứ tại Hàn Quốc với số lượng 20 điếu/gói. ', 5, 50, 1, 1),
  ('Cigar Lotus 10 Short', 450000, 450000, './assets/cigar/lotus10short.jpg', 'Cigar Lotus 10 short là dòng sản phẩm cigar mini có kích thước nhỏ rất hợp cho người thưởng thức được đầy đủ hương vị của điếu cigar trong thời gian ngắn.', 'Sản xuất thủ công tại Việt Nam với số lượng 10 điếu/gói.', 5, 50, 2, 2),
  ('Vinaboss Montesco 55', 5500000, 5750000, './assets/cigar/vinaboss-montesco-55.jpg', 'Trong quá trình sản xuất thành công một điếu Cigar Vinaboss Montesco 55 có rất nhiều các bước kiểm tra, rà soát chất lượng từng công đoạn một, nhất là bắt đầu từ lúc lựa chọn lá, tất cả đều thông qua những đôi bàn tay hết sức dày dặn kinh nghiệm.', 'Sản xuất thủ công tại Việt Nam với số lượng 10 điếu/hộp.', 5, 50, 2, 2),
  ('Lotus Mini Hộp Sắt', 250000, 250000, './assets/cigar/lotus-mini-hopsat.jpg', 'Cigar Lotus Mini No2 là dòng sản phẩm cigar mini có kích thước nhỏ rất hợp cho người thưởng thức được đầy đủ hương vị của điếu cigar trong thời gian ngắn.', 'Sản xuất thủ công tại Việt Nam với số lượng 10 điếu/hộp.', 5, 50, 2, 2),
  ('Flame Art Deco Circles Lines', 855000, 970000, './assets/zippo/flame-art-deco-circles-lines.jpg', 'Bổ sung một thiết kế mới, bắt mắt cho bộ sưu tập các dòng sản phẩm cơ bản của Zippo. Bật lửa Classic Metallic Red có lớp phủ kim loại màu đỏ đậm với lớp vỏ anốt hoàn hảo và được khắc Laser logo Zippo ngọn lửa trang trí nghệ thuật vòng tròn hình học là sự bổ sung mới mẻ cho bất kỳ bộ sưu tập của bạn. Được đóng gói trong một hộp đựng dạng quà tặng. Để tối ưu hiệu suất, hãy dùng nhiên liệu bật lửa của Zippo.', 'Sản xuất thủ công tại Anh (Lưu ý: Năm sản xuất của bật lửa Zippo có thể thay đổi tùy vào thời điểm quý khách đặt hàng)', 5, 50, 3, 3),
  ('Billiards Black Crackle Lighter', 820000, 820000, './assets/zippo/billiards-black-crackle-lighter.jpg', 'Bi-a là một môn thể thao đẳng cấp và chiếc bật lửa này thể hiện điều đó. Thiết kế bàn bida được khắc laser trên bề mặt bật lửa Black Crackle, để lộ tông màu đồng thau sang trọng bên dưới. Được đóng gói trong một hộp đựng dạng quà tặng. Để tối ưu hiệu suất, hãy dùng nhiên liệu bật lửa của Zippo.', 'Sản xuất thủ công tại Anh (Lưu ý: Năm sản xuất của bật lửa Zippo có thể thay đổi tùy vào thời điểm quý khách đặt hàng)', 5, 50, 3, 3),
  ('Classic United States of America', 870000, 1050000, './assets/zippo/classic-united-states-of-america-since-1932.jpg', 'Nâng tầm bộ sưu tập bật lửa Zippo của bạn với thiết kế này. Thiết kế này được tạo ra bằng cách sử dụng quy trình khắc laser logo zippo cổ điển của mỹ từ năm 1932 trên bật lửa Black Ice® là sự bổ sung mới mẻ cho bất kỳ bộ sưu tập của bạn. Được đóng gói trong một hộp đựng dạng quà tặng. Để tối ưu hiệu suất, hãy dùng nhiên liệu bật lửa của Zippo.', 'Sản xuất thủ công tại Anh (Lưu ý: Năm sản xuất của bật lửa Zippo có thể thay đổi tùy vào thời điểm quý khách đặt hàng)', 5, 50, 3, 3),
  ('Squares Triangles', 885000, 1050000, './assets/zippo/squares-triangles.jpg', 'Bổ sung một thiết kế mới, bắt mắt cho bộ sưu tập các dòng sản phẩm cơ bản của Zippo. Thiết kế phức tạp tuyệt đẹp trên chiếc bật lửa High Polish Blue này mô tả Logo Zippo hình vuông và tam giác bằng cách sử dụng quy trình khắc Laser của Zippo là sự bổ sung mới mẻ cho bất kỳ bộ sưu tập của bạn. Được đóng gói trong một hộp đựng dạng quà tặng. Để tối ưu hiệu suất, hãy dùng nhiên liệu bật lửa của Zippo.', 'Sản xuất thủ công tại Anh (Lưu ý: Năm sản xuất của bật lửa Zippo có thể thay đổi tùy vào thời điểm quý khách đặt hàng)', 5, 50, 3, 3),
  ('Death Kiss', 920000, 920000, './assets/zippo/death-kiss.jpg', 'Tình yêu đích thực kéo dài hơn cả cuộc đời, bằng chứng là chiếc bật lửa Sage quyến rũ này. Thiết kế hình ảnh màu đầy mê hoặc mô tả một cặp tri kỷ trong cái ôm vĩnh cửu, trong khi dòng chữ “Les Amoureux” làm tăng thêm sự lãng mạn. Được đóng gói trong một hộp đựng dạng quà tặng. Để tối ưu hiệu suất, hãy dùng nhiên liệu bật lửa của Zippo.', 'Sản xuất thủ công tại Anh (Lưu ý: Năm sản xuất của bật lửa Zippo có thể thay đổi tùy vào thời điểm quý khách đặt hàng)', 5, 50, 3, 3),
  ('Gory Tattoo', 870000, 870000, './assets/zippo/gory-tattoo.jpg', 'Sự sống và cái chết được đặt cạnh nhau một cách tuyệt đẹp đến từng chi tiết đẫm máu trên chiếc bật lửa đồng thau, nền sơn tĩnh điện Black Matte cổ điển này trong một thiết kế Color Image đầy ám ảnh. Được đóng gói trong một hộp đựng dạng quà tặng. Để tối ưu hiệu suất, hãy dùng nhiên liệu bật lửa của Zippo.', 'Sản xuất thủ công tại Anh (Lưu ý: Năm sản xuất của bật lửa Zippo có thể thay đổi tùy vào thời điểm quý khách đặt hàng)', 5, 50, 3, 3);
  
  
