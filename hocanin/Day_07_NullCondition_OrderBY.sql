USE SYS;
/* ======================== IS NULL CONDITION ===========================
    Arama yapilan field'da NULL degeri almis kayitlari getirir.
======================================================================*/
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

Select *from insanlar;

-- Ismı null olan kayıtları lısteleyınız
SELECT * 
FROM insanlar
WHERE isim IS NULL;

-- ısmı null olan kayıtları 'isimsiz' olarak guncelleyın

UPDATE insanlar
SET isim = 'isimsiz'
WHERE isim IS NULL;

-- ismi null olan kayitlari siliniz

DELETE FROM insanlar
WHERE isim IS NULL;

-- ismi null olmayanlari siliniz.

DELETE FROM insanlar
WHERE isim IS NOT NULL;





/* ======================== ORDER BY ===========================
=> ORDER BY komutu belli bir field'a gore NATURAL ORDER olarak siralama
yapmak icin kullanilir.
=> ORDER BY komutu sadece SELECT komutu ile kullanilir.
=> ORDER BY komutuna ozel olarak, siralama yapacagimiz field ismi yerine 
field sirasini da yazabiliriz.
=> Kayitlari natural order'a gore siralamak icin sorgunun sonuna 
 ORDER BY (field_name) yazmak yeterlidir.
=> Kayitlari ters siralama ile yazdirmak isterseniz DESC yaziyoruz.
=> Kayitlari natural siralama ile yazdirmak isterseniz ASC yaziyoruz.
Ancak default deger ASC oldugu icin DESC yazilmadigi surece ASC gecerlidir.
=> Ayni degerde olan kayitlari, tablodaki kayit sirasina gore getirir.
==============================================================*/

CREATE TABLE insanciklar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO insanciklar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanciklar VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanciklar VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanciklar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanciklar VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanciklar VALUES (345678901, 'Ali','Yilmaz', 'Istanbul');

SELECT * FROM insanciklar;

-- Insanciklar tablosundaki datalari adres'e gore siralayin 

SELECT * 
FROM insanciklar
ORDER BY (adres) ASC;

SELECT *
FROM insanciklar
ORDER BY (4);

-- Ismi Mine olanlari soyisim sirali olarak listeleyen Query yaziniz.

SELECT * 
FROM insanciklar
WHERE isim='Mine'
ORDER BY (soyisim);

-- Ismi Mine olanlari soyisim ters sirali olarak listeleyen Query yaziniz.

SELECT * 
FROM insanciklar
WHERE isim='Mine'
ORDER BY (soyisim) DESC;

-- Insanciklar tablosundaki soyismi BULUT olanlari 
-- isim sirali olarak listeleyin.

SELECT * 
FROM insanciklar 
WHERE soyisim= 'Bulut'
ORDER BY (isim);

-- Insanciklar tablosundaki soyismi BULUT iceren 
-- isim sirali olarak listeleyin.

SELECT *
FROM insanciklar
WHERE soyisim LIKE '%bulut%'
ORDER BY (2);

-- Insanciklar tablosundaki tum kayitlari SSN numarasina gore siralayin.

SELECT * 
FROM insanciklar
ORDER BY(ssn);

-- Insanciklar tablosundaki tum kayitlari 
-- SSN numarasi buyukten kucuge olarak siralayin.

SELECT * 
FROM insanciklar
ORDER BY(ssn) DESC;

-- Insanciklar tablosundaki tum kayitlari Soyisimler ters sirali, 
-- isimler Natural sirali olarak listeleyin.

SELECT * 
FROM insanciklar
ORDER BY soyisim DESC, isim ASC;

-- Insanciklar tablosundaki tum kayitlari adresler ters sirali,
-- isimler ters sirali olarak listeleyin.

SELECT *
FROM insanciklar
ORDER BY adres DESC, isim DESC;


-- Insanciklar tablosundaki tum kayitlari adresler ters sirali,
-- isimler ters sirali, soyisimler ters sirali olarak listeleyin.

SELECT *
FROM insanciklar
ORDER BY adres DESC,isim DESC, soyisim DESC;







