-- creates a view that shows the number of songs and total length of each album

CREATE VIEW album_length AS
	SELECT
		album_id,
		album.title AS album,
		COUNT(song.title) AS num_songs,
		SUM(song.length) AS total_length
	FROM
		xref_album_song
	JOIN
		album
		USING (album_id)
	JOIN
		song
		USING (song_id)
	GROUP BY album, album_id
	ORDER BY total_length ASC;

SELECT * FROM album_length;