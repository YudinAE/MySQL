#======== Определить кто больше поставил лайков (всего): мужчины или женщины.
select count(*) as total_likes
		, sum(case when profiles.gender='f' then 1 else 0 end) as female_likes
        , sum(case when profiles.gender='m' then 1 else 0 end) as male_likes
 from likes
join profiles on likes.user_id=profiles.user_id;