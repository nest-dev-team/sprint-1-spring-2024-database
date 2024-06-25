-- creates a view that shows the number of reviews for each song

CREATE VIEW song_review_count AS
	SELECT
		song_id,
		song.title AS song,
		COUNT(song_id) AS reviews
	FROM
		song_review
	JOIN
		song
		USING (song_id)
	GROUP BY song_id, song
	ORDER BY reviews ASC;

SELECT * FROM song_review_count;