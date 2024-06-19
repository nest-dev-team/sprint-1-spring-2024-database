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