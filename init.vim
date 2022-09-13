set nocompatible            " disable compatibility to old-time vi
set ttyfast                 " Speed up scrolling in Vim
set nospell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.

" General {
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8
	
	set magic "allow special characters in search
	set formatoptions-=or
	set foldmethod=indent
	set foldlevel=1


    set clipboard=unnamed,unnamedplus
    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.before.local file:
    "   let g:spf13_no_autochdir = 1

	set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                   " Store a ton of history (default is 20)
    "set spell                          " Spell checking on
    set autowrite						" Automatically save before commands like :next and :make

	set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])


    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=100         " Maximum number of changes that can be undone
            set undoreload=1000        " Maximum number lines to save for undo on a buffer reload
        endif

    " }

" }

" Vim UI {

	autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
	"ENREGISTRER AUTOMATIQUEMENT :"
	autocmd FocusLost,TabLeave * :wall

	set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number


    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    "set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
	" F3: Toggle list (display unprintable characters).
	nnoremap <F3> :set list!<CR>"
	set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
	" spell languages
	set spelllang=fr,en_us
	setlocal spell spelllang=fr,en_us
	" Show nine spell checking candidates at most
	set spellsuggest=best,9

	nnoremap <silent> <F7> :set spell!<cr>


" }
" Formatting {
    "set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
	"set expandtab                   " Tabs are spaces, not tabs
	set tabstop=4                   " An indentation every four columns
	set softtabstop=4               " Let backspace delete indent
	set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
	set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
	"set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.before.local file:
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now.

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell,rust setlocal nospell
	" Visual mode pressing * or # searches for the current selection
	" Super useful! From an idea by Michael Naumann
	vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
	vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
	" Disable highlight when Enter is pressed
	nnoremap <CR> :noh<CR><CR>

	let Tlist_File_Fold_Auto_Close = 1

" }


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

" }

" Plugins {


" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

"" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '${name}'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']


"
nmap <Leader>ll <Plug>MarkdownPreview
nmap <Leader>lm <Plug>MarkdownPreviewStop
	" }
"}
" GUI Settings {

" }

" Functions {

" }
"}


" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

"____________macros___________{
	let @x='%%%x``x'
	let @d='%%%hxx``xx'

	"if python:
	autocmd FileType python let @c='i#!/usr/bin/env python3# -*- coding: utf-8 -*-def main():if __name__ == "__main__:main()OAOAOAOA'

"code check when saved
nmap <Leader>P :Preview<CR>


call plug#begin()

Plug 'morhetz/gruvbox'							" Pour avoir un beau thème
"Plug 'sainnhe/sonokai'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'ayu-theme/ayu-vim'
Plug 'reewr/vim-monokai-phoenix'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Pour mieux se déplacer dans les dossiers
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'					" <leader> c space pour commenter et décommenter de gros bloques
Plug 'https://github.com/vim-scripts/restore_view.vim.git' " Pour que le curseur revienne au même endroit que lorsqu'on a quitté le programme
Plug 'frazrepo/vim-rainbow'						" Pour avoir les couleurs sur les parenthèses qui matchent
Plug 'andymass/vim-matchup'						" match les if else etc. avec %
" Plug 'puremourning/vimspector'					" debuggueur
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" bottom bar
Plug 'vim-airline/vim-airline'
" Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'							" pour le html
Plug 'rhysd/vim-grammarous'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
source ~/.config/nvim/plug-config/coc.vim	

" colorsheme
	autocmd vimenter * ++nested colorscheme gruvbox
	set background=dark
	let g:gruvbox_contrast_dark="high"
	let g:gruvbox_inverse=0
	if (empty($TMUX))
		if (has("nvim"))
			"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
			let $NVIM_TUI_ENABLE_TRUE_COLOR=1
		endif
		"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
		"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
		" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
		if (has("termguicolors"))
			set termguicolors
		endif
	endif
	let g:gruvbox_italic = 1
	let g:gruvbox_transparent_bg = 1
	let g:gruvbox_sign_column = 'bg0'
	let g:gruvbox_vert_split = 'fg0'
	let g:gruvbox_invert_signs = 1

	" The configuration options should be placed before `colorscheme sonokai`.
	"let g:sonokai_style = 'shusia'
	"let g:sonokai_style = 'andromeda'
	"let g:sonokai_better_performance = 1
	"colorscheme sonokai

	"set termguicolors     " enable true colors support
	"let ayucolor="light"  " for light version of theme
	"let ayucolor="mirage" " for mirage version of theme
	"let ayucolor="dark"   " for dark version of theme
	"colorscheme ayu

"let g:airline_theme='monokai_tasty'
"let g:vim_monokai_tasty_italic = 1
"colorscheme vim-monokai-tasty

"colorscheme monokai-phoenix

