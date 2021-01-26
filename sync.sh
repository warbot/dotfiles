cd "$(dirname "${BASH_SOURCE}")";

git pull origin master

function checkSyncTool() {
  if ! [ -x "$(command -v unison)" ]; then
    echo 'Sync tool `unison` is missing. Installing with brew'
    echo 'brew install unison'
    brew install unison
  fi
}

function syncDotfile() {
	unison ~/dotfiles ~/\
		 -ignore "Path {?*,.?*}"\
		 -ignorenot "Name {.agignore,.aliases,.gitconfig,.vimrc,.vim,.zshrc,.aliases,.tmux.conf}"\
     -batch

  source ~/.zshrc
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

checkSyncTool
syncDotfile
unset checkSyncTool
unset syncDotfile

