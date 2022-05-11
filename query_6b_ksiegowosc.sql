--a
ALTER TABLE ksiegowosc.pracownicy ADD kierunkowy VARCHAR(20)
UPDATE ksiegowosc.pracownicy SET kierunkowy = CONCAT('(+48)', telefon)
SELECT kierunkowy
FROM ksiegowosc.pracownicy;
--b
UPDATE [ksiegowosc].[pracownicy] SET kierunkowy = CONCAT(SUBSTRING(kierunkowy, 1, 8), '-', SUBSTRING(kierunkowy, 9, 3), '-', SUBSTRING(kierunkowy, 12, 3))
--c
SELECT id_pracownika, UPPER(imie), UPPER(nazwisko), UPPER(adres), telefon
FROM [ksiegowosc].[pracownicy]
WHERE LEN(nazwisko) = (SELECT MAX(LEN(nazwisko)) FROM [ksiegowosc].[pracownicy])

--d
ALTER TABLE [ksiegowosc].[pensja] ADD pensja VARCHAR(20)
UPDATE [ksiegowosc].[pensja] SET pensja = kwota
SELECT CONVERT(VARCHAR(32), HashBytes('MD5', a.imie), 2) as MD5Hash_imie,
CONVERT(VARCHAR(32), HashBytes('MD5', a.nazwisko), 2) as MD5Hash_nazwisko,
CONVERT(VARCHAR(32), HashBytes('MD5', a.adres), 2) as MD5Hash_adres,
CONVERT(VARCHAR(32), HashBytes('MD5', a.telefon), 2) as MD5Hash_telefon,
CONVERT(VARCHAR(32), HashBytes('MD5', t.pensja), 2) as MD5Hash_pensja
FROM [ksiegowosc].[pracownicy] a
JOIN [ksiegowosc].[wynagrodzenie] s
ON  a.id_pracownika = s.id_pracownika
JOIN [ksiegowosc].[pensja] t
ON s.[id_pensji] = t.[id_pensji]

--f
SELECT a.[imie], a.[nazwisko], t.[kwota], p.[kwota] AS premia
FROM [ksiegowosc].[pracownicy] a
LEFT OUTER JOIN [ksiegowosc].[wynagrodzenie] s
ON a.id_pracownika = s.id_pracownika
LEFT OUTER JOIN [ksiegowosc].[pensja] t
ON s.[id_pensji] = t.[id_pensji]
LEFT OUTER JOIN [ksiegowosc].[premia] p
ON p.[id_premii] = s.[id_premii]

--g
SELECT CONCAT('Pracownik ', a.imie, ' ', a.nazwisko, ', w dniu ', s.data, ' otrzymal pensje calkowita na kwote ',
t.kwota + p.kwota, 'zl, gdzie wynagrodzenie zasadnicze wynosilo: ', t.kwota, 'zl, premia: ', p.kwota, 'zl, nadgodziny: ', q.liczba_godzin*30-150, 'zl')
FROM [ksiegowosc].[pracownicy] a
JOIN [ksiegowosc].wynagrodzenie s
ON s.id_pracownika = a.id_pracownika
JOIN [ksiegowosc].[pensja] t
ON s.id_pensji=t.id_pensji
JOIN [ksiegowosc].[premia] p
ON s.id_premii=p.id_premii
JOIN [ksiegowosc].[godziny] q
ON q.id_godziny = s.id_godziny