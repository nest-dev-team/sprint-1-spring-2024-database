SELECT
	*,
	AGE(CURRENT_DATE, date_of_birth) as age
FROM
	"user"
JOIN
	user_review_count
	USING (user_id)
ORDER BY join_date DESC;