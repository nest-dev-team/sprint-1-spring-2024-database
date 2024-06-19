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