CREATE TABLE artist
(
    artist_id serial NOT NULL,
    genre_id integer NOT NULL,
    name character varying(256) NOT NULL,
    bio_desc character varying(512),
    PRIMARY KEY (artist_id),
    CONSTRAINT genre_id FOREIGN KEY (genre_id)
        REFERENCES public.genre (genre_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);