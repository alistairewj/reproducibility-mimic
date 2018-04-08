-- creates a table with word counts for every note
-- the word counts are based off lexemes which exclude english stop words
-- see postgres docs about ts_tovector for details

-- count each distinct word once, rather than getting a total count of words
drop table if exists dm_word_count cascade;
create table dm_word_count as
select
  hadm_id
  , sum(length(to_tsvector(text))) as non_stop_words
from noteevents
group by hadm_id
order by hadm_id;

-- --------------------- --
-- Alternative solutions --
-- --------------------- --

-- 1
-- (the solution used in the original paper)
-- if using PostgreSQL 9.4-9.6, use tsexact extension
-- installation is pretty simple! see here:
-- https://github.com/postgrespro/tsexact
-- provides the `poslen()` function

-- drop table if exists dm_word_count cascade;
-- create table dm_word_count as
-- select
--   hadm_id, sum(poslen(to_tsvector(text))) as non_stop_words
-- from noteevents
-- group by hadm_id
-- order by hadm_id;

-- 2
-- write a plpgsql function that operates on each hadm_id
-- accurate, but slow!
-- drop function if exists count_non_stop_words(integer);
-- create function count_non_stop_words(hadm_id integer) returns integer as
-- $body$
-- DECLARE
--     non_stop_words integer;
--     txt_query varchar(100) := 'select to_tsvector(text) from noteevents where hadm_id = ' || hadm_id;
-- BEGIN
--     select sum(nentry)
--       into non_stop_words
--     from ts_stat(txt_query);
--     return non_stop_words;
-- END
-- $body$
-- language plpgsql;

-- select hadm_id, count_non_stop_words(hadm_id)
-- from admissions
-- order by hadm_id;


-- 3
-- use regex to split words - doesn't do lexeme processing or remove stopwords
-- select
--   hadm_id
--   , sum(array_length(regexp_split_to_array(trim(text), E'\\W+','g'), 1)) as non_stop_words
-- from noteevents
-- group by hadm_id
-- order by hadm_id;
