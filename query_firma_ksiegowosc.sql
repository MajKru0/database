CREATE DATABASE firma;
CREATE SCHEMA ksiegowosc;
CREATE TABLE ksiegowosc.pracownicy (id_pracownika int PRIMARY KEY NOT NULL,
										imie VARCHAR(50) NOT NULL,
										nazwisko VARCHAR(50) NOT NULL,
										adres VARCHAR(80),
										telefon VARCHAR(12));
CREATE TABLE ksiegowosc.godziny (id_godziny int PRIMARY KEY NOT NULL,
					data DATE NOT NULL,
					liczba_godzin INT NOT NULL,
					id_pracownika INT NOT NULL,
					CONSTRAINT fkID_pracownik FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika));
CREATE TABLE ksiegowosc.pensja (id_pensji INT PRIMARY KEY NOT NULL,
					stanowisko VARCHAR(80) NOT NULL,
					kwota MONEY NOT NULL);
CREATE TABLE ksiegowosc.premia (id_premii INT PRIMARY KEY,
					rodzaj VARCHAR(50) NOT NULL,
					kwota MONEY NOT NULL);
CREATE TABLE ksiegowosc.wynagrodzenie (id_wynagrodzenia INT PRIMARY KEY NOT NULL,
							data DATE NOT NULL,
							id_pracownika INT NOT NULL,
							id_godziny INT NOT NULL,
							id_pensji INT NOT NULL,
							id_premii INT
							CONSTRAINT fkID_pracownik1 FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy (id_pracownika),
							CONSTRAINT fkID_godziny FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny (id_godziny),
							CONSTRAINT fkID_pensji FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja (id_pensji),
							CONSTRAINT fkID_premii FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia (id_premii));
		-- dzia³a w PGAdminie ale tu nie COMMENT ON TABLE wynagrodzenie IS 'klucz g³owny tabeli to id wynagrodzenia'
SELECT * FROM ksiegowosc.pracownicy;
INSERT INTO ksiegowosc.pracownicy VALUES(1, 'Katarzyna', 'Kowalska', 'Promienna 11, Wilkowo', '511216040');
INSERT INTO ksiegowosc.pracownicy VALUES(2, 'Beata', 'Malenczuk', 'Grunwaldzka 38, Bialystok', NULL);
INSERT INTO ksiegowosc.pracownicy VALUES(3, 'Martyna', 'Pieklo', 'S³owackiego 43, Wilkowo', '533312892');
INSERT INTO ksiegowosc.pracownicy VALUES(4, 'Anna', 'Grudka', 'Poznañska 2, Luboñ', '704222278');
INSERT INTO ksiegowosc.pracownicy VALUES(5, 'Alicja', 'Przydanek', 'Mirabelkowa 133, Plewiska', '865343342');
INSERT INTO ksiegowosc.pracownicy VALUES(6, 'Katarzyna', 'Malik', 'Akacjowa 3, Kraków', NULL);
INSERT INTO ksiegowosc.pracownicy VALUES(7, 'Ewelina', 'Hy¿y', 'Rzeczna 44, Borki', '501825145');
INSERT INTO ksiegowosc.pracownicy VALUES(8, 'Stefan', 'Miszak', 'Prosta 343, Plewiska', '784512664');
INSERT INTO ksiegowosc.pracownicy VALUES(9, 'Kazimierz', 'Pieklo', 'S³owackiego 43, Wilkowo', '511642855');
INSERT INTO ksiegowosc.pracownicy VALUES(10, 'Eugeniusz', 'Kowalski', 'Promienna 11, Wilkowo', '511216042');
INSERT INTO ksiegowosc.pracownicy VALUES(11, 'Kamil', 'Nowakowski', 'Strzelecka 7, Wieliczka', NULL);
INSERT INTO ksiegowosc.pracownicy VALUES(12, 'Marcin', 'Kaczyna', 'Opolska 52, Wieliczka', '779512987');

