#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE public."stock_record" (
        id serial NOT NULL,
        order_id varchar NOT NULL,
        products varchar NOT NULL,
        created_on timestamp(0) NOT NULL DEFAULT now(),
        PRIMARY KEY (id)
    );
EOSQL

echo "Table created!"