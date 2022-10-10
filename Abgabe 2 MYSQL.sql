USE HOTEL ;




DROP TABLE IF EXISTS ARCHIV_KUNDE;
DROP TABLE IF EXISTS ARCHIV_KUNDE_Update;
DROP TABLE IF EXISTS ARCHIV_KUNDE_Delete;
DROP TABLE IF EXISTS BUCHUNGEN ;
DROP TABLE IF EXISTS Portal;
DROP TABLE IF EXISTS STORNIERUNG;
DROP TABLE IF EXISTS RESERVIERUNG;
DROP TABLE IF EXISTS ZIMMER;
DROP TABLE IF EXISTS KUNDE;
DROP TABLE IF EXISTS MITARBEITER;





CREATE TABLE Kunde (

Kunden_ID INT PRIMARY KEY,
Vorname VARCHAR(20) NOT NULL,
Name VARCHAR(20) NOT NULL,
Geburtsdatum DATE NOT NULL,
Telefonnummer INT,
Email VARCHAR(45) NULL UNIQUE,
Kontonummer INT NOT NULL UNIQUE,
Nationalität VARCHAR(45)

);


CREATE TABLE Zimmer(

Zimmer_ID INT PRIMARY KEY,
Mitarbeiter_ID INT NOT NULL,
Zimmerart VARCHAR(324) NOT NULL,
Extras VARCHAR(45) NULL,
Preis DECIMAL NOT NULL
);


CREATE TABLE Mitarbeiter (

Mitarbeiter_ID INT PRIMARY KEY,
Name VARCHAR(345) NOT NULL,
Nachname VARCHAR(34) NOT NULL,
EBENE VARCHAR(29),
BEWERTUNGSPUNKTE INT,
Email varchar(34) NOT NULL UNIQUE,
Tel_Nummer INT,
Gehalt DECIMAL NOT NULL,
Kontonummer INT UNIQUE NOT NULL
);


CREATE TABLE Buchungen(

Buchungs_ID INT PRIMARY KEY,
Zimmer_ID INT NOT NULL,
Kunden_ID INT NOT NULL,
Mitarbeiter_ID INT NOT NULL,
Stornierungs_ID INT NULL,
Reservierungs_ID INT NULL,
Portal_ID  INT NULL,
Buchungsdatum_von DATE NOT NULL,
Buchungsdatum_bis DATE NOT NULL,
Rabatt INT NULL
);


CREATE TABLE Reservierung(

 Reservierungs_ID INT PRIMARY KEY,
 Kunden_ID INT NOT NULL,
 Zimmer_ID INT NOT NULL,
 Reservierung_von DATE NOT NULL,
 Reservierung_bis DATE NOT NULL
 );


CREATE TABLE Stornierung(

Stornierungs_ID INT PRIMARY KEY,
 Bemerkung VARCHAR(100) NULL,
 Kunden_ID INT NOT NULL,
 Zimmer_ID INT NOT NULL
 );


 CREATE TABLE ARCHIV_KUNDE(

Archiv_Kunden_ID INT PRIMARY KEY,
Archiv_Vorname VARCHAR(34) NOT NULL,
Archiv_Name VARCHAR(56) NOT NULL,
Archiv_Geb_Datum DATE NOT NULL,
Archiv_Tel_Nummer INT NOT NULL,
Archiv_Email  VARCHAR(34) NOT NULL,
Archiv_Kontonummer INT NOT NULL,
Archiv_Nationalitaet VARCHAR(100) NOT NULL
);


 CREATE TABLE ARCHIV_KUNDE_Update(

Archiv_Kunden_ID2 INT PRIMARY KEY,
Archiv_Vorname2 VARCHAR(34) NOT NULL,
Archiv_Name2 VARCHAR(56) NOT NULL,
Archiv_Geb_Datum2 DATE NOT NULL,
Archiv_Tel_Nummer2 INT NOT NULL,
Archiv_Email2 VARCHAR(34) NOT NULL,
Archiv_Kontonummer2 INT NOT NULL,
Archiv_Nationalitaet2 VARCHAR(100) NOT NULL
);


 CREATE TABLE ARCHIV_KUNDE_Delete(

Archiv_Kunden_id3 INT PRIMARY KEY,
Archiv_Vorname3 VARCHAR(34) NOT NULL,
Archiv_Name3 VARCHAR(56) NOT NULL,
Archiv_Geb_Datum3 DATE NOT NULL,
Archiv_Tel_Nummer3 INT NOT NULL,
Archiv_Email3  VARCHAR(34) NOT NULL,
Archiv_Kontonummer3 INT NOT NULL,
Archiv_Nationalitaet3 varchar(100) NOT NULL
);


