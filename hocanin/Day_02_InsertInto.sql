USE sys;

/*===============================================
			 VERI GIRISI - INSERT
===============================================*/
/*--------------------- Syntax -------------------
	INSERT INTO table_name
	VALUES 
	(
	std_id CHAR(4),           *1001*
	std_name VARCHAR(25),     *Esra*
	std_age INT				  *20*
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

CREATE TABLE fen_lisesi
(
   okul_no INT UNIQUE,
   isim VARCHAR(30) NOT NULL,
   derece DOUBLE,
   adres VARCHAR(50),
   son_degisiklik_tarihi DATE
);

SELECT * FROM fen_lisesi;

INSERT INTO fen_lisesi VALUES(1001,'Burcu DURAK', 4.8, 'NIGDE','2024-01-24');
INSERT INTO fen_lisesi VALUES(1002,'Burcu DURAK', 4.8, 'NIGDE','2024-01-24');
INSERT INTO fen_lisesi VALUES(1003,'', 4.8, 'NIGDE','2024-01-24');
INSERT INTO fen_lisesi VALUES(1004,4.8, 'NIGDE','2024-01-24');
INSERT INTO fen_lisesi VALUES(1005,null, 4.8, 'NIGDE','2024-01-24');
INSERT INTO fen_lisesi VALUES(1006,'Zehra D', 4.7, 'Istanbul','2024-01-24');
INSERT INTO fen_lisesi VALUES(1007,'Reyhan Yilmaz', 4.9, 'Ankara','2024-01-24');
INSERT INTO fen_lisesi VALUES(1008,'Beytullah Gorgulu', 4.5, 'Akhisar','2024-01-24');
INSERT INTO fen_lisesi VALUES(1009,'Azim Kaya', 4.6, 'Mersin','2024-01-24');
INSERT INTO fen_lisesi VALUES(1010,'Zeliha Selcuk', 4.8, 'Bolu','2024-01-24');
INSERT INTO fen_lisesi VALUES(null,'Osman', 4.8, 'Antalya','2024-01-24');
INSERT INTO fen_lisesi VALUES(null,'Fatma', 4.8, 'Antalya','2024-01-24');
INSERT INTO fen_lisesi VALUES(null,'Ali', 4.8, 'Antalya','2024-01-24');

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

CREATE TABLE anadolu_lisesi_yeni
(
	okul_no CHAR(4) UNIQUE,
    isim VARCHAR(25) NOT NULL,
    adres VARCHAR(25),
    derece DOUBLE
);
SELECT * FROM anadolu_lisesi_yeni;

INSERT INTO anadolu_lisesi_yeni VALUES('1006', 'Yusuf','Akhisar', 9.9);
INSERT INTO anadolu_lisesi_yeni VALUES('1000','ŞEVVAL TUFEKCI','ALMANYA',4.9);
INSERT INTO anadolu_lisesi_yeni VALUES('1002','Zehra','istanbul',3.12);
INSERT INTO anadolu_lisesi_yeni VALUES('1','Reyhan','Eskisehir',9.9); 
INSERT INTO anadolu_lisesi_yeni VALUES('1001','ESRA YILMAZ','CANNES',4.9);


-- Field'larin yeri degisse bile values o siralamayla girersek sorun olmadan kayit edecektir.

INSERT INTO anadolu_lisesi_yeni (okul_no, isim) VALUES('1005','Ayca OVALI');
INSERT INTO anadolu_lisesi_yeni ( isim, okul_no) VALUES('iHSAN ALTUNISIK', '1007');





