--création de la vue hotel station
CREATE OR REPLACE VIEW hotel_station
AS
SELECT h.id AS hotel_id,
h.station_id,
h.name as "Hotel name",
h.category,
h.address,
h.city,
s.name AS "Station name",
s.altitude
FROM hotel h
JOIN station s ON h.station_id = s.id;

--test
select * from hotel_station;


--A partir de la base « hotel », créez les vues suivantes :


--test
select * from hotel_station;

--1. Vue 1 : Afficher la liste des réservations avec le nom des clients
CREATE OR REPLACE VIEW booking_list
AS
select c.last_name as "client name",
b.room_id,
b.booking_date,
b.stay_start_date,
b.stay_end_date,
b.price,
b.deposit
FROM client c 
JOIN booking b ON b.client_id = c.id;

--2. Vue 2 : Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station
CREATE OR REPLACE VIEW room_list
AS
select r."number" as room_number,
h."name" as "hotel",
r."number",
r.capacity,
r."type"
FROM room r 
JOIN hotel h on r.hotel_id = h.id;
JOIN station s  on s.station_id = s.id;

--3. Vue 3 : Afficher les réservations avec le nom du client et le nom de l’hôtel
CREATE OR REPLACE VIEW booking_client
AS
select 
c.last_name,
c.first_name,
h."name" as "hotel",
b.room_id as "room number",
b.booking_date,
b.stay_start_date,
b.stay_end_date,
b.price,
b.deposit
FROM booking b
join client c on b.client_id = c.id
join room r on b.room_id = r.id
JOIN hotel h on r.hotel_id = h.id
JOIN station s  on h.station_id = s.id;

--test
select  * from booking_client;


--RESTRICTION

--1. Créez un utilisateur « application_admin » pouvant se connecter au SBGD
CREATE ROLE application_admin_2 LOGIN PASSWORD '123456';

--2. Ajoutez une connexion à la base de données « hotel » en utilisant votre 
--nouvel utilisateur dans votre client SQL.
CREATE ROLE user_2 LOGIN PASSWORD '123456';

--3. Essayez d’effectuer un select sur une table, que se passe t il ?
--en testant depuis le profil user, il n'a aucune permission par défaut



--AJOUT DE PRIVILEGES

GRANT <liste-privileges>
ON <nom-table> TO <nom-role>;


