/*

Count Occurrences of Words in Drafts
https://platform.stratascratch.com/coding/9817-find-the-number-of-times-each-word-appears-in-drafts?code_type=1
ID 9817

Find the number of times each word appears in the contents column across all rows in the google_file_store dataset. 
Output two columns: word and occurrences.

Tables:

<google_file_store>
contents:text#
filename:text

*/

/*
Working Logic:
Sentences in contents can be converted to an array of words using string_to_array and a space as delimiter.
This produces an array of words in place (i.e. single entry per column), which can be be transposed into a single word per column using unnest().
Some words contaiin trailing punctutation. Since we can see the dataset we will just remove those we can see ('.', ','). Regex would be more robust for all non-alphabetic characters.
These actions can produce a 1-column CTE which contains a row per word for all words in google_file_store -> contents. Remember to wrap all words in lower() to normalize.
We can then write our main query, which returns the count of all entries grouped by word. 
Since each word from each sentence exists as its own row in our CTE, COUNT(*) will find the number of occurences for each word.
*/

-- Attempt
WITH unique_words AS (
SELECT lower(word) AS word
FROM (
    SELECT trim(both '.,' FROM word) as word
    FROM (
        SELECT unnest(string_to_array(contents, ' ')) AS word
        FROM google_file_store)
    )
)

SELECT word, COUNT(*) as occurences
FROM unique_words
WHERE word <> ''
GROUP BY word
ORDER BY occurences DESC;
-- Result: Passed!