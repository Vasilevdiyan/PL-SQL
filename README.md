# PL-SQL
PL/SQL Code from the Uni-Project



DROP TABLE Kunde CASCADE CONSTRAINTS;
DROP TABLE Stornierung CASCADE CONSTRAINTS;
DROP TABLE Zimmer CASCADE CONSTRAINTS;
DROP TABLE Mitarbeiter CASCADE CONSTRAINTS;
DROP TABLE Buchungen CASCADE CONSTRAINTS;
DROP TABLE Reservierung CASCADE CONSTRAINTS;
DROP TABLE Portal CASCADE CONSTRAINTS;
DROP TABLE ARCHIV_KUNDE CASCADE CONSTRAINTS;
DROP TABLE ARCHIV_KUNDE_Delete CASCADE CONSTRAINTS;
DROP TABLE ARCHIV_KUNDE_Update CASCADE CONSTRAINTS;



DROP TYPE Kunde_person;
DROP TYPE MITARBEITER_PERSON;
DROP TYPE PERSON;
DROP TYPE Tätigkeit_t;



CREATE OR REPLACE TYPE Tätigkeit_t AS OBJECT(

Tätigkeitsfeld VARCHAR2(20),
Ebene VARCHAR2(20),
Bewertungspunkte INT

);


Create or replace type person as object (
    person_ID INT,
    Name Varchar2(100),
    vorname varchar2(100),
    email varchar2(100),
    kontonummer Int,
    telefonnummer int,
    Geburtsdatum Date
) NOT final;


create or replace  type Kunde_person under person (
nationalität Varchar2(100)) Not Final;



create or replace type mitarbeiter_person under person(
    tätigkeitsfeld Tätigkeit_t,
    gehalt int
     )Final;

CREATE table Kunde of Kunde_person (person_ID primary key)
Object Identifier is Primary Key;


create table mitarbeiter of mitarbeiter_person ( person_ID primary key )
OBJECT IDENTIFIER IS PRIMARY KEY;





ALTER TABLE Kunde ADD CHECK ( KONTONUMMER > 999 ) INITIALLY IMMEDIATE;


CREATE TABLE Zimmer(

Zimmer_ID INT PRIMARY KEY,
Person_ID INT NOT NULL,
Zimmerart VARCHAR2(324) NOT NULL,
Extras VARCHAR2(45) NULL,
Preis DECIMAL(19,5) NOT NULL
);



ALTER TABLE Mitarbeiter ADD CHECK ( Kontonummer > 999 ) INITIALLY IMMEDIATE;


CREATE TABLE Buchungen(

Buchungs_ID INT PRIMARY KEY,
Zimmer_ID INT NOT NULL,
Person_ID INT NOT NULL,
Person_ID_Mitarbeiter INT NOT NULL,
Stornierungs_ID INT NULL,
Reservierungs_ID INT NULL,
Portal_ID  INT NULL,
Buchungsdatum_von DATE NOT NULL,
Buchungsdatum_bis DATE NOT NULL,
Rabatt INT NULL
);

ALTER TABLE Buchungen ADD CHECK ( Buchungsdatum_von < Buchungsdatum_bis) INITIALLY IMMEDIATE;


CREATE TABLE Reservierung(

 Reservierungs_ID INT PRIMARY KEY,
 Person_ID INT NOT NULL,
 Zimmer_ID INT NOT NULL,
 Reservierung_von DATE NOT NULL,
 Reservierung_bis DATE NOT NULL
 );

ALTER TABLE Reservierung ADD CHECK ( reservierung_von < reservierung_bis ) INITIALLY IMMEDIATE;


