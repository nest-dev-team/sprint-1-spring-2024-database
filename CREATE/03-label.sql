CREATE TABLE label
(
    label_id serial NOT NULL,
    name character varying(256) NOT NULL,
    description character varying(512),
    founding_date date,
    PRIMARY KEY (label_id)
);