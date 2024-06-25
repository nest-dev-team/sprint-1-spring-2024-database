-- display all users with their respective username, password, email, date of birth, join date, number of reviews, and age

SELECT
	user_id,
	"user".username,
	password,
	email,
	date_of_birth,
	join_date,
	reviews,
	AGE(CURRENT_DATE, date_of_birth) as age
FROM
	"user"
JOIN
	user_review_count
	USING (user_id)
ORDER BY join_date DESC;