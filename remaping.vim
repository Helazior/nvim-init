" Key (re)Mappings {
 	"The default leader is '\', but many people prefer ',' as it's in a standard
	"location
	let mapleader = ','

	" Visual blocks in Ctrl q
	" map <C-v> <C-q>
	" real Ctrl v
	"map <C-S-v> <C-v>
	autocmd filetype python nnoremap <F6> :w <bar> exec '!python '.shellescape('%')<CR>
	autocmd filetype c nnoremap <F6> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
	autocmd filetype cpp nnoremap <F6> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
	autocmd filetype tex nnoremap <F6> :w <bar> exec '!pdflatex '.shellescape('%').' && xdg-open '.shellescape('%:r').'.pdf&'<CR>
	"autocmd BufRead,BufNewFile *.c,*.h,*.cpp 
	"nnoremap <F6> :w <bar> exec '!decac '.shellescape('%').' && ima '.shellescape('%:r').'.ass'<CR>
	"map <F7> :!pdflatex % && start %:r.pdf<CR> 
	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_
	nnoremap Y y$
    nnoremap j gj
    nnoremap k gk
	" Shortcuts
	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
	vnoremap < <gv
	vnoremap > >gv

	" Allow using the repeat operator with a visual selection (!)
	"vnoremap . :normal .<CR>
	
	"For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

    " Adjust viewports to the same size
    map <Leader>= <C-w>=
	
	" search the next { or }
	map <silent> <Leader>l /{\\|}<CR>

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Easier formatting
    nnoremap <silent> <leader>q gwip

    " FIXME: Revert this f70be548
    " fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
    map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

	" Move blocks of code
	" normal mode
	nnoremap <silent> <C-Up>   :<C-u>m-2<CR>==
	nnoremap <silent> <C-Down> :<C-u>m+<CR>==
	" visual mode 
	xnoremap <silent> <C-Up>   :m-2<CR>gv=gv
	xnoremap <silent> <C-Down> :m'>+<CR>gv=gv
	" insert mode
	imap <silent> <C-Up>   <ESC>:<C-u>m-2<CR>==
	imap <silent> <C-Down> <ESC>:<C-u>m+<CR>==

	" fzf
	map <silent> ;	:Files<CR>
	map <silent> !	:Buffers<CR>

	" buffer
	map <silent> <C-S-Right> :bn<cr>  
	map <silent> <C-S-Left> :bp<cr>  
	
" }

