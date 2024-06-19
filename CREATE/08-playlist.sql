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