-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 22, 2024 lúc 01:58 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `linhkien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet`
--

CREATE TABLE `baiviet` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pagraph` text NOT NULL,
  `id_blog` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `image`) VALUES
(1, 'banner-01.jpg'),
(2, 'banner-02.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pagaph` text NOT NULL,
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `blog`
--

INSERT INTO `blog` (`id`, `image`, `title`, `pagaph`, `day`) VALUES
(1, 'banner-01.jpg', 'Lợi ích của laptop đối với người sử dụng thiết bị', 'Laptop được sử dụng ngày càng phổ biến, phục vụ quá trình học tập và công việc hiệu quả. Cùng Điện máy XANH tìm hiểu lợi ích của laptop đối với người sử dụng thiết bị thông qua bài viết ......', '2024-12-11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'MainBorad'),
(2, 'CPU'),
(3, 'Ram'),
(4, 'GPU'),
(5, 'Nguồn'),
(6, 'Case');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `customer_address` text NOT NULL,
  `note` text DEFAULT NULL,
  `total_amount` decimal(10,3) NOT NULL,
  `status` enum('Pending','Processing','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `quantitly` int(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `quantitly`, `status`, `id_category`) VALUES
(1, 'Mainboard Asus H610M-K Prime DDR4', '0801223337_66ab8eb1415d5.jpg', 2.3, 10, 1, 1),
(2, 'Bo mạch chủ ASUS TUF GAMING X570-PLUS WI-FI', '10312_12700.jpg', 2.43, 2, 1, 1),
(3, 'Bo mạch chủ GIGABYTE Z790 AORUS ELITE AX DDR4', '10738_pcm_mainboard_gigabyte_z790_aorus_elite_ddr4_1.jpg', 2, 5, 1, 1),
(4, 'Bo mạch chủ GIGABYTE B560M Aorus Pro', '10794_aorus_geforce_rtx____4070_ti_super_master_16g_01.png', 9.11, 8, 1, 1),
(5, 'Bo mạch chủ MSI MEG Z790 ACE DDR5', '11132-tnc-store-vo-case-xigmatek-xs-19-m-atx-mau-den-en44380--4-.jpg', 1.2, 10, 1, 1),
(6, 'Bo mạch chủ ASUS TUF GAMING B650M-PLUS (DDR5)', '120_82420_ram_desktop_kingston_fury_beast_black_rgb_xmp_kf560c40bbak2_64_64gb_2x32gb_ddr5_6000mhz__3_.jpg', 5.2, 10, 1, 1),
(7, 'Bo mạch chủ ASUS ProArt Z790 CREATOR WIFI D5', '120_82420_ram_desktop_kingston_fury_beast_black_rgb_xmp_kf560c40bbak2_64_64gb_2x32gb_ddr5_6000mhz__3_.jpg', 1.8, 10, 1, 1),
(8, 'Bo mạch chủ GIGABYTE X670 AORUS ELITE AX (DDR5)', '12550_kenoo_af300_07a.jpg', 3.66, 5, 1, 1),
(9, 'Bo mạch chủ ASUS Pro WS WRX80E-SAGE SE WIFI', '13218_cpu_intel_xeon_e5_2680.jpg', 4.8, 11, 1, 1),
(10, 'Bộ vi xử lý AMD Athlon 3000G / 3.5GHz / 2 nhân 4 luồng / 5MB / AM4', '23620-mainboard-asus-prime-z790-p-csm-1.jpeg', 29.2, 5, 1, 2),
(11, ' Bộ vi xử lý AMD Ryzen 9 5950X / 3.4GHz Boost 4.9GHz / 16 nhân 32 luồng / 64MB / AM4 ', '250-2938-73417_card_man_hinh_ocpc_rtx_2060_super_8gb__5_.jpg', 14.999, 4, 1, 2),
(12, 'Bộ vi xử lý Intel Core i9 14900KF / Turbo up to 6.0GHz / 24 Nhân 32 Luồng / 36MB / LGA 1700', '250-2938-73417_card_man_hinh_ocpc_rtx_2060_super_8gb__5_.jpg', 12, 3, 1, 2),
(13, 'Bộ vi xử lý AMD Ryzen Threadripper Pro 3955WX / 3.9GHz Boost 4.3GHz / 16 nhân 32 luồng / 64MB / sWRX8', '250-2938-73417_card_man_hinh_ocpc_rtx_2060_super_8gb__5_.jpg', 8.5, 2, 1, 2),
(14, 'Bộ vi xử lý AMD Ryzen 5 5600 / 3.5GHz Boost 4.4GHz / 6 nhân 12 luồng / 32MB / AM4', '250-2938-73417_card_man_hinh_ocpc_rtx_2060_super_8gb__5_.jpg', 21, 1, 1, 2),
(15, 'Bộ vi xử lý AMD Ryzen 7 5700X / 3.4GHz Boost 4.6GHz / 8 nhân 16 luồng / 32MB / AM4', '250-2938-73417_card_man_hinh_ocpc_rtx_2060_super_8gb__5_.jpg', 18.299, 8, 1, 2),
(16, 'RAM Corsair Dominator Titanium White 64GB (2x32GB) RGB 6600 DDR5 (CMP64GX5M2X6600C32W)', '11132-tnc-store-vo-case-xigmatek-xs-19-m-atx-mau-den-en44380--4-.jpg', 90, 10, 1, 3),
(17, 'RAM Corsair Dominator Titanium White 32GB (2x16GB) RGB 7200 DDR5 (CMP32GX5M2X7200C34W)', 'ram.jpg', 8.323, 4, 1, 3),
(18, 'RAM Corsair Dominator Titanium Black 32GB (2x16GB) RGB 6000 DDR5 (CMP32GX5M2B6000C30)', 'ram.jpg', 9.433, 10, 1, 3),
(19, 'RAM Corsair Dominator Titanium Black 64GB (2x32GB) RGB 6000 DDR5 (CMP64GX5M2B6000C30)', 'ram.jpg', 2.344, 10, 1, 3),
(20, 'RAM Corsair Dominator Titanium White 64GB (2x32GB) RGB 6000 DDR5 (CMP64GX5M2B6000C30W)', 'ram.jpg', 7.555, 10, 1, 3),
(21, 'Ram Corsair Dominator Platinum 32gb (2x16gb) Rgb 6200 Ddr5 (cmt32gx5m2x6200c36)', 'ram.jpg', 4.656, 10, 1, 3),
(25, 'CPU Intel Core i5 14600K', 'cpu.jpg', 89.909, 10, 1, 4),
(26, 'CPU AMD Ryzen 3 3200G', 'cpu.jpg', 36.232, 4, 1, 4),
(27, 'Nguồn máy tính Xigmatek X-Power III 500 450W', 'mainboard.jpg', 2.53, 6, 1, 5),
(28, 'Nguồn máy tính Xigmatek X-Power III III 650 600W', 'gpu.jpg', 1.32, 8, 1, 5),
(29, 'Nguồn máy tính MSI MAG A750BN PCIE5 750W', 'gpu.jpg', 3.45, 5, 1, 5),
(30, 'Case Xigmatek XS-19 (EN44380)', 'case.jpg', 1.5, 1, 1, 6),
(31, 'Case NZXT H5 Flow All Black', 'case.jpg', 1.6, 1, 1, 6),
(32, 'Case NZXT H5 Flow All White', 'case.jpg', 1.9, 1, 1, 6),
(33, 'Case NZXT H9 FLOW BLACK', 'case.jpg', 2.2, 1, 1, 6),
(34, 'Case NZXT H7 FLOW RGB ALL BLACK (CM-H71FB-R1)', 'case.jpg', 3.7, 1, 1, 6),
(35, 'Nguồn máy tính DeepCool PK650D 650W', '4314-nguon-coolermaster-v1000-4.jpg', 4.9, 1, 1, 5),
(36, 'Nguồn máy tính DeepCool PF450D 450W', 'images (19).jpg', 1.1, 1, 1, 5),
(37, 'CPU AMD Ryzen 9 9950X', 'cpu.jpg', 4.9, 1, 1, 4),
(38, 'CPU Intel Core i9 14900K', 'cpu.jpg', 5.54, 1, 1, 4),
(39, 'CPU Intel Core i5 12400F', 'cpu.jpg', 4.29, 1, 1, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role`) VALUES
(0, 'Văn Toàn', 'nvtoan@gmail.com', '0905987241', '123', ''),
(1, 'Châu Thành', 'cvqthanh@gmail.com', '0958224614', '123', 'admin'),
(2, 'Bá Toàn', 'nbtpro@gmail.com', '0964535345', '123', ''),
(3, 'Hồ Văn Cường', 'hvcuong@gmail.com', '0962235346', '123', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog_baiviet` (`id_blog`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categories_products_idx` (`id_category`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `fk_baiviet_blog` FOREIGN KEY (`id_blog`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_orders_order_items` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_products_order_items` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_categories_products` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
