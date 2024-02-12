USE sys;

/*====================================================================
				  				SELECT - WHERE
====================================================================*/
-- Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin 
-- SELECT ile birlikte WHERE komutu kullanilir.

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

-- Soru: Meslek lisesinde kayıtlı ogrencilerden derecesi 90'dan buyuk olanlari
-- goruntuleyin.


SELECT *
FROM meslek_lisesi
WHERE derece>90;

-- Soru: Meslek lisesinde kayıtlı ogrencilerden derecesi 80'den kucuk olanlari
-- goruntuleyin.

SELECT *
FROM meslek_lisesi
WHERE derece<80;

-- Soru: Meslek lisesinde kayıtlı ogrencilerden adresi 'ankara' 
-- olanlarin isim ve derece bilgilerini goruntuleyin.

SELECT isim, derece
FROM meslek_lisesi
WHERE adres = 'ankara';


-- Meslek lisesinde kayıtlı '1005' okul numarali ogrencinin 
-- ismini ve adres bilgilerini goruntuleyin.


SELECT isim,adres
FROM meslek_lisesi 
WHERE okul_no = '1005';


/*========================== AND (ve) Operatoru Kullanimi ==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez. 

SELECT * 
FROM matematik 
WHERE sinav1 < 50 AND sinav2 < 50;

Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.

*/

-- Soru: Meslek lisesinde kayıtlı ogrencilerden derecesi 70 ile 80 arasinda olanlarin 
-- okul_no ve adres bilgilerini goruntuleyin.

SELECT okul_no, adres
FROM meslek_lisesi
WHERE derece>70 AND derece<80;

-- Sql gunluk konusma dilinde calismayi hedeflemis bir sorgu dilidir. 
-- Bundan dolayi && isareti yerine AND kullanimi daha dogru bir kullanim olacaktir.

SELECT okul_no, adres
FROM meslek_lisesi
WHERE derece>70 && derece<80;

/*========================== OR (veya) Operatoru Kullanimi ==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.

SELECT * 
FROM matematik 
WHERE sinav1 < 50 OR sinav2 < 50
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
*/

-- Soru: Meslek lisesinde kayıtlı ogrencilerden derecesi 70'den kucuk veya  
-- 80 den buyuk  olanlarin okul_no ve adres bilgilerini goruntuleyin

SELECT okul_no, adres
FROM meslek_lisesi
WHERE derece<70 OR derece>80;


SELECT okul_no, adres
FROM meslek_lisesi
WHERE derece<70 OR derece>95;

-- ----------------------- AND Negatif -----------------------------

SELECT okul_no, adres
FROM meslek_lisesi
WHERE derece>95 AND derece<80;


/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.

-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;

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

-- Soru: Ogretmen lisesinde kayıtlı ogrencilerden sinav_notu 
-- 70 ile 80 arasinda olanlarin ID ve adres bilgilerini goruntuleyin.

SELECT *
FROM ogretmen_lisesi
WHERE sinav_notu >70 AND sinav_notu <80;


SELECT id, adres 
FROM ogretmen_lisesi
WHERE sinav_notu
BETWEEN 70 AND 80;

SELECT id, adres 
FROM ogretmen_lisesi
WHERE sinav_notu
BETWEEN 71 AND 79;

-- Between girilen aralikalri da sonuca dahil ettigi icin istenilen aralikalr net 
-- bir sekilde sorguya yazilmali.


-- Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.

SELECT isim
FROM ogretmen_lisesi
WHERE isim
BETWEEN 'Muhammet Talha' AND 'Murat';


-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.

SELECT isim
FROM ogretmen_lisesi
WHERE isim
BETWEEN 'Emine Yucel' AND 'Murat';


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

SELECT * FROM personel;


-- id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele

SELECT *
FROM personel
WHERE id
BETWEEN 10005 AND 10009;

-- Between komutu ile belli bir araliktaki kayitlari listelemek 
-- istedigimizde; filtrelemeyi verilen araliga gore yapar,
-- yazdirmayi da tablodaki kayit sirasina gore yapar,


-- Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin


SELECT *
FROM personel
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli';


-- Ismi Ahmet ile Ayse Fatma arasinda olan personel bilgilerini listeleyin

SELECT *
FROM personel
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse Fatma';

-- Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin

SELECT id
FROM personel
WHERE isim = 'Ayse' OR maas = 7000;

-- Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin

SELECT isim
FROM personel 
WHERE id= '10001' OR id = '10005' OR id = '10008';


