CREATE TABLE artist_review
(
    review_id serial NOT NULL,
    user_id integer NOT NULL,
    artist_id integer NOT NULL,
    rating integer NOT NULL CHECK (rating BETWEEN 1 AND 10),
    "desc" character varying(256),
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