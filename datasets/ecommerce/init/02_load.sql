\copy customers FROM '/data/ecommerce/customers_dataset.csv' DELIMITER ',' CSV HEADER;

\copy orders FROM '/data/ecommerce/orders_dataset.csv' DELIMITER ',' CSV HEADER;

\copy order_items FROM '/data/ecommerce/order_items_dataset.csv' DELIMITER ',' CSV HEADER;

\copy order_payments FROM '/data/ecommerce/order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

\copy order_reviews FROM '/data/ecommerce/order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

\copy products FROM '/data/ecommerce/products_dataset.csv' DELIMITER ',' CSV HEADER;

\copy sellers FROM '/data/ecommerce/sellers_dataset.csv' DELIMITER ',' CSV HEADER;

\copy geolocation FROM '/data/ecommerce/geolocation_dataset.csv' DELIMITER ',' CSV HEADER;

\copy product_category_translation FROM '/data/ecommerce/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;