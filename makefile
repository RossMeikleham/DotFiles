all: installAntigen installZSH installVim installTMUX installAwesome installLBotConfig installXresources

installWeechat:
	ln -s $(CURDIR)/weechat ~/.weechat

installAntigen:
	ln -s $(CURDIR)/antigen ~/.antigen

installZSH:
	# Install custom files.
	ln -s $(CURDIR)/zprofile ~/.zprofile
	ln -s $(CURDIR)/zshrc ~/.zshrc


installTMUX:
	ln -s $(CURDIR)/tmux.conf ~/.tmux.conf


uninstallZSH:
	rm -rf ~/.zprofile
	rm -rf ~/.zshrc


installVim:
	# Create the symlinks to vim
	ln -s $(CURDIR)/vimrc ~/.vimrc
	ln -s $(CURDIR)/vim/colors ~/.vim/colors
	ln -s $(CURDIR)/vim/bundle ~/.vim/bundle
	ln -s $(CURDIR)/vim/autoload ~/.vim/autoload
	

installAwesome:
	#Create symlinks to awesome
	ln -s $(CURDIR)/awesome ~/.config/awesome	

installLBotConfig:
	#Create symlinks to lambdabot config
	ln -s $(CURDIR)/ghci ~/.ghci

.PHONY: installXresources 
installXresources:
	ln -s $(CURDIR)/Xresources ~/.Xresources
