lines =. (< ;. _2) freads 'inputs/2.txt'

password_pattern =. '([[:digit:]]+)-([[:digit:]]+)[[:space:]]+(.):[[:space:]]+(.*)'

find_matches =. password_pattern & rxmatch

get_group =: dyad define
    start =. 0 { x
    length =. 1 { x
    length {. start }. y
)

validate =: monad define
    groups =. find_matches y
    parts =. groups (get_group " 1 1) y
    min_count =. ". 1 { parts
    max_count =. ". 2 { parts
    character =. 0 { 3 { parts
    password =. 4 { parts
    count_of_character =. +/ character = password
    (count_of_character >: min_count) *. (count_of_character <: max_count)
)


+/ validate "1 > lines
