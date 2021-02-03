
create table Klienci
(
	ID int primary key identity(1,1),
	LoginK varchar(40),
	Haslo varchar (40),
)

create table Kasjerzy
(
	ID int primary key identity(1,1),
	ID_Kina int,
	LoginK varchar(40),
	Haslo varchar (40),
)

create table Bilety
(
	ID int primary key identity(1,1),
	ID_Klienta int,
	ID_Seansu int,
	ID_Kina int,
	DataZakupu datetime,
)

create table Rezerwacje
(
	ID int primary key identity(1,1),
	ID_Klienta int,
	ID_Seansu int,
	ID_Kina int,
	DataWykonania datetime,
)

create table Miejsca
(
	ID int primary key identity(1,1),
	ID_Seansu int,
	ID_Biletu int,
	ID_Rezerwacji int,
	ID_Kina int,
	WspolMiejscaX int,
	WspolMiejscaY varchar(1),
	StatusMiejsca varchar(10),
	TypMiejsca varchar(10),
)

create table Sale
(
	ID int primary key identity(1,1),
	ID_Kina int,
	Numer int,
	IloscMiejscX int,
	IloscMiejscY int,
)

create table Seanse
(
	ID int primary key identity(1,1),
	ID_Kina int,
	ID_WersjiFilmu int,
	ID_Sali int, 
	DataS datetime,
)

create table Kina
(
	ID int primary key identity(1,1),
	Adres varchar(50),
)

create table WersjeFilmów
(
	ID int primary key identity(1,1),
	ID_Filmu int,
	TypWersji varchar(50),
	Obsada varchar(400),
	Dlugosc int
)

create table Oceny
(
	ID int primary key identity(1,1),
	ID_WersjiFilmu int,
	Komentarz varchar(2000),
	Nota int,
)

create table Filmy
(
	ID int primary key identity(1,1),
	Tytul varchar(100),
	Kategoria varchar(20),
	Rezyser varchar(100),
	Informacje varchar(1000),
	OcenaZewnetrzna int,
)
*/
/*
drop table Klienci
drop table Bilety
drop table Rezerwacje
drop table Miejsca
drop table Kasjerzy
drop table Kina
drop table Filmy
drop table WersjeFilmów
drop table Oceny
drop table Seanse
drop table Sale
*/


--select * from Bilety 
--select * from Miejsca
--select * from Seanse

--join Klienci on  Klienci.ID=Bilety.ID_Klienta
--join Klienci on Klienci.ID=Rezerwacje.ID_Klienta


insert into Filmy(Tytul, Kategoria, Rezyser, Informacje, OcenaZewnetrzna) 
		values ('W³adca Pierœcieni: Dru¿yna Pierœcienia', 'Fantasy', 'Peter Jetson', 'Podró¿ hobbita z Shire i jego oœmiu towarzyszy, której celem jest zniszczenie potê¿nego pierœcienia po¿¹danego przez Czarnego W³adcê - Saurona. ', 8.0)
insert into Filmy(Tytul, Kategoria, Rezyser, Informacje, OcenaZewnetrzna) 
		values ('W³adca Pierœcieni: Dwie wie¿e', 'Fantasy', 'Peter Jetson', 'Dru¿yna Pierœcienia zostaje rozbita, lecz zdesperowany Frodo za wszelk¹ cenê chce wype³niæ powierzone mu zadanie. Aragorn z towarzyszami przygotowuje siê, by odeprzeæ atak hord Sarumana.', 8.3)	
insert into Filmy(Tytul, Kategoria, Rezyser, Informacje, OcenaZewnetrzna) 
		values ('W³adca Pierœcieni: Powrót króla', 'Fantasy', 'Peter Jetson', 'Zwieñczenie filmowej trylogii wg powieœci Tolkiena. Aragorn jednoczy si³y Œródziemia, szykuj¹c siê do bitwy, która ma odwróciæ uwagê Saurona od pod¹¿aj¹cych w kierunku Góry Przeznaczenia hobbitów.', 8.4)	
insert into Filmy(Tytul, Kategoria, Rezyser, Informacje, OcenaZewnetrzna) 
		values ('Shrek', 'Animacja', 'Andrew Adamson', 'By odzyskaæ swój dom, brzydki ogr z gadatliwym os³em wyruszaj¹ uwolniæ piêkn¹ ksiê¿niczkê.', 7.8)	
insert into Filmy(Tytul, Kategoria, Rezyser, Informacje, OcenaZewnetrzna) 
		values ('Titanic', 'Katastroficzny', 'James Cameron', 'Rok 1912, brytyjski statek Titanic wyrusza w swój dziewiczy rejs do USA. Na pok³adzie emigrant Jack przypadkowo spotyka arystokratkê Rose. ', 7.3)	
insert into Filmy(Tytul, Kategoria, Rezyser, Informacje, OcenaZewnetrzna) 
		values ('Listy do M.', 'Komedia', 'Mitja Okoron', 'Piêæ kobiet i piêciu mê¿czyzn odkrywa mi³oœæ w czasie œwi¹t Bo¿ego Narodzenia.', 6.9)	
insert into Filmy(Tytul, Kategoria, Rezyser, Informacje, OcenaZewnetrzna) 
		values ('Piraci z Karaibów: Kl¹twa Czarnej Per³y', 'Przygodowy', 'Gore Verbinski', 'Kowal Will Turner sprzymierza siê z kapitanem Jackiem Sparrowem, by odzyskaæ swoj¹ mi³oœæ - porwan¹ córkê gubernatora.', 7.7)
insert into Filmy(Tytul, Kategoria, Rezyser, Informacje, OcenaZewnetrzna) 
		values ('Epoka lodowcowa', 'Animacja', 'Chris Wedge', 'W czasie wielkiej migracji zwierz¹t tygrys szablozêbny, mamut i leniwiec staraj¹ siê oddaæ ludzkie dziecko jego plemieniu.', 7.6)

insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (1,'Napisy', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean', 187);
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (1,'Lektor', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean', 187);
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (1,'Dubbing', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean, Mieczyslaw Moranski, Marcin Przybylski, Leszek Zdun', 188);
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (2,'Napisy', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean', 197);
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (2,'Lektor', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean', 197);
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (2,'Dubbing', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean, Mieczys³aw Morañski, Marcin Przybylski, Leszek Zduñ', 199);
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (3,'Napisy', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean', 176);
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (3,'Lektor', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean', 176);
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (3,'Dubbing', 'Elijah Wood, Viggo Mortensen, Sean Astin, Sean Bean, Mieczys³aw Morañski, Marcin Przybylski, Leszek Zduñ', 179)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (4,'Napisy', 'Mike Myers, Eddie Murphy, Cameron Diaz', 90)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (4,'Dubbing', ' Zbigniew Zamachowski, Agnieszka Kunikowska, Jerzy Stuhr', 91)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (5,'Napisy', ' Leonardo DiCaprio, Kate Winslet, Billy Zane', 102)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (5,'Lektor', ' Leonardo DiCaprio, Kate Winslet, Billy Zane', 102)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (6,'Polski', ' Tomasz Karolak, Maciej Stuhr, Agnieszka Dygant, Piotr Adamczyk', 107)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (7,'Napisy', 'Johnny Depp, Orlando Bloom, Keira Knightley, Geoffrey Rush', 126)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (7,'Lektor', 'Johnny Depp, Orlando Bloom, Keira Knightley, Geoffrey Rush', 126)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (8,'Lektor', 'Ray Romano, John Leguizamo, Denis Leary, Goran Višnjiæ', 112)
insert into WersjeFilmów(ID_Filmu, TypWersji, Obsada, Dlugosc)
		values (8,'Dubbing', 'Wojciech Malajkat , Piotr Fronczewski , Cezary Pazura, Andrzej Blumenfeld ', 1112)

--select * from WersjeFilmów
--join Filmy on  Filmy.ID=WersjeFilmów.ID_Filmu

insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (1,'Ankowski','Elo123');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (1,'Bankowski','Elo320');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (1,'Cankowski','Cankowski997');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (1,'Dankowski','Majonez3');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (2,'Enkowski','33lataniewoli');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (2,'Fankowski','Dajpodwyzke');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (2,'Gankowski','Hal0');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (3,'Hankowski','Anna');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (3,'Inkowski','ABC123');
insert into Kasjerzy
(ID_Kina, LoginK, Haslo) values (3,'Jankowski','CBA321');


insert into Kina
(Adres) values ('Kwiatowa 3');
insert into Kina
(Adres) values ('Za Lasami 11');
insert into Kina
(Adres) values ('Wielkopolska 13');

insert into Klienci
(LoginK,Haslo) values ('a.b@cd.pl','Amarena001');
insert into Klienci
(LoginK,Haslo) values ('anna.kulesza@op.pl','konopie420');
insert into Klienci
(LoginK,Haslo) values ('karolak@rodzinka.pl','Wiedzmin123');
insert into Klienci
(LoginK,Haslo) values ('trek.pol@onet.pl','Amarena001');
insert into Klienci
(LoginK,Haslo) values ('wojtek.kulesza@onet.pl','chleB1');
insert into Klienci
(LoginK,Haslo) values ('pan.wykladowca@pw.edu.pl','PanDa3');
insert into Klienci
(LoginK,Haslo) values ('ree.koko@gmail.com','haha555');
insert into Klienci
(LoginK,Haslo) values ('robert.k@.pl','EeeeeEee');
insert into Klienci
(LoginK,Haslo) values ('plekanpek@gmail.com','pawci0');
insert into Klienci
(LoginK,Haslo) values ('kolejarz123@pkp.pl','PedolinoRobiBrrrr1');
insert into Klienci
(LoginK,Haslo) values ('antek007@gmail.pl','B0ndJamesB0nd');
insert into Klienci
(LoginK,Haslo) values ('billy.m@onet.pl','StaryJestem');
insert into Klienci
(LoginK,Haslo) values ('kolszowski@o2.pl','Afro69');
insert into Klienci
(LoginK,Haslo) values ('piter.w@onet.pl','KiedyObrona666');
insert into Klienci
(LoginK,Haslo) values ('gouda336@gmail.com','cheddar54321');

insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (1,8,'Film super tylko kto posadzil siatkarza na siedzeniu przede mna?')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (1,9,'Nice')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (1,10,'OMG najlepszy film jaki widzialam!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (1,3,'Nie moje klimaty')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (1,10,'Nie znacie sie na filmach jak dajecie takie niskie oceny. Film ten jest mistrzostwem. Stanowi dziedzictwo naszej kultury.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (2,9,'No i git film pierwsza klasa')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (2,10,'Niesomowite.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (2,1,'Slabe')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (3,9,'Mistrzostwo mimo tego dubbingu.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (3,8,'Nice')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (3,7,'Swietny film. Slaby dubbing')

insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (4,10,'Najlepszy film w historii kina. ¯adne trolle tego nie zmieni¹.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (4,9,'Nice')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (4,10,'Piekny!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (5,6,'Sredniawka')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (5,10,'GANDALF!!!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (5,7,'Niezle nawet')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (6,10,'Genialne')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (6,9,'9/10')

insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (7,10,'Najlepszy film w historii kina')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (7,9,'NAJLEPSZY FILM WSZECHCZASOW!!!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (8,10,'Piekny!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (8,9,'Plakalem, takie to epickie!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (8,10,'8/10')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (9,3,'Nie mozna tego sluchac :(')

insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (10,10,'Bezcenne ;)')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (10,10,'Ten film to klejnot, kropka.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (10,10,'I to jest klasyka a nie jakieœ przeciêtne Króle Lwy!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (10,9,'NAJS')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (10,10,'Kocham ten film')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (10,10,'Somebody once told me...')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (11,10,'Swietne ;)')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (11,10,'Klasyczek')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (11,3,'Overrated')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (11,10,'Shrek for life!')

insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (12,1,'Dno')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (12,10,'Majstersztyk.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (13,9,'Piekny film, polecam kazdemu.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (13,8,'Cool')

insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (14,2,'rozczarowana jestem nie da sie tego obejrzec')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (14,10,'Czy Karolak jest singlem? Ale ciacho.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (14,3,'nawet plakat œci¹gnêli...co za kraj...')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (14,9,'fajny, ³atwy dla oka film z fajn¹ obsad¹...')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (14,10,'Odzyska³em wiarê w polskie komedie!!! Bardzo dobry, dobrze zrealizowany, aktorzy fajni. I do œmiechu i do ³ezki - taki trochê nasz polski odpowiednik Love Actually :)')

insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (15,6,'Dobry film, klasyk, ale naisy czasem niezsynchronizowane')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (15,10,'Genialny film')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (15,9,'Zabawny, pelen akcji i ogolnie swietny!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (15,8,'Piraci ARRR')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (16,3,'Dla dzieci raczej')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (16,10,'Swietna gra aktroska')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (16,9,'Polecam kazdemu.')

insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (17,9,'Moje dziecinstwo')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (17,10,'Klasyk!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (17,8,'Zabawny. Swietny!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (17,4,'Na dzisiejsze standardy nie sa to animacje godne mej uwagi')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (18,10,'Legendarny dubbing. Swiatowa klasa!')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (18,9,'Klasyka.')
insert into Oceny
(ID_WersjiFilmu, Nota, Komentarz) values (18,9,'Jeden z najlepszych filmow')


insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (1,1,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (1,2,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (1,3,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (1,4,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (2,1,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (2,2,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (2,3,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (2,4,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (3,1,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (3,2,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (3,3,10,5)
insert into Sale
(ID_Kina, Numer, IloscMiejscX, IloscMiejscY) values (3,4,10,5)



insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 1, 1, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 2, 2, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 3, 3, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 16, 4, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 14, 1, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 2, 2, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 1, 3, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 18, 4, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 7, 1, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 6, 2, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 3, 3, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 8, 4, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 2, 1, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 1, 2, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 11, 3, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 12, 4, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 14, 1, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 15, 2, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 13, 3, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 17, 4, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 2, 1, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 5, 2, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 7, 3, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 16, 4, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 11, 1, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 1, 2, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 8, 3, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 10, 4, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 9, 1, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 13, 2, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 16, 3, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 17, 4, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 1, 1, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 2, 2, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 13, 3, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 14, 4, '2021-02-12 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 15, 1, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 6, 2, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 8, 3, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 9, 4, '2021-02-12 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 16, 1, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 18, 2, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 1, 3, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 2, 4, '2021-02-12 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 5, 1, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 6, 2, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 7, 3, '2021-02-12 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 8, 4, '2021-02-12 22:00:00.000')

-----------------------------------------------------------------------------------

insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 6, 2, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 8, 3, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 10, 4, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 10, 1, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 12, 2, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 13, 3, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 14, 4, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 15, 1, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 16, 2, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 17, 3, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 18, 4, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 15, 1, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 6, 2, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 7, 3, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 8, 4, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 1, 1, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 2, 2, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 3, 3, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 9, 4, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 10, 1, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 7, 2, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 9, 3, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 14, 4, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 15, 1, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 16, 2, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 17, 3, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 18, 4, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 5, 1, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 6, 2, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 7, 3, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 8, 4, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 1, 1, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 2, 2, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 3, 3, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 14, 4, '2021-02-11 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 11, 1, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 10, 2, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 12, 3, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 14, 4, '2021-02-11 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 15, 1, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 16, 2, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 17, 3, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 18, 4, '2021-02-11 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 15, 1, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 1, 2, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 2, 3, '2021-02-11 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 17, 4, '2021-02-11 22:00:00.000')

----------------------------------------------------------------------------------

insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 2, 12, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 3, 13, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 4, 14, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 1, 11, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 2, 12, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 3, 13, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 4, 14, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 5, 11, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 6, 12, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 7, 10, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 8, 9, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 5, 8, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 6, 7, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 7, 7, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (1, 8, 7, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 1, 11, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 2, 12, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 3, 10, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 4, 1, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 1, 6, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 2, 2, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 3, 3, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 4, 4, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 5, 11, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 6, 12, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 7, 13, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 8, 14, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 5, 1, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 6, 2, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 7, 3, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (2, 8, 14, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 1, 11, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 2, 12, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 3, 13, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 4, 6, '2021-02-10 10:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 1, 1, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 2, 9, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 3, 4, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 4, 4, '2021-02-10 14:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 5, 1, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 6, 12, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 7, 3, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 8, 14, '2021-02-10 18:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 5, 1, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 6, 12, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 7, 3, '2021-02-10 22:00:00.000')
insert into Seanse
(ID_Kina, ID_WersjiFilmu, ID_Sali, DataS) values (3, 8, 14, '2021-02-10 22:00:00.000')



DECLARE @intNrSeansu as INT = 1;
DECLARE @intNrMiejscaX as INT = 1;
DECLARE @intNrMiejscaY as INT = 1;

WHILE @intNrSeansu <= 142
BEGIN
	SET @intNrMiejscaX = 1;
	WHILE @intNrMiejscaX <= 10
	BEGIN
		SET @intNrMiejscaY = 1;
		WHILE @intNrMiejscaY <= 5
			BEGIN
			insert into Miejsca
			(ID_Kina, ID_Seansu,  ID_Biletu, ID_Rezerwacji, WspolMiejscaX, WspolMiejscaY, StatusMiejsca, TypMiejsca) 
			values (1, @intNrSeansu, 0, 0,@intNrMiejscaX,@intNrMiejscaY,'wolne', 'normalne')
			SET @intNrMiejscaY = @intNrMiejscaY + 1;
		END;
		SET @intNrMiejscaX = @intNrMiejscaX + 1;
	END;
	SET @intNrSeansu = @intNrSeansu + 1;
END;



insert into Bilety
(ID_Klienta, ID_Kina, ID_Seansu, DataZakupu) values (1,1,1,'2021-01-31 15:09:26.000')
insert into Bilety
(ID_Klienta, ID_Kina, ID_Seansu, DataZakupu) values (1,1,1,'2021-01-31 15:09:26.000')
insert into Bilety
(ID_Klienta, ID_Kina, ID_Seansu, DataZakupu) values (1,1,1,'2021-01-31 15:09:26.000')
insert into Bilety
(ID_Klienta, ID_Kina, ID_Seansu, DataZakupu) values (1,1,1,'2021-01-31 15:09:26.000')

insert into Bilety
(ID_Klienta, ID_Kina, ID_Seansu, DataZakupu) values (2,1,1,'2021-01-31 15:09:26.000')
insert into Bilety
(ID_Klienta, ID_Kina, ID_Seansu, DataZakupu) values (2,1,1,'2021-01-31 15:09:26.000')



insert into Rezerwacje
(ID_Klienta, ID_Kina, ID_Seansu, DataWykonania) values (3,1,1,'2021-01-30 14:27:26.000')
insert into Rezerwacje
(ID_Klienta, ID_Kina, ID_Seansu, DataWykonania) values (4,1,1,'2021-01-28 20:09:26.000')