SELECT * FROM ksiegowosc.godziny;
INSERT INTO ksiegowosc.godziny VALUES(1, '05-04-2022', 8, 2);
INSERT INTO ksiegowosc.godziny VALUES(2, '04-04-2022', 8, 1);
INSERT INTO ksiegowosc.godziny VALUES(3, '05-04-2022', 11, 3);
INSERT INTO ksiegowosc.godziny VALUES(4, '04-01-2022', 16, 5);
INSERT INTO ksiegowosc.godziny VALUES(5, '05-04-2022', 12, 9);
INSERT INTO ksiegowosc.godziny VALUES(6, '05-04-2022', 6, 8);
INSERT INTO ksiegowosc.godziny VALUES(7, '04-01-2022', 10, 12);
INSERT INTO ksiegowosc.godziny VALUES(8, '05-04-2022', 5, 7);
INSERT INTO ksiegowosc.godziny VALUES(9, '04-05-2022', 8, 6);
INSERT INTO ksiegowosc.godziny VALUES(10, '04-01-2022', 16, 4);
INSERT INTO ksiegowosc.godziny VALUES(11, '05-04-2022', 8, 10);

SELECT * FROM ksiegowosc.premia;
INSERT INTO ksiegowosc.premia VALUES(1, 'regulaminowa', 72.00);
INSERT INTO ksiegowosc.premia VALUES(2, 'regulaminowa', 100.00);
INSERT INTO ksiegowosc.premia VALUES(3, 'regulaminowa', 250.00);
INSERT INTO ksiegowosc.premia VALUES(4, 'regulaminowa', 600.00);
INSERT INTO ksiegowosc.premia VALUES(5, 'regulaminowa', 1200.00);
INSERT INTO ksiegowosc.premia VALUES(6, 'uznaniowa', 25.00);
INSERT INTO ksiegowosc.premia VALUES(7, 'uznaniowa', 125.00);
INSERT INTO ksiegowosc.premia VALUES(8, 'uznaniowa', 80.00);
INSERT INTO ksiegowosc.premia VALUES(9, 'uznaniowa', 99.00);
INSERT INTO ksiegowosc.premia VALUES(10, 'uznaniowa', 110.00);

SELECT * FROM ksiegowosc.pensja;
INSERT INTO ksiegowosc.pensja VALUES(1, 'kierownik', 6000.00);
INSERT INTO ksiegowosc.pensja VALUES(2, 'team leader', 3500.00);
INSERT INTO ksiegowosc.pensja VALUES(3, 'kierownik zmiany', 3000.00);
INSERT INTO ksiegowosc.pensja VALUES(4, 'sprzedawca', 1900.00);
INSERT INTO ksiegowosc.pensja VALUES(5, 'HR-owiec', 5900.00);
INSERT INTO ksiegowosc.pensja VALUES(6, 'ksiêgowy', 3800.00);
INSERT INTO ksiegowosc.pensja VALUES(7, 'BHP-owiec', 4000.00);
INSERT INTO ksiegowosc.pensja VALUES(8, 'serwisant', 7000.00);
INSERT INTO ksiegowosc.pensja VALUES(9, 'recepcjonista', 2050.00);
INSERT INTO ksiegowosc.pensja VALUES(10, 'PR-owiec', 6000.00);

