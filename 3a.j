map =. (, ;. _2) freads 'inputs/3.txt'
column_count =. 1 { $ map
row_count =. 0 { $ map

gradients =. 1 1 , 3 1 , 5 1 ,: 7 1

extra_gradient =. 1 2 $ 1 2

row_idx =. ((i. @: <. @: (row_count&%) @: (1&{)) * (1&{))

col_idx =. (column_count&|) @: ((i. @: <. @: (row_count&%) @: (1&{)) * (0&{))

col_idx_test =. (column_count&|) @: ((i. @: <. @: (row_count&%) @: (1&{)) * (0&{))

NB. row_idx _1 { gradients
NB. col_idx 3 { gradients

map_idx =. row_idx (,"0) col_idx

positions =. <"1 map_idx "1 gradients
extra_positions =. <"1 map_idx "1 extra_gradient

(*/ +/"1 '#' = positions { map) * (*/ +/"1 '#' = extra_positions { map)



