let g:airline_theme='molokai'

let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 0 "Ne change pas la couleur de toute la barre dès qu'on change de mode

let g:airline#extensions#tabline#enabled = 1	"afficher les buffers
let g:airline#extensions#syntastic#enabled = 1

let g:tender_airline = 1
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_section_z = airline#section#create(['%p%%', ' ', '%l:%c'])

let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_b = airline#section#create(['%{getcwd()}', 'hunks', 'branch'])
let g:airline_section_c = airline#section#create_left(['file'])
let g:airline_section_b = '%-0.30{getcwd()}'  " chemin max 30 caractères
let g:airline_section_c = '%t'  " file name

let airline#extensions#vim9lsp#enabled = 1
let g:airline#extensions#unite#enabled = 1

" Defaut : 
"let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
"let g:airline_section_b       (hunks, branch)[*]
"let g:airline_section_c       (bufferline or filename, readonly)
"let g:airline_section_gutter  (csv)
"let g:airline_section_x       (tagbar, filetype, virtualenv)
"let g:airline_section_y       (fileencoding, fileformat, 'bom', 'eol')
"let g:airline_section_z       (percentage, line number, column number)
"let g:airline_section_error   (ycm_error_count, syntastic-err, eclim, languageclient_error_count)
"let g:airline_section_warning (ycm_warning_count, syntastic-warn, languageclient_warning_count, whitespace)



"if !exists('g:airline_symbols')
	"let g:airline_symbols = {}
"endif

