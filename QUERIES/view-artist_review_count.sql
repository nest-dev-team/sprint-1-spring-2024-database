CREATE VIEW artist_review_count AS
	SELECT
		artist_id,
		artist.name AS artist,
		COUNT(artist_id) AS reviews
	FROM
		artist_review
	JOIN
		artist
		USING (artist_id)
	GROUP BY artist_id, artist
	ORDER BY reviews ASC;

SELECT * FROM artist_review_count;