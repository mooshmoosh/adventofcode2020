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
    first_position =. (". 1 { parts) - 1
    second_position =. (". 2 { parts) - 1
    character =. 0 { 3 { parts
    password =. 4 { parts
    (((first_position { password) = character) + ((second_position { password) = character)) = 1
)

+/ validate"1 > lines
