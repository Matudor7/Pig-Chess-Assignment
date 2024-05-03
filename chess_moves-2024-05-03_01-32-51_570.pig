data = LOAD '/data/2016_CvH.csv' USING PigStorage(',') AS (
    Game: chararray,
    White: chararray,
    Black: chararray,
    White_Elo: int,
    Black_Elo: int,
    White_RD: int,
    Black_RD: int,
    WhiteIsComp: chararray,
    BlackIsComp: chararray,
    TimeControl: chararray,
    Date: chararray,
    Time: chararray,
    White_Clock: chararray,
    Black_Clock: chararray,
    ECO: chararray,
    PlyCount: int,
    Result: chararray,
    Result_Winner: chararray,
    Commentaries: chararray,
    Moves: chararray
);

-- Extract all first moves
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