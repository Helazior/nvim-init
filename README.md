# nvim-init

* Installer nvim
* Installer vim pluging :
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Mettre le `init.vim` dans :
`~/.config/nvim/`

Avoir nodejs à jour.  

Puis dans nvim taper :
```
:PlugInstall
:CocInstall coc-pairs
:CocInstall coc-vimtex
:CocInstall coc-java
:CocInstall coc-snippets
```
(
Pour coc-snippets :
```
pip3 install --user neovim
```
)

Si dans un programme java il n'arrive pas à activer coc-java :
Puis aller sur `https://download.eclipse.org/jdtls/snapshots/?d`
Télécharger `jdt-language-server-1.5.0-202110010353.tar.gz` ou plus récent, le décompresser dans :
`~/.config/coc/extensions/coc-java-data/server`


Pour Ale, installer dans le terminal :

```
pip3 install flake8
pip3 install pylint
pip3 install autopep8
pip3 install black
pip3 install yapf
```

Rust Analyzer
```
mkdir -p ~/.local/bin
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
```
ou avec yay si sur archlinux

Dans `~/.zshrc_alias` s'il existe (ou .zshrc sinon) mettre :
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