SELECT * FROM ksiegowosc.wynagrodzenie;
INSERT INTO ksiegowosc.wynagrodzenie VALUES(1, '05-10-2022', 1, 2, 1, 5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(2, '05-10-2022', 2, 1, 10, 10);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(3, '05-10-2022', 3, 3, 6, 1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(4, '05-15-2022', 6, 9, 4, NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(5, '05-10-2022', 4, 10, 4, 6);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(6, '05-10-2022', 7, 8, 6, 7);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(7, '05-10-2022', 5, 4, 3, 2);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(8, '05-15-2022', 9, 5, 3, 8);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(9, '05-10-2022', 10, 11, 1, 5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES(10, '05-10-2022', 8, 6, 1, NULL);

--ZAPYTANIA

SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

SELECT a.[id_pracownika], s.[kwota]
FROM [ksiegowosc].[wynagrodzenie] a
JOIN [ksiegowosc].[pensja] s
ON a.[id_pensji] = s.id_pensji
WHERE s.[kwota] > 1000.00;

SELECT a.[id_pracownika]
FROM [ksiegowosc].[wynagrodzenie] a
JOIN [ksiegowosc].[pensja] s
ON a.[id_pensji] = s.[id_pensji]
WHERE s.kwota > 2000
AND a.id_premii IS NULL

SELECT * FROM ksiegowosc.pracownicy
--mia³o byc 'J' ale nie mam, wiec zrobilam 'S'
WHERE imie LIKE 'S%';

SELECT * FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%'
AND imie LIKE '%a';

SELECT a.[imie], a.[nazwisko], s.[liczba_godzin]*25-160 AS [nadgodziny]
FROM [ksiegowosc].[pracownicy] a
JOIN [ksiegowosc].[godziny] s
ON a.[id_pracownika] = s.[id_pracownika]
WHERE s.[liczba_godzin]*25 > 160;

SELECT imie, nazwisko
FROM [ksiegowosc].[pracownicy]
--dwa zagniezdzenia
WHERE id_pracownika IN (SELECT id_pracownika FROM [ksiegowosc].[wynagrodzenie] WHERE id_pensji IN 
(SELECT id_pensji FROM [ksiegowosc].[pensja] WHERE kwota BETWEEN 1500 AND 3000))

SELECT imie, nazwisko
FROM [ksiegowosc].[pracownicy]
WHERE id_pracownika IN (SELECT id_pracownika FROM [ksiegowosc].[wynagrodzenie] WHERE id_godziny IN
(SELECT id_godziny FROM [ksiegowosc].[godziny] WHERE liczba_godzin*23 > 160)
AND id_premii IS NULL);

SELECT s.[id_pracownika], a.[imie], a.[nazwisko], t.[kwota]
FROM [ksiegowosc].[pracownicy] a
JOIN [ksiegowosc].[wynagrodzenie] s
ON a.id_pracownika = s.id_pracownika
JOIN [ksiegowosc].[pensja] t
ON s.id_pensji = t.id_pensji
ORDER BY t.kwota;

SELECT s.[id_pracownika], a.[imie], a.[nazwisko], t.[kwota], q.kwota
FROM [ksiegowosc].[pracownicy] a
JOIN [ksiegowosc].[wynagrodzenie] s
ON a.id_pracownika = s.id_pracownika
JOIN [ksiegowosc].[pensja] t
ON s.id_pensji = t.id_pensji
JOIN [ksiegowosc].[premia] q
ON s.id_premii = q.id_premii
ORDER BY t.kwota DESC, q.kwota DESC;

SELECT count(*), t.stanowisko
FROM [ksiegowosc].[pracownicy] a
JOIN [ksiegowosc].[wynagrodzenie] s
ON a.id_pracownika=s.id_pracownika
JOIN [ksiegowosc].[pensja] t
ON s.id_pensji = t.id_pensji
GROUP BY t.stanowisko;


SELECT MIN(kwota) AS min_placa, AVG(kwota) as sr_placa, MAX(kwota) as maks_placa
FROM [ksiegowosc].[pensja]
WHERE stanowisko LIKE 'kierownik%';

SELECT SUM(kwota) AS suma_plac FROM [ksiegowosc].[pensja] WHERE id_pensji IN 
(SELECT id_pensji FROM [ksiegowosc].[wynagrodzenie] WHERE id_pracownika IN
(SELECT id_pracownika FROM [ksiegowosc].[pracownicy])) 

SELECT SUM(a.[kwota]) AS suma_plac, a.[stanowisko]
FROM [ksiegowosc].[pensja] a
JOIN [ksiegowosc].[wynagrodzenie] s
ON a.[id_pensji] = s.[id_pensji]
JOIN [ksiegowosc].[pracownicy] t
ON s.[id_pracownika] = t.[id_pracownika]
GROUP BY a.[stanowisko]

SELECT COUNT(*) AS l_premii, a.[stanowisko]
FROM [ksiegowosc].[pensja] a
JOIN [ksiegowosc].[wynagrodzenie] s
ON a.[id_pensji] = s.[id_pensji]
WHERE id_premii IS NOT NULL
GROUP BY a.[stanowisko]

SELECT * FROM [ksiegowosc].[pracownicy]
WHERE id_pracownika IN (SELECT id_pracownika FROM [ksiegowosc].[wynagrodzenie]
WHERE id_pensji IN (SELECT id_pensji FROM [ksiegowosc].[pensja] WHERE kwota >= 3000))