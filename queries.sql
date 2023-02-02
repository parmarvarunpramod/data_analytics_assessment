--Q1 Which brand saw the most dollars spent in the month of June?
WITH
        base AS
        (
                SELECT
                        ri.BRAND_CODE                                     ,
                        ri.TOTAL_FINAL_PRICE                              ,
                        extract(YEAR FROM purchase_date)  AS purchase_year ,
                        extract(MONTH FROM purchase_date) AS purchase_month
                FROM
                        receipt_items ri
                LEFT JOIN
                        receipts r
                ON
                        ri.REWARDS_RECEIPT_ID = r.id
                WHERE
                        TOTAL_FINAL_PRICE IS NOT NULL
        )
        ,
        sale_in_june AS
        (
                SELECT
                        BRAND_CODE    ,
                        purchase_year ,
                        SUM(TOTAL_FINAL_PRICE) AS TOTAL_FINAL_PRICE
                FROM
                        base
                WHERE
                        BRAND_CODE IS NOT NULL
                AND     purchase_month       = '6'
                GROUP BY
                        BRAND_CODE,
                        purchase_year
        )
SELECT
        BRAND_CODE    ,
        purchase_year ,
        total_final_price
FROM
        (
                SELECT
                        BRAND_CODE       ,
                        purchase_year    ,
                        total_final_price,
                        rank() over(PARTITION BY
                                    purchase_year ORDER BY
                                    total_final_price DESC) AS row_num
                FROM
                        sale_in_june)a
WHERE
        row_num='1';

--Q2 Which user spent the most money in the month of August?
WITH
        user_receipts_agg AS
        (
                SELECT
                        user_id                                           ,
                        extract(YEAR FROM purchase_date) AS purchase_year ,
                        SUM(total_spent)                 AS total_spent
                FROM
                        receipts
                WHERE
                        extract(MONTH FROM purchase_date) = '8'
                GROUP BY
                        user_id ,
                        extract(YEAR FROM purchase_date)
        )
SELECT
        user_id       ,
        purchase_year ,
        total_spent
FROM
        user_receipts_agg
WHERE
        total_spent IN
        (
                SELECT
                        MAX(total_spent)
                FROM
                        user_receipts_agg
                GROUP BY
                        purchase_year);

--Q3 What user bought the most expensive item?
WITH
        receipt_items_cte AS
        (
                SELECT
                        REWARDS_RECEIPT_ITEM_ID ,
                        REWARDS_RECEIPT_ID      ,
                        total_final_price
                FROM
                        receipt_items
                WHERE
                        total_final_price IN
                        (
                                SELECT
                                        MAX(total_final_price)
                                FROM
                                        receipt_items)
        )--Identifying the most expensive item using the cte
SELECT        DISTINCT
        r.user_id   ,
        u.gender    ,
        u.birth_date,
        u.state
FROM
        receipt_items_cte ric
LEFT JOIN
        receipts r
ON
        ric.REWARDS_RECEIPT_ID = r.id
LEFT JOIN
        USERS u
ON
        r.user_id = u.id;

--Q4 What is the name of the most expensive item purchased?
SELECT
        REWARDS_RECEIPT_ITEM_ID   ,
        original_receipt_item_text,
        DESCRIPTION
FROM
        receipt_items
WHERE
        total_final_price IN
        (
                SELECT
                        MAX(TOTAL_FINAL_PRICE)
                FROM
                        receipt_items);

--Q5 How many users scanned in each month?
SELECT
        extract(YEAR FROM date_scanned)  AS scanned_year  ,
        extract(MONTH FROM date_scanned) AS scanned_month ,
        COUNT(DISTINCT user_id)          AS num_of_users_scanned
FROM
        receipts
GROUP BY
        extract(YEAR FROM date_scanned),
        extract(MONTH FROM date_scanned)