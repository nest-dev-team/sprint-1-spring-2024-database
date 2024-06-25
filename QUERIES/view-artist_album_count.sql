CREATE VIEW artist_album_count AS
	SELECT
		artist_id,
		artist.name AS artist,
		COUNT(album.title) AS num_albums
	FROM
		xref_album_artist
	JOIN
		album
		USING (album_id)
	JOIN
		artist
		USING (artist_id)
	GROUP BY artist_id, artist
	ORDER BY num_albums ASC;

SELECT * FROM artist_album_count;