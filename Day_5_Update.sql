USE sys;
/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.

-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;
UPDATE islemlerinin yapilabilmesi icin Ayarlar -> SQL Editor -> "Safe Updates" check box'indaki
tik isaretini kaldirip kaydetmemiz gerekiyor, sonrasinda MySQL'i kapatip tekrar acmaliyiz
*/
/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun.
id ve isim field'lari PRIMARY KEY olsun.
---------------------------------------------------------------------------------------*/

CREATE TABLE firmalar(
id int,
isim VARCHAR(30),
iletisim_isim VARCHAR(30),
CONSTRAINT id_isim_pk PRIMARY KEY (id,isim)
);

/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'),
(2, 'RDB', 'Veli Gul'),
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/
INSERT INTO firmalar VALUES
(1, 'ACB', 'Ali Can'),
(2, 'RDB', 'Veli Gul'),
(3, 'KMN', 'Ayse Gulmez');

SELECT * FROM firmalar;

-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz.
UPDATE firmalar SET isim = 'KRM' WHERE id=3;


-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.
UPDATE firmalar SET id=4  WHERE iletisim_isim = 'Veli Gul';
UPDATE firmalar SET isim = 'FDS' WHERE iletisim_isim = 'Veli Gul';
-- ikinci yol
UPDATE firmalar SET id=4, isim='FDS' WHERE iletisim_isim = 'Veli Gul';

-- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.
UPDATE firmalar SET iletisim_isim='Osman Can' WHERE isim = 'ACB';

-- Iletisim ismi 'Osman Can' olan firmanin iletisim ismini 'Ayse Can' olarak guncelleyiniz.
UPDATE firmalar SET iletisim_isim='Ayse Can' WHERE  iletisim_isim='Osman Can';

-- id, isim ve irtibat fieldlarinin oldugu bir tedarik tablosu olusturun.
-- id field'ini Primary Key yapin.

CREATE TABLE tedarik(
id int PRIMARY KEY,
isim varchar(20),
irtibat  varchar(20)
);

-- tedarikci_id, urun_id, urun_isim, musteri_isim fieldlari olan urun
-- tablosu olusturun
-- Bu tablodaki tedarikci_id fieldinin tedarik tablosunun PK si ile Foreign -- Key baglantisini kurun

CREATE TABLE urun_tablosu(
tedarikci_id INT,
urun_id INT,
urun_isim VARCHAR(20),
musteri_isim  VARCHAR(20),
CONSTRAINT tedarikci_id_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarik(id)
);
INSERT INTO tedarik VALUES(100, 'IBM', 'Ali Can');
INSERT INTO tedarik VALUES(101, 'APPLE', 'Merve Temiz');
INSERT INTO tedarik VALUES(102, 'SAMSUNG', 'Kemal Can');
INSERT INTO tedarik VALUES(103, 'LG', 'Ali Can');
INSERT INTO urun_tablosu VALUES(100, 1001,'Laptop', 'Suleyman');
INSERT INTO urun_tablosu VALUES(101, 1002,'iPad', 'Fatma');
INSERT INTO urun_tablosu VALUES(102, 1003,'TV', 'Ramazan');
INSERT INTO urun_tablosu VALUES(103, 1004,'Phone', 'Ali Can');

SELECT * FROM tedarik;
SELECT * FROM urun_tablosu;

-- 'LG' firmasinda calisan 'Ali Can'in ismini 'Veli Can'
-- olarak degistiriniz.
UPDATE tedarik SET irtibat ='Veli Can' WHERE  isim='LG';

/* a) Urun tablosundan Ali Can'in aldigi urunun ismini,
tedarik tablosunda irtibat Merve Temiz olan
sirketin ismi ile degistirin. */

UPDATE urun_tablosu SET urun_isim = (SELECT isim FROM tedarik WHERE irtibat = 'Merve Temiz') 
WHERE musteri_isim = 'Ali Can';


-- Urun tablosundaki TV satin alan musterinin ismini,
-- tedarik tablosundaki IBM'in irtibat'i ile degistirin.
UPDATE urun_tablosu SET musteri_isim =(SELECT irtibat FROM tedarik WHERE isim='IBM')
WHERE urun_isim='TV';

