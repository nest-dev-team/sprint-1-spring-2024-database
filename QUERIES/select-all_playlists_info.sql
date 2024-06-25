-- display all playlists with their respectivee user, number of songs, total length, and playlist description

SELECT
	playlist.name AS playlist, 
	"user".username AS "user", 
	num_songs,
	total_length,
	playlist.description
FROM 
	playlist
JOIN
	"user"
	USING (user_id)
JOIN
	playlist_length
	USING (playlist_id)
ORDER BY playlist ASC;