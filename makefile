all: installAntigen installZSH installVim installTMUX installAwesome installLBotConfig installXresources

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
	ln -s $(CURDIR)/vim ~/.vim

installAwesome:
	#Create symlinks to awesome
	ln -s $(CURDIR)/awesome ~/.config/awesome	

installLBotConfig:
	#Create symlinks to lambdabot config
	ln -s $(CURDIR)/ghci ~/.ghci

.PHONY: installXresources 
installXresources:
	ln -s $(CURDIR)/Xresources ~/.Xresources
