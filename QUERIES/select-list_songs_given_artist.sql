-- list all songs by a given artist

SELECT 
	song.title AS song_title,
	album.title AS album_title,
	artist.name as artist_name
FROM 
	artist
JOIN 
	xref_album_artist 
	ON artist.artist_id = xref_album_artist.artist_id
JOIN 
	album album 
	ON xref_album_artist.album_id = album.album_id
JOIN 
	xref_album_song 
	ON album.album_id = xref_album_song.album_id
JOIN 
	song song 
	ON xref_album_song.song_id = song.song_id
WHERE artist.name = 'Jinwoo';