CREATE VIEW artist_song_count AS
	SELECT
		artist_id,
		artist.name AS artist,
		COUNT(song.title) AS num_songs
	FROM
		xref_artist_song
	JOIN
		song
		USING (song_id)
	JOIN
		artist
		USING (artist_id)
	GROUP BY artist_id, artist
	ORDER BY num_songs ASC;

SELECT * FROM artist_song_count;