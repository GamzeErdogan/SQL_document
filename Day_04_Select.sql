USE sys;
/*====================================================================
                                SELECT - WHERE
====================================================================*/
/*
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin;
 SELECT ile birlikte WHERE komutu kullanilir.
*/
/*-----------------------------------Syntax--------------------------------
    SELECT field1,field2,field3
    FROM tablo_adi
    WHERE kosul;
    SELECT: Hangi sutunlari getirsin?
    FROM  : Hangi tablodan getirsin?
    WHERE : Hangi satirlari getirsin?
--------------------------------------------------------------------------*/
CREATE TABLE meslek_lisesi
(
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);
SELECT * FROM meslek_lisesi;
INSERT INTO meslek_lisesi VALUES('1001','Fatih Oz', 89,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');
-- Soru1: Meslek lisesinde kayıtlı ogrencilerin sadece isimlerini goruntuleyin.
SELECT isim
FROM meslek_lisesi;
-- Soru: Meslek lisesinde kayıtlı ogrencilerden derecesi 90'dan buyuk olanlari goruntuleyin.
SELECT *
FROM meslek_lisesi
WHERE derece>90;
-- Soru: Meslek lisesinde kayıtlı ogrencilerden derecesi 80'den kucuk olanlari goruntuleyin.
SELECT *
FROM meslek_lisesi
WHERE derece<80;
-- Soru: Meslek lisesinde kayıtlı ogrencilerden adresi 'ankara' olanlarin isim ve derece bilgilerini goruntuleyin.
SELECT isim,derece
FROM meslek_lisesi
WHERE adres='ankara';
-- Soru:Meslek lisesinde kayıtlı  '1005' okul numarali ogrencinin isim ve adres bilgilerini goruntuleyin.
SELECT isim,adres
FROM meslek_lisesi
WHERE okul_no='1005';
/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
SELECT *
FROM matematik
WHERE sinav1 < 50 AND sinav2 < 50;
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
*/
-- Soru: Meslek lisesinde kayıtlı ogrencilerden derecesi 70 ile 80 arasinda olanlarin okul_no ve adres bilgilerini goruntuleyin.
SELECT okul_no,adres
FROM meslek_lisesi
WHERE derece>70 AND derece<80;
SELECT okul_no,adres
FROM meslek_lisesi
WHERE derece>70 && derece<80;
-- Sql gunluk konusma dilinde calismayi hedeflemis bir sorgu dilidir. 
-- Bundan dolayi && isareti yerine AND kullanimi daha dogru bir kullanim olacaktir.
/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
SELECT *
FROM matematik
WHERE sinav1 < 50 OR sinav2 < 50;
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
*/
-- Soru: Meslek lisesinde kayıtlı ogrencilerden derecesi 70'den kucuk veya  80 den buyuk  olanlarin okul_no ve adres bilgilerini goruntuleyin
SELECT okul_no,adres
FROM meslek_lisesi
WHERE derece<70 OR derece>80;
SELECT okul_no,adres
FROM meslek_lisesi
WHERE derece<70 OR derece>95;
-- ----------------------- AND Negatif -----------------------------
SELECT okul_no, adres
FROM meslek_lisesi
WHERE derece>95 AND derece<80;
-- derece>95 sarti gerceklesmedigi icin ve AND komutu kullanildigi icin herhangi bir veri dondurmedi,bos liste dondurdu.
/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile (AND VEYA OR) tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name.    *su tablodan al
WHERE field_name.   *tablonun icinden su field'dan al
BETWEEN deger1 AND deger2;  *deger1 ve deger2 sinirlari dahil arasindakileri
=========================================================================================*/
CREATE TABLE ogretmen_lisesi
(
    id INT,
    isim VARCHAR(45),
    adres VARCHAR(100),
    sinav_notu DOUBLE
);
INSERT INTO ogretmen_lisesi VALUES(111,'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUES(112,'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUES(113,'Ilker Sahın', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUES(114,'Kadır Corumlu', 'Corum', 95);
INSERT INTO ogretmen_lisesi VALUES(115,'Selman Kasabalı', 'Ankara', 74);
INSERT INTO ogretmen_lisesi VALUES(116,'Murat Aycıcek', 'Izmır', 85);
INSERT INTO ogretmen_lisesi VALUES(117,'Tugba Ozsoy', 'Bolu', 88);
SELECT * FROM ogretmen_lisesi;
-- Soru: Ogretmen lisesinde kayıtlı ogrencilerden sinav_notu 70 ile 80 arasinda olanlarin id ve adres bilgilerini goruntuleyin.
SELECT id, adres 
FROM ogretmen_lisesi
WHERE sinav_notu
BETWEEN 70 AND 80;
SELECT id,adres
FROM ogretmen_lisesi
WHERE sinav_notu
BETWEEN 71 AND 79;  -- sinav notuna 70 ve 80'i dahil etmek istemiyorsak between 71 and 79 yapariz
SELECT id,adres
FROM ogretmen_lisesi
WHERE sinav_notu>70 AND sinav_notu<80; -- bu sorgulama cesidinde sinav notunda 70 ve 80 dahil deildir
-- Between komutu girilen araliklari da sonuca dahil ettigi icin istenilen araliklar net 
-- bir sekilde sorguya yazilmalidir.
-- Soru: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.
SELECT isim
FROM ogretmen_lisesi
WHERE isim
BETWEEN 'Muhammet Talha' AND 'Murat';
-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.Alfabetik siralama ile ve ASCII  degerlerine gore gelir.
SELECT isim
FROM ogretmen_lisesi
WHERE isim
BETWEEN 'Emine Yucel' AND 'Murat';
SELECT isim
FROM ogretmen_lisesi
WHERE isim
BETWEEN 'Muh' AND 'Mur';
CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);
INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Fatma',4300);
INSERT INTO personel VALUES('10007','Beyza Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);
SELECT *FROM personel;
-- Soru:id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
SELECT *
FROM personel
WHERE id
BETWEEN 10005 AND 10009;
-- Between komutu ile belli bir araliktaki kayitlari listelemek
-- istedigimizde; filtrelemeyi verilen araliga gore yapar,
-- yazdirmayi da tablodaki kayit sirasina gore yapar.
-- Soru:Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
SELECT *
FROM personel 
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli';
-- "SELECT * FROM personel WHERE isim BETWEEN 'Mehmet Yilmaz' AND 'Veli';" intellij 'e gonderirken bu formda gonderiyoruz!!!!!
-- Soru: Ismi Ahmet ile Ayse Fatma arasinda olan personel bilgilerini listeleyin
SELECT *
FROM personel
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse Fatma';
-- Soru: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
SELECT id
FROM personel
WHERE isim='Ayse' OR maas=7000;
-- Soru: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
SELECT isim
FROM personel
WHERE id='10001' OR id='10005' OR id='10008';
/*================================== SELECT-IN ===========================================
IN komutu birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmalidir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
IN (deger1,deger2,...);
*/
-- Soru: Personel tablosundan Id'si 10001, 10005 ya da 10008 olan
-- personel isimlerini listeleyin
SELECT isim
FROM personel
WHERE id
IN ('10001','10005','10008');
/*================================== SELECT-LIKE =============================================
LIKE keywordu ile sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field 
 LIKE pattern
 
 
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir (yani ne kadar karakter oldugu onemli deildir)
 _ ---> Tek bir karakteri temsil eder.(sadece bir karakteri temsil eder)
 
*/
-- Soru:Ismi A ile baslayan personeli listeleyiniz
SELECT *
FROM personel
WHERE isim
LIKE 'a%';
-- Soru:Isminde Ayse olan personelin isimlerini listeleyiniz
SELECT isim
FROM personel
WHERE isim
LIKE '%Ayse%';
-- Soru:Ismi a harfi ile biten personeli listeleyiniz
SELECT *
FROM personel
WHERE isim
LIKE '%a';  
-- Soru:Isminin 2. harfi e olan personeli listeleyiniz
SELECT *
FROM personel
WHERE isim
LIKE '_e%'; 
-- Soru:Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
SELECT *
FROM personel
WHERE isim LIKE '_e%' AND isim LIKE '%y%';

-- Isminde a harfi olmayan personeli listeleyiniz
SELECT * FROM personel WHERE isim NOT LIKE '%A%';

-- Maasi 5 haneli olan personeli listeleyiniz
SELECT *
FROM personel WHERE maas LIKE '_____';

-- ISMININ 1. harfi a ve 7. harfi a olan personeli listeleyiniz
SELECT *
FROM personel
WHERE isim LIKE 'A_____A%';

/*================================== SELECT-REGEXP_LIKE ================================== */

-- Daha karmasik pattern ile sorgulama islemi icin REGEXP_LIKE kullanilabilir.
  -- 'c' => case-sensitive demektir
  -- 'i' => case-insensitive demektir ve default case-insensitive aktiftir.

/*-----Syntax-----
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]','c'[]); */
 
 CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
INSERT INTO kelimeler VALUES
	(1001, 'hot', 3),
	(1002, 'hat', 3),
	(1003, 'hit', 3),
	(1004, 'hbt', 3),
	(1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
	(1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);





