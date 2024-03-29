USE sys;
/* ======================== ALIASES ===========================
   Aliases kodu ile tablo yazdirilirken, field isimleri sadece
   o cikti icin degistirilebilir.
===============================================================*/
CREATE TABLE employees
(
employee_id char(9),
employee_name varchar(50),
employee_birth_city varchar(50)
);

INSERT INTO employees VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO employees VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO employees VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM employees;
Select employee_id AS id, employee_name AS isim ,employee_birth_city AS city
from employees;

/* ======================== GROUP BY CLAUSE ===========================
Group By komutu sonuclari bir veya daha fazla sutuna gore
gruplamak icin SELECT komutuyla birlikte kullanilir.
GROUP BY komutu her grup basina bir satir dondurur.
GROUP BY AGGREGATE fonksiyonlariyla birlikte kullanilir. */

CREATE TABLE manav (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', null, 2);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav VALUES( 'Ayse', null, 3);
SELECT * FROM manav;

-- Urun adina gore alinan urunlerin toplam kilosunu listeleyin.
SELECT urun_adi, SUM(urun_miktar)toplam_kg FROM manav
GROUP BY urun_adi;

-- Isme gore, alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore siralayin.
SELECT isim, SUM(urun_miktar) AS toplam_kg FROM manav
GROUP BY isim ORDER BY isim;

-- Isme gore, alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore ters siralayin.
SELECT isim, SUM(urun_miktar) AS toplam_kg FROM manav
GROUP BY isim ORDER BY isim DESC;

-- Bunlari bir de toplam kiloya gore ters sirali yapalim
SELECT isim, SUM(urun_miktar) AS toplam_kg FROM manav
GROUP BY isim ORDER BY toplam_kg DESC;

-- Urun ismine gore urun satin alan toplam kisi sayisini kisi sayisina gore siralayiniz.
SELECT urun_adi, COUNT(isim) AS toplam_kisi FROM manav
GROUP BY urun_adi ORDER BY toplam_kisi;

-- Alinan kilo miktarina gore musteri sayisini, urun_miktar
-- sirasina gore listeleyiniz.
 SELECT urun_miktar, COUNT(isim) AS toplam_kisi FROM manav
 GROUP BY urun_miktar ORDER BY urun_miktar;

-- Satilan meyve turune (urun_adi) gore urun alan kisi sayisini,
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
 SELECT urun_adi, COUNT(isim) AS toplam_kisi FROM manav
 WHERE urun_adi IS NOT NULL
 GROUP BY urun_adi ORDER BY urun_adi ;
 
 -- Satilan meyvenin 4 harfli olmasina (urun_adi) gore urun alan kisi sayisini,
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
SELECT urun_adi, COUNT(isim) AS toplam_kisi FROM manav
 WHERE urun_adi LIKE '____'
 GROUP BY urun_adi ORDER BY urun_adi ;
 
 /*======================== HAVING CLAUSE =======================
 HAVING, AGGREGATE FUNCTION'lar ile birlikte kullanilan
FILTRELEME komutudur.
Aggregate fonksiyonlar ile ilgili bir kosul koymak
icin GROUP BY'dan sonra HAVING cumlecigi kullanilir.
Yeni create ettigimiz bir field uzerinden filtreleme yapmak istiyorsak
WHERE cumlecigini kullanamayiz.
WHERE cumlecigi sadece  database de var olan fieldlar uzerinde bir filtreleme yapar.
===============================================================*/
CREATE TABLE iscilerr
(
	id int,
	isim varchar(50),
    sehir varchar(20),
	maas int,
	sirket varchar(20)
);
INSERT INTO iscilerr VALUES
(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'),
(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'),
(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'),
(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'),
(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'),
(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'),
(123456710, 'Hatıce Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM iscilerr;

-- Sirketlere gore toplam isci sayisini listeleyiniz
SELECT sirket, COUNT(isim) AS isci_sayisi FROM iscilerr
GROUP BY sirket;

-- Sirketlere gore isci_sayisini 1'den buyukse yazdiriniz
SELECT sirket, COUNT(isim) AS isci_sayisi FROM iscilerr
GROUP BY sirket HAVING isci_sayisi>1;

-- (Ayni isimlere gore sorguyu yaziniz) Toplam geliri 8000 liradan fazla olan isimleri gosteren sorgu yaziniz
SELECT isim, SUM(maas) AS tpl_maas FROM iscilerr
GROUP BY isim HAVING 8000<tpl_maas;

-- Eger bir sehirde alinan MAX maas 5000'den dusukse sehir ismini
-- ve MAX maasi veren sorgu yaziniz
SELECT sehir,MAX(maas)max_maas FROM iscilerr
GROUP BY sehir HAVING max_maas < 5000;

-- Eger bir sehirde alinan MAX maas 5000'den buyukse sehir ismi 'i' harfi ile basliyorsa o sehirleri ve
-- ve MAX maasi, maas sirali veren sorgu yaziniz
SELECT sehir,MAX(maas)max_maas FROM iscilerr
WHERE sehir LIKE 'i%'
GROUP BY sehir HAVING max_maas > 5000  ORDER BY max_maas;