CREATE TABLE Stornierung(

Stornierungs_ID INT PRIMARY KEY,
 Bemerkung VARCHAR2(100) NULL,
 Person_ID INT NOT NULL,
 Zimmer_ID INT NOT NULL
 );



 CREATE TABLE ARCHIV_KUNDE(

Archiv_Kunden_ID INT PRIMARY KEY,
Archiv_Vorname VARCHAR2(34) NOT NULL,
Archiv_Name VARCHAR2(56) NOT NULL,
Archiv_Geb_Datum DATE NOT NULL,
Archiv_Tel_Nummer INT NOT NULL,
Archiv_Email  VARCHAR2(34) NOT NULL,
Archiv_Kontonummer INT NOT NULL,
Archiv_Nationalitaet VARCHAR2(100) NOT NULL
);


 CREATE TABLE ARCHIV_KUNDE_Update(

Archiv_Kunden_ID2 INT PRIMARY KEY,
Archiv_Vorname2 VARCHAR2(34) NOT NULL,
Archiv_Name2 VARCHAR2(56) NOT NULL,
Archiv_Geb_Datum2 DATE NOT NULL,
Archiv_Tel_Nummer2 INT NOT NULL,
Archiv_Email2 VARCHAR2(34) NOT NULL,
Archiv_Kontonummer2 INT NOT NULL,
Archiv_Nationalitaet2 VARCHAR2(100) NOT NULL
);




 CREATE TABLE ARCHIV_KUNDE_Delete(

Archiv_Kunden_id3 INT PRIMARY KEY,
Archiv_Vorname3 VARCHAR2(34) NOT NULL,
Archiv_Name3 VARCHAR2(56) NOT NULL,
Archiv_Geb_Datum3 DATE NOT NULL,
Archiv_Tel_Nummer3 INT NOT NULL,
Archiv_Email3  VARCHAR2(34) NOT NULL,
Archiv_Kontonummer3 INT NOT NULL,
Archiv_Nationalitaet3 varchar2(100) NOT NULL
);



CREATE TABLE Portal(

Portal_ID INT PRIMARY KEY,
Name VARCHAR2(15) NOT NULL,
Bewertung NUMBER(6) NOT NULL
);






ALTER TABLE Buchungen
ADD CONSTRAINT fk_mit_buch
FOREIGN KEY (Person_ID_Mitarbeiter) REFERENCES Mitarbeiter (Person_ID)
ON DELETE CASCADE  INITIALLY IMMEDIATE ;


ALTER TABLE Buchungen ADD  CONSTRAINT fk_zim_buch
FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer
ON DELETE CASCADE INITIALLY IMMEDIATE;


ALTER TABLE Buchungen add CONSTRAINT fk_res_buch
FOREIGN KEY (Reservierungs_ID) REFERENCES Reservierung
ON DELETE CASCADE INITIALLY IMMEDIATE;


ALTER TABLE Buchungen ADD CONSTRAINT fk_por_buch
FOREIGN KEY (Portal_ID) REFERENCES Portal
ON DELETE CASCADE INITIALLY IMMEDIATE;


ALTER TABLE Buchungen ADD CONSTRAINT fk_sto_buch
FOREIGN KEY (Stornierungs_ID) REFERENCES Stornierung
ON DELETE CASCADE INITIALLY IMMEDIATE;


ALTER TABLE Buchungen ADD CONSTRAINT fk_kun_buch
FOREIGN KEY (Person_ID) REFERENCES Kunde (Person_ID)
ON DELETE CASCADE INITIALLY IMMEDIATE;


ALTER TABLE Reservierung ADD CONSTRAINT fk_kun_res
FOREIGN KEY (Person_ID) REFERENCES Kunde
ON DELETE CASCADE INITIALLY IMMEDIATE;


ALTER TABLE Reservierung ADD CONSTRAINT fk_zim_res
FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer
ON DELETE CASCADE INITIALLY IMMEDIATE ;


ALTER TABLE Stornierung ADD CONSTRAINT fk_zim_sto
FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer
ON DELETE CASCADE INITIALLY IMMEDIATE;


ALTER TABLE Stornierung ADD CONSTRAINT fk_kund_sto
FOREIGN KEY (Person_ID) REFERENCES Kunde
ON DELETE CASCADE INITIALLY IMMEDIATE;


ALTER TABLE Zimmer ADD CONSTRAINT fk_mit_zim
FOREIGN KEY (Person_ID) REFERENCES Mitarbeiter
ON DELETE CASCADE INITIALLY IMMEDIATE;

COMMIT;

DROP SEQUENCE seq_kunde;
DROP SEQUENCE seq_mitarbeiter;
DROP SEQUENCE seq_zimmer;
DROP SEQUENCE seq_portal;
DROP SEQUENCE seq_buchungen;
DROP SEQUENCE seq_stornierung;
DROP SEQUENCE seq_reservierungen;


