CREATE TABLE xref_album_song
(
    album_song_id serial NOT NULL,
    song_id integer NOT NULL,
    album_id integer NOT NULL,
    PRIMARY KEY (album_song_id),
    CONSTRAINT song_id FOREIGN KEY (song_id)
        REFERENCES public.song (song_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT album_id FOREIGN KEY (album_id)
        REFERENCES public.album (album_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);