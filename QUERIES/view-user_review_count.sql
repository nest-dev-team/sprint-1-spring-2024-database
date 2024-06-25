CREATE VIEW user_review_count AS
	SELECT 
		user_id,
		username,
		COUNT(artist_review.review_id) + 
		COUNT(album_review.review_id) +
		COUNT(song_review.review_id)
		AS reviews
	FROM
		"user"
	LEFT JOIN
		artist_review
		USING (user_id)
	LEFT JOIN
		album_review
		USING (user_id)
	LEFT JOIN
		song_review
		USING (user_id)
	GROUP BY user_id, username;

SELECT * FROM user_review_count;