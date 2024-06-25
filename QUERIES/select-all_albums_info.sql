SELECT
	album.title AS album, 
	artist.name AS artist, 
	genre.name AS genre,
	label.name AS label,
	release_date,
	reviews,
	num_songs,
	total_length
FROM 
	xref_album_artist
JOIN
	artist
	USING (artist_id)
JOIN
	genre
	USING (genre_id)
JOIN
	album
	USING (album_id)
JOIN
	label
	USING (label_id)
JOIN
	album_length
	USING (album_id)
FULL OUTER JOIN
	album_review_count
	USING (album_id)
ORDER BY album ASC;