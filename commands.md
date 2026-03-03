1. Check ignored files and folder
```sh
git ls-files --others --ignored --exclude-standard | grep '/$'
```
2. Git status with ignore status
```sh
git status --ignored
```
3. Change default shell
```sh
chsh -s $(which zsh)
```
4. Stow Command
```sh
stow -nvS -d ~/dotfiles -t ~ .
```