CREATE TABLE Portal(

Portal_ID INT PRIMARY KEY,
Name VARCHAR(15) NOT NULL,
Bewertung INT NOT NULL
);





ALTER TABLE Buchungen
ADD CONSTRAINT fk_mit_buch
FOREIGN KEY (Mitarbeiter_ID) REFERENCES Mitarbeiter (Mitarbeiter_ID);


ALTER TABLE Buchungen ADD  CONSTRAINT fk_zim_buch
FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer (Zimmer_ID);


ALTER TABLE Buchungen add CONSTRAINT fk_res_buch
FOREIGN KEY (Reservierungs_ID) REFERENCES Reservierung (Reservierungs_ID) ;


ALTER TABLE Buchungen ADD CONSTRAINT fk_por_buch
FOREIGN KEY (Portal_ID) REFERENCES Portal (Portal_ID);


ALTER TABLE Buchungen ADD CONSTRAINT fk_sto_buch
FOREIGN KEY (Stornierungs_ID) REFERENCES Stornierung (Stornierungs_ID);


ALTER TABLE Buchungen ADD CONSTRAINT fk_kun_buch
FOREIGN KEY (Kunden_ID) REFERENCES Kunde (Kunden_ID);


ALTER TABLE Reservierung ADD CONSTRAINT fk_kun_res
FOREIGN KEY (Kunden_ID) REFERENCES Kunde (Kunden_ID);


ALTER TABLE Reservierung ADD CONSTRAINT fk_zim_res
FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer (Zimmer_ID);


ALTER TABLE Stornierung ADD CONSTRAINT fk_zim_sto
FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer (Zimmer_ID);


ALTER TABLE Stornierung ADD CONSTRAINT fk_kund_sto
FOREIGN KEY (Kunden_ID) REFERENCES Kunde (Kunden_ID);


ALTER TABLE Zimmer ADD CONSTRAINT fk_mit_zim
FOREIGN KEY (Mitarbeiter_ID) REFERENCES Mitarbeiter (Mitarbeiter_ID);

COMMIT;


/* INSERTS */

/* INSERTS */


INSERT INTO Mitarbeiter VALUES
(1,'Laura','Vintricci','Operativ',10,'vintricci@com.de',635565656,1600,5326272);
INSERT INTO Kunde VALUES
(1,'Marco','Schmitz','1990.04.06',45436634,'Marco@com.de',4224234,'Bulgarien');
INSERT INTO Zimmer VALUES (1,1,'doppelzimmer','keine',100);
INSERT INTO Portal VALUES (1,'Booking.com',6);
INSERT INTO Buchungen VALUES (1,1,1,1,Null,Null,1,'2020.02.20','2020.05.30',0);


INSERT INTO Mitarbeiter VALUES
(2,'Peter','Zwegert','Strategisch',10,'Zwegert@com.de',36564634,2800,53345272);
INSERT INTO Kunde VALUES
(2,'Cristiano','Ronaldo','1986.06.12',564576787,'CR7@com.de',45446365,'Deutschland');
INSERT INTO Zimmer VALUES (2,2,'Präsidenten Suite','Alles',5000);
INSERT INTO Portal VALUES (2,'Booking.com',6);
INSERT INTO Reservierung VALUES (2,2,2,'2020.01.12','2020.01.20');
INSERT INTO Buchungen VALUES (2,2,2,2,Null,2,2,'2020.02.20','2020.05.30',0);


INSERT INTO Mitarbeiter VALUES (3,'Pep','Guardiola','Operativ',10,'Guardiola.decom',446346346,1200,987654321);
INSERT INTO Kunde VALUES (3,'Lionel','Messi','1987.05.03',4534534,'mesii@lionelbarca.es',42234,'Deutschland');
INSERT INTO Zimmer VALUES (3,3,'presidentapartment','Jacuzzi',100000);
INSERT INTO Reservierung VALUES (3,3,3,'2020.05.03','2020.07.03');
INSERT INTO Stornierung VALUES (1,'stoniert wegen Scheidung',3,3);


commit;



/* Trigger1 Gewinn_Check */
Drop Trigger if exists Gewinn_check;

DELIMITER $$
CREATE Trigger Gewinn_Check AFTER INSERT ON Buchungen
for each row 
	BEGIN
    
    DECLARE Umsatz INT;
       
       SELECT SUM(Preis) INTO Umsatz FROM Zimmer NATURAL JOIN Buchungen ;


IF Umsatz > 5000


    THEN

    UPDATE Mitarbeiter   SET Gehalt = Gehalt * 1.30 WHERE EBENE = 'Strategisch' AND BEWERTUNGSPUNKTE > 5;
    UPDATE Mitarbeiter   SET Gehalt = Gehalt * 1.10 WHERE EBENE = 'Operativ' AND BEWERTUNGSPUNKTE > 5;


END IF;



    END$$

DELIMITER ;

/* Ausführung Gewinn_Check  || SAFEMODE DEAKTIVIEREN BY PREFERENCES || */
SELECT SUM(Preis) FROM Zimmer NATURAL JOIN Buchungen;
Select Gehalt From Mitarbeiter;

INSERT INTO Buchungen VALUES (3,3,3,3,1,3,2,'2020.05.20','2020.5.30',4);
COMMIT;

SELECT Gehalt FROM Mitarbeiter;
commit;






/* Trigger2 Archivieren */
Drop Trigger if exists Archivieren_Insert;

DELIMITER $$
create TRIGGER  Archivieren_Insert after insert on Kunde
    for each row
    begin
     if new.Kunden_ID then
     insert into Archiv_Kunde values(new.kunden_id,new.vorname,new.name,new.geburtsdatum,new.telefonnummer,
     new.email,new.kontonummer,new.nationalität);
        end if;

    end$$;
DELIMITER ;








Drop Trigger if exists Archivieren_Update;

DELIMITER $$
create TRIGGER  Archivieren_Update after update on Kunde
    for each row
    begin
       if old.name <> new.name or new.vorname <>old.vorname
       or old.Telefonnummer <> new.Telefonnummer or old.Email <> new.Email or
       old.Kontonummer <> new.Kontonummer or old.Nationalität <> new. Nationalität
       then
        insert into Archiv_Kunde_update values(old.kunden_id,old.vorname,old.name,old.geburtsdatum,
        old.telefonnummer, old.email,old.kontonummer,old.nationalität);
     end if ;

    end$$;
DELIMITER ;







Drop Trigger if exists Archivieren_Delete;

DELIMITER $$
create TRIGGER  Archivieren_Delete after delete on Kunde
    for each row
    begin
  
        insert into Archiv_Kunde_delete values(old.kunden_id,old.vorname,old.name,old.geburtsdatum,
        old.telefonnummer, old.email,old.kontonummer,old.nationalität);


    end$$;
DELIMITER ;




/*Testfälle Archiv*/

INSERT INTO Kunde VALUES
(4,'Elyas','Schmitz','1990.03.02',4543634,'Marco@cfom.de',4228234,'Deutschland');

UPDATE Kunde SET Name = 'Peter' WHERE Kunden_ID = 4;

DELETE FROM KUNDE WHERE  Kunden_ID = 4;

Select * From Archiv_Kunde;
Select * From Archiv_Kunde_Update;
Select * From Archiv_Kunde_Delete;
select * from Kunde ;








/*  Trigger3 MAXRABATT  */
drop trigger MaxRabatt;


DELIMITER $$
Create TRIGGER MAXRABATT AFTER INSERT ON Buchungen
for each row
BEGIN


DECLARE X INT ;
SELECT SUM(Rabatt) INTO X FROM Buchungen;


IF X > 1000 THEN 
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: MaxRabatt überschritten!';

ELSEIF X < 0 THEN
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: Ungültige Rabatt Eingabe!!!';

END IF;


END$$;
DELIMITER ;


/* Testfälle MAXRABATT*/


Select Rabatt, NaME FROM BUCHUNGEN NATURAL JOIN KUNDE;

INSERT INTO Mitarbeiter VALUES
(6,'Peter','ZwegOert','StFrategOisch',3,'ZwegGGrt@com.de',3664634,2800,545272);
INSERT INTO Kunde VALUES
(6,'Cristiano','Ronaldo','1956.06.12',5676787,'CGGR7@com.de',456365,'Deutschland');
INSERT INTO Zimmer VALUES (5,2,'Präsidenten Suite','Alles',5000);
INSERT INTO Portal VALUES (5,'Booking.com',6);
INSERT INTO Buchungen VALUES (6,5,6,6,Null,NULL,5,'2020.05.20','2020.05.30',100);



INSERT INTO Mitarbeiter VALUES
(7,'Peter','ZwegOert','StFrategFBGFOisch',3,'ZwegGGFEDrt@com.de',34634,2800,5472);
INSERT INTO Kunde VALUES
(7,'Cristiano','Ronaldo','1956.06.12',56787,'CGGGBGR7@com.de',4563165,'Deutschland');
INSERT INTO Zimmer VALUES (7,2,'Präsidenten Suite','Alles',5000);
INSERT INTO Buchungen VALUES (7,7,7,7,Null,NULL,5,'2020.05.20','2020.05.30',1001);







/* Prozedur1 Statistiken */
Drop procedure Statistiken;

DELIMITER $$
CREATE PROCEDURE Statistiken( Eingabe INT )
    

    BEGIN
	Declare Umsatz INT;
    DECLARE Kosten INT; 
    DECLARE FixeKosten INT default 1000;


    

        Select ' Willkommen zur Funktion Statistiken ';
        SELECT SUM(Preis) INTO umsatz FROM Zimmer NATURAL JOIN Buchungen;
        SELECT SUM(Gehalt + Fixekosten) INTO Kosten FROM Mitarbeiter;
	


        IF Eingabe = 1 THEN
        SELECT SUM(Preis) as Umsatz FROM Zimmer NATURAL JOIN Buchungen;

        elseif Eingabe = 2 THEN
        SELECT SUM(Gehalt + Fixekosten) as 'Die Kosten betragen' FROM Mitarbeiter;

        elseif Eingabe = 3 THEN
        Select Umsatz-Kosten as 'Gewinn';

        ELSeIF Eingabe = 4 THEN
        SELECT concat('Der höchste Zimmerpreis betreagt ',MAX(Preis) ) FROM Zimmer;

        ELSEIF Eingabe = 5 THEN
		SELECT concat('Der günstigste Zimmerpreis ist ',MIN(Preis)) FROM Zimmer;

        elseif Eingabe = 6 THEN
        SELECT AVG(Preis) as 'Durschnittlicher Zimmerpreis' FROM Zimmer;

        END IF;



END$$;
DELIMITER ;




/* Testfälle */

Call Statistiken (1);
Call Statistiken (2);
Call Statistiken (3);
Call Statistiken (4);
Call Statistiken (5);
Call Statistiken (6);

Commit;








/* Funktion Währungsrechner*/

DROP FUNCTION Währungsrechner;


DELIMITER $$

