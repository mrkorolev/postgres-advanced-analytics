-- order to customer (not customer_unique_id)
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

-- order to payments
ALTER TABLE order_payments
ADD CONSTRAINT fk_order_payments_order
FOREIGN KEY (order_id) REFERENCES orders(order_id);

-- order to reviews
ALTER TABLE order_reviews
ADD CONSTRAINT fk_order_reviews_order
FOREIGN KEY (order_id) REFERENCES orders(order_id);

-- order_items -> orders/products/sellers
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_order
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_product
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_seller
FOREIGN KEY (seller_id) REFERENCES sellers(seller_id);

