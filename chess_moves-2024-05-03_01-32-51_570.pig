-- Load data and store column into a variable
data = LOAD '/data/chessmoves.csv' USING PigStorage(',') AS (
    Moves: chararray
);

-- Extract all first moves by string splitting the 'moves' variable to only 
-- extract the first move mentioned in each row
first_moves = FOREACH data GENERATE FLATTEN(STRSPLIT(Moves, ' ', 3).$1) AS first_move;

-- Group the first moves
grouped_first_moves = GROUP first_moves BY first_move;

-- Count the occurrences of each unique first move
first_move_count = FOREACH grouped_first_moves GENERATE group AS first_move, COUNT(first_moves) AS count;

-- Filter out entries with count 0
non_zero_count_moves = FILTER first_move_count BY count > 0;

-- Display the first move and its count
first_move_with_count = FOREACH non_zero_count_moves GENERATE first_move, count;
DUMP first_move_with_count;
