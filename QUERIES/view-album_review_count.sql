-- creates a view that shows the number of reviews for each album

CREATE VIEW album_review_count AS
	SELECT
		album_id,
		album.title AS album,
		COUNT(album_id) AS reviews
	FROM
		album_review
	JOIN
		album
		USING (album_id)
	GROUP BY album_id, album
	ORDER BY reviews ASC;

SELECT * FROM album_review_count;