# nvim-init

* Installer nvim
* Installer vim pluging :
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Mettre le `init.vim` dans :
`~/.config/nvim/`

Puis dans nvim taper :
```
:PlugInstall
:CocInstall coc-pairs
:CocInstall coc-vimtex
:CocInstall coc-java
:CocConfig
```
et mettre :
`"diagnostic.displayByAle": true`



Puis aller sur `https://download.eclipse.org/jdtls/snapshots/?d`
Télécharger `jdt-language-server-1.5.0-202110010353.tar.gz` ou plus récent, le décompresser dans :
`~/.config/coc/extensions/coc-java-data/server`


Pour Ale, installer dans le terminal :

```
pip3 install flake8
pip3 install pylint
```
TODO: changer les niveaux d'alerte car ils sont trop violent en python (une erreur car j'ai pas mis d'espace avant un commentaire...)

Dans `~/.zshrc`
Mettre
```
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude .vim'
```
Dans `~/.zshrc_alias` s'il existe (ou zshrc sinon) mettre :
```
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
```

Puis :
```
source .zshrc
source .zshrc_alias
```
