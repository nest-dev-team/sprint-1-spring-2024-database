-- list all songs available in the catalog, sorted by title 

SELECT 
	song.title AS song_title,
	artist.name as arist_name
FROM 
	song
JOIN 
	xref_artist_song 
	ON song.song_id = xref_artist_song.song_id
JOIN 
	artist ON xref_artist_song.artist_id = artist.artist_id
ORDER BY song_title ASC;