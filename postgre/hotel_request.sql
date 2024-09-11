--1 - Afficher la liste des hôtels : Le résultat doit faire apparaître le nom de l’hôtel et la ville
select "name" , city 
from  hotel  ;

--2 - Afficher la ville de résidence de Mr White : Le résultat doit faire apparaître le nom, le prénom,
-- et l'adresse du client
select first_name, last_name , address 
from client  
where last_name like 'White';

--3 - Afficher la liste des stations dont l’altitude < 1000 : Le résultat doit faire apparaître le nom 
--de la station et l'altitude
select "name", altitude 
from station 
where altitude < 1000;

--4 - Afficher la liste des chambres ayant une capacité > 1 : Le résultat doit faire apparaître le numéro
-- de la chambre ainsi que la capacité
select "number", capacity 
from  room 
where capacity > 1;

--5 - Afficher les clients n’habitant pas à Londres : Le résultat doit faire apparaître le nom du client et la ville
select last_name, city 
from client
where city != 'Londres';

--6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie > 3 : Le résultat doit
-- faire apparaître le nom de l'hôtel, ville et la catégorie
select "name",city,category
from hotel
where city like 'Bretou' and category > 3;

--7 - Afficher la liste des hôtels avec leur station : Le résultat doit faire apparaître le nom de la station, le nom 
--de l’hôtel, la catégorie, la ville)
select s."name" as station_name,h."name",h.category, h.id , h.city 
from hotel h
join station s  ON h.station_id = s.id ;

--8 - Afficher la liste des chambres et leur hôtel : Le résultat doit faire apparaître le nom de l’hôtel, la catégorie,
--la ville, le numéro de la chambre)
select h."name" ,h.category, h.city, r."number" 
from room r 
join hotel h  on r.hotel_id  = h.id ;

--9 - Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou :
-- Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre et sa capacité)
select h."name" ,h.category, h.city, r."number" , r.capacity 
from room r 
join hotel h  on r.hotel_id  = h.id 
where r.capacity > 1 and h.city like 'Bretou';

--10 - Afficher la liste des réservations avec le nom des clients : Le résultat doit faire apparaître le nom du client,
-- le nom de l’hôtel, la date de réservation
select c.last_name as client_name , h."name" as hotel_name , b.booking_date 
from booking b 
join client c on b.client_id = c.id 
join room r on b.room_id = r.id 
join hotel h on r.hotel_id = h.id ;


--11 - Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station : Le résultat doit faire apparaître 
--le nom de la station, le nom de l’hôtel, le numéro de la chambre et sa capacité)
select s."name" as station_name, h."name" as hotel_name , r."number" as room_number , r.capacity
from hotel h 
join room r on h.id = r.hotel_id 
join station s on h.station_id = s.id ;

--12 - Afficher les réservations avec le nom du client et le nom de l’hôtel : Le résultat doit faire apparaître le nom
--du client, le nom de l’hôtel, la date de début du séjour et la durée du séjour
select c.last_name as client_name , h."name" as hotel_name , (b.stay_end_date - b.stay_start_date) as duration
from booking b 
join client c on b.client_id = c.id 
join room r on b.room_id = r.id 
join hotel h on r.hotel_id = h.id ;


--13 - Compter le nombre d’hôtel par station
select count(h.station_id) as hotel_per_station
from station s 
join hotel h  ON h.station_id = s.id 
group by s.id;

--14 - Compter le nombre de chambre par station
select s.id , s."name", count(*) as room_per_station
from station s 
join hotel h  ON h.station_id = s.id 
join room r on r.hotel_id = h.id 
group by s.id ;

--15 - Compter le nombre de chambre par station ayant une capacité > 1
select s.id , s."name", count(*) as room_per_station
from station s 
join hotel h  ON h.station_id = s.id 
join room r on r.hotel_id = h.id 
where r.capacity > 1
group by s.id ;

--16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation
select h."name" as hotel, c.last_name , booking_date 
from booking b 
join client c on b.client_id = c.id
join room r on b.room_id = r.id 
join hotel h on h.station_id = h.id
where c.last_name  like 'Squire';

--17 - Afficher la durée moyenne des réservations par station
select avg(stay_end_date - stay_start_date) 
from booking b 
join room r on b.room_id = r.id 
join hotel h on h.station_id = h.id
join station s on h.station_id = s.id;








