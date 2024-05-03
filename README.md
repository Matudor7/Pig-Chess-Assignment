# Pig-Chess-Assignment
## Tudor Nosca, Catalin Avornicesei, Roberta Paracchini, Sallah Aouragh
This repository houses the Pig script meant to count every opening move from a set of chess games, and display how many times the respective opening move has been made
The script has been executed using both MapReducer and Tez, and from our findings, there is no signifcant execution time difference between the two methods. One time they were even equal in time taken.
One issue we encountered was that the script had to store each column from the dataset even if we only used one ("moves"). Therefore, the script has many defined variables that were not ultimately used.
