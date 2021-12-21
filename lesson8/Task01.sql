/* Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений). */
# =========== Добавляем данные для примера
INSERT INTO `vk`.`messages` (`id`, `from_user_id`, `to_user_id`, `text`, `created_at`, `read_at`) VALUES ('101', '38', '89', 'Provident dignissimos ipsam necessitatibus eligendi voluptas.', '2002-11-22 04:10:45', '2002-11-24 04:10:45');
INSERT INTO `vk`.`messages` (`id`, `from_user_id`, `to_user_id`, `text`, `created_at`, `read_at`) VALUES ('102', '39', '88', 'Numquam id illo distinctio vitae.', '1976-01-27 02:35:17', '2002-11-22 04:10:45');
INSERT INTO `vk`.`messages` (`id`, `from_user_id`, `to_user_id`, `text`, `created_at`, `read_at`) VALUES ('103', '39', '88', 'a tempora quia.', '1998-11-28 19:47:27', '2002-11-22 04:10:45');
INSERT INTO `vk`.`messages` (`id`, `from_user_id`, `to_user_id`, `text`, `created_at`, `read_at`) VALUES ('104', '39', '88', 'a tem qa.', '2002-11-28 19:47:27', '2002-11-29 04:10:45');
INSERT INTO `vk`.`messages` (`id`, `from_user_id`, `to_user_id`, `text`, `created_at`, `read_at`) VALUES ('105', '36', '88', 'a teora quia.', '1998-11-28 19:47:27', '2002-11-22 04:10:45');

#========== Возьмем пользователя с порядковым номером 88
SELECT * FROM vk.profiles where user_id = 88;

#========= Найдем пользователя, который отправил больше всех сообщений выбранному пользователю
select concat(fr.firstname, ' ',fr.lastname) as USER_FROM, concat(tou.firstname, ' ',tou.lastname) as USER_TO, count(*) as number_of_messages from profiles fr
join messages m on fr.user_id=m.from_user_id 
join profiles tou on tou.user_id=m.to_user_id
where m.to_user_id = 88
group by m.from_user_id
order by number_of_messages desc limit 1;


 