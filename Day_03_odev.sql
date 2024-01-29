/*------------------------------- Q8 -------------------------------
	"bebeler" isimli bir tablo olusturun.
	Tabloda "id", "isim", "iletisim_no" field'lari olsun.
	"id" field'i PRIMARY KEY olsun.
	
	"notlar" isminde baska bir tablo olusturun.
	Tabloda "bebe_id" ve "puan" field'lari olsun.
	"bebe_id" FOREIGN KEY olsun.
-------------------------------------------------------------------*/
Use sys;
CREATE TABLE bebeler(
id INT PRIMARY KEY,
isim VARCHAR(20),
iletisim_no CHAR(10)
);

CREATE TABLE notlar(
bebe_id INT,
puan DOUBLE,
CONSTRAINT bebe_id_fk FOREIGN KEY (bebe_id) REFERENCES bebeler (id)
);

SELECT * FROM bebeler;
SELECT * FROM notlar;