CREATE SEQUENCE seq_kunde;
CREATE SEQUENCE seq_mitarbeiter;
CREATE SEQUENCE seq_zimmer;
CREATE SEQUENCE seq_portal;
CREATE SEQUENCE seq_buchungen;
CREATE SEQUENCE seq_stornierung;
CREATE SEQUENCE seq_reservierungen;





/* INSERTS */


INSERT INTO Mitarbeiter VALUES
(seq_mitarbeiter.nextval,'Laura','Vintricci','vintricci@com.de',6355656565363,1600,'15.05.1998',Tätigkeit_t('Datenerfasser','Operativ',6),1353);

INSERT INTO Kunde VALUES
(seq_kunde.nextval,'Marco','Schmitz','Marco@com.de',3434343,343434343,'04.06.1990','Bulgarien');

INSERT INTO Zimmer VALUES (seq_zimmer.nextval,seq_mitarbeiter.currval,'Doppelzimmer','keine',50.50);
INSERT INTO Portal VALUES (seq_portal.nextval,'Booking.com',6);
INSERT INTO Buchungen VALUES (seq_buchungen.nextval,seq_zimmer.currval,seq_kunde.currval,seq_Mitarbeiter.currval,'','',seq_portal.currval,'20.05.2020','30.05.2020',0);






INSERT INTO Mitarbeiter VALUES
(seq_mitarbeiter.nextval,'Marco','Erlos','erlos@com.de',4545774336,1400,'01.09.1994',Tätigkeit_t('Manager','Strategisch',6),3045);

INSERT INTO Kunde VALUES
(seq_kunde.nextval,'Theodor','Dünnwald','dünnwald@com.de',465633484,4799543,'04.06.1990','Deutschland');

INSERT INTO Zimmer VALUES (seq_zimmer.nextval,seq_mitarbeiter.currval,'Doppelzimmer','Keine',600.50);
INSERT INTO Portal VALUES (seq_portal.nextval,'Booking.com',6);
INSERT INTO Buchungen VALUES (seq_buchungen.nextval,seq_zimmer.currval,seq_kunde.currval,seq_Mitarbeiter.currval,'','',seq_portal.currval,'20.05.2020','30.05.2020',0);




COMMIT;










/* Trigger1 Gewinn_Check */

CREATE OR REPLACE TRIGGER Gewinn_Check AFTER INSERT ON Buchungen

DECLARE
Umsatz INT;

    BEGIN
       SELECT SUM(Preis) INTO Umsatz FROM Zimmer NATURAL JOIN Buchungen ;


IF Umsatz > 2000


    THEN

    UPDATE Mitarbeiter m  SET m.GEHALT = m.GEHALT * 1.30 WHERE m.TÄTIGKEITSFELD.EBENE = 'Strategisch' AND m.TÄTIGKEITSFELD.BEWERTUNGSPUNKTE> 5;
    UPDATE Mitarbeiter m  SET m.GEHALT = m.GEHALT * 1.10 WHERE m.TÄTIGKEITSFELD.EBENE = 'Operativ' AND m.TÄTIGKEITSFELD.BEWERTUNGSPUNKTE > 5;


END IF;



    END;
/
SHOW ERRORS  ;



/* Testfälle Gewinn_Check */


/*Testfall1*/

SELECT SUM(Preis) FROM Zimmer NATURAL JOIN Buchungen;
Select m.GEHALT from mitarbeiter m;


INSERT INTO Mitarbeiter VALUES
(seq_mitarbeiter.nextval,'Lorenzio','Dachser','dachser@com.de',3434765342,1446,'14.05.1975',Tätigkeit_t('Rezeptionist','Operativ',3),1459);
INSERT INTO Kunde VALUES
(seq_kunde.nextval,'Valentina','Schnas','Schnas@com.de',3433527343,43343,'03.06.1990','Deutschland');
INSERT INTO Zimmer VALUES (seq_zimmer.nextval,seq_mitarbeiter.currval,'Doppelzimmer','Keine',369);
INSERT INTO Reservierung VALUES (seq_reservierungen.nextval,seq_kunde.currval,seq_zimmer.currval,'08.11.2020','10.01.2021');
INSERT INTO Stornierung VALUES (seq_stornierung.nextval,'stoniert wegen Scheidung',seq_kunde.currval,seq_zimmer.currval);
INSERT INTO Buchungen VALUES (seq_buchungen.nextval,seq_zimmer.currval,seq_kunde.currval,seq_mitarbeiter.currval,'',seq_reservierungen.currval,seq_portal.currval,'20.05.2020','30.05.2020',4);
COMMIT;


/*Testfall2*/


INSERT INTO Mitarbeiter VALUES
(seq_mitarbeiter.nextval,'Patrick','Star','star@com.de',34576765342,1346,'15.05.1991',Tätigkeit_t('Rezeptionist','Operativ',3),1131);
INSERT INTO Kunde VALUES
(seq_kunde.nextval,'Valentin','Großhäuser','Großhäuser@com.de',3433547343,47343,'04.06.1990','Canada');
INSERT INTO Zimmer VALUES (seq_zimmer.nextval,seq_mitarbeiter.currval,'Presidentapartment','Jacuzzi',1000);
INSERT INTO Reservierung VALUES (seq_reservierungen.nextval,seq_kunde.currval,seq_zimmer.currval,'08.12.2020','08.01.2021');
INSERT INTO Stornierung VALUES (seq_stornierung.nextval,'stoniert wegen Scheidung',seq_kunde.currval,seq_zimmer.currval);
INSERT INTO Buchungen VALUES (seq_buchungen.nextval,seq_zimmer.currval,seq_kunde.currval,seq_mitarbeiter.currval,'',seq_reservierungen.currval,seq_portal.currval,'20.05.2020','30.05.2020',4);
COMMIT;


SELECT m.Gehalt FROM Mitarbeiter m;










/* Trigger2 Archivieren */

create or replace TRIGGER  Archivieren after insert or update or delete    on Kunde
    for each row
    begin
     if inserting then
     insert into Archiv_Kunde values(:new.person_id,:new.vorname,:new.name,:new.geburtsdatum,:new.telefonnummer,
     :new.email,:new.kontonummer,:new.nationalität);
        end if;


        if updating then
        insert into Archiv_Kunde_update values(:old.person_id,:old.vorname,:old.name,:old.geburtsdatum,
        :old.telefonnummer, :old.email,:old.kontonummer,:old.nationalität);
     end if ;


     if deleting then
      insert into Archiv_Kunde_delete values(:old.person_id,:old.vorname,:old.name,:old.geburtsdatum,
        :old.telefonnummer,
     :old.email,:old.kontonummer,:old.nationalität);
     end if ;
    end;
/






/*Testfälle Archiv*/


INSERT INTO Kunde VALUES
(seq_kunde.nextval,'Werner','Hemmels','Hemmels@com.de',3424343,34544343,'04.06.1990','Deutschland');

UPDATE Kunde SET Name = 'Diyan' WHERE PERSON_ID = 1;

DELETE FROM KUNDE WHERE  PERSON_ID = 1;

Select * From Archiv_Kunde;
Select * From Archiv_Kunde_Update;
Select * From Archiv_Kunde_Delete;










/*  Trigger3 MAXRABATT  */

CREATE OR REPLACE TRIGGER MAXRABATT AFTER INSERT ON BUCHUNGEN


DECLARE
  X INT ;
  Output VARCHAR2(100);
  Output2 VARCHAR2(100);
  Restrabatt VARCHAR2(100);


BEGIN



SELECT SUM(Rabatt) INTO X FROM BUCHUNGEN;




IF X < 50 THEN
OUTPUT := 'Wir haben zurzeit einen Gesamten Rabatt von'  || ' ' || X;
END IF;

Restrabatt := 50 - x ;

IF X > 50 THEN Restrabatt:= 0;



END IF;

OUTPUT2 := 'Sie haben noch die Möglichkeit den Kunden Rabatt in Höhe von ' || Restrabatt || ' Euro zu gewähren';
DBMS_OUTPUT.PUT_LINE('Der Maximale Rabatt darf nicht 50 überschreiten!' );

DBMS_OUTPUT.PUT_LINE(OUTPUT );
DBMS_OUTPUT.PUT_LINE(output2 );

IF X > 50 THEN
raise_application_error(-20001,'Der Maximale Rabatt wurde überschritten');



END IF;

END;

/
SHOW ERRORS;





/*TESTFÄLLE */


SET SERVEROUTPUT ON
INSERT INTO Buchungen VALUES (seq_buchungen.nextval,seq_zimmer.currval,seq_kunde.currval,seq_mitarbeiter.currval,'',seq_reservierungen.currval,seq_portal.currval,'24.05.2020','30.05.2020',10);
COMMIT;

INSERT INTO Buchungen VALUES (seq_buchungen.nextval,seq_zimmer.currval,seq_kunde.currval,seq_mitarbeiter.currval,'',seq_reservierungen.currval,seq_portal.currval,'24.05.2020','30.05.2020',50);
COMMIT;









/* Prozedur1 Statistiken */

SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE Statistiken( Eingabe INT )
    IS
    Umsatz INT;
    Kosten INT ;
    FixeKosten INT := 1000;
    Gewinn INT;
    Durchnittpreis_ProZimmer INT;
    Teuerste_Zimmer INT;
    Billigste_Zimmer INT;
    output VARCHAR2(256);



    BEGIN


        DBMS_OUTPUT.PUT_LINE(' Willkommen zur Funktion Statistiken ');
        DBMS_OUTPUT.PUT_LINE(' ');
        SELECT SUM(Preis) INTO umsatz FROM Zimmer NATURAL JOIN Buchungen;
        SELECT SUM(m.Gehalt + Fixekosten) INTO Kosten FROM Mitarbeiter m;
        Gewinn := Umsatz - Kosten;
        SELECT MAX(Preis) INTO Teuerste_Zimmer FROM Zimmer;
        SELECT MIN(Preis) INTO Billigste_Zimmer FROM Zimmer;
        SELECT AVG(Preis) INTO Durchnittpreis_ProZimmer FROM Zimmer;


        IF Eingabe = 1 THEN
        output :=  ' Der Umsatz betreagt: ' ||' '|| Umsatz;

        ELSIF Eingabe = 2 THEN
        output := ' Die Kosten haben einen Wert von: ' ||' '|| kosten;

        ELSIF Eingabe = 3 THEN
        output := ' Es ergibt sich ein Gewinn in Höhe von: ' ||' '|| Gewinn;

        ELSIF Eingabe = 4 THEN
        output := ' Höchster Zimmerpreis betreagt:' ||' '|| Teuerste_Zimmer;

        ELSIF Eingabe = 5 THEN
        output := ' Niedrigster Zimmerpreis betreagt:' ||' '|| Billigste_Zimmer;

        ELSIF Eingabe = 6 THEN
        output := 'Der Durschnittspreis der Zimmer betreagt:' ||' '|| Durchnittpreis_ProZimmer;

        END IF;




         DBMS_OUTPUT.PUT_LINE(output);

END;
/
SHOW ERRORS;




/* Testfälle */

EXECUTE Statistiken (1);
EXECUTE Statistiken (2);
EXECUTE Statistiken (3);
EXECUTE Statistiken (4);
EXECUTE Statistiken (5);
EXECUTE Statistiken (6);






/*Funktion2 Währungsrechner*/


CREATE OR REPLACE FUNCTION WÄHRUNGSRECHNER(Währung VARCHAR2 , Betrag DECIMAL)
RETURN DECIMAL
IS



    BetragNeu DECIMAL(5,2);

BEGIN


    IF WÄHRUNG = 'Lew' THEN BetragNeu := Betrag * 3;
    ELSIF Währung = 'Dollar' THEN BetragNeu := Betrag * 1.3;
    ELSIF Währung = 'Währung nicht verfügbar' THEN BetragNeu:= 0;
    END IF;
    RETURN BetragNeu;
    END;

    /
SHOW ERRORS ;









/* Prozedur3 Rabatt */


SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE Rabatt( KundenIDSuche INT )



IS

Person VARCHAR2(200) ;
Ergebnis DECIMAL(10) ;
Währung_W VARCHAR2(200);
Output VARCHAR2(200);
Preis_W DECIMAL(19.5);
Text VARCHAR2(200);
x VARCHAR2(500);



BEGIN


SELECT Person_ID INTO Person FROM KUNDE NATURAL JOIN BUCHUNGEN NATURAL JOIN Zimmer WHERE Person_ID = KundenIDSuche ;


SELECT  Nationalität Into x FROM KUNDE  NATURAL JOIN  BUCHUNGEN  WHERE Person_ID = KundenIDSuche ;

IF x = 'Deutschland'
THEN Text :=  '10 Euro Rabatt wurde zur Buchung hinzugefügt - Person:' || Person;
UPDATE BUCHUNGEN  SET RABATT =  10 WHERE Person_ID = KundenIDSuche;





ELSIF x <> 'Deutschland'

THEN Text :=  '15 Euro Rabatt wurde zur Buchung hinzugefügt - Person:' || Person;
UPDATE BUCHUNGEN SET RABATT = 15 WHERE Person_ID = KundenIDSuche;
DBMS_OUTPUT.PUT_LINE(Text);
DBMS_OUTPUT.PUT_LINE('');


SELECT  ( CASE Nationalität

WHEN  'Bulgarien' THEN  'Lew'

WHEN  'Canada' THEN 'Dollar'

ELSE  'Währung nicht verfügbar'

END) INTO Währung_W

FROM Kunde   NATURAL JOIN BUCHUNGEN  NATURAL JOIN ZIMMER WHERE Person_ID = KundenIDSuche;

SELECT PREIS INTO PREIS_W FROM Kunde NATURAL JOIN BUCHUNGEN NATURAL JOIN ZIMMER WHERE Person_ID = KundenIDSuche;

SELECT WÄHRUNGSRECHNER(Währung_W,Preis_W) INTO Ergebnis FROM DUAL;

Output := 'Die Umgewandelte Währung vom Kunden betreagt' || ' ' || Ergebnis;


END IF;


DBMS_OUTPUT.PUT_LINE(TEXT);
DBMS_OUTPUT.PUT_LINE(Output);


END;


/

SHOW ERRORS;


SELECT * FROM KUNDE;
Select Name, Person_ID, Nationalität,Zimmer_ID, Preis, Rabatt from kunde Natural join buchungen natural join Zimmer;
EXECUTE RABATT(1);
Select Name, Person_ID, Nationalität,Zimmer_ID, Preis, Rabatt from kunde Natural join buchungen natural join Zimmer;










Create or replace procedure Check_in (Datum Date)
     is
        Name_Chekin Varchar2(300);
        Cursor c1 IS SELECT DISTINCT m.NAME from kunde m, Buchungen b where b.buchungsdatum_von = datum;
        BEGIN
        OPEN c1;
                LOOP
                FETCH c1 into name_chekin;
          IF c1% NOTFOUND THEN  DBMS_OUTPUT.PUT_LINE('Es ist kein weiterer Check In Vorhanden');
          EXIT
          ;
    END IF;
          DBMS_OUTPUT.PUT_LINE(Name_chekin);
           END LOOP;
           CLOSE c1;



        end;
        /
    Show ERRORS;

    SET SERVEROUTPUT ON

    execute Check_in ('21.05.2020');
    execute Check_in ('20.05.2020');













CREATE OR REPLACE VIEW  Kunde_Reservierung AS  SELECT * FROM Kunde Natural Join Reservierung;


/*Instead of Trigger*/


create or replace TRIGGER insert_on_view1
    INSTEAD OF INSERT ON Kunde_Reservierung
    declare


     duplikate_info EXCEPTION;
     PRAGMA EXCEPTION_INIT (duplikate_info, -00001);

    begin


    Insert into Kunde values (:new.Person_ID,:new.Name,:new.Vorname,:new.Email,
                             :new.Kontonummer,:new.Telefonnummer,:new.Geburtsdatum,:new.Nationalität);
    insert into Reservierung values (:NEW.Reservierungs_ID,:NEW.Person_ID,:NEW.Zimmer_ID,:new.Reservierung_von,:new.Reservierung_bis);

     EXCEPTION
     WHEN duplikate_info THEN
       RAISE_APPLICATION_ERROR (
         num => -20107,
         msg => 'Doppelte Personen- oder Projekt-ID');
   END insert_on_view1 ;


SELECT * FROM Kunde_Reservierung;

INSERT INTO Kunde_Reservierung VALUES (seq_kunde.nextval,'Donald','Peter','Peter@gmail.com',3434235,03434343,
                                       '20.02.1993', 'Deutschland', seq_reservierungen.nextval ,3,
                                       '01.02.2020','04.02.2020');


INSERT INTO Kunde_Reservierung VALUES (1,'Otto','LACHS','LACHS@gmail.com',343434235,034344343,
                                        '20.02.1993', 'Deutschland', seq_reservierungen.nextval , 4 ,
                                       '01.02.2020','08.02.2020');


SELECT * FROM Kunde_Reservierung;
SELECT * from Kunde;
SELECT * from Reservierung;
