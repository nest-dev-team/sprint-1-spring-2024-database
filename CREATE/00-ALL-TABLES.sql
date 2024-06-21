CREATE TABLE genre
(
    genre_id serial NOT NULL,
    name character varying(64) NOT NULL,
    PRIMARY KEY (genre_id)
);

CREATE TABLE label
(
    label_id serial NOT NULL,
    name character varying(256) NOT NULL,
    description character varying(512),
    founding_date date,
    PRIMARY KEY (label_id)
);

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

CREATE TABLE album
(
    album_id serial NOT NULL,
    label_id integer NOT NULL,
    title character varying(256) NOT NULL,
    release_date date,
    PRIMARY KEY (album_id),
    CONSTRAINT label_id FOREIGN KEY (label_id)
        REFERENCES public.label (label_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

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

CREATE TABLE "user"
(
    user_id serial NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(32) NOT NULL,
    email character varying(128) NOT NULL,
    date_of_birth date,
    join_date date NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE playlist
(
    playlist_id serial NOT NULL,
    user_id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(256),
    PRIMARY KEY (playlist_id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE artist_review
(
    review_id serial NOT NULL,
    user_id integer NOT NULL,
    artist_id integer NOT NULL,
    rating integer NOT NULL CHECK (rating BETWEEN 1 AND 10),
    "desc" character varying(512),
    review_date date DEFAULT CURRENT_DATE,
    PRIMARY KEY (review_id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT artist_id FOREIGN KEY (artist_id)
        REFERENCES public.artist (artist_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE album_review
(
    review_id serial NOT NULL,
    user_id integer NOT NULL,
    album_id integer NOT NULL,
    rating integer NOT NULL CHECK (rating BETWEEN 1 AND 10),
    "desc" character varying(512),
    review_date date DEFAULT CURRENT_DATE,
    PRIMARY KEY (review_id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT album_id FOREIGN KEY (album_id)
        REFERENCES public.album (album_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE song_review
(
    review_id serial NOT NULL,
    user_id integer NOT NULL,
    song_id integer NOT NULL,
    rating integer NOT NULL CHECK (rating BETWEEN 1 AND 10),
    "desc" character varying(512),
    review_date date DEFAULT CURRENT_DATE,
    PRIMARY KEY (review_id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT song_id FOREIGN KEY (song_id)
        REFERENCES public.song (song_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

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