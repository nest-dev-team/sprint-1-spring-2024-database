CREATE TABLE album_review
(
    review_id serial NOT NULL,
    user_id integer NOT NULL,
    album_id integer NOT NULL,
    rating integer NOT NULL CHECK (rating BETWEEN 1 AND 10),
    "desc" character varying(256),
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