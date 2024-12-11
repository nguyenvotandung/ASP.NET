CREATE DATABASE ASPNET;
GO
USE ASPNET;
GO
CREATE TABLE Product(
    ProductID INT IDENTITY(1,1) PRIMARY KEY, -- ID tự tăng
    ProductName NVARCHAR(255) NOT NULL, -- Tên sản phẩm
    ShortDescription NVARCHAR(500), -- Mô tả ngắn
    FullDescription NVARCHAR(MAX), -- Mô tả đầy đủ
    ProductImage NVARCHAR(255), -- Đường dẫn hoặc URL hình ảnh
    Price DECIMAL(18,2) NOT NULL, -- Giá sản phẩm
    CategoryID INT NOT NULL, -- ID danh mục
    BrandID INT NOT NULL, -- ID thương hiệu
    CreateAt DATETIME DEFAULT GETDATE(), -- Thời gian tạo
    CreateBy NVARCHAR(100), -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(), -- Thời gian cập nhật
    UpdateBy NVARCHAR(100), -- Người cập nhật
    Status BIT DEFAULT 1 -- Trạng thái (1 = Hoạt động, 0 = Không hoạt động)
);
GO

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY, -- ID tự tăng
    CategoryName NVARCHAR(255) NOT NULL, -- Tên danh mục
    Description NVARCHAR(MAX), -- Mô tả danh mục
    CreateAt DATETIME DEFAULT GETDATE(), -- Thời gian tạo
    CreateBy NVARCHAR(100), -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(), -- Thời gian cập nhật
    UpdateBy NVARCHAR(100) -- Người cập nhật
);


CREATE TABLE Brand (
    BrandID INT IDENTITY(1,1) PRIMARY KEY, -- ID tự tăng
    BrandName NVARCHAR(255) NOT NULL, -- Tên thương hiệu
    Description NVARCHAR(MAX), -- Mô tả thương hiệu
    CreateAt DATETIME DEFAULT GETDATE(), -- Thời gian tạo
    CreateBy NVARCHAR(100), -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(), -- Thời gian cập nhật
    UpdateBy NVARCHAR(100) -- Người cập nhật
);


CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY, -- ID tự tăng
    UserName NVARCHAR(100) NOT NULL, -- Tên người dùng
    Email NVARCHAR(255) UNIQUE NOT NULL, -- Email (duy nhất)
    Password NVARCHAR(255) NOT NULL, -- Mật khẩu
    FullName NVARCHAR(255), -- Tên đầy đủ
    Role NVARCHAR(50) DEFAULT 'User', -- Vai trò (User, Admin)
    CreateAt DATETIME DEFAULT GETDATE(), -- Thời gian tạo
    CreateBy NVARCHAR(100), -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(), -- Thời gian cập nhật
    UpdateBy NVARCHAR(100), -- Người cập nhật
    Status BIT DEFAULT 1 -- Trạng thái (1 = Hoạt động, 0 = Không hoạt động)
);

ALTER TABLE Product
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


ALTER TABLE Product
ADD CONSTRAINT FK_Products_Brands
FOREIGN KEY (BrandID) REFERENCES Brand(BrandID);

-- Dữ liệu cho bảng Categories
INSERT INTO Categories (CategoryName, Description, CreateBy)
VALUES
(N'Điện thoại', N'Danh mục các sản phẩm điện thoại', N'Admin'),
(N'Âm thanh', N'Danh mục các thiết bị âm thanh', N'Admin'),
(N'Máy tính', N'Danh mục các thiết bị máy tính', N'Admin');


INSERT INTO Categories (CategoryName, Description, CreateBy)
VALUES
(N'Điện thoại', N'Danh mục các sản phẩm điện thoại', N'Admin'),
(N'Âm thanh', N'Danh mục các thiết bị âm thanh', N'Admin'),
(N'Máy tính', N'Danh mục các thiết bị máy tính', N'Admin');

-- Dữ liệu cho bảng Brand
INSERT INTO Brand (BrandName, Description, CreateBy)
VALUES
(N'Apple', N'Thương hiệu Apple', N'Admin'),
(N'Sony', N'Thương hiệu Sony', N'Admin'),
(N'Dell', N'Thương hiệu Dell', N'Admin');

-- Dữ liệu cho bảng Product
INSERT INTO Product (
    ProductName,
    ShortDescription,
    FullDescription,
    ProductImage,
    Price,
    CategoryID,
    BrandID,
    CreateBy,
    UpdateBy,
    Status
)
VALUES
-- Sản phẩm 1
(
    N'Điện thoại iPhone 15 Pro Max', 
    N'Mẫu iPhone mới nhất với hiệu năng vượt trội.',
    N'Điện thoại iPhone 15 Pro Max với màn hình OLED 6.7 inch, chip A17 Bionic, camera cải tiến và thời lượng pin lâu hơn. Đây là sự lựa chọn hoàn hảo cho công việc và giải trí.',
    N'https://example.com/images/iphone15promax.jpg', 
    35999000, 
    1, -- ID danh mục (Điện thoại)
    1, -- ID thương hiệu (Apple)
    N'Admin',
    N'Admin',
    1 -- Hoạt động
),

-- Sản phẩm 2
(
    N'Tai nghe Sony WH-1000XM5',
    N'Tai nghe chống ồn tốt nhất trên thị trường.',
    N'Tai nghe Sony WH-1000XM5 với công nghệ chống ồn đỉnh cao, thời gian sử dụng lên đến 30 giờ và âm thanh chất lượng cao. Lý tưởng cho việc nghe nhạc và làm việc.',
    N'https://example.com/images/sony-wh1000xm5.jpg',
    8990000, 
    2, -- ID danh mục (Âm thanh)
    2, -- ID thương hiệu (Sony)
    N'Admin',
    N'Admin',
    1 -- Hoạt động
),

-- Sản phẩm 3
(
    N'Máy tính xách tay Dell XPS 15',
    N'Máy tính xách tay cao cấp với hiệu năng mạnh mẽ.',
    N'Máy tính Dell XPS 15 được trang bị màn hình 15.6 inch 4K, bộ xử lý Intel Core i7 thế hệ 12, RAM 16GB, SSD 512GB. Lý tưởng cho công việc thiết kế và lập trình.',
    N'https://example.com/images/dell-xps15.jpg',
    45990000,
    3, -- ID danh mục (Máy tính)
    3, -- ID thương hiệu (Dell)
    N'Admin',
    N'Admin',
    1 -- Hoạt động
);
ALTER TABLE Categories
ADD Image NVARCHAR(255);


