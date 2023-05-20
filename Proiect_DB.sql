create table angajati_Remotech
(angajat_id number(7) primary key,
nume varchar2(20), 
prenume varchar2(20),
email varchar2(30),
data_angajare date,
id_superior number(7),
salariul_lunar number(8,2),
departament_id number(6), 
id_functie number(6), 
id_livrare number(5));

create table Departamente_Remotech
(departament_id number(7) primary key,
nume_departament varchar2(20) unique, 
numar_telefon varchar2(11) unique,
id_coordonator number(7)); 

create table functii_Remotech
(id_functie number(7)
primary key,
denumire_functie
varchar(20)unique);

create table furnizori
(id_furnizor number(7) constraint id_furnizor_pk primary key,
nume_furnizor varchar(20),
id_produs number(7),
pret_produs number(7,2),
constraint id_produs_pret_produs_uk unique (id_produs, pret_produs));

create table produse_Remotech
(id_produs number(7) constraint id_produs_pk primary key,
denumire_produs varchar(20),
marca_produs varchar(20),
model_produs varchar(20),
id_furnizor number(7), 
id_livrare number(7), 
constraint id_furnizor_fk foreign key (id_furnizor) references furnizori (id_furnizor));

create table livrari
(id_livrare number(7) primary key,
data_receptie date,
data_finalizare date,
id_locatie number(7), 
id_produs number(7) constraint id_produs_fk references produse_Remotech(id_produs),
numar_bucati_livrate number(5));

create table locatii_livrari
(id_locatie number(7),
oras varchar2(20),
tara varchar2(20),
constraint id_locatii_pk primary key (id_locatie)
);


alter table produse_Remotech
add constraint id_livrare_fk foreign key(id_livrare) references livrari (id_livrare);
alter table livrari 
add constraint id_locatie_fk foreign key (id_locatie) references locatii_livrari (id_locatie);
alter table furnizori
add constraint id_produsfurnizori_fk foreign key (id_produs) references produse_Remotech(id_produs);

alter table angajati_Remotech
add constraint id_livrareAngajati_fk foreign key (id_livrare) references livrari(id_livrare);

alter table angajati_Remotech
add constraint angajati_id_departament_fk foreign key (departament_id) references Departamente_Remotech(departament_id);

alter table angajati_Remotech
add constraint angajati_id_functie_fk foreign key (id_functie) references Functii_Remotech (id_functie);

alter table departamente_Remotech
drop column id_coordonator;
alter table functii_Remotech
MODIFY (denumire_functie varchar2(30));


insert into functii_Remotech values(100, 'Agent in salubritate');
insert into functii_Remotech values(101, 'Coordonator salubritate');
insert into functii_Remotech values(102, 'Contabil');
insert into functii_Remotech values(103, 'Coordonator contabilitate');
insert into functii_Remotech values(104, 'Director general');
insert into functii_Remotech values(105, 'Agent Marketing');
insert into functii_Remotech values(106, 'Coordonator Marketing');
insert into functii_Remotech values(107, 'Paza');
insert into functii_Remotech values(108, 'Coordonator Paza');
insert into functii_Remotech values(109, 'Livrator');
insert into functii_Remotech values(110, 'Coordonator Livrari');

insert into Departamente_Remotech values (1000, 'Contabilitate', '0721345687');
insert into Departamente_Remotech values (1001, 'Salubritatee', '0721346999');
insert into Departamente_Remotech values (1002, 'Marketing', '0721356734');
insert into Departamente_Remotech values (1003, 'Vanzari', '0721345688');
insert into Departamente_Remotech values (1004, 'Asistenta medicala', '0721353221');
insert into Departamente_Remotech values (1005, 'Conducere', '0722677891');

alter table furnizori
drop constraint id_produsfurnizori_fk;

insert into furnizori values (202,'Toshiba', 303, 5100);
insert into furnizori values (203,'ASUS', 304, 6100);
insert into furnizori values (204,'Samsung', 305, 4300.99);
insert into furnizori values (205,'Nokia', 301, 439.77);
insert into furnizori values (206,'Huawei', 300, 1439.8); 
insert into furnizori values (207,'Apple', 307, 4500.7);
insert into furnizori values (208,'Apple', 302, 3030);
insert into furnizori values (209,'Samsung', 306, 5200);
insert into furnizori(id_furnizor) values (210);

insert into locatii_livrari values( 41,'Bucuresti', 'Romania');
insert into locatii_livrari values( 42,'Budapesta', 'Ungaria');
insert into locatii_livrari values( 43,'Sofia', 'Bulgaria');
insert into locatii_livrari values( 44,'Beriln', 'Germaina');

alter table produse_Remotech
drop constraint id_livrare_fk;

insert into produse_Remotech values( 300, 'Telefon', 'Huwaei', 'Mate20Lite', 206, 50);
insert into produse_Remotech values( 301, 'Telefon', 'Nokia', '8210Dual', 205, 54);
insert into produse_Remotech values( 302, 'Telefon', 'iPhone', '13 5G', 208, 51);
insert into produse_Remotech values( 303, 'Laptop', 'Toshiba', 'SatelitePro', 202, 52);
insert into produse_Remotech values( 304, 'Laptop', 'ASUS', 'X515EA', 203, 53);
insert into produse_Remotech(id_produs, denumire_produs, marca_produs, model_produs, id_furnizor) values(305, 'Telefon', 'Samsung' , 'GalaxyS10e', 204);
insert into produse_Remotech(id_produs, denumire_produs, marca_produs, model_produs, id_furnizor) values(306, 'Telefon', 'Samsung' , 'GalaxyS4', 209);
insert into produse_Remotech(id_produs, denumire_produs, marca_produs, model_produs, id_furnizor) values(307, 'Telefon', 'Apple' , 'iPhone8Plus', 207);

insert into livrari values (50, '02-Dec-2018' , '31-Dec-2018', 44, 300, 2);
insert into livrari values (51, '03-Jul-2019' , '06-Jul-2019', 41, 302, 4);
insert into livrari values (52, '02-Jan-2020' , '05-Jan-2020', 42, 303,3);
insert into livrari values (53, '02-Feb-2021' , '05-Feb-2021', 44, 304, 1);
insert into livrari values (54, '02-May-2022' , '05-May-2022', 43, 301, 5);

alter table produse_Remotech
add constraint id_livrare_fk foreign key(id_livrare) references livrari (id_livrare);

insert into departamente_remotech values( 1006, 'Paza', '0721334681');

update functii_remotech
set denumire_functie = 'Paznic'
where id_functie = 107;

insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, salariul_lunar, departament_id, id_functie) values(1, 'Peng', 'Denis', 'denispeng@yahoo.com', '03-Mar-2018', 8500.56, 1005, 104);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(2, 'Ion', 'Marin', 'ionmarin@gmail.com', '03-Oct-2018', 1, 7500.00, 1000, 103);
insert into angajati_Remotech values(3, 'Stones', 'Robert', 'roberts@gmail.com', '03-Oct-2019' ,1, 5500.70, 1003, 110, 50);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(4, 'Karls', 'Joshua', 'joshuakarls@yahoo.com', '03-Apr-2020', 6, 2800.1, 1006, 107);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(5, 'Karls', 'Daniel', 'danielkarls@yahoo.com', '04-Apr-2020', 6, 2800.1, 1006, 107);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(6, 'Alex', 'Ionescu', 'AlexIonescu@gmail.com', '03-Feb-2019' ,1, 3560.4, 1006, 108);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(7, 'Iasmina', 'Jason', 'IasminaJ@yahoo.com', '20-Apr-2020', 2, 5000, 1000, 102);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(8, 'Dana', 'Pop', 'popdanaJ@yahoo.com', '20-Apr-2021', 2, 5050, 1000, 102);
insert into angajati_Remotech values(9, 'Ana', 'Marinescu', 'anamarinescu@gmail.com', '03-Jun-2019' ,3, 3000.90, 1003, 109, 53);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(10, 'Ricardo', 'David', 'davidr@yahoo.com', '19-Mar-2022', 12, 1750, 1001, 100);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(11, 'Marcu', 'Nitu', 'marcunitu@yahoo.com', '20-Jan-2022', 2, 4050, 1000, 102);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(12, 'Angel', 'Davis', 'angeld@yahoo.com', '19-Mar-2022', 1, 1950, 1001, 101);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(13, 'Iris', 'Adams', 'irisadams@gamil.com', '20-Nov-2018', 1, 5500.78, 1002, 106);
insert into angajati_Remotech values(14, 'Chen', 'Wuang', 'chenwuang@gmail.com', '15-Jun-2020' ,3, 3000.90, 1003, 109, 51);
insert into angajati_Remotech values(15, 'Ammar', 'Kaleb', 'ammkaleb@yahoo.com', '15-Sep-2020' ,3, 3000.90, 1003, 109, 54);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(16, 'Andreescu', 'Cezar', 'andrcez@yahoo.com', '01-Aug-2022', 12, 1750, 1001, 100);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(17, 'Steve', 'James', 'stevej@gamil.com', '21-Feb-2019', 13, 4200, 1002, 105);
insert into angajati_Remotech values(18, 'George', 'Neacsu', 'georgeneacsu@gmail.com', '04-Jul-2019' ,3, 3200.90, 1003, 109, 52);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(19, 'Andrew', 'James', 'andrewj@gamil.com', '21-Feb-2019', 13, 4200, 1002, 105);
insert into angajati_Remotech(angajat_id, nume, prenume,email, data_angajare, id_superior, salariul_lunar, departament_id, id_functie) values(20, 'Radu', 'Tudor', 'radutud@gamil.com', '23-Apr-2020', 13, 4100, 1002, 105);






