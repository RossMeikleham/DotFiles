"Ross Meikleham vimrc 2013


if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

set tags+=./.tags
set laststatus=2

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=9001		" keep 9001 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  

  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  au BufRead,BufNewFile *.gpc set filetype=gpc
  set hlsearch
endif


filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"



"set omnifunc=syntaxcomplete#Complete
"Setup suntax highlighting for Scons
au BufNewFile,BufRead SCons* set filetype=scons 
call pathogen#infect() 
  

"Setup terminal colour approximation and colorscheme
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme molokai2


"Set so vimrc is automatically reloaded when changes are made
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC |
if has('gui_running') | so $MYGVIMRC | endif
augroup END



"Set tab spacing to 4
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Resize splits when the window is resized
au VimResized * :wincmd =


"map H to go to beginning of line, L to go to end
nmap H ^
nmap L $


" Swap colon and semi-colon keys
nnoremap ; :
nnoremap : ;

set number "enable line numbers
set t_Co=256 "256 colors
set autochdir

"Disable arrow keys for navigating
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


"Simpler split navigation
map <C-j> <C-W>j
map <C-k> <C-w>k 
map <C-h> <C-W>h
map <C-l> <C-W>l

"Use system clipboard instead
"of vim buffers
set clipboard=unnamed,unnamedplus

let g:haskell_conceal = 0
"let g:haskell_conceal_wide = 1

command MatlabRun execute '!echo "' ."run(\'".expand("%:p")."\')" . '"| matlab -nojvm' 

nnoremap <F5> :MatlabRun <CR>
