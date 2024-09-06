" colorsheme
	if (empty($TMUX))
		if (has("nvim"))
			"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
			let $NVIM_TUI_ENABLE_TRUE_COLOR=1
		endif
		if (has("termguicolors"))
			set termguicolors
		endif
	endif
	set background=dark
	"autocmd vimenter * ++nested colorscheme gruvbox
	"let g:gruvbox_contrast_dark="high"
	"let g:gruvbox_inverse=0

	"let g:gruvbox_italic = 1
	"let g:gruvbox_transparent_bg = 1
	"let g:gruvbox_sign_column = 'bg0'
	"let g:gruvbox_vert_split = 'fg0'
	"let g:gruvbox_invert_signs = 1


	" The configuration options should be placed before `colorscheme sonokai`.
	"let g:sonokai_style = 'shusia'
	"let g:sonokai_style = 'andromeda'
	"let g:sonokai_better_performance = 1
	"colorscheme sonokai

	set termguicolors     " enable true colors support
	let ayucolor="light"  " for light version of theme
	let ayucolor="mirage" " for mirage version of theme
	let ayucolor="dark"   " for dark version of theme
	colorscheme ayu

"let g:airline_theme='monokai_tasty'
"let g:vim_monokai_tasty_italic = 1
"colorscheme vim-monokai-tasty

"colorscheme monokai-phoenix

