CREATE TABLE Atlikejas (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    Sceninis_vardas VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TABLE Klausytojas (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    El_pastas VARCHAR(100) NOT NULL CONSTRAINT Ar_El_Pastas CHECK (El_pastas LIKE '%@%') 
);

CREATE TABLE Albumas (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    Pavadinimas VARCHAR(100) NOT NULL,
    Atlikejas INT NOT NULL,
    Isleidimo_data DATE DEFAULT CURRENT_DATE CONSTRAINT Albumo_Isleidimo_Data CHECK (Isleidimo_data <= CURRENT_DATE),
    FOREIGN KEY (Atlikejas) REFERENCES Atlikejas ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Daina (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    Pavadinimas VARCHAR(100) NOT NULL,
    Trukme INT CONSTRAINT DainosTrukme CHECK(Trukme > 0), -- sekundės
    Isleidimo_data DATE DEFAULT CURRENT_DATE CONSTRAINT Dainos_Isleidimo_Data CHECK (Isleidimo_data <= CURRENT_DATE),
    Atlikejas INT NOT NULL,
    Albumas INT,
    FOREIGN KEY (Atlikejas) REFERENCES Atlikejas ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Albumas) REFERENCES Albumas ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Grojarastis (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    Pavadinimas VARCHAR(100) NOT NULL,
    Klausytojas INT NOT NULL,
    FOREIGN KEY (Klausytojas) REFERENCES Klausytojas ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Grojarascio_Daina (
    Grojarastis INT NOT NULL,
    Daina INT NOT NULL,
    PRIMARY KEY (Grojarastis, Daina),
    FOREIGN KEY (Grojarastis) REFERENCES Grojarastis ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Daina) REFERENCES Daina ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Pamegta_Daina (
    Klausytojas INT NOT NULL,
    Daina INT NOT NULL,
    PRIMARY KEY (Klausytojas, Daina),
    FOREIGN KEY (Klausytojas) REFERENCES Klausytojas ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Daina) REFERENCES Daina ON DELETE CASCADE ON UPDATE CASCADE
);

-- Indeksai --

CREATE UNIQUE INDEX Unikalus_Sceninis_Vardas ON Atlikejas (Sceninis_vardas);
CREATE INDEX Albumo_Pavadinimas ON Albumas (Pavadinimas);
CREATE INDEX Dainos_Pavadinimas ON Daina (Pavadinimas);

-- Virtualios lentelės --

CREATE VIEW Grojarascio_Dainu_Skaicius AS
SELECT
    Grojarastis, 
    COUNT(*) AS Dainu_skaicius
FROM Grojarascio_Daina
GROUP BY Grojarastis;

CREATE VIEW Grojarastis_Pilnas AS
SELECT
    G.*,
    COALESCE(GDS.Dainu_skaicius, 0) AS Dainu_skaicius
FROM Grojarastis G
LEFT JOIN Grojarascio_Dainu_Skaicius GDS ON G.ID = GDS.Grojarastis;

CREATE MATERIALIZED VIEW Daina_Pamegta_Kartu AS
SELECT
    Daina,
    COUNT(*) AS Pamegta_kartu
FROM Pamegta_Daina
GROUP BY Daina;

REFRESH MATERIALIZED VIEW Daina_Pamegta_Kartu;

CREATE VIEW Daina_Pilna AS
SELECT
    D.*,
    COALESCE(DPK.Pamegta_kartu, 0) AS Pamegta_kartu
FROM Daina D
LEFT JOIN Daina_Pamegta_Kartu DPK ON D.ID = DPK.Daina;

CREATE VIEW Albumo_Metaduomenys AS
SELECT
  Albumas,
  COUNT(ID) AS Dainu_skaicius,
  SUM(Trukme) AS Albumo_Trukme
FROM Daina
GROUP BY Albumas;

CREATE VIEW Albumas_Pilnas AS
SELECT
    A.*,
    AM.Dainu_skaicius,
    AM.Albumo_Trukme
FROM Albumas A
INNER JOIN Albumo_Metaduomenys AM ON A.ID = AM.Albumas;

-- Trigeriai --

CREATE FUNCTION MaxGrojarasciuSkaicius()
RETURNS TRIGGER AS $$
BEGIN
IF (SELECT COUNT(*) FROM Grojarastis
 WHERE Grojarastis.Klausytojas = NEW.Klausytojas) >= 3
THEN
 RAISE EXCEPTION 'Viršytas grojarasčių skaičius';
END IF;
RETURN NEW;
END; $$
LANGUAGE plpgsql;

CREATE TRIGGER MaxGrojarasciuSkaicius
BEFORE INSERT ON Grojarastis
FOR EACH ROW
EXECUTE FUNCTION MaxGrojarasciuSkaicius();

CREATE FUNCTION MaxGrojarascioDainuSkaicius()
RETURNS TRIGGER AS $$
BEGIN
IF (SELECT COUNT(*) FROM Grojarascio_Daina
 WHERE Grojarascio_Daina.Grojarastis = NEW.Grojarastis) >= 3
THEN
 RAISE EXCEPTION 'Viršytas grojarasčio dainų skaičius skaičius';
END IF;
RETURN NEW;
END; $$
LANGUAGE plpgsql;

CREATE TRIGGER MaxGrojarascioDainuSkaicius
BEFORE INSERT ON Grojarascio_Daina
FOR EACH ROW
EXECUTE FUNCTION MaxGrojarascioDainuSkaicius();

-- Užpildymas duomenimis --

INSERT INTO Atlikejas (Sceninis_vardas) VALUES 
('pop atlikejas'),
('rock atlikejas'),
('rap atlikejas'),
('jazz atlikejas');

INSERT INTO Klausytojas (El_pastas) VALUES 
('1@example.com'),
('2@example.com'),
('3@example.com');

INSERT INTO Albumas (Pavadinimas, Atlikejas, Isleidimo_data) VALUES 
('Pop albumas', 1, '2024-01-01'),
('Rap albumas', 2, '2024-02-01'),
('Rock albumas', 3, '2024-03-01');

INSERT INTO Daina (Pavadinimas, Trukme, Isleidimo_data, Atlikejas, Albumas) VALUES 
('Pop daina 1', 210, '2024-01-01', 1, 1),
('Pop daina 2', 180, '2024-01-03', 1, 1),
('Roko daina 1', 240, '2024-02-01', 2, 2),
('Roko daina 2', 300, '2024-02-05', 2, 2),
('Rapo daina 1', 150, '2024-03-06', 3, 3),
('Rapo daina 2', 220, '2024-03-08', 3, 3);

INSERT INTO Grojarastis (Pavadinimas, Klausytojas) VALUES 
('G1', 1),
('G2', 2),
('G3', 3),
('G4', 1),
('G5', 1);

INSERT INTO Grojarascio_Daina (Grojarastis, Daina) VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 5),
(3, 6);

INSERT INTO Pamegta_Daina (Klausytojas, Daina) VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 6);

