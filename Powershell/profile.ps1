$VIMDIR = "C:\Program Files (x86)\Vim\vim74"
$VIMPATH = $VIMDIR + "\vim.exe"
$GVIMPATH = $VIMDIR + "\gvim.exe"
$GITPATH = "C:\Program Files (x86)\Git\cmd\git.exe" 
$HGPATH = "C:\Program Files\Mercurial\hg.exe"

Set-Alias vim $VIMPATH
Set-Alias git $GITPATH
Set-Alias hg  $HGPATH
Set-Alias gvim $GVIMPATH

# Load posh-hg example profile
. 'C:\Users\Ross\Documents\WindowsPowerShell\Modules\posh-hg\profile.example.ps1'

. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
. $env:github_posh_git\profile.example.ps1





