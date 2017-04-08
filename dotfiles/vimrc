set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

color koehler
set nu

" If KDE, set a readable font
if has("gui_kde")
   set guifont=Courier\ 10\ Pitch/10/-1/5/50/0/0/0/1/0
endif

" Clear any existing autocommands..
autocmd!

if has('syntax') && (&t_Co > 2)
  syntax on
endif

set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
"execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" have the mouse enabled all the time:
" set mouse=a

" don't have files trying to override this .vimrc:
set nomodeline

" * Text Formatting -- General

" don't make it look like there are line breaks where there aren't:
set nowrap

" identation
set autoindent
set smarttab
set expandtab
set shiftwidth=4
"set shiftround
" Don't put comments on the first coloumn when indenting
inoremap # #

" Have Q reformat the current paragraph or current selected text
nnoremap Q gqap
vnoremap Q gq

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
" set formatoptions-=t
" set textwidth=79


" enable filetype detection:
filetype on

if has("autocmd")
  filetype plugin indent on
endif

" for all files
autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro cindent

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for PHP programming, have things in braces indenting themselves:
autocmd FileType php set autoindent tabstop=3

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" for python
autocmd FileType python set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab

" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
"noremap <Space> <PageDown>
"noremap <BS> <PageUp>
"noremap - <PageUp>
" [<Space> by default is like l, <BkSpc> like h, and - like k.]

" scroll the window (but leaving the cursor in the same place) by a couple of
noremap <C-k> 1<C-Y>
noremap <C-j> 1<C-E>

noremap <M-k> 1<C-Y>k
noremap <M-j> 1<C-E>j
noremap <C-M-k> 1<C-Y>2k
noremap <C-M-j> 1<C-E>2j
" [<Ins> by default is like i, and <Del> like x.]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>


" * Keystrokes -- Formatting

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have the usual indentation keystrokes still work in visual mode:
"vnoremap <C-T> >
"vnoremap <C-D> <LT>
"vmap <Tab> <C-T>
"vmap <S-Tab> <C-D>

" * Keystrokes -- Insert Mode

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
"inoremap <Tab> <C-T>
"inoremap <S-Tab> <C-D>
" [<Ctrl>+V <Tab> still inserts an actual tab character.]

"set backupdir=~/.backup
"set dir=~/.backup

" Hilight everything beoynd line 80
highlight ExtraWhitespace ctermbg=red guibg=red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match ExtraWhitespace /\s\+\%#\@<!$/
match OverLength /\%80v.\+/

" We play utf-8
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

au BufEnter /private/tmp/crontab.* setl backupcopy=yes
let python_highlight_all = 2
