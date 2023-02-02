DROP TABLE
        public.users;

CREATE TABLE
        IF NOT EXISTS public.users
        (
                id                 VARCHAR PRIMARY KEY,
                created_date       TIMESTAMP          ,
                birth_date         TIMESTAMP          ,
                gender             VARCHAR            ,
                last_rewards_login TIMESTAMP          ,
                state              VARCHAR            ,
                sign_up_platform   VARCHAR            ,
                sign_up_source     VARCHAR
        );

COPY public.users ( id , created_date , birth_date , gender , last_rewards_login, state , sign_up_platform , sign_up_source ) FROM 'E:\New Folder\users.csv' DELIMITER ',' CSV HEADER;
SELECT *
FROM
        public.users limit 5;

CREATE TABLE
        IF NOT EXISTS public.brands
        (
                id                VARCHAR PRIMARY KEY,
                barcode           VARCHAR            ,
                brand_code        VARCHAR            ,
                cpg_id            VARCHAR            ,
                category          VARCHAR            ,
                category_code     VARCHAR            ,
                name              VARCHAR            ,
                romance_text      VARCHAR            ,
                related_brand_ids VARCHAR
        );

COPY public.brands(id, barcode,brand_code,cpg_id,category,category_code, name,romance_text,related_brand_ids) FROM 'E:\New Folder\brands.csv' DELIMITER ',' CSV HEADER;
SELECT *
FROM
        public.brands limit 5;

CREATE TABLE
        IF NOT EXISTS public.receipts
        (
                id                        VARCHAR PRIMARY KEY,
                store_name                VARCHAR            ,
                purchase_date             TIMESTAMP          ,
                purchase_time             TIME               ,
                date_scanned              TIMESTAMP          ,
                total_spent               DECIMAL(10,2)      ,
                rewards_receipt_status    VARCHAR            ,
                user_id                   VARCHAR            ,
                user_viewed               BOOLEAN            ,
                purchased_item_count      INTEGER            ,
                created_date              TIMESTAMP          ,
                pending_date              TIMESTAMP          ,
                modify_date               TIMESTAMP          ,
                flagged_date              TIMESTAMP          ,
                processed_date            TIMESTAMP          ,
                finished_date             TIMESTAMP          ,
                rejected_date             TIMESTAMP          ,
                needs_fetch_review        BOOLEAN            ,
                digital_receipt           BOOLEAN            ,
                deleted                   BOOLEAN            ,
                non_point_earning_receipt BOOLEAN
        );

COPY public.receipts(id, store_name,purchase_date,purchase_time,date_scanned,total_spent, rewards_receipt_status,user_id,user_viewed,purchased_item_count, created_date, pending_date,modify_date,flagged_date,processed_date,finished_date,rejected_date,needs_fetch_review,digital_receipt,deleted,non_point_earning_receipt) FROM 'E:\New Folder\receipts.csv' DELIMITER ',' CSV HEADER;
SELECT *
FROM
        public.receipts limit 5;


CREATE TABLE
        IF NOT EXISTS public.receipt_items
        (
                rewards_receipt_item_id    VARCHAR PRIMARY KEY,
                rewards_receipt_id         VARCHAR            ,
                item_index                 INTEGER            ,
                description                VARCHAR            ,
                barcode                    VARCHAR            ,
                brand_code                 VARCHAR            ,
                quantity_purchased         INTEGER            ,
                total_final_price          DECIMAL(10,2)      ,
                points_earned              DECIMAL(10,1)      ,
                rewards_group              VARCHAR            ,
                original_receipt_item_text VARCHAR            ,
                modify_date                TIMESTAMP
        );

COPY public.receipt_items(rewards_receipt_item_id, rewards_receipt_id, item_index, description, barcode, brand_code, quantity_purchased, total_final_price, points_earned, rewards_group, original_receipt_item_next,modify_date) FROM 'E:\New Folder\receipt_items.csv' DELIMITER ',' CSV HEADER;
SELECT *
FROM
        public.receipt_items limit 5;