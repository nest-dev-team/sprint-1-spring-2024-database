-- Using UNION, list all users who have posted at least 1 review of a song, album, or artist
SELECT 
	u.user_id AS user_id,
	u.username AS username,
	COUNT (song_review.review_id)
FROM 
	"user" u
JOIN
	song_review
	ON u.user_id = song_review.user_id
GROUP BY u.user_id, username
UNION
SELECT 
	u.user_id AS user_id,
	u.username AS username,
	COUNT (album_review.review_id)
FROM 
	"user" u
JOIN 
	album_review 
	ON u.user_id = album_review.user_id
GROUP BY u.user_id, username
UNION
SELECT 
	u.user_id AS user_id,
	u.username AS username,
	COUNT (artist_review.review_id)
FROM 
	"user" u
JOIN 
	artist_review
	on u.user_id = artist_review.user_id
GROUP BY u.user_id, username