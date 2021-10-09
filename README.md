# nvim-init

Mettre le `init.vim` dans :
`~/.config/nvim/`

Puis dans nvim taper :
```
:PlugInstall
:CocInstall coc-pairs
:CocConfig
```
et mettre :
`"diagnostic.displayByAle": true`

Dans le terminal taper :
```
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude .vim'
```
Pour Ale, installer dans le terminal :

```
pip3 install flake8
pip3 install pylint
```
TODO: changer les niveaux d'alerte car ils sont trop violent en python (une erreur car j'ai pas mis d'espace avant un commentaire...)

Dans `~/.zshrc`
Mettre
```
alias vi="nvim"
```
