let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled=1
"let g:airline_section_b='%{strftime("%Y/%m/%d %H:%M:%S")}'
let g:airline_section_c='%F'
"# let g:airline_section_y=airline#section#create_right(['%{strftime("%Y/%m/%d %H:%M:%S")}', ' ', 'ffenc', 'BN: %{bufnr("%")}'])
let g:airline_section_y=airline#section#create_right(['%{strftime("%Y/%m/%d %H:%M:%S")}', ' ', 'ffenc'])
