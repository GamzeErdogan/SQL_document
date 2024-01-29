/*Odev Senaryo: Öğrenci ve Ders Kayıt Sistemi
1. Tablo Oluşturma
Soru 1: ogrenciler adında bir tablo oluşturun. Bu tablonun sütunları şunlar olsun:
ogrenci_id (int, primary key)
isim (varchar)
dogum_tarihi (date)
cinsiyet (char)*/
USE sys;
CREATE TABLE ogrenciler_yeni(
ogrenci_id INT PRIMARY KEY,
isim VARCHAR(20),
dogum_tarihi DATE,
cinsiyet CHAR(5)
);

/*Soru 2: dersler adında ikinci bir tablo oluşturun. Bu tablonun sütunları şunlar olsun:
ders_id (int, primary key)
ders_adi (varchar)
ogretmen (varchar)*/

CREATE TABLE dersler(
ders_id INT PRIMARY KEY,
ders_adi VARCHAR(25),
ogretmen VARCHAR(50)
);

/*2. Foreign Key ile İlişkisel Tablo Oluşturma
Soru 3: ogrenci_ders_kayit adında üçüncü bir tablo oluşturun. 
Bu tablo, öğrencilerin hangi derslere kayıtlı olduğunu göstermelidir. Sütunlar:
kayit_id (int, primary key)
ogrenci_id (int, foreign key - ogrenciler1 tablosundan)
ders_id (int, foreign key - dersler tablosundan)
yil (int)*/

CREATE TABLE ogrenci_ders_kayit(
kayit_id INT PRIMARY KEY,
ogrenci_id INT,
ders_id INT,
yil INT,
CONSTRAINT ogrenci_id_fk FOREIGN KEY(ogrenci_id) REFERENCES ogrenciler_yeni (ogrenci_id),
CONSTRAINT ders_id_fk FOREIGN KEY (ders_id) REFERENCES dersler(ders_id)
);

-- 3. Veri Ekleme
-- Soru 4: ogrenciler tablosuna en az üç öğrenci ekleyin.
INSERT INTO ogrenciler_yeni VALUES (1,'Selma Uzun','2000-01-21','Kadin');
INSERT INTO ogrenciler_yeni VALUES (2,'Ahmet Kisa','2001-12-10','Erkek');
INSERT INTO ogrenciler_yeni VALUES (3,'Ayse Guler','2002-03-25','Kadin');
INSERT INTO ogrenciler_yeni VALUES (4,'Mehmet Bakar','2003-04-07','Erkek');
INSERT INTO ogrenciler_yeni VALUES (5,'Fatma Kosar','2004-11-13','Kadin');

-- Soru 5: dersler tablosuna en az üç ders ekleyin.
INSERT INTO dersler VALUES (1,'Matematik','Kemal Sunal');
INSERT INTO dersler VALUES (2,'Fizik','Aysen Gruda');
INSERT INTO dersler VALUES (3,'Kimya','Munir Ozkul');
INSERT INTO dersler VALUES (4,'Biyoloji','Adile Nasit');
INSERT INTO dersler VALUES (5,'Tarih','Fatih Sonmez');

-- Soru 6: ogrenci_ders_kayit tablosuna, 
-- öğrencilerin hangi derslere kaydolduklarını gösteren kayıtlar ekleyin.
INSERT INTO ogrenci_ders_kayit VALUES (01,1,5,2022);
INSERT INTO ogrenci_ders_kayit VALUES (02,1,1,2022);
INSERT INTO ogrenci_ders_kayit VALUES (03,1,2,2023);
INSERT INTO ogrenci_ders_kayit VALUES (04,2,5,2022);
INSERT INTO ogrenci_ders_kayit VALUES (05,2,4,2023);
INSERT INTO ogrenci_ders_kayit VALUES (06,2,3,2023);
INSERT INTO ogrenci_ders_kayit VALUES (07,3,1,2022);
INSERT INTO ogrenci_ders_kayit VALUES (08,3,2,2023);
INSERT INTO ogrenci_ders_kayit VALUES (09,3,3,2024);
INSERT INTO ogrenci_ders_kayit VALUES (10,4,3,2022);
INSERT INTO ogrenci_ders_kayit VALUES (11,4,5,2023);
INSERT INTO ogrenci_ders_kayit VALUES (12,4,4,2024);
INSERT INTO ogrenci_ders_kayit VALUES (13,5,1,2022);
INSERT INTO ogrenci_ders_kayit VALUES (14,5,2,2023);
INSERT INTO ogrenci_ders_kayit VALUES (15,5,5,2024);
SELECT * FROM ogrenci_ders_kayit;

-- 4. Sorgulama
-- Soru 7: ogrenciler tablosundan tüm öğrencilerin isimlerini ve doğum tarihlerini seçin.
SELECT isim , dogum_tarihi FROM ogrenciler_yeni;

-- Soru 8: dersler tablosundan ders adı 'Matematik' olan dersin öğretmeninin ismini bulun
SELECT ogretmen FROM dersler WHERE ders_adi= 'Matematik';

-- Soru 9: ogrenci_ders_kayit tablosundan, 2023 yılında kayıt olan öğrencilerin ogrenci_idlerini ve ders ders_idlerini seçin.

SELECT ogrenci_id,ders_id FROM ogrenci_ders_kayit WHERE yil= '2023';

-- 5. İleri Seviye Sorgular
-- Soru 10: ogrenciler1 tablosundan cinsiyeti 'K' (Kadın) olan ve doğum tarihi 2000 ile 2005 arasında olan öğrencilerin isimlerini bulun

SELECT isim FROM ogrenciler_yeni WHERE cinsiyet='kadin' AND dogum_tarihi>'2000-01-01' AND dogum_tarihi<'2005-12-30';

-- Soru 11: ogrenci_ders_kayit tablosundan, ogrenci_idsi 1, 2 veya 3 olan öğrencilerin kayıtlarını bulun
SELECT * FROM ogrenci_ders_kayit WHERE ogrenci_id IN ('1','2','3');