/*============================== SELECT-IN =====================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek 
komutla yazabilme imkani verir.
 IN icerisine yazacagimiz sartlar ayni field'a ait olmali.

----- Syntax -----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
IN (deger1,deger2,...);

*/

-- Personel tablosundan Id'si 10001, 10005 ya da 10008 olan 
-- personel isimlerini listeleyin

SELECT isim
FROM personel
WHERE id  
IN ('10001','10005','10008');

/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.

-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field 
 LIKE pattern

Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir (yani ne kadar karakter oldugu onemli degildir.)
 _ ---> Tek bir karakteri temsil eder. (sadece bir karakteri temsil eder)
 
 */
 USE sys;
-- Ismi A ile baslayan personeli listeleyiniz 
 
 SELECT *
 FROM personel
 WHERE isim
 LIKE 'a%';
 
 -- Isminde Ayse olan personelin isimlerini listeleyiniz.
 
 SELECT *
 FROM personel
 WHERE isim
 LIKE '%Ayse%';
 
 -- Ismi a harfi ile biten personeli listeleyiniz
 
SELECT *
FROM personel
WHERE isim
LIKE '%a';

-- Isminin 2. harfi e olan personeli listeleyiniz

SELECT *
FROM personel
WHERE isim
LIKE '_e%';

-- Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz

 SELECT *
 FROM personel
 WHERE isim LIKE '_e%' AND isim LIKE'%y%';

-- Isminde a harfi olmayan personeli listeleyiniz

SELECT *
FROM personel
WHERE isim 
NOT LIKE '%a%';

-- Maasi 5 haneli olan personelin isimlerini listeleyiniz

SELECT isim
FROM personel
WHERE maas
LIKE '_____';


-- ISMININ 1. harfi a ve 7. harfi a olan personeli listeleyiniz

SELECT * 
FROM personel
WHERE isim
LIKE 'a_____a%'; 

/*================================== SELECT-REGEXP_LIKE ==================================

Daha karmasik pattern ile sorgulama islemi icin REGEXP_LIKE kullanilabilir.
  -- 'c' => case-sensitive demektir
  -- 'i' => case-insensitive demektir ve default case-insensitive aktiftir.

-----Syntax-----

 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]','c'[]);
 
 */
 
 CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );

SELECT * FROM kelimeler;

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


-- NOT: VEYA islemi icin | karakteri kullanilir.
-- Q1 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e 
-- dikkat ederek listele

SELECT kelime  -- field
FROM kelimeler  -- table
WHERE REGEXP_LIKE (kelime, 'ot|at', 'c'); 

-- Q1 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e 
-- dikkat etmeden listeleyiniz.

 SELECT kelime
 FROM kelimeler
 WHERE REGEXP_LIKE (kelime, 'ot|at' );
 
 -- NOT: Baslangici gostermek icin ^ karakteri kullanilir.
 
 -- Q1 : 'ho' veya 'hi' ile baslayan kelimeleri case-sensitive'e 
-- dikkat etmeksizin listele

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime, '^ho|^hi' );

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime,'^(ho|hi)');

-- NOT: Bitisi gostermek icin $ karakteri kullanilir.

-- Q2 : Sonu 't' veya 'm' ile bitenleri case-sensitive'e 
-- dikkat etmeksizin listele

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime, 't$|m$');


-- NOT : [!-~] = Butun karakterleri ifade eder.
--       [a-zA-Z0-9] = Harf ve rakamlari temsil eder.
			

 -- Q3 : h ile baslayip t ile biten 3 harfli kelimeleri 
-- (h ile t kucuk harfli olanlari) listeleyiniz

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime, 'h[!-~]t', 'c');


--  h ile baslayip t ile biten 2. karakteri rakam olan 3 harfli 
-- kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
 
 
SELECT kelime 
FROM kelimeler
WHERE REGEXP_LIKE (kelime, 'h[0-9]t', 'c');

-- h ile baslayip t ile biten 2. karakteri buyuk harf olan 3 harfli 
-- kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE (kelime,'h[A-Z]t','c');

-- 2. harfi 'O' olan 3 harfli kelimeleri (o harfi buyuk olanlari) 
-- ve id'lerini listeleyiniz

SELECT kelime,id
FROM kelimeler
WHERE REGEXP_LIKE (kelime, '^[a-zA-Z0-9]O[a-zA-Z0-9]$', 'c');


SELECT kelime,id
FROM kelimeler
WHERE REGEXP_LIKE (kelime, '^[!-~]O[!-~]$', 'c');


SELECT kelime,id
FROM kelimeler
WHERE REGEXP_LIKE (kelime, '^.[O].$', 'c');















