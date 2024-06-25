-- select the top rated song using FETCH, display the song, artist, review and rating

SELECT 
	song.title AS title, 
	artist.name AS artist, 
	song_review.rating AS rating,
	song_review.desc AS description
FROM 
	artist
JOIN 
	xref_artist_song 
	ON artist.artist_id = xref_artist_song.artist_id
JOIN 
	song 
	ON xref_artist_song.song_id = song.song_id
JOIN 
	song_review 
	ON song.song_id = song_review.song_id
ORDER BY rating DESC
FETCH FIRST 1 ROW ONLY;