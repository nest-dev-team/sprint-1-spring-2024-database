SELECT
	song.title AS song,
	album.title AS album,
	artist.name AS artist,
	genre.name AS genre,
	length,
	reviews
FROM 
	xref_artist_song
JOIN
	song
	USING (song_id)
JOIN
	genre
	USING (genre_id)
JOIN
	artist
	USING (artist_id)
JOIN
	xref_album_song
	USING (song_id)
JOIN
	album
	USING (album_id)
FULL OUTER JOIN
	song_review_count
	USING (song_id)
ORDER BY song ASC;
