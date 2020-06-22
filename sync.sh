cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function syncDotfile() {
	unison ~/dotfiles ~/\
		 -ignore "Path {?*,.?*}"\
		 -ignorenot "Name {.agignore,.aliases,.gitconfig,.vimrc,.zshrc}"\
     -batch

  source ~/.zshrc;
}

# if [ "$1" == "--force" -o "$1" == "-f" ]; then
# 	syncDotfile;
# else
# 	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
# 	echo "";
# 	if [[ $REPLY =~ ^[Yy]$ ]]; then
# 		syncDotfile;
# 	fi;
# fi;

syncDotfile;
unset syncDotfile;

