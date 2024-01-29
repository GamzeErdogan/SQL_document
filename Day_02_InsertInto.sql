Use sys;
/*===============================================
			 VERI GIRISI - INSERT
===============================================*/
/*--------------------- Syntax -------------------
	INSERT INTO table_name
	VALUES
	(
	std_id CHAR(4),
	std_name VARCHAR(25),
	std_age INT
	);
--------------------------------------------------*/
/*-------------------- NOT -------------------------
   Degerleri girerken dikkat edilmesi gerekenler;
1- Tabloyu olustururken hangi data type belirlediysek o
   datatype cinsinden veri girisi yapmaliyiz
2- String ifadeleri 'tek tirnak' icinde yaziyoruz.
3- DATE data type'da String gibi 'tek tirnak' icinde yazilir.
4- MySQL'in default tarih formati YYYY-MM-DD seklindedir.
--------------------------------------------------*/
/*-------------------- NOT -------------------------
 1- Bir field'a kaydedilecek verileri UNIQUE yapmak icin
   table olustururken field isminin yanina UNIQUE yaziyoruz.
 2- Bir field kaydedilecek verilerde NULL olmasin istiyorsak
   table olustururken field isminin yanina NOT NULL yaziyoruz.
--------------------------------------------------*/
/* Fen Lisesi ogrencilerinin okul no, isim, derece,adres ve
son degisiklik tarihi bilgilerinin oldugu bir tablo hazirlayalim.
okul no field'i UNIQUE olmali
isim field'i bos birakilamamali.
*/

CREATE TABLE fen_lisesi(
okul_no INT UNIQUE,
isim VARCHAR(30) NOT NULL,
derece DOUBLE,
adres VARCHAR(50),
son_degisiklik_tarihi DATE );

INSERT INTO fen_lisesi VALUES(1001,'Burcu DURAK',4.8,'NIGDE','2024-01-24');
INSERT INTO fen_lisesi VALUES(1002,'Burcu DURAK',4.8,'NIGDE','2024-01-24');
INSERT INTO fen_lisesi VALUES(1003,'',4.8,'NIGDE','2024-01-24');

SELECT * FROM fen_lisesi;

/*-------------------- NOT -------------------------
 MYSQL'de UNIQUE olarak belirtilen fieldin data type String degilse
 istedigimiz kadar NULL deger girebiliyoruz.
 String data type'inda ise sadece bir defa Null (hiclik)
 deger girisi yapabiliyoruz.
--------------------------------------------------*/
/*------------------------ Q3 -----------------------
	okul_no, isim, adres, derece field'lari olan anadolu lisesi
	tablosu olusturun.
	okul no field'i CHAR data type'inda ve UNIQUE olmali.
	isim field'i NOT NULL olmali.
---------------------------------------------------*/
CREATE TABLE anadolu_lisesi(
okul_no char(7) UNIQUE,
isim VARCHAR (20) NOT NULL,
adres VARCHAR(50),
derece DOUBLE );

INSERT INTO anadolu_lisesi VALUES (0000001,'Gamze Cakir', 'Fransa', 5.0);
INSERT INTO anadolu_lisesi VALUES (0000002,'Halime Cakir', 'Fransa', 5.0);
INSERT INTO anadolu_lisesi VALUES (0000003,'Halime mahnur', 'Turkey', 5.0);

SELECT * FROM anadolu_lisesi;
 -- belirli fields lere veri girmek istersek
 -- Field larin yeri degisse bile values o siralamayla girersek sorun olmadan kayit edecektir
 INSERT INTO anadolu_lisesi (okul_no , isim ) VALUES ('1005','AYCA OVALI');
 INSERT INTO anadolu_lisesi (isim, okul_no ) VALUES ('1008','AYCA');
 
 








