# ================================== Подсчитать общее количество лайков, которые получили пользователи младше 10 лет
#===== Общее количество лайков, которое получили пользователеи младше 10 лет
 SELECT count(*) AS LIKES FROM likes where user_id in (select user_id from profiles
  WHERE birthday > CURRENT_DATE()-INTERVAL 10 YEAR);
  
#===== Общее количество лайков, которое получили пользователеи младше 10 лет (JOIN)
select count(*) AS LIKES from likes
join profiles on likes.user_id=profiles.user_id 
where birthday > CURRENT_DATE()-INTERVAL 10 YEAR;
  
#===== Определение количества пользователей, которые младше 10 лет
SELECT user_id,
  ((YEAR(CURRENT_DATE) - YEAR(birthday)) -                           
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))
  ) AS age
FROM profiles having age<10;
