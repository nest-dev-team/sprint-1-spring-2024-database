CREATE TABLE xref_album_artist
(
    album_artist_id serial NOT NULL,
    artist_id integer NOT NULL,
    album_id integer NOT NULL,
    PRIMARY KEY (album_artist_id),
    CONSTRAINT artist_id FOREIGN KEY (artist_id)
        REFERENCES public.artist (artist_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT album_id FOREIGN KEY (album_id)
        REFERENCES public.album (album_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);