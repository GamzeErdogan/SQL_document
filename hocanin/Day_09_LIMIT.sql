USE sys;

/*============================ LIMIT ===========================
>Tablodaki verilerin belli bir kismini listelemek icin LIMIT
 komutunu kullaniriz.
 
>LIMIT komutundan sonra kullandigimiz sayi kadar kaydi bize getirir.

>Eger belirli bir aralikta calismak istiyorsak bu durumda 
iki sayi gireriz, ancak bu sayilardan ilki baslangic noktamizi 
ifade ederken ikincisi kac kayit getirecegimizi belirtir. Baslangic 
noktasi dahil edilmez!
===============================================================*/

-- Isciler tablosundan ilk 5 kaydi getiriniz.

SELECT * 
FROM isciler
LIMIT 5;

-- Isim sirali tablodan ilk 3 kaydi listeleyin.

SELECT isim 
FROM isciler
ORDER BY isim
LIMIT 3;

-- Maas sirali tablodan 4. kayittan 7. kayda kadar olan
-- (7. dahil degil) kayitlarin isim ve sehir bilgilerini listeleyin.

SELECT isim, sehir
FROM isciler
ORDER BY maas
LIMIT 3,3;


/*
								LIMIT VE OFFSET 
                                
LIMIT = Bize kac adet data gelecegini belirliyor
OFFSET = Kac adet verinin atlanacagini belirler.
*/

-- Maas sirali tablodan 4. kayittan 7. kayda kadar olan
-- (7. dahil degil) kayitlarin isim ve sehir bilgilerini listeleyin.


SELECT isim, sehir
FROM isciler
ORDER BY maas
LIMIT 3 OFFSET 3;

-- Bu ornekte OFFSET ile ilk 3 satir atlandi 
-- LIMIT ile 4. 5. 6. siradaki datalar goruntulendi.


SELECT isim, sehir
FROM isciler
ORDER BY maas
LIMIT 1111111111111 OFFSET 5;

-- NOT: Eger x kadar data atlansin ve geride kalan tum datalar gelsin 
-- istiyorsak LIMIT degeri oalrak max degeri gireriz Offset degeri oalrakta 
-- atlanamsini istedigimiz data sayisini gireriz.

-- Maasi en yuksek 3 kisinin bilgilerini listeleyen sorguyu yaziniz.

SELECT * 
FROM isciler 
ORDER BY maas DESC
LIMIT 3;

-- Maasi en yuksek kisiler listesinden 3. sirada olan ismi
-- listeleyen sorguyu yaziniz.

SELECT isim
FROM isciler
ORDER BY maas DESC
LIMIT 2,1;

SELECT isim
FROM isciler
ORDER BY maas DESC
LIMIT 1 OFFSET 2;

-- Maas'i 4000'den yuksek olan ılk 3 kisinin sehrini listeleyin.

SELECT sehir, isim
FROM isciler
WHERE maas>4000
ORDER BY maas DESC
LIMIT 3;


/*=========================DISTINCT===========================

DISTINCT cumlecıgı bir sorgu ifadesinde benzer olan kayitlari 
filtrelemek icin kullanilir. 
Dolayisiyla secilen sutun veya sutunlar icin benzersiz (UNIQUE)
veri iceren satirlari olusturmaya yarar.
------- SYNTAX----------
SELECT DISTINCT field1, field2 ......
FROM table_name  
============================================================*/
-- Iscileri yasadiklari sehirler ile tekrarsiz listeleyiniz

SELECT DISTINCT isim, sehir
FROM isciler; 

-- manav tablosunda satilan farkli meyve turlerini 
-- listeleyen bir query yaziniz

SELECT * FROM manav;

SELECT urun_adi 
FROM manav
GROUP BY urun_adi;   -- Gruplama syntax yapisidir.

SELECT DISTINCT urun_adi  -- dogru syntax yapisi budur.
FROM manav;








