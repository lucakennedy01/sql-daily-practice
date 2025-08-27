/*

Artist Appearance Count
https://platform.stratascratch.com/coding/9992-find-artists-that-have-been-on-spotify-the-most-number-of-times?code_type=1
ID 9992

Find how many times each artist appeared on the Spotify ranking list.
Output the artist name along with the corresponding number of occurrences.
Order records by the number of occurrences in descending order.

Tables:
<spotify_daily_worldwide_ranking>
artist:text
id:bigint
position:bigint
region:text
stream_date:date
streams:bigint
trackname:text
url:text

*/

/*
Working logic:
Each row represents a song, so COUNT(artist) will return how many songs
of that artist have appeared
*/

--Atempt:
select artist, COUNT(artist) as appearances
from spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY appearances DESC;
--Result:Passed