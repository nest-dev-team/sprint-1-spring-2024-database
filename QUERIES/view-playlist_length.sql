CREATE VIEW playlist_length AS
	SELECT
		playlist_id,
		playlist.name AS playlist,
		COUNT(song.title) AS num_songs,
		SUM(song.length) as total_length
	FROM
		xref_playlist_song
	JOIN
		playlist
		USING (playlist_id)
	JOIN
		song
		USING (song_id)
	GROUP BY playlist, playlist_id
	ORDER BY total_length ASC;
	
SELECT * FROM playlist_length;