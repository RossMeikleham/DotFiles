source ~/.antigen/antigen.zsh
. /etc/profile.d/vte.sh    

antigen use oh-my-zsh

# Make the terminal a nicer place to be: Linux Edition
antigen bundle archlinux
antigen bundle command-not-found
antigen bundle cp
antigen bundle fasd
antigen bundle docker
antigen bundle zsh-users/zsh-completions src


# Make the terminal a nicer place to be: ZSH Edition
# "If you want to use the zsh-syntax-highlighting script along with
# history-substring-search, then make sure that you load it *before* you load
# this script:"
antigen bundle zsh-users/zsh-syntax-highlighting 
antigen bundle history-substring-search

# Git stuff
antigen bundle git
antigen bundle git-extras
antigen bundle bobthecow/git-flow-completion

#Haskell package manager
antigen bundle cabal
antigen bundle web-search

export PYTHONPATH=/usr/lib/python2.7/site-packages

# Make the prompt pretty :3
antigen theme ross
antigen apply

#Set Exports "
export EDITOR=vim
export PATH=$PATH:/opt/android-studio/bin/
export PATH=$PATH:/opt/idea-IC-133.124/bin/
export DEPLOYGATE_USERNAME=RossMeikleham
export JAVA_HOME="/opt/jdk1.7.0_45"
export ANDROID_HOME="/opt/android-sdk/sdk" 
export ANDROID_NDK=/opt/android-ndk-r10
export PATH=$PATH:$ANDROID_NDK

#Set paths"
PATH=$JAVA_HOME/bin:$PATH #Java
PATH=/opt/android-sdk/sdk/platform-tools:/opt/android-sdk/sdk/tools:$PATH #Android
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$HOME/.cabal/bin:$PATH #Haskell package manager
PATH=/usr/local/MATLAB/MATLAB_Production_Server/R2013a/bin:$PATH #MATLAB
PATH=/usr/local/MATLAB/MATLAB_Production_Server/R2013a/bin/glnxa64:$PATH #MATLAB

# Uni Level 4 Paths
export L4=$HOME/Dropbox/Level4
export CS4=$L4/CS
export M4=$L4/Maths
export PROJECT=$L4/Project

alias l4="cd $L4"
alias cs4="cd $CS4"
alias m4="cd $M4"
alias project="cd $PROJECT"

#urxvt with partial transparency
alias urxvt="urxvt -tr -sh 20"

#Mounting android device
alias mountDroid="sudo jmtpfs -o allow_other /media" 

#Setup powerline bindings
if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
        source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi            


git-export() {
	git clone --depth=1 "$@"
	rm -rf "$2/.git"
}

uploadImage (){
    echo "Uploading... " $1
    curl -s -F "image=@$1" -F "key=486690f872c678126a2c09a9e196ce1b" http://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
    shift
}


copyzshtheme () {
    cp ross.zsh-theme ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git/themes/
}
