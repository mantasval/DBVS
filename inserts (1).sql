INSERT INTO Stud.Knyga VALUES('9998-01-101-9','Duomenu bazes',           'Baltoji',   2015, 212, NULL ) ;
INSERT INTO Stud.Knyga VALUES('9998-01-102-7','Programavimo kalbos',     'Baltoji',   2016, 401, 22.50) ;
INSERT INTO Stud.Knyga VALUES('9999-02-202-2','Operacines sistemos',     'Juodoji',   2016, 356, 19.90) ;
INSERT INTO Stud.Knyga VALUES('9999-02-203-0','Transliavimo metodai',    'Juodoji',   2017, 495, 30.00) ;
INSERT INTO Stud.Knyga VALUES('9998-01-103-5','Objektinis programavimas','Baltoji',   2016, 356, 19.90) ;
INSERT INTO Stud.Knyga VALUES('9997-03-303-5','Informacines sistemos',   'Raudonoji', 2006, 254, 15.50) ;
INSERT INTO Stud.Knyga VALUES('9998-01-104-3','Kompiuteriu tinklai',     'Baltoji',   2007, 455, 35.20) ;

INSERT INTO Stud.Autorius VALUES('9998-01-101-9', 'Jonas',   'Jonaitis'  ) ;
INSERT INTO Stud.Autorius VALUES('9998-01-101-9', 'Petras',  'Petraitis' ) ;
INSERT INTO Stud.Autorius VALUES('9998-01-102-7', 'Pijus',   'Jonaitis'  ) ;
INSERT INTO Stud.Autorius VALUES('9999-02-202-2', 'Pijus',   'Jonaitis'  ) ;
INSERT INTO Stud.Autorius VALUES('9999-02-202-2', 'Onute',   'Jonaityte' ) ;
INSERT INTO Stud.Autorius VALUES('9999-02-202-2', 'Jonas',   'Petraitis' ) ;
INSERT INTO Stud.Autorius VALUES('9999-02-202-2', 'Jonas',   'Jonaitis'  ) ;
INSERT INTO Stud.Autorius VALUES('9999-02-203-0', 'Juozas',  'Juodakis'  ) ;
INSERT INTO Stud.Autorius VALUES('9999-02-203-0', 'Antanas', 'Antanaitis') ;
INSERT INTO Stud.Autorius VALUES('9998-01-103-5', 'Maryte',  'Grazulyte' ) ;
INSERT INTO Stud.Autorius VALUES('9998-01-103-5', 'Janina',  'Jonaityte' ) ;
INSERT INTO Stud.Autorius VALUES('9997-03-303-5', 'Simas',   'Simaitis'  ) ;
INSERT INTO Stud.Autorius VALUES('9997-03-303-5', 'Petras',  'Petraitis' ) ;
INSERT INTO Stud.Autorius VALUES('9997-03-303-5', 'Simas',   'Baltakis'  ) ;
INSERT INTO Stud.Autorius VALUES('9998-01-104-3', 'Jonas',   'Petraitis' ) ;

INSERT INTO Stud.Skaitytojas VALUES(1000, '50101010222', 'Jonas',   'Petraitis', '2003-01-01', 'Tiesioji 1-10' ) ;
INSERT INTO Stud.Skaitytojas VALUES(1001, '39902200102', 'Jonas',   'Onaitis',   '2004-02-28', 'Lenktoji 20' ) ;
INSERT INTO Stud.Skaitytojas VALUES(1010, '49903021111', 'Milda',   'Onaityte',  '2004-03-02', 'Didzioji 21-5' ) ;
INSERT INTO Stud.Skaitytojas VALUES(1015, '49906301011', 'Onute',   'Petraityte','2004-06-30', 'Didzioji 21-5' ) ;
INSERT INTO Stud.Skaitytojas VALUES(1021, '39905301031', 'Petras',  'Jonaitis',  '2003-05-30', 'Mazoji 1' ) ;
INSERT INTO Stud.Skaitytojas VALUES(1032, '39912310031', 'Tadas',   'Onaitis',   '2004-12-31', 'Tiesioji 12' ) ;
INSERT INTO Stud.Skaitytojas VALUES(1033, '49911300131', 'Grazina', 'Petraityte','2004-11-30', 'Tiesioji 1-10' ) ;
INSERT INTO Stud.Skaitytojas VALUES(1011, '50111010055', 'Jonas', 'Adomaitis','2003-01-01', 'Mazoji 1' ) ;

INSERT INTO Stud.Egzempliorius VALUES(32101, '9998-01-101-9', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32102, '9998-01-101-9', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32103, '9998-01-101-9', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32104, '9998-01-101-9', 1000, '2024-02-02', '2024-05-05' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32105, '9998-01-101-9', 1010, '2024-02-04', '2024-04-14' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32106, '9998-01-101-9', 1021, '2024-02-14', '2024-04-04' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32107, '9998-01-101-9', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32108, '9998-01-101-9', 1001, '2024-02-02', '2024-04-14' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32109, '9998-01-101-9', 1032, '2024-02-20', '2024-04-05' ) ;


INSERT INTO Stud.Egzempliorius VALUES(32200, '9998-01-102-7', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32201, '9998-01-102-7', 1021, '2024-02-02', '2024-04-01' ) ;

INSERT INTO Stud.Egzempliorius VALUES(32301, '9999-02-202-2', 1000, '2024-02-02', '2024-04-15' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32302, '9999-02-202-2', 1021, '2024-02-14', '2024-05-04' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32303, '9999-02-202-2', NULL, NULL, NULL ) ;


INSERT INTO Stud.Egzempliorius VALUES(32330, '9999-02-203-0', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32331, '9999-02-203-0', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32332, '9999-02-203-0', 1010, '2024-02-14', '2024-05-15' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32333, '9999-02-203-0', 1015, '2024-02-14', '2024-04-01' ) ;

INSERT INTO Stud.Egzempliorius VALUES(32401, '9998-01-103-5', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32402, '9998-01-103-5', 1032, '2024-02-20', '2024-05-05' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32403, '9998-01-103-5', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32404, '9998-01-103-5', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32405, '9998-01-103-5', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32406, '9998-01-103-5', 1010, '2024-02-14', '2024-04-04' ) ;

INSERT INTO Stud.Egzempliorius VALUES(32501, '9997-03-303-5', 1010, '2024-02-14', '2024-05-04' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32502, '9997-03-303-5', 1032, '2024-02-20', '2024-05-04' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32503, '9997-03-303-5', 1015, '2024-02-20', '2024-05-05' ) ;
INSERT INTO Stud.Egzempliorius VALUES(32504, '9997-03-303-5', 1001, '2024-02-06', '2024-04-05' ) ;

INSERT INTO Stud.Egzempliorius VALUES(32601, '9998-01-104-3', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32602, '9998-01-104-3', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32603, '9998-01-104-3', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32604, '9998-01-104-3', NULL, NULL, NULL ) ;
INSERT INTO Stud.Egzempliorius VALUES(32605, '9998-01-104-3', NULL, NULL, NULL ) ;
