file =. freads 'inputs/4.txt'
split_on_blank_lines =. ('\n\n'&rxmatches rxcut ])

as_pairs =. ((,&2 @: >. @: (%&2) @: $) $ ])
even_ones =. (0&{)"1 @: as_pairs
split_on =. even_ones @: (rxmatches rxcut ])
passport_strings =. even_ones split_on_blank_lines file

as_key_value =. < @: as_pairs @: (':|[[:space:]]+'&split_on) @: >

passports =. as_key_value "0 passport_strings
keys =. ~. @: ((0&{)"1) @: >

count_fields =. +/ @: (e. keys)

required_fields =.'byr' ; 'iyr' ; 'eyr' ; 'hgt' ; 'hcl' ; 'ecl' ; 'pid'

contains_all =. 7&= @: count_fields

is_valid =. required_fields & contains_all

+/ (is_valid"0) passports
