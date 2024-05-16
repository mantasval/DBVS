INSERT INTO Daina (Pavadinimas, Trukme, Isleidimo_data, Atlikejas) VALUES ('Neigiama trukme', -5, CURRENT_DATE, 1);

INSERT INTO Grojarastis (Pavadinimas, Klausytojas) VALUES ('Ketvirtas grojarastis', 1);
INSERT INTO Grojarascio_Daina (Grojarastis, Daina) VALUES (1, 4); -- Ketvirta daina

INSERT INTO Atlikejas (Sceninis_vardas) VALUES ('pop atlikejas'); -- Jau egzistuoja

INSERT INTO Klausytojas (El_pastas) VALUES ('be etos')

INSERT INTO Albumas (Pavadinimas, Atlikejas, Isleidimo_data) VALUES ('Naujas albumas', 1, '2024-09-01'); -- Neteisinga data