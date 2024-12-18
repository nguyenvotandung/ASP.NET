CREATE DATABASE ASPNET;
GO
USE ASPNET;
GO
CREATE TABLE Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,  -- ID tự tăng
    ProductName NVARCHAR(255) NOT NULL,       -- Tên sản phẩm
    ShortDescription NVARCHAR(500),           -- Mô tả ngắn
    FullDescription NVARCHAR(MAX),            -- Mô tả đầy đủ
    ProductImage NVARCHAR(255),               -- Đường dẫn hoặc URL hình ảnh
    Price DECIMAL(18,2) NOT NULL,             -- Giá sản phẩm
    CategoryID INT NOT NULL,                  -- ID danh mục
    BrandID INT NOT NULL,                     -- ID thương hiệu
    CreateAt DATETIME DEFAULT GETDATE(),      -- Thời gian tạo
    CreateBy NVARCHAR(100),                   -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(),      -- Thời gian cập nhật
    UpdateBy NVARCHAR(100),                   -- Người cập nhật
    Status BIT DEFAULT 1,                     -- Trạng thái (1 = Hoạt động, 0 = Không hoạt động)
    ShockSale TINYINT DEFAULT 0,              -- Sản phẩm giảm giá sốc (0 = Không, 1 = Đang, 2 = Hết)
    IsRecommended BIT DEFAULT 0               -- Sản phẩm được đề xuất (0 = Không, 1 = Có)
);
DROP TABLE Users
INSERT INTO Product (
    ProductName, ShortDescription, FullDescription, ProductImage, Price, 
    CategoryID, BrandID, CreateBy, UpdateBy, Status, ShockSale, IsRecommended
)
VALUES
-- Sản phẩm 1
('iPhone 15 Pro', 
 'Smartphone cao cấp của Apple', 
 'iPhone 15 Pro với chip A17 Bionic, màn hình 6.1 inch Super Retina XDR và hệ thống camera Pro.', 
 'https://example.com/images/iphone15pro.jpg', 
 999.99, 
 1, -- Giả sử 1 là ID danh mục "Điện thoại"
 1, -- Giả sử 1 là ID thương hiệu "Apple"
 'Admin', 
 'Admin', 
 1, -- Trạng thái hoạt động
 1, -- Giảm giá sốc
 1  -- Được đề xuất
),

-- Sản phẩm 2
('Samsung Galaxy S23 Ultra', 
 'Điện thoại flagship của Samsung', 
 'Samsung Galaxy S23 Ultra với màn hình 6.8 inch Dynamic AMOLED 2X, Snapdragon 8 Gen 2 và bút S Pen.', 
 'https://example.com/images/samsung_s23_ultra.jpg', 
 1199.99, 
 1, -- ID danh mục "Điện thoại"
 2, -- ID thương hiệu "Samsung"
 'Admin', 
 'Admin', 
 1, -- Trạng thái hoạt động
 0, -- Không giảm giá sốc
 1  -- Được đề xuất
),

-- Sản phẩm 3
('Xiaomi 13 Pro', 
 'Flagship mạnh mẽ từ Xiaomi', 
 'Xiaomi 13 Pro trang bị Snapdragon 8 Gen 2, màn hình AMOLED 6.73 inch và camera Leica.', 
 'https://example.com/images/xiaomi_13_pro.jpg', 
 799.99, 
 1, -- ID danh mục "Điện thoại"
 3, -- ID thương hiệu "Xiaomi"
 'Admin', 
 'Admin', 
 1, -- Trạng thái hoạt động
 1, -- Giảm giá sốc
 0  -- Không được đề xuất
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
ALTER TABLE Categories
ADD CategoryImage NVARCHAR(255); -- Đường dẫn hoặc URL hình ảnh

INSERT INTO Categories (CategoryName, Description, CategoryImage, CreateBy, UpdateBy)
VALUES
-- Danh mục 1
('Điện thoại', 'Danh mục các sản phẩm điện thoại di động', 'https://example.com/images/dien-thoai.jpg', 'Admin', 'Admin'),

-- Danh mục 2
('Laptop', 'Danh mục các sản phẩm máy tính xách tay', 'https://example.com/images/laptop.jpg', 'Admin', 'Admin'),

-- Danh mục 3
('Phụ kiện', 'Danh mục các sản phẩm phụ kiện công nghệ', 'https://example.com/images/phu-kien.jpg', 'Admin', 'Admin');



CREATE TABLE Brand (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,     -- ID tự tăng
    BrandName NVARCHAR(255) NOT NULL,          -- Tên thương hiệu
    Description NVARCHAR(MAX),                 -- Mô tả thương hiệu
    CreateAt DATETIME DEFAULT GETDATE(),       -- Thời gian tạo
    CreateBy NVARCHAR(100),                    -- Người tạo
    UpdateAt DATETIME DEFAULT GETDATE(),       -- Thời gian cập nhật
    UpdateBy NVARCHAR(100),                    -- Người cập nhật
    IsPopular BIT DEFAULT 0                    -- Thương hiệu phổ biến (0 = Không, 1 = Có)
);

INSERT INTO Brand (BrandName, Description, CreateBy, UpdateBy, IsPopular)
VALUES
-- Thương hiệu 1
('Apple', 'Thương hiệu nổi tiếng với các sản phẩm iPhone, iPad và MacBook.', 'Admin', 'Admin', 1),

-- Thương hiệu 2
('Samsung', 'Thương hiệu hàng đầu về điện thoại, TV và các sản phẩm gia dụng.', 'Admin', 'Admin', 1),

-- Thương hiệu 3
('Sony', 'Thương hiệu chuyên về điện tử và các sản phẩm giải trí.', 'Admin', 'Admin', 0),

-- Thương hiệu 4
('Dell', 'Thương hiệu uy tín trong lĩnh vực máy tính và thiết bị văn phòng.', 'Admin', 'Admin', 1),

-- Thương hiệu 5
('Xiaomi', 'Thương hiệu nổi tiếng về các sản phẩm công nghệ giá rẻ và chất lượng.', 'Admin', 'Admin', 1);


ALTER TABLE Product
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


ALTER TABLE Product
ADD CONSTRAINT FK_Products_Brands
FOREIGN KEY (BrandID) REFERENCES Brand(BrandID);

CREATE TABLE Users (
    idUser int IDENTITY(1,1) PRIMARY KEY ,
    FirstName  varchar(50),
    LastName  varchar(50),
    Email  varchar(50),
    Password  varchar(50)
);

