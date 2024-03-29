-- Bu bir yorum SATIRIDIR.

/*
Bu bir yorum BLOGUDUR.
*/

/*===============================================
		TABLO OLUSTURMA (CRUD - Create)
===============================================*/

/*--------------------- Syntax -------------------
	CREATE TABLE table_name
	(
	 field_name DATATYPE,
	 field_name DATATYPE,
	 field_name DATATYPE,
	 field_name DATATYPE,
	 field_name DATATYPE,
	);
--------------------------------------------------*/

-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler tablosunu olusturun.

USE sys;
-- Queryler database uzerinde islem yapabilmesi icin database secimi icin bu query
-- en once bir defa calistirilir.


CREATE TABLE ogrenciler
(
 id CHAR(4),
 isim VARCHAR(20),
 not_ortalamasi DOUBLE,
 adres VARCHAR(100),
 son_degistirme_tarihi DATE
);

SELECT * FROM ogrenciler;
-- Eger tum tabloyu gormek istersek bu query execute edilir.

-- NOT! SQL de field isimleri kebap_case olarak yazilmalidir.


/*------------------------ Q1 -----------------------
	"tedarikciler" isminde bir tablo olusturun.
	Olusturdugunuz "tedarikciler" tablosunda
	"tedarikci_id", "tedarikci_ismi", "tedarikci_adres"
	ve "ulasim_tarihi" field'lari olsun.
---------------------------------------------------*/


	CREATE TABLE tedarikciler
    (
    tedarikci_id CHAR(4),
    tedarikci_ismi VARCHAR(20),
    tedarikci_adres VARCHAR(50),
    ulasim_tarihi DATE
    );

SELECT * FROM tedarikciler;

/*===============================================
		VAR OLAN TABLODAN TABLO OLUSTURMA
===============================================*/

/*--------------------- Syntax -------------------
	CREATE TABLE table_name
	AS
	SELECT field1, field2 
	FROM other_table_name;
--------------------------------------------------*/

/* Ogrenciler tablosundan "isim" ve "not_ortalamasi"
 field'larini alarak "ogrenci_derece" isimli yeni 
 bir tablo olusturun.
*/

CREATE TABLE ogrenci_derece
AS
SELECT isim, not_ortalamasi 
FROM ogrenciler;

SELECT * FROM ogrenci_derece;

/*------------------------ Q2 -----------------------
	"tedarikciler" table'indan "tedarikci_ismi" ve
	"ulasim_tarihi" field'larini alarak "tedarikciler_son"
	isminde yeni bir table olusturun. 
---------------------------------------------------*/

CREATE TABLE tedarikciler_son
AS
SELECT tedarikci_ismi, ulasim_tarihi
FROM tedarikciler;

SELECT * FROM tedarikciler_son;

/*------------------------------------------------------------------
Tablo Oluşturma
Bir veritabanında 'musteriler' adında yeni bir tablo oluşturun. 
Bu tablonun aşağıdaki sütunları içermesi gerekmektedir:

musteri_id: Bu, bir tamsayı olmalıdır.
isim: Müşterinin ismini tutan bir metin sütunu.
email: Müşterinin e-posta adresini tutan bir metin sütunu.
dogum_tarihi: Müşterinin doğum tarihini tutan bir tarih sütunu.
Bu tabloyu oluşturacak SQL komutunu yazın.

............................................................................
Yeni Tablo Oluşturma
Yukarıda oluşturduğunuz 'musteriler' tablosunu kullanarak, 
sadece isim ve email sütunlarını içeren 'iletisim_bilgileri' 
adında yeni bir tablo oluşturun. Bu yeni tablonun ayrıca 'id' adında bir sütunu olmalıdır.

Bu yeni tabloyu ve ilgili verileri içerecek şekilde SQL komutunu yazın.


----------------------------------------------------------------------------------*/

CREATE TABLE musteriler
(
	musteri_id INT ,
    isim VARCHAR(50),
    email VARCHAR(25),
    dogum_tarihi DATE
);


CREATE TABLE iletisim_bilgileri
AS
SELECT isim, email 
FROM musteriler; 


CREATE TABLE iletisim_bilgileri2
(
id INT,
isim1 VARCHAR(20),
email1 VARCHAR(25)
);
 
 INSERT INTO iletisim_bilgileri2 (isim1, email1)
 SELECT isim, email FROM musteriler;

SELECT * FROM musteriler;
SELECT * FROM iletisim_bilgileri;
SELECT * FROM iletisim_bilgileri2;

use sys;
select * from cocuklar;


