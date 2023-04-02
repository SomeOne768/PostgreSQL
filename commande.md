# Installation

    -   sudo apt install postgresql
    -   finger postgres : 

## Lancer:
>sudo -i -u postgres


# Desinstallation
## arrêtez le service
>sudo systemctl stop postgresql
## lister les paquets installés liés à postgres :
>dpkg -l | grep postgres
## et les supprimer :
>sudo apt --purge remove postgresql-*

# CONFIG

## Creation d'utilisateur et BDD

```postgresql
CREATE USER username LOGIN;
ALTER ROLE username CREATEDB;
ALTER ROLE username WITH ENCRYPTED PASSWORD 'mdp';

CREATE DATABASE nom OWNER username;
```

```postgresql
DROP DATABASE nom;
```

## Accès
psql nom_base_de_donnee