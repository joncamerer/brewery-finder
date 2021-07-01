-- **************************************************************
-- This script resets the contents of the database
-- **************************************************************

DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS breweries; 
DROP TABLE IF EXISTS users;

DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_brewery_id;
DROP SEQUENCE IF EXISTS seq_beer_id;
DROP SEQUENCE IF EXISTS seq_reviews_id;
DROP SEQUENCE IF EXISTS seq_event_id;
DROP SEQUENCE IF EXISTS seq_news_id;

DROP ROLE IF EXISTS final_capstone_owner;
DROP ROLE IF EXISTS final_capstone_appuser;