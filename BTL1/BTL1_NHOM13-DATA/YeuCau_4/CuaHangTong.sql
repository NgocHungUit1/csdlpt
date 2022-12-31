ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';
Set serverOutput on;
Drop TABLE  DIENTHOAI;
Drop TABLE  CUAHANG;
Drop TABLE  KHOHANG_QLKHO;
Drop TABLE  KHOHANG_NVBH;
Drop TABLE  NHANVIEN ;
Drop TABLE  HOADON ;
Drop TABLE  CTHD ;
Drop TABLE  KHACHHANG ;
---------------------
CREATE TABLE DIENTHOAI 
(
    MaDT VARCHAR2(10) PRIMARY KEY,
    TenDT VARCHAR2(50),
    MauSac VARCHAR2(50),
    DungLuong VARCHAR2(50),
    GiaTien NUMBER,
    ThuongHieu VARCHAR2(50)
    
);

CREATE TABLE CUAHANG
(
    MaCH VARCHAR2(5) PRIMARY KEY,
    TenCH VARCHAR2(50),
    SoDT VARCHAR2(11)
    
);

CREATE TABLE  KHOHANG_QLKHO
(
    MaCH VARCHAR2(5),
    MaDT VARCHAR2(10),
    SoLuong NUMBER,
    NgayNhapKho DATE,
     CONSTRAINT PK_KHOHANG_QLKHO PRIMARY KEY(MaCH,MaDT), 
    CONSTRAINT FK_KHOHANG_QLKHO_CUAHANG FOREIGN KEY (MaCH)
    REFERENCES CUAHANG (MaCH),
      CONSTRAINT FK_KHOHANG_QLKHO_DIENTHOAI FOREIGN KEY (MaDT)
    REFERENCES DIENTHOAI(MaDT)

);

CREATE TABLE KHOHANG_NVBH
(
    MaCH VARCHAR2(5),
    MaDT VARCHAR2(10),
    TinhTrang  VARCHAR2(10), 
     CONSTRAINT PK_KHOHANG_NVBH PRIMARY KEY(MaCH,MaDT), 
    CONSTRAINT FK_KHOHANG_NVBH_CUAHANG FOREIGN KEY (MaCH)
    REFERENCES CUAHANG (MaCH),
      CONSTRAINT FK_KHOHANG_NVBH_DIENTHOAI FOREIGN KEY (MaDT)
    REFERENCES DIENTHOAI(MaDT)
);

CREATE TABLE NHANVIEN 
(
    MaNV VARCHAR2(5) PRIMARY KEY,
    TenNV VARCHAR2(50),
    DiaChi  VARCHAR2(50),
    SoDT VARCHAR2(11),
    Luong NUMBER,
    MaCH VARCHAR2(5),
    CONSTRAINT FK_NHANVIEN_CUAHANG FOREIGN KEY (MaCH)
    REFERENCES CUAHANG (MaCH)
);

CREATE TABLE KHACHHANG
(
    MaKH VARCHAR2(5) PRIMARY KEY,
    TenKH VARCHAR2(50),
    DiaChi  VARCHAR2(50),
    SoDT VARCHAR2(11)
);

CREATE TABLE HOADON 
(
    MaHD VARCHAR2(5) PRIMARY KEY,
    MaNV VARCHAR2(5),
    MaKH VARCHAR2(5), 
    MaCH VARCHAR2(5),
    NgayHD DATE,
    ThanhTien NUMBER,
    CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY (MaNV)
        REFERENCES NHANVIEN (MaNV),
    CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MaKH)
        REFERENCES KHACHHANG (MaKH),
    CONSTRAINT FK_HOADON_CUAHANG FOREIGN KEY (MaCH)
        REFERENCES CUAHANG (MaCH)
);

CREATE TABLE CTHD 
(
    MaHD VARCHAR2(5),
    MaDT VARCHAR2(10),
    SoLuong NUMBER, 
    CONSTRAINT PK_CTHD PRIMARY KEY(MaHD,MaDT), 
    CONSTRAINT FK_CTHD_HOADON FOREIGN KEY (MaHD)
        REFERENCES HOADON (MaHD),
    CONSTRAINT FK_CTHD_DIENTHOAI FOREIGN KEY (MaDT)
        REFERENCES DIENTHOAI (MaDT)
);
---------------------------------------------
INSERT INTO   DIENTHOAI VALUES ('Phone01','Iphone 12','Black','64GB',18290000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone02','Iphone 12','Red','64GB',18290000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone03','Iphone 12','Blue','64GB',18290000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone04','Iphone 12','White','64GB',18290000,'Apple');

INSERT INTO   DIENTHOAI VALUES ('Phone05','Iphone 12','Black','128GB',19590000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone06','Iphone 12','Red','128GB',19590000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone07','Iphone 12','Blue','128GB',19590000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone08','Iphone 12','White','128GB',19590000,'Apple');

INSERT INTO   DIENTHOAI VALUES ('Phone09','Iphone 12','Black','256GB',22390000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone10','Iphone 12','Red','256GB',22390000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone11','Iphone 12','Blue','256GB',22390000,'Apple');

INSERT INTO   DIENTHOAI VALUES ('Phone12','Iphone 13','Midnight','64GB',21590000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone13','Iphone 13','Red','64GB',21590000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone14','Iphone 13','Blue','64GB',21590000,'Apple');

INSERT INTO   DIENTHOAI VALUES ('Phone15','Iphone 13','Midnight','128GB',24190000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone16','Iphone 13','Red','128GB',24190000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone17','Iphone 13','Blue','128GB',24190000,'Apple');

INSERT INTO   DIENTHOAI VALUES ('Phone18','Iphone 13','Midnight','256GB',29490000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone19','Iphone 13','Red','256GB',29490000,'Apple');
INSERT INTO   DIENTHOAI VALUES ('Phone20','Iphone 13','Blue','256GB',29490000,'Apple');

INSERT INTO   DIENTHOAI VALUES ('Phone21','Samsung Galaxy Z Fold3 5G','Black','256GB',41999000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone22','Samsung Galaxy Z Fold3 5G','Grey','256GB',41999000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone23','Samsung Galaxy Z Fold3 5G','Blue','256GB',41999000,'Samsung');

INSERT INTO   DIENTHOAI VALUES ('Phone24','Samsung Galaxy Z Fold3 5G','Black','512GB',45000000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone25','Samsung Galaxy Z Fold3 5G','Grey','512GB',45000000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone26','Samsung Galaxy Z Fold3 5G','Blue','512GB',45000000,'Samsung');

INSERT INTO   DIENTHOAI VALUES ('Phone27','Samsung Galaxy Z Flip3 5G','Black ','128GB',24990000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone28','Samsung Galaxy Z Flip3 5G','Blue','128GB',24990000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone29','Samsung Galaxy Z Flip3 5G','White','128GB',24990000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone30','Samsung Galaxy Z Flip3 5G','Purple','128GB',24990000,'Samsung');

INSERT INTO   DIENTHOAI VALUES ('Phone31','Samsung Galaxy Z Flip3 5G','Black','256GB',26990000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone32','Samsung Galaxy Z Flip3 5G','Blue','256GB',26990000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone33','Samsung Galaxy Z Flip3 5G','White','256GB',26990000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone34','Samsung Galaxy Z Flip3 5G','Purple','256GB',26990000,'Samsung');

INSERT INTO   DIENTHOAI VALUES ('Phone35','Samsung Galaxy A22','Purple','128GB',5390000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone36','Samsung Galaxy A22','Black','128GB',5390000,'Samsung');
INSERT INTO   DIENTHOAI VALUES ('Phone37','Samsung Galaxy A22','Green','128GB',5390000,'Samsung');

INSERT INTO   DIENTHOAI VALUES ('Phone38','Xiaomi 11T 5G','Blue','128GB',5390000,'Xiaomi');
INSERT INTO   DIENTHOAI VALUES ('Phone39','Xiaomi 11T 5G','White','128GB',5390000,'Xiaomi');
INSERT INTO   DIENTHOAI VALUES ('Phone40','Xiaomi 11T 5G','Grey','128GB',5390000,'Xiaomi');

INSERT INTO   DIENTHOAI VALUES ('Phone41','Vsmart Aris','Blue','128GB',4490000,'Vsmart');
INSERT INTO   DIENTHOAI VALUES ('Phone42','Vsmart Aris','Grey','128GB',4490000,'Vsmart');
INSERT INTO   DIENTHOAI VALUES ('Phone43','Vsmart Aris','Green','128GB',4490000,'Vsmart');

INSERT INTO   DIENTHOAI VALUES ('Phone44','Vsmart Aris Pro','Grey','128GB',5150000,'Vsmart');
INSERT INTO   DIENTHOAI VALUES ('Phone45','Vsmart Aris Pro','Green','128GB',5150000,'Vsmart');
INSERT INTO   DIENTHOAI VALUES ('Phone46','Vsmart Aris Pro','Copper','128GB',5150000,'Vsmart');

INSERT INTO   DIENTHOAI VALUES ('Phone47','Vivo Y21s','Midnight','128GB',5480000,'Vivo');
INSERT INTO   DIENTHOAI VALUES ('Phone48','Vivo Y21s','White','128GB',5480000,'Vivo');

INSERT INTO   DIENTHOAI VALUES ('Phone49','OPPO Reno6 5G','Black','128GB',12990000,'Oppo');
INSERT INTO   DIENTHOAI VALUES ('Phone50','OPPO Reno6 5G','Grey','128GB',12990000,'Oppo');



-- 2/ CUA HANG
DELETE FROM   CUAHANG;

INSERT INTO   CUAHANG VALUES ('CH01','QUAN 1, TPHCM','09494499969');
INSERT INTO   CUAHANG VALUES ('CH02','QUAN BA DINH, HA NOI','0995596624');

-- 2/ KHACH HANG
DELETE FROM   KHACHHANG;

INSERT INTO   KHACHHANG VALUES ('KH01','Nguyen Ngoc Hung','QUAN 1, TPHCM','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH02','Nguyen Pham Cao Triet','QUAN 2, TPHCM','0995596624');
INSERT INTO   KHACHHANG VALUES ('KH03','Hoang Minh Nam Phuong','QUAN 3, TPHCM','09822343455');
INSERT INTO   KHACHHANG VALUES ('KH04','Dao Minh Duc','QUAN 4, TPHCM','0936934644');
INSERT INTO   KHACHHANG VALUES ('KH05','Pham Thi Thao Nhi','QUAN 5, TPHCM','0944924928');
INSERT INTO   KHACHHANG VALUES ('KH06','Vu My Ngoc','QUAN 6, TPHCM','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH07','Do Quang Vinh','QUAN 7, TPHCM','0949821299');
INSERT INTO   KHACHHANG VALUES ('KH08','Nguyen Truong Hoang Nam','QUAN 8, TPHCM','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH09','Nguyen Phan Bao Chau','QUAN 9, TPHCM','0982999343');
INSERT INTO   KHACHHANG VALUES ('KH10','Nguyen Le Nhat Vy','QUAN 10, TPHCM','0998555312');
INSERT INTO   KHACHHANG VALUES ('KH11','Nguyen Thai Bao Ngoc','QUAN 11, TPHCM','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH12','Truong Gia Bao','QUAN 12, TPHCM','0938241489');
INSERT INTO   KHACHHANG VALUES ('KH13','Ngo Manh Hung','QUAN TAN BINH, TPHCM','0982991868');
INSERT INTO   KHACHHANG VALUES ('KH14','Bui Nguyen Trung Thanh','QUAN BINH TAN, TPHCM','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH15','Ngac Bao Vinh','QUAN BINH THANH, TPHCM','0949165339');
INSERT INTO   KHACHHANG VALUES ('KH16','Phan Bao Chau','QUAN GO VAP, TPHCM','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH17','Tran Nguyen Phuoc Tai','QUAN PHU NHUAN, TPHCM','09528392386');
INSERT INTO   KHACHHANG VALUES ('KH18','Tran An Nguyen','QUAN TAN PHU, TPHCM','0993394146');
INSERT INTO   KHACHHANG VALUES ('KH19','Huynh Hoang Bao Ngoc','QUAN THU DUC, TPHCM','09528392386');
INSERT INTO   KHACHHANG VALUES ('KH20','Nguyen Tran Yen Nhi','HUYEN BINH CHANH, TPHCM','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH21','Pham Hoang Vinh','HUYEN CAN GIO, TPHCM','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH22','Tran Ngoc Vu','HUYEN CU CHI, TPHCM','0994193243');
INSERT INTO   KHACHHANG VALUES ('KH23','Tran Dang Khoa','HUYEN HOC MON, TPHCM','0942244615');
INSERT INTO   KHACHHANG VALUES ('KH24','Nguyen Thien An','HUYEN NHA BE, TPHCM','0989968144');
INSERT INTO   KHACHHANG VALUES ('KH25','Le Vo Ngoc Nhi','QUAN HOAN KIEM, HA NOI','0993362892');
INSERT INTO   KHACHHANG VALUES ('KH26','Pham Quang Huy','QUAN DONG DA, HA NOI','09499594949');
INSERT INTO   KHACHHANG VALUES ('KH27','Chu Minh Duc','QUAN BA DINH, HA NOI','0992426225');
INSERT INTO   KHACHHANG VALUES ('KH28','Nguyen Thanh Dat','QUAN HAI BA TRUNG, HA NOI','09528392386');
INSERT INTO   KHACHHANG VALUES ('KH29','Phung Duc Thien','QUAN HOANG MAI, HA NOI','09528392386');
INSERT INTO   KHACHHANG VALUES ('KH30','Dang Ngoc Anh Thi','QUAN THANH XUAN, HA NOI','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH31','Lai Mai Thanh Thao','QUAN LONG BIEN, HA NOI','09834525696');
INSERT INTO   KHACHHANG VALUES ('KH32','Tran Do Hoang Long','QUAN NAM TU LIEM, HA NOI','0944899489');
INSERT INTO   KHACHHANG VALUES ('KH33','Banh Gia Linh','QUAN BAC TU LIEM, HA NOI','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH34','Bui Quang Huy','QUAN TAY HO, HA NOI','0946924915');
INSERT INTO   KHACHHANG VALUES ('KH35','Nguyen Dac Hong Anh','QUAN CAU GIAY, HA NOI','0993916948');
INSERT INTO   KHACHHANG VALUES ('KH36','Le Hana','QUAN HA DONG, HA NOI','09364632242');
INSERT INTO   KHACHHANG VALUES ('KH37','Pham Thi Bao Tram','THI XA SON TAY, HA NOI','0931441445');
INSERT INTO   KHACHHANG VALUES ('KH38','Nguyen Gia Huy','HUYEN BA VI, HA NOI','0935116895');

INSERT INTO   KHACHHANG VALUES ('KH39','To Dinh Gia Bao','HUYEN CHUONG MY, HA NOI','09528392386');
INSERT INTO   KHACHHANG VALUES ('KH40','Mai Hieu Minh','HUYEN PHUC THO, HA NOI','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH41','Tran Ninh Khang','HUYEN DAN PHUONG, HA NOI','09528392386');
INSERT INTO   KHACHHANG VALUES ('KH42','Nguyen Van Thanh Binh','HUYEN DONG ANH, HA NOI','09494499969');
INSERT INTO   KHACHHANG VALUES ('KH43','Huynh Vo Tri Nhan','HUYEN GIA LAM, HA NOI','0983154412');
INSERT INTO   KHACHHANG VALUES ('KH44','Hoang Diep Anh','HUYEN HOAI DUC, HA NOI','0991958924');
INSERT INTO   KHACHHANG VALUES ('KH45','Cao Ba Ngoc','HUYEN ME LINH, HA NOI','0933223832');
INSERT INTO   KHACHHANG VALUES ('KH46','Phan Tam An','HUYEN MY DUC, HA NOI','0995949124');
INSERT INTO   KHACHHANG VALUES ('KH47','Vo Minh Thanh','HUYEN PHU XUYEN, HA NOI','09898699925');
INSERT INTO   KHACHHANG VALUES ('KH48','Huynh Thai Son','HUYEN QUOC OAI, HA NOI','0966486839');
INSERT INTO   KHACHHANG VALUES ('KH49','Nguyen Khanh Trinh','HUYEN SOC SON, HA NOI','09528392386');
INSERT INTO   KHACHHANG VALUES ('KH50','Pham Ngoc Hai','HUYEN THACH THAT,HA NOI','09528392386');



--- 4/ Nhan Vien

INSERT INTO   NHANVIEN VALUES ('NV01','Dao Thi Hong Ngoc','QUAN 1, TPHCM','09494499969',6300000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV02','Ngo Thi Hong Anh','QUAN 1, TPHCM','0995596624',4000000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV03','Nguyen Thi Kim Anh','QUAN 2, TPHCM','09822343455',5000000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV04','Nguyen Hoang Mai Khoi','QUAN 2, TPHCM','0936934644',6500000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV05','Tran Vu An Nhien','QUAN 2, TPHCM','0944924928',16000000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV06','Le Huynh','QUAN 6, TPHCM','09494499969',16600000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV07','Nguyen Dang Khoa','QUAN 7, TPHCM','0949821299',6000000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV08','Nguyen Hoang Minh Quan','QUAN 8, TPHCM','09494499969',6000000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV09','Pham Thi Thanh Truc','QUAN 9, TPHCM','0982999343',5900000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV10','Nguyen Minh Cuong','QUAN 10, TPHCM','0998555312',5900000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV11','Bui Thanh Trang','QUAN 11, TPHCM','09494499969',5900000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV12','Banh Van Tran Phat','QUAN 12, TPHCM','0938241489',5900000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV13','Tran Gia Han','QUAN TAN BINH, TPHCM','0982991868',4200000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV14','Pham Khanh Han','QUAN BINH TAN, TPHCM','09494499969',4200000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV15','Nguyen Huu Cuong','QUAN BINH THANH, TPHCM','0949165339',4200000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV16','Nguyen Anh Tuan','QUAN GO VAP, TPHCM','09494499969',4200000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV17','Tran Doan Kim Ngan','QUAN PHU NHUAN, TPHCM','09528392386',7500000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV18','Duong Minh Khang','QUAN TAN PHU, TPHCM','0993394146',7500000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV19','Hoang Tran Bao Long','QUAN THU DUC, TPHCM','09528392386',7500000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV20','Le Nhat Nam','HUYEN BINH CHANH, TPHCM','09494499969',7500000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV21','Dinh Nguyen Kim Anh','HUYEN CAN GIO, TPHCM','09494499969',7500000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV22','Le Gia Huy','HUYEN CU CHI, TPHCM','0994193243',8000000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV23','Le Trinh Hoang Phat','HUYEN HOC MON, TPHCM','0942244615',8000000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV24','Cao Tran Nam Anh','HUYEN NHA BE, TPHCM','0989968144',8000000,'CH01');
INSERT INTO   NHANVIEN VALUES ('NV25','Phan To Nhu','QUAN HOAN KIEM, HA NOI','0993362892',6100000,'CH01');


INSERT INTO   NHANVIEN VALUES ('NV26','Ngo Le Khoi Nguyen','QUAN DONG DA, HA NOI','09499594949',6100000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV27','Huynh My Yen','QUAN BA DINH, HA NOI','0992426225',6100000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV28','Truong Tuyet Anh','QUAN HAI BA TRUNG, HA NOI','09528392386',6100000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV28','Nguyen Minh Nhat','QUAN HOANG MAI, HA NOI','09528392386',6100000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV29','Nhat','QUAN HOANG MAI, HA NOI','09528392386',6100000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV30','Doan Dac Phuc','QUAN THANH XUAN, HA NOI','09494499969',7000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV31','Nguyen Nguyen Bao Ngoc','QUAN LONG BIEN, HA NOI','09834525696',7000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV32','Pham Ngoc Quynh Huong','QUAN NAM TU LIEM, HA NOI','0944899489',7000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV33','Thai Ha Linh','QUAN BAC TU LIEM, HA NOI','09494499969',7000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV34','Pham Ngoc Minh','QUAN TAY HO, HA NOI','0946924915',7000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV35','Nguyen Hong Minh','QUAN CAU GIAY, HA NOI','0993916948',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV36','Le Duong','QUAN HA DONG, HA NOI','09364632242',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV37','Phan Bao Tram','THI XA SON TAY, HA NOI','0931441445',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV38','Phan Gia Huy','HUYEN BA VI, HA NOI','0935116895',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV39','Gia Bao','QUAN GO VAP, TPHCM','09528392386',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV40','Ha Minh Phat','QUAN GO VAP, TPHCM','09494499969',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV41','Tran Minh Phat','QUAN GO VAP, TPHCM','09528392386',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV42','Nguyen Van Binh','QUAN GO VAP, TPHCM','09494499969',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV43','Vo Thi Tra My','QUAN GO VAP, TPHCM','0983154412',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV44','Nguyen Le Kim Khanh','QUAN GO VAP, TPHCM','0991958924',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV45','Phan Minh Huy','QUAN GO VAP, TPHCM','0933223832',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV46','Truong Thanh Tai','QUAN 12, TPHCM','0995949124',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV47','Vo Minh Quan','QUAN 12, TPHCM','09898699925',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV48','Dang Thai Son','QUAN 12, TPHCM','0966486839',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV49','Cao Pham Khanh Mai','QUAN 12, TPHCM','09528392386',6000000,'CH02');
INSERT INTO   NHANVIEN VALUES ('NV50','Ho Khanh Thi','QUAN 12, TPHCM','09528392386',6000000,'CH02');




-- 5/ KHOHANG_QLKHO --

INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone01',100,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone02',200,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone03',200,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone05',200,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone06',100,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone08',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone09',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone10',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone12',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone14',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone16',100,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone17',100,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone18',125,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone22',125,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone23',125,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone25',125,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone26',175,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone27',175,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone30',175,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone31',175,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone32',250,'01/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone34',250,'01/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone35',250,'01/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone37',250,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone38',275,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone40',275,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone41',275,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone42',275,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone44',300,'07/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH01','Phone49',300,'07/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone01',50,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone02',50,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone04',200,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone05',200,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone07',100,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone08',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone09',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone10',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone12',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone14',150,'29/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone15',100,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone17',100,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone19',125,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone20',125,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone21',125,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone23',125,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone24',175,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone25',175,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone30',175,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone31',175,'30/10/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone32',250,'01/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone33',250,'01/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone35',250,'01/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone37',250,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone38',275,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone40',275,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone41',275,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone42',275,'05/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone44',300,'07/11/2022');
INSERT INTO  KHOHANG_QLKHO VALUES ('CH02','Phone49',300,'07/11/2022');


-- 6/ KHOHANG_NVBH -- 

INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone01','Het hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone02','Het hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone03','Het hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone05','Het hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone06','Het hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone08','Het hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone09','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone10','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone12','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone14','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone16','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone17','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone18','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone22','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone23','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone25','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone26','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone27','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone30','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone31','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone32','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone34','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone35','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone37','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone38','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone40','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone41','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone42','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone44','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH01','Phone49','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone01','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone02','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone04','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone05','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone07','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone08','Het hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone09','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone10','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone12','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone14','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone15','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone17','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone19','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone20','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone21','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone23','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone24','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone25','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone30','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone31','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone32','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone33','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone35','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone37','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone38','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone40','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone41','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone42','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone44','Con hang');
INSERT INTO  KHOHANG_NVBH VALUES ('CH02','Phone49','Het hang');


-- 7/ HOADON -- 
DELETE FROM  HOADON;

INSERT INTO  HOADON VALUES ('HD01','NV01','KH01','CH01','30/10/2022',22390000);
INSERT INTO  HOADON VALUES ('HD02','NV01','KH01','CH01','30/10/2022',44780000);
INSERT INTO  HOADON VALUES ('HD03','NV01','KH02','CH01','30/10/2022',21590000);
INSERT INTO  HOADON VALUES ('HD04','NV05','KH03','CH01','30/10/2022',64770000);
INSERT INTO  HOADON VALUES ('HD05','NV10','KH04','CH01','30/10/2022',24190000);
INSERT INTO  HOADON VALUES ('HD06','NV15','KH06','CH01','30/10/2022',24190000);
INSERT INTO  HOADON VALUES ('HD07','NV24','KH08','CH01','30/10/2022',29490000);
INSERT INTO  HOADON VALUES ('HD08','NV03','KH10','CH01','30/10/2022',41999000);
INSERT INTO  HOADON VALUES ('HD09','NV04','KH11','CH01','30/10/2022',90000000);
INSERT INTO  HOADON VALUES ('HD10','NV06','KH12','CH01','30/10/2022',90000000);
INSERT INTO  HOADON VALUES ('HD11','NV07','KH15','CH01','31/10/2022',49980000);
INSERT INTO  HOADON VALUES ('HD12','NV20','KH18','CH01','31/10/2022',74970000);
INSERT INTO  HOADON VALUES ('HD13','NV01','KH20','CH01','31/10/2022',80970000);
INSERT INTO  HOADON VALUES ('HD14','NV01','KH21','CH01','31/10/2022',26990000);
INSERT INTO  HOADON VALUES ('HD15','NV01','KH22','CH01','31/10/2022',26990000);
INSERT INTO  HOADON VALUES ('HD16','NV01','KH22','CH01','01/11/2022',5480000);
INSERT INTO  HOADON VALUES ('HD17','NV01','KH22','CH01','01/11/2022',5480000);
INSERT INTO  HOADON VALUES ('HD18','NV01','KH30','CH01','01/11/2022',5390000);
INSERT INTO  HOADON VALUES ('HD19','NV01','KH32','CH01','01/11/2022',22390000);
INSERT INTO  HOADON VALUES ('HD20','NV01','KH33','CH01','07/11/2022',22390000);
INSERT INTO  HOADON VALUES ('HD21','NV01','KH43','CH01','07/11/2022',4490000);
INSERT INTO  HOADON VALUES ('HD22','NV01','KH44','CH01','07/11/2022',4490000);
INSERT INTO  HOADON VALUES ('HD23','NV01','KH45','CH01','07/11/2022',4490000);
INSERT INTO  HOADON VALUES ('HD24','NV01','KH46','CH01','07/11/2022',4490000);
INSERT INTO  HOADON VALUES ('HD25','NV01','KH47','CH01','07/11/2022',4490000);
INSERT INTO  HOADON VALUES ('HD26','NV27','KH04','CH02','30/10/2022',18290000) ;
INSERT INTO  HOADON VALUES ('HD27','NV27','KH05','CH02','30/10/2022',36580000);
INSERT INTO  HOADON VALUES ('HD28','NV32','KH06','CH02','30/10/2022',18290000);
INSERT INTO  HOADON VALUES ('HD29','NV35','KH08','CH02','30/10/2022',58770000);
INSERT INTO  HOADON VALUES ('HD30','NV42','KH08','CH02','30/10/2022',19590000);
INSERT INTO  HOADON VALUES ('HD31','NV44','KH09','CH02','30/10/2022',19590000);
INSERT INTO  HOADON VALUES ('HD32','NV29','KH09','CH02','30/10/2022',22390000);
INSERT INTO  HOADON VALUES ('HD33','NV30','KH10','CH02','30/10/2022',21590000);
INSERT INTO  HOADON VALUES ('HD34','NV30','KH12','CH02','30/10/2022',43180000);
INSERT INTO  HOADON VALUES ('HD35','NV30','KH12','CH02','30/10/2022',36580000);
INSERT INTO  HOADON VALUES ('HD36','NV32','KH14','CH02','31/10/2022',36580000);
INSERT INTO  HOADON VALUES ('HD37','NV46','KH17','CH02','31/10/2022',54870000);
INSERT INTO  HOADON VALUES ('HD38','NV43','KH20','CH02','31/10/2022',72570000);
INSERT INTO  HOADON VALUES ('HD39','NV50','KH21','CH02','31/10/2022',24190000);
INSERT INTO  HOADON VALUES ('HD40','NV26','KH24','CH02','31/10/2022',24190000);
INSERT INTO  HOADON VALUES ('HD41','NV26','KH24','CH02','01/11/2022',24190000);
INSERT INTO  HOADON VALUES ('HD42','NV29','KH25','CH02','01/11/2022',24190000);
INSERT INTO  HOADON VALUES ('HD43','NV38','KH31','CH02','01/11/2022',29490000);
INSERT INTO  HOADON VALUES ('HD44','NV39','KH34','CH02','01/11/2022',41999000);
INSERT INTO  HOADON VALUES ('HD45','NV40','KH35','CH02','07/11/2022',41999000);
INSERT INTO  HOADON VALUES ('HD46','NV44','KH40','CH02','07/11/2022',26990000);
INSERT INTO  HOADON VALUES ('HD47','NV33','KH41','CH02','07/11/2022',26990000);
INSERT INTO  HOADON VALUES ('HD48','NV35','KH42','CH02','07/11/2022',5390000);
INSERT INTO  HOADON VALUES ('HD49','NV35','KH43','CH02','07/11/2022',5390000);
INSERT INTO  HOADON VALUES ('HD50','NV37','KH44','CH02','07/11/2022',5390000);

-- 8/ CTHD 
INSERT INTO  CTHD VALUES ('HD01','Phone09',01);
INSERT INTO  CTHD VALUES ('HD02','Phone10',02);
INSERT INTO  CTHD VALUES ('HD03','Phone12',01);
INSERT INTO  CTHD VALUES ('HD04','Phone14',03);
INSERT INTO  CTHD VALUES ('HD05','Phone16',01);
INSERT INTO  CTHD VALUES ('HD06','Phone17',01);
INSERT INTO  CTHD VALUES ('HD07','Phone18',01);
INSERT INTO  CTHD VALUES ('HD08','Phone22',01);
INSERT INTO  CTHD VALUES ('HD09','Phone25',02);
INSERT INTO  CTHD VALUES ('HD10','Phone26',02);
INSERT INTO  CTHD VALUES ('HD11','Phone27',02);
INSERT INTO  CTHD VALUES ('HD12','Phone30',03);
INSERT INTO  CTHD VALUES ('HD13','Phone31',03);
INSERT INTO  CTHD VALUES ('HD14','Phone32',01);
INSERT INTO  CTHD VALUES ('HD15','Phone34',01);
INSERT INTO  CTHD VALUES ('HD16','Phone47',01);
INSERT INTO  CTHD VALUES ('HD17','Phone48',01);
INSERT INTO  CTHD VALUES ('HD18','Phone40',01);
INSERT INTO  CTHD VALUES ('HD19','Phone09',01);
INSERT INTO  CTHD VALUES ('HD20','Phone10',01);
INSERT INTO  CTHD VALUES ('HD21','Phone41',01);
INSERT INTO  CTHD VALUES ('HD22','Phone41',01);
INSERT INTO  CTHD VALUES ('HD23','Phone42',01);
INSERT INTO  CTHD VALUES ('HD24','Phone42',01);
INSERT INTO  CTHD VALUES ('HD25','Phone42',01);
INSERT INTO  CTHD VALUES ('HD16','Phone48',03);
INSERT INTO  CTHD VALUES ('HD26','Phone01',01);
INSERT INTO  CTHD VALUES ('HD27','Phone02',02);
INSERT INTO  CTHD VALUES ('HD28','Phone04',01);
INSERT INTO  CTHD VALUES ('HD29','Phone05',03);
INSERT INTO  CTHD VALUES ('HD30','Phone07',01);
INSERT INTO  CTHD VALUES ('HD31','Phone08',01);
INSERT INTO  CTHD VALUES ('HD32','Phone09',01);
INSERT INTO  CTHD VALUES ('HD33','Phone12',01);
INSERT INTO  CTHD VALUES ('HD34','Phone14',02);
INSERT INTO  CTHD VALUES ('HD35','Phone01',02);
INSERT INTO  CTHD VALUES ('HD36','Phone01',02);
INSERT INTO  CTHD VALUES ('HD37','Phone02',03);
INSERT INTO  CTHD VALUES ('HD38','Phone15',03);
INSERT INTO  CTHD VALUES ('HD39','Phone15',01);
INSERT INTO  CTHD VALUES ('HD40','Phone15',01);
INSERT INTO  CTHD VALUES ('HD41','Phone17',01);
INSERT INTO  CTHD VALUES ('HD42','Phone17',01);
INSERT INTO  CTHD VALUES ('HD43','Phone20',01);
INSERT INTO  CTHD VALUES ('HD44','Phone21',01);
INSERT INTO  CTHD VALUES ('HD45','Phone23',01);
INSERT INTO  CTHD VALUES ('HD46','Phone32',01);
INSERT INTO  CTHD VALUES ('HD47','Phone33',01);
INSERT INTO  CTHD VALUES ('HD48','Phone35',01);
INSERT INTO  CTHD VALUES ('HD49','Phone35',01);
INSERT INTO  CTHD VALUES ('HD50','Phone35',01);

COMMIT;

--- ==========================  Yeu Cau 4 ===================================---

-- ================
--||   XOA CACHE  ||
-- ================

alter system flush shared_pool;
alter system flush buffer_cache;

-- =========================
--||   Kiểm tra thời gian  ||
-- =========================

SELECT * FROM TABLE(DBMS_XPLAN.display_cursor(format=>'ALLSTATS LAST'));

-- ===============================
--||   Câu truy vấn chưa tối ưu ||
-- ===============================

    SELECT /*+ GATHER_PLAN_STATISTICS */ TENKH, TENDT, MAUSAC, SOLUONG
    FROM CUAHANG CH, KHACHHANG KH, DIENTHOAI DT, NHANVIEN NV, HOADON HD, CTHD
    WHERE CH.MACH=HD.MACH AND HD.MAHD=CTHD.MAHD AND HD.MANV=NV.MANV
    AND HD.MAKH=KH.MAKH AND CTHD.MADT=DT.MADT AND TENNV='Nhat'
    AND NGAYHD='01/11/2022'AND CH.TENCH='QUAN BA DINH, HA NOI';


-- =======================================================
--||  Câu truy vấn đã tối ưu trong môi trường toàn cục   ||
-- =======================================================

Select /*+ GATHER_PLAN_STATISTICS */ TenKH, TenDT, MauSac,SoLuong
From (Select MaCH From CuaHang Where TenCH= 'QUAN BA DINH, HA NOI') CH JOIN
	(Select MaCH, MaHD, MaNV, MaKH From HoaDon Where NgayHD = '01/11/2022')  HD ON
	CH.MaCH =HD.MaCH JOIN (Select MaNV From NhanVien Where TenNV = 'Nhat') NV ON
	NV.MaNV = HD.MaNV JOIN (Select * From CTHD)  CTHD ON CTHD.MaHD = HD.MaHD JOIN
	(Select MaKH, TenKH From KhachHang) KH ON KH.MaKH=HD.MaKH JOIN 
	(Select MaDT, TenDT, MauSac From DienThoai) DT ON DT.MaDT = CTHD.MaDT

  -- ====================================================
--||   Câu truy vấn đã tối ưu trong môi trường phân tán  ||
-- ======================================================

Select /*+ GATHER_PLAN_STATISTICS */ TenKH, TenDT, MauSac,SoLuong
From (Select MaHD, MaNV, MaKH From CH2.HoaDon Where 
NgayHD = '01/11/2022') HD JOIN 
(Select MaNV From CH2.NhanVien Where TenNV = 'Nhat') NV ON 
NV.MaNV = HD.MaNV JOIN (Select * From CH2.CTHD) CTHD ON CTHD.MaHD = HD.MaHD 
JOIN (Select MaKH, TenKH From CH2.KhachHang) KH ON KH.MaKH=HD.MaKH 
JOIN (Select MaDT, TenDT, MauSac From CH2.DienThoai) DT ON DT.MaDT = CTHD.MaDT;

----------------------------------------------------------------------------