-- urun id'si 1001 olan urun ismini,
-- id'si 102 olan sirketin ismi ile degistirin.

UPDATE urun_tablosu SET urun_isim=(SELECT isim FROM tedarik WHERE id=102)
WHERE urun_id=1001;

-- Cocuklar tablosu olusturun.
-- Icinde id,isim,veli_isim ve grade field'lari olsun.
-- Id field'i Primary Key olsun

CREATE TABLE cocuklar(
id INT,
isim VARCHAR(20),
veli_isim VARCHAR(10),
grade DOUBLE,
CONSTRAINT id_pk PRIMARY KEY (id)
);

INSERT INTO cocuklar values
(123, 'Ali Can', 'Hasan',75),
 (124, 'Merve Gul', 'Ayse',85),
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85),
 (127, 'Oguz Karaca', 'Tuncay',85),
 (128, 'Resul Can', 'Tugay',85),
 (129, 'Tugay Kala', 'Osman',45);
 
 CREATE TABLE puanlar(
ogrenci_id INT,
ders_adi VARCHAR(10),
yazili_notu DOUBLE,
CONSTRAINT puanlar_fk
FOREIGN KEY (ogrenci_id)
REFERENCES cocuklar (id)
);
INSERT INTO puanlar VALUES ('123','kimya',75);
INSERT INTO puanlar VALUES ('124','fizik',65);
INSERT INTO puanlar VALUES ('125','tarih',90);
INSERT INTO puanlar VALUES ('126','kimya',87);
INSERT INTO puanlar VALUES ('127','tarih',69);
INSERT INTO puanlar VALUES ('128','kimya',93);
INSERT INTO puanlar VALUES ('129','fizik',25);
SELECT * FROM puanlar;
SELECT * FROM cocuklar;


-- Tum cocuklarin gradelerini puanlar tablosundaki yazili_notu ile update edin.
UPDATE cocuklar SET grade =(SELECT yazili_notu 
							FROM puanlar WHERE ogrenci_id=cocuklar.id
							);		

-- Ismi Kemal Yasa olan ogrencinin grade'ini puanlar tablosundaki
-- ogrenci id'si 128 olan yazili notu ile update edin.
UPDATE cocuklar SET grade =(SELECT yazili_notu
							FROM puanlar
                            WHERE ogrenci_id=128)
WHERE isim='Kemal Yasa';
-- ************************************************burda kaldim

-- Tum cocuklarin veli isimlerini puanlar tablosundaki ders_adi ile update edin.

-- UPDATE cocuklar SET veli_isim = (SELECT );

CREATE TABLE mart_satislar
(
 urun_id int,
 musteri_isim varchar(20),
 urun_isim varchar(10),
 urun_fiyat int
);
INSERT INTO mart_satislar VALUES (10, 'Ali', 'Honda',75000);
INSERT INTO mart_satislar VALUES (10, 'Ayse', 'Honda',95200);
INSERT INTO mart_satislar VALUES (20, 'Hasan', 'Toyota',107500);
INSERT INTO mart_satislar VALUES (30, 'Mehmet', 'Ford', 112500);
INSERT INTO mart_satislar VALUES (20, 'Ali', 'Toyota',88000);
INSERT INTO mart_satislar VALUES (10, 'Hasan', 'Honda',150000);
INSERT INTO mart_satislar VALUES (40, 'Ayse', 'Hyundai',140000);
INSERT INTO mart_satislar VALUES (20, 'Hatice', 'Toyota',60000);
SELECT * FROM mart_satislar;

-- 1) Ismi hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin

-- 2) Ismi Hasan olan musterinin urun_id'sini 30 yapin
UPDATE mart_satislar SET urun_id = 30 WHERE musteri_isim = 'Hasan';

-- 3) Toyota marka araclara %10 indirim yapin
UPDATE mart_satislar
SET urun_fiyat = urun_fiyat*0.9
WHERE urun_isim='Toyota';

-- 4) Ismi A ile baslayan butun musterilerin urun_fiyatlarini %15 artirin
UPDATE mart_satislar
SET urun_fiyat = urun_fiyat * 1.15
WHERE urun_isim like 'A%';