CREATE  FUNCTION WÄHRUNGSRECHNER( Währung VARCHAR(50) , Betrag DECIMAL)
RETURNS DECIMAL
NO SQL




BEGIN

    DECLARE  BetragNeu DECIMAL(5,2);

    IF WÄHRUNG = 'Lew' THEN SET BetragNeu := Betrag * 3;
    ELSEIF  Währung = 'Dollar' THEN SET BetragNeu := Betrag * 1.3;
    ELSEIF  Währung = 'Währung nicht verfügbar' THEN SET BetragNeu:= 0;
    END IF;
    RETURN BetragNeu;
    
    
    END$$
    
    DELIMITER ;







/* Prozedur3 Rabatt */
  
  DROP PROCEDURE RABATT ;
  

DELIMITER $$


CREATE   PROCEDURE Rabatt( KundenIDSuche INT )




BEGIN


DECLARE Person VARCHAR(200) ;
DECLARE Ergebnis VARCHAR(200) ;
DECLARE Währung_W VARCHAR(200);
DECLARE Preis_W DECIMAL(5,2);
DECLARE Output VARCHAR(200);
DECLARE Text VARCHAR(200);
DECLARE X VARCHAR(50);








SELECT KUNDEN_ID INTO Person FROM KUNDE NATURAL JOIN BUCHUNGEN NATURAL JOIN Zimmer WHERE Kunden_ID = KundenIDSuche ;


SELECT  Nationalität Into x FROM KUNDE  NATURAL JOIN  BUCHUNGEN  WHERE Kunden_ID = KundenIDSuche ;
IF x = 'Deutschland'
THEN SET Text :=  '10 Euro Rabatt wurde zur Buchung hinzugefügt';

UPDATE BUCHUNGEN  SET RABATT =  10 WHERE Kunden_ID = KundenIDSuche;





ELSEIF x <> 'Deutschland'

THEN SET Text :=  '15 Euro Rabatt wurde zur Buchung hinzugefügt - Person:' ;
UPDATE BUCHUNGEN SET RABATT =  15 WHERE Kunden_ID = KundenIDSuche;
SELECT Text;



SELECT  ( CASE Nationalität

WHEN  'Bulgarien' THEN  'Lew'

WHEN  'Canada' THEN 'Dollar'

ELSE  'Währung nicht verfügbar'

END) INTO Währung_W

FROM Kunde   NATURAL JOIN BUCHUNGEN  NATURAL JOIN ZIMMER WHERE Kunden_ID = KundenIDSuche;

SELECT PREIS INTO PREIS_W FROM Kunde NATURAL JOIN BUCHUNGEN NATURAL JOIN ZIMMER WHERE kunden_ID = KundenIDSuche;

SELECT WÄHRUNGSRECHNER(Währung_W,Preis_W) INTO Ergebnis FROM DUAL;

SET Output := CONCAT( 'Die Umgewandelte Währung vom Kunden betreagt' , ERGEBNIS);


END IF;


SELECT TEXT;
SELECT Output;


END$$


DELIMITER ;

SELECT KUNDEN_ID, NAME, PREIS, NATIONALITÄT FROM KUNDE NATURAL JOIN BUCHUNGEN NATURAL JOIN ZIMMER;

CALL RABATT(2);

SELECT RABATT FROM BUCHUNGEN WHERE KUNDEN_ID = 1;









DROP PROCEDURE CHECK_IN;

DELIMITER $$

Create  procedure Check_in (Datum Date)
     

        
        BEGIN
			   DECLARE  Name_Chekin Varchar(300);
               DECLARE c1 Cursor  FOR SELECT DISTINCT m.NAME from kunde m, Buchungen b where b.buchungsdatum_von = datum;
               
               
               
        OPEN c1;
                LOOP
                FETCH c1 into name_chekin;
      
		

          SELECT Name_chekin;
           END LOOP;
           CLOSE c1;
           
           
           
        end$$

DELIMITER ;
    
    CALL Check_in ('2020.02.20');
    
    
    
