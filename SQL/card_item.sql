use electronic_store;

select * from cart_item;
SET SQL_SAFE_UPDATES = 0;
SHOW INDEX FROM cart_item WHERE Non_unique = 0;
ALTER TABLE cart_item DROP INDEX UKr5b99rvdnupujm2h7hh2bh6m7;

ALTER TABLE cart_item DROP INDEX UKr5b99rvdnupujm2h7hh2bh6m7;

