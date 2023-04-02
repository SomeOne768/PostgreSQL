# Create



## table:
```SQL
-- drop table name ;

CREATE TABLE [IF NOT EXISTS] nom(
    colonne type [PRIMARY KEY],
    colonne2 smallint references nom_colonne_autre_table,
    ....
);

```

### type:
- smallint; interger; bigint; decimal(7,2)
- varchar, char
- date


## Insertion
```sql
insert into dept values (val1, val2, NULL);
```

- to_date('17-
12-1980','dd-mm-yyyy')



WHERE nom LIKE '%reste_chaine';

https://perso.isima.fr/~makang/DEVBD/TP1PLSQL.pdf