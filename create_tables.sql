CREATE TABLE Atlikejas (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    Sceninis_vardas VARCHAR(100) NOT NULL
);

CREATE TABLE Klausytojas (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    El_pastas VARCHAR(100) NOT NULL
);

CREATE TABLE Albumas (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    Pavadinimas VARCHAR(100) NOT NULL,
    Atlikejas INT NOT NULL,
    Trukme INT CONSTRAINT AlbumoTrukme CHECK(Trukme > 0), -- sekundės
    Isleidimo_data DATE,
    Dainu_skaicius INT,
    FOREIGN KEY (Atlikejas) REFERENCES Atlikejas ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Daina (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    Pavadinimas VARCHAR(100) NOT NULL,
    Trukme INT CONSTRAINT DainosTrukme CHECK(Trukme > 0), -- sekundės
    Isleidimo_data DATE,
    Pamegta_kartu INT,
    Atlikejas INT NOT NULL,
    Albumas INT,
    FOREIGN KEY (Atlikejas) REFERENCES Atlikejas ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Albumas) REFERENCES Albumas ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Grojarastis (
    ID  INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    Pavadinimas VARCHAR(100) NOT NULL,
    Dainu_skaicius INT,
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

INSERT INTO Atlikejas (Sceninis_vardas) VALUES 
('pop atlikejas'),
('rock atlikejas'),
('rap atlikejas'),
('jazz atlikejas');

INSERT INTO Klausytojas (El_pastas) VALUES 
('1@example.com'),
('2@example.com'),
('3@example.com');

INSERT INTO Albumas (Pavadinimas, Atlikejas, Trukme, Isleidimo_data, Dainu_skaicius) VALUES 
('Pop albumas', 1, 3600, '2024-01-01', 10),
('Rap albumas', 2, 4200, '2024-02-01', 12),
('Rock albumas', 3, 3000, '2024-03-01', 8);

INSERT INTO Daina (Pavadinimas, Trukme, Isleidimo_data, Pamegta_kartu, Atlikejas, Albumas) VALUES 
('Pop daina 1', 210, '2024-01-01', 15, 1, 1),
('Pop daina 2', 180, '2024-01-03', 20, 1, 1),
('Roko daina 1', 240, '2024-02-01', 5, 2, 2),
('Roko daina 2', 300, '2024-02-05', 10, 2, 2),
('Rapo daina 1', 150, '2024-03-06', 25, 3, 3),
('Rapo daina '2, 220, '2024-03-08', 30, 3, 3);

INSERT INTO Grojarastis (Pavadinimas, Dainu_skaicius, Klausytojas) VALUES 
('G1', 3, 1),
('G2', 2, 2),
('G3', 1, 3);

INSERT INTO Grojarascio_Daina (Grojarastis, Daina) VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6);

INSERT INTO Pamegta_Daina (Klausytojas, Daina) VALUES 
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 5),
(3, 6);