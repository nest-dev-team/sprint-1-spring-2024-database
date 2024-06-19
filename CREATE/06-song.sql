CREATE TABLE song
(
    song_id serial NOT NULL,
    genre_id integer NOT NULL,
    title character varying(256) NOT NULL,
    length interval NOT NULL,
    PRIMARY KEY (song_id),
    CONSTRAINT genre_id FOREIGN KEY (genre_id)
        REFERENCES public.genre (genre_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);