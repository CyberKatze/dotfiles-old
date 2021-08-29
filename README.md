# m3d Dotfile
Managing your dotfile with symlink.

## Installation 
1. Clone the repository
	```bash
		git clone https://github.com/m3dsh/dotfiles.git ~/.dotfiles
	```
2. Go to ~/.dotfiles and run 
	```bash
	$ stow <directory name>
	```
	for each file you want to install
3. Read each `README.md` in directory for more config

## Uninstalling 
```
$ stow -D <filename>
```

## Doc
- [How to use stow as dotfile manager](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/)
- [Mehran Shahidi Website](https://mehranshahidi.ir)
