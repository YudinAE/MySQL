# ===== (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). =====
# Поля from, to и label содержат английские названия городов, поле name — русское. =====
# Выведите список рейсов flights с русскими названиями городов. =====

SELECT flights.id, fr_c.name,to_c.name FROM flights
join cities fr_c on flights.from = fr_c.cities
join cities to_c on flights.to = to_c.cities;

