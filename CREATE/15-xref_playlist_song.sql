CREATE TABLE xref_playlist_song
(
    playlist_song_id serial NOT NULL,
    song_id integer NOT NULL,
    playlist_id integer NOT NULL,
    PRIMARY KEY (playlist_song_id),
    CONSTRAINT song_id FOREIGN KEY (song_id)
        REFERENCES public.song (song_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT playlist_id FOREIGN KEY (playlist_id)
        REFERENCES public.playlist (playlist_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);