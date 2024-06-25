-- display all artists with their respective genre, number of songs, number of albums, reviews, and artist bio description

SELECT
	artist.name AS artist, 
	genre.name AS genre,
	num_songs,
	num_albums,
	reviews,
	bio_desc
FROM 
	artist
JOIN
	genre
	USING (genre_id)
JOIN
	artist_song_count
	USING (artist_id)
JOIN
	artist_album_count
	USING (artist_id)
FULL OUTER JOIN
	artist_review_count
	USING (artist_id)
ORDER BY artist ASC;