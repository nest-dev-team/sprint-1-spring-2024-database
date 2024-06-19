CREATE TABLE xref_artist_song
(
    artist_song_id serial NOT NULL,
    song_id integer NOT NULL,
    artist_id integer NOT NULL,
    PRIMARY KEY (artist_song_id),
    CONSTRAINT song_id FOREIGN KEY (song_id)
        REFERENCES public.song (song_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT artist_id FOREIGN KEY (artist_id)
        REFERENCES public.artist (artist_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);