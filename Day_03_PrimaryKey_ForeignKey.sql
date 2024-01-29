USE sys;
/*============================ Primary Key ============================
1- Primary Key bir row'u tanimlayan bir field veya birden fazla field kombinasyonudur.
2- Primary Key UNIQUE'dir
3- Bir tabloda en fazla bir Primary Key Olabilir.
4- Primary Key column'da hicbir data NULL olamaz. */

-- Bir field Primary Key yapmak icin 2 farkli yol vardir;
/*--------------------- Syntax 1 -------------------
	Data Type'dan sonra "PRIMARY KEY" yazarak
	CREATE TABLE students_table
	(
		id INT PRIMARY KEY,
		name VARCHAR(50) NOT NULL,
		grade INT,
		adres VARCHAR(100),
		last_update DATE
	);
--------------------------------------------------*/
/*--------------------- Syntax 2 -------------------
	CONSTRAINT Keyword'u kullanilarak PRIMARY KEY tanimlanabilir.
	"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n);"
	CREATE TABLE students_table
	(
		id INT ,
		name VARCHAR(50) NOT NULL,
		grade INT,
		adres VARCHAR(100),
		last_update DATE
		CONSTARINT id_pk PRIMARY KEY (id)
	);
--------------------------------------------------*/
/*------------------------------- Q4 -------------------------------
	"sehirler" isimli bir table olusturun.
	Tabloda "alan_kodu", "isim", "nufus" fieldlari olsun.
	"isim" field'i bos birakilamasin.
	1. yolu kullanarak "alan_kodu" field'ini primary key yapin
-------------------------------------------------------------------*/
CREATE TABLE sehirler
(
alan_kodu INT PRIMARY KEY,
isim VARCHAR(30) NOT NULL,
nufus BIGINT
);
SELECT * FROM sehirler;

/*------------------------------- Q5 -------------------------------
	"ogretmenler" isimli bir table olusturun.
	Tabloda "id", "isim", "brans", "cinsiyet" fieldlari olsun.
	"id" field'i tekrarli veri kabul etmesin.
	2. yolu kullanarak "id" ve "isim" field'larini primary key yapin
-------------------------------------------------------------------*/

CREATE TABLE ogretmenler
(
id CHAR(4) UNIQUE,
isim VARCHAR(20),
brans VARCHAR(20),
cinsiyet CHAR(5),
CONSTRAINT ogretmenler_pk PRIMARY KEY(id, isim)
);
SELECT * FROM ogretmenler;

/*------------------------------- Q6 -------------------------------
	"universite_ogrenci_bilgi_sistemi" isimli bir table olusturun.
	Tabloda "giris_yili", "giris_siralamasi", "isim", "bolum" field'lari olsun.
	"isim" field'i NULL deger kabul etmesin.
	2. yolu kullanarak "giris_yili" ve "giris_siralamasi" field'larini primary key yapin
-------------------------------------------------------------------*/
CREATE TABLE universite_ogrenci_bilgi_sistemi
(
giris_yili YEAR,
giris_siralamasi INT,
isim VARCHAR(20) NOT NULL,
bolum VARCHAR(20),
CONSTRAINT student_pk PRIMARY KEY(giris_yili,giris_siralamasi)
);
SELECT *FROM universite_ogrenci_bilgi_sistemi;

/*============================ Foreign Key ============================
1- Foreign Key iki tablo arasında Relation oluşturmak için kullanılır.
2- Foreign Key başka bir tablonun Primary Key’ine bağlıdır.
3- Referenced table (bağlanılan tablo, Primary Key’in olduğu tablo)  Parent Table olarak da adlandırılır. Foreign Key’in olduğu tablo ise  Child Table olarak da adlandırılır.
4- Bir tabloda birden fazla Foreign Key olabilir.
5- Foreign Key NULL değeri alabilir.
6- Foreign Key DUBLICATE değeri alabilir.

Not 1: Parent Table’da olmayan bir veriyi(PK'daki herhangi bir deger) Child Table’a giremezsiniz.
Not 2: Child Table’ı silmeden Parent Table’ı silemezsiniz. Önce Child  Table silinir, sonra Parent Table silinir.
 */
 /*--------------------------- Syntax  ---------------------------
	CONSTRAINT constraintName FOREIGN KEY(child_table_field_name)
	REFERENCES parent_table (parent_table_field_name)
	CREATE TABLE table_name
	(
		id CHAR(10),
		name CHAR(10),
		CONSTARINT constraint_name
		FOREIGN KEY(table_name_id)
		REFERENCES parent_table (parent_table_field_name)
	);
---------------------------------------------------------------*/
/*------------------------------- Q7 -------------------------------
	"tedarikci" isimli bir tablo olusturun.
	Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" fieldlari olsun.
	"tedarikci_id" field'ini PRIMARY KEY olsun.
	
	"urunler" isminde baska bir tablo olusturun.
	Tabloda "tedarikci_id" ve "urun_id" field'lari olsun.
	"tedarikci_id" FOREIGN KEY olsun.
-------------------------------------------------------------------*/
CREATE TABLE tedarikci
(
tedarikci_id INT PRIMARY KEY,
tedarikci_ismi VARCHAR(30),
iletisim_isim VARCHAR(30)
);

CREATE TABLE urunler
(
tedarikci_id INT,
urun_id INT,
CONSTRAINT id_fk FOREIGN KEY (tedarikci_id)
REFERENCES tedarikci(tedarikci_id)
);
SELECT * FROM tedarikci;
SELECT * FROM urunler;

