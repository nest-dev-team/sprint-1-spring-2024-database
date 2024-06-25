-- create index on genre table

CREATE INDEX idx_genre
ON genre(genre_id, name);