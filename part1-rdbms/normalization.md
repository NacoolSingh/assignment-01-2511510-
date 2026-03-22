## Anomaly Analysis

### Insert Anomaly
In the orders_flat table, we cannot insert a new product without creating an order because product details are tied to order_id.

### Update Anomaly
Customer information is repeated across multiple rows. If a customer's details change, it must be updated in multiple rows.

### Delete Anomaly
If an order is deleted, associated customer and product information may also be lost.