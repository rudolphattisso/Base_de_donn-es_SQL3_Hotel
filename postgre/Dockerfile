FROM postgres
ENV POSTGRE_USER postgres
ENV POSTGRES_PASSWORD B@nLgU4qz*9?D~3n83
ENV POSTGRES_DB hotel
# copie du fichier de création de BDD dans le conteneur
# lancement automatique du script
COPY 1_hostel-create-tables.sql /docker-entrypoint-initdb.d/1_hostel-create-tables.sql 
COPY 2_hostel-insert.sql /docker-entrypoint-initdb.d/2_hostel-insert.sql 