/*

Top 10 Songs 2010
https://platform.stratascratch.com/coding/9650-find-the-top-10-ranked-songs-in-2010?code_type=1
ID 9650

Difficulty: Medium

Find the top 10 ranked songs in 2010. 
Output the rank, group name, and song name, but do not show the same song twice. 
Sort the result based on the rank in ascending order.

Tables:

<billboard_top_100_year_end>
artist:text
group_name:text
id:bigint
song_name:text
year:bigint
year_rank:bigint
*/

/*
Working Logic:
We return the year_rank, group_name and song_name for all entries where year = 2010 and year_rank <= 10
We then group by all 3 fields to remove duplicates for any entries where those 3 fields are identical but have different other fields
*/

-- Attempt:
SELECT year_rank, group_name, song_name
FROM billboard_top_100_year_end
WHERE year = 2010 and year_rank <= 10
GROUP BY year_rank, group_name, song_name
LIMIT 10;
-- Result: Passed