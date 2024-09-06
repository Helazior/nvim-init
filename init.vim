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


	"if has('statusline')
		"set laststatus=2

		" Broken down into easily includeable segments
		"set statusline=%<%f\                     " Filename
		"set statusline+=%w%h%m%r                 " Options
		"set statusline+=\ [%{&ff}/%Y]            " Filetype
		"set statusline+=\ [%{getcwd()}]          " Current dir
		"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
	"endif

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
    set foldenable                  " Auto fold code set list
	" F3: Toggle list (display unprintable characters).
	nnoremap <F3> :set list!<CR>"
	set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
	" spell languages
	set spelllang=fr,en_us
	setlocal spell spelllang=fr,en_us
	" Show nine spell checking candidates at most
	set spellsuggest=best,9
	set spell!

	nnoremap <silent> <F7> :set spell!<cr>
	nnoremap <silent> <F8> :LanguageToolCheck<cr>
" }

source ~/.config/nvim/formatting.vim
source ~/.config/nvim/remaping.vim

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
	autocmd FileType python let @c='i#!/usr/bin/env python3# -*- coding: utf-8 -*-'
	" }
call plug#begin()

Plug 'morhetz/gruvbox'							" Pour avoir un beau thème
Plug 'sainnhe/sonokai'
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
Plug 'lervag/vimtex'							" \ll pour compiler automatiquement / arrêter et peut rendre plus lisible en configurant
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}  " voir sur le naviguateur le markdown
Plug 'vim-airline/vim-airline'					" barre du bas
Plug 'vim-airline/vim-airline-themes'
"Plug 'honza/vim-snippets'						" pour avoir des blocks de code avec l'autocompletion (y en a déjà un dans coc)
"Plug 'mattn/emmet-vim'							" pour le html
Plug 'rhysd/vim-grammarous'		"spell check
Plug 'dpelle/vim-LanguageTool'	"spell check
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
let g:rainbow_active = 1
let g:languagetool_jar='~/LanguageTool-5.2/languagetool-commandline.jar'



"source ~/.config/nvim/plug-config/vimtex.vim " TODO: regler l'erreur 
let g:vimtex_compiler_latexmk_engines = {
    \ '_'           : '-pdf',
    \ 'pdf_escaped' : '-pdf -pdflatex="pdflatex -shell-escape %O %S"',
\}


source ~/.config/nvim/plug-config/airline.vim "Markdown
source ~/.config/nvim/plug-config/mkdp.vim "Markdown
source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/colorsheme.vim
