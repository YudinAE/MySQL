# ================= Выведите список товаров products и разделов catalogs, который соответствует товару =================
SELECT products.name,products.description,products.price,catalogs.name as catalog_name FROM shop.products
join catalogs on products.catalog_id=catalogs.id;

