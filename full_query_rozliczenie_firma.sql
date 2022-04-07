--DROP SCHEMA rozliczenie cascade; --usuwa schemat razem z zawartoscia
CREATE SCHEMA IF NOT EXISTS rozliczenie
    AUTHORIZATION postgres;
	CREATE TABLE IF NOT EXISTS rozliczenie.pracownicy (id_pracownika int PRIMARY KEY NOT NULL,
						imie VARCHAR(50) NOT NULL, 
						nazwisko VARCHAR(50) NOT NULL,
									 --NVARCHAR do jezykow innych niz angielski - nvarchar doesnt exist
						adres text,
						telefon text);
CREATE TABLE IF NOT EXISTS rozliczenie.godziny (id_godziny int PRIMARY KEY NOT NULL,
					 data date NOT NULL,
					 liczba_godzin int NOT NULL,
					 id_pracownika int NOT NULL,
								CONSTRAINT fkIDpracownik FOREIGN KEY (id_pracownika) REFERENCES rozliczenie.pracownicy(id_pracownika)
								 );
								 CREATE TABLE IF NOT EXISTS rozliczenie.premie (id_premii int PRIMARY KEY NOT NULL,
					rodzaj VARCHAR(50) NOT NULL,
					kwota money NOT NULL);
CREATE TABLE IF NOT EXISTS rozliczenie.pensje (id_pensji int PRIMARY KEY NOT NULL,
					stanowisko VARCHAR(80) NOT NULL,
					kwota money NOT NULL,
					id_premii int,
							CONSTRAINT fkIDpremia FOREIGN KEY (id_premii) REFERENCES rozliczenie.premie(id_premii) );


SELECT * FROM rozliczenie.pracownicy;
INSERT INTO rozliczenie.pracownicy VALUES(1, 'Katarzyna', 'Kowalska', 'Promienna 11, Wilkowo', '511216040');
INSERT INTO rozliczenie.pracownicy VALUES(2, 'Beata', 'Malenczuk', 'Grunwaldzka 38, Bialystok', NULL);
INSERT INTO rozliczenie.pracownicy VALUES(3, 'Martyna', 'Pieklo', 'Słowackiego 43, Wilkowo', '533312892');
INSERT INTO rozliczenie.pracownicy VALUES(4, 'Anna', 'Grudka', 'Poznańska 2, Luboń', '704222278');
INSERT INTO rozliczenie.pracownicy VALUES(5, 'Alicja', 'Przydanek', 'Mirabelkowa 133, Plewiska', '865343342');
INSERT INTO rozliczenie.pracownicy VALUES(6, 'Katarzyna', 'Malik', 'Akacjowa 3, Kraków', NULL);
INSERT INTO rozliczenie.pracownicy VALUES(7, 'Ewelina', 'Hyży', 'Rzeczna 44, Borki', '501825145');
INSERT INTO rozliczenie.pracownicy VALUES(8, 'Stefan', 'Miszak', 'Prosta 343, Plewiska', '784512664');
INSERT INTO rozliczenie.pracownicy VALUES(9, 'Kazimierz', 'Pieklo', 'Słowackiego 43, Wilkowo', '511642855');
INSERT INTO rozliczenie.pracownicy VALUES(10, 'Eugeniusz', 'Kowalski', 'Promienna 11, Wilkowo', '511216042');
INSERT INTO rozliczenie.pracownicy VALUES(11, 'Kamil', 'Nowakowski', 'Strzelecka 7, Wieliczka', NULL);
INSERT INTO rozliczenie.pracownicy VALUES(12, 'Marcin', 'Kaczyna', 'Opolska 52, Wieliczka', '779512987');

SELECT * FROM rozliczenie.godziny;
INSERT INTO rozliczenie.godziny VALUES(1, '05-04-2022', 8, 2);
INSERT INTO rozliczenie.godziny VALUES(2, '04-04-2022', 8, 1);
INSERT INTO rozliczenie.godziny VALUES(3, '05-04-2022', 11, 6);
INSERT INTO rozliczenie.godziny VALUES(4, '01-04-2022', 16, 9);
INSERT INTO rozliczenie.godziny VALUES(5, '05-04-2022', 12, 9);
INSERT INTO rozliczenie.godziny VALUES(6, '05-04-2022', 6, 1);
INSERT INTO rozliczenie.godziny VALUES(7, '01-04-2022', 10, 1);
INSERT INTO rozliczenie.godziny VALUES(8, '05-04-2022', 5, 7);
INSERT INTO rozliczenie.godziny VALUES(9, '04-04-2022', 8, 6);
INSERT INTO rozliczenie.godziny VALUES(10, '01-04-2022', 16, 6);
INSERT INTO rozliczenie.godziny VALUES(11, '05-04-2022', 8, 10);

SELECT * FROM rozliczenie.premie;
INSERT INTO rozliczenie.premie VALUES(1, 'regulaminowa', 72.00);
INSERT INTO rozliczenie.premie VALUES(2, 'regulaminowa', 100.00);
INSERT INTO rozliczenie.premie VALUES(3, 'regulaminowa', 250.00);
INSERT INTO rozliczenie.premie VALUES(4, 'regulaminowa', 600.00);
INSERT INTO rozliczenie.premie VALUES(5, 'regulaminowa', 1200.00);
INSERT INTO rozliczenie.premie VALUES(6, 'uznaniowa', 25.00);
INSERT INTO rozliczenie.premie VALUES(7, 'uznaniowa', 125.00);
INSERT INTO rozliczenie.premie VALUES(8, 'uznaniowa', 80.00);
INSERT INTO rozliczenie.premie VALUES(9, 'uznaniowa', 99.00);
INSERT INTO rozliczenie.premie VALUES(10, 'uznaniowa', 110.00);

SELECT * FROM rozliczenie.pensje;
INSERT INTO rozliczenie.pensje VALUES(1, 'kierownik', 6000.00, 5);
INSERT INTO rozliczenie.pensje VALUES(2, 'team leader', 3500.00, 3);
INSERT INTO rozliczenie.pensje VALUES(3, 'kierownik zmiany', 3000.00, 2);
INSERT INTO rozliczenie.pensje VALUES(4, 'sprzedawca', 2100.00, 6);
INSERT INTO rozliczenie.pensje VALUES(5, 'HR-owiec', 5900.00, 4);
INSERT INTO rozliczenie.pensje VALUES(6, 'księgowy', 3800.00, 1);
INSERT INTO rozliczenie.pensje VALUES(7, 'BHP-owiec', 4000.00, NULL);
INSERT INTO rozliczenie.pensje VALUES(8, 'serwisant', 7000.00, NULL);
INSERT INTO rozliczenie.pensje VALUES(9, 'recepcjonista', 2050.00, 8);
INSERT INTO rozliczenie.pensje VALUES(10, 'PR-owiec', 6000.00, 10);

ALTER TABLE rozliczenie.pracownicy ADD id_pensji INT;
ALTER TABLE rozliczenie.pracownicy ADD CONSTRAINT fk_pensja FOREIGN KEY (id_pensji) REFERENCES rozliczenie.pensje(id_pensji);

UPDATE rozliczenie.pracownicy SET id_pensji=NULL;
UPDATE rozliczenie.pracownicy SET id_pensji=1 WHERE id_pracownika = 1;
UPDATE rozliczenie.pracownicy SET id_pensji=10 WHERE id_pracownika = 2;
UPDATE rozliczenie.pracownicy SET id_pensji=2 WHERE id_pracownika = 3;
UPDATE rozliczenie.pracownicy SET id_pensji=5 WHERE id_pracownika = 4;
UPDATE rozliczenie.pracownicy SET id_pensji=9 WHERE id_pracownika = 5;
UPDATE rozliczenie.pracownicy SET id_pensji=4 WHERE id_pracownika = 6;
UPDATE rozliczenie.pracownicy SET id_pensji=6 WHERE id_pracownika = 7;
UPDATE rozliczenie.pracownicy SET id_pensji=8 WHERE id_pracownika = 8;
UPDATE rozliczenie.pracownicy SET id_pensji=3 WHERE id_pracownika = 9;
UPDATE rozliczenie.pracownicy SET id_pensji=1 WHERE id_pracownika = 10;
UPDATE rozliczenie.pracownicy SET id_pensji=4 WHERE id_pracownika = 11;
UPDATE rozliczenie.pracownicy SET id_pensji=7 WHERE id_pracownika = 12;

SELECT nazwisko,adres FROM rozliczenie.pracownicy;

SELECT date_part('dow',godziny.data) AS week, date_part('month', godziny.data) AS month FROM rozliczenie.godziny;

ALTER TABLE rozliczenie.pensje RENAME COLUMN kwota TO kwota_brutto;
ALTER TABLE rozliczenie.pensje ADD kwota_netto money;
UPDATE rozliczenie.pensje SET kwota_netto = kwota_brutto-(kwota_brutto*0.1371)-0.09*(kwota_brutto*0.1371);
