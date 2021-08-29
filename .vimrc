set nocompatible              " be iMproved, required
filetype off                  " required

" WARNING
" This will require a bit of external setup to work properly
" You'll need to have:
" - Fira Code with macligature support
" - A YouCompleteMe server
" - Airline/powerline fonts

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree' " File explorer
Plugin 'scrooloose/syntastic' " Syntax checking ***REQUIRES EXTERNAL SETUP***
Plugin 'tpope/vim-surround' " Easily surround text with characters
Plugin 'vim-airline/vim-airline' " Better status bar
Plugin 'easymotion/vim-easymotion' " Key commands for easy cursor movement
Plugin 'haya14busa/incsearch.vim' " Highlight searches incrementally
Plugin 'haya14busa/incsearch-easymotion.vim' " Add easymotion support
Plugin 'osyo-manga/vim-over' " Visual search & replace
Plugin 'jistr/vim-nerdtree-tabs' " Use NERDTree in a side panel
Plugin 'godlygeek/csapprox' " Make GVim color schemes work in terminal
Plugin 'airblade/vim-gitgutter' " Git gutter
Plugin 'xolox/vim-misc' " Adds utility functions for Vim scripts
Plugin 'jiangmiao/auto-pairs' " Add closing characters for parentheses + more
Plugin 'nathanaelkane/vim-indent-guides' " Add vertical lines as indent guides
Plugin 'scrooloose/nerdcommenter' " Easy comment/uncomment
Plugin 'mattn/emmet-vim' " Shortcuts for writing HTML
Plugin 'sheerun/vim-polyglot' " Auto-download syntax highlights
Plugin 'KabbAmine/yowish.vim' " Color scheme
Plugin 'morhetz/gruvbox' " Color scheme
Plugin 'ctrlpvim/ctrlp.vim' " File search
Plugin 'Valloric/YouCompleteMe' " Autocompletion ***REQUIRES EXTERNAL SETUP***
Plugin 'Xuyuanp/nerdtree-git-plugin' " Git support for NERDTree
Plugin 'mileszs/ack.vim' " Faster grep
Plugin 'burke/matcher' " Better Ctrl-P matching
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'flowtype/vim-flow' " Support for Flow (JavaScript static typechecker)
Plugin 'artur-shaik/vim-javacomplete2' " Autocomplete for Java libraries
Plugin 'alvan/vim-closetag' " Auto-close HTML tags
Plugin 'heavenshell/vim-jsdoc' " Generate JSDoc comments based on fn signature
Plugin 'sickill/vim-pasta' " Auto-indent after pasting
Plugin 'Valloric/MatchTagAlways' " Always highlight enclosing HTML tags
Plugin 'kshenoy/vim-signature' " Visual marks
Plugin 'mhinz/vim-startify' " Start screen
Plugin 'severin-lemaignan/vim-minimap' " Sublime-like minimap

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

execute pathogen#infect()

"""""""""""""""""""""""
" Vim Configuration
"""""""""""""""""""""""

" Use jk to break out of insert mode
imap jk <Esc>

" Change the leader key to space
let mapleader = "\<Space>"

" Easy saving
nnoremap <Leader>w :w<CR>

" Easy playback of recordings
nmap Q @q

" Easier window switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" This allows buffers to be hidden if you've modified a buffer.
set hidden

" Open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap } :bnext<CR>

" Move to the previous buffer
nmap { :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>

" Quicker grep
nmap <leader>q :cw<cr>
nmap <leader>gr :Ggrep! 

" Easily autoindent whole file
nmap + gg=G

" Make a new mark
nmap mm m,
" Jump to last mark
nmap <leader>, [`
" Jump to next mark
nmap <leader>. ]`

"""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""

" Don't do Flow typechecking on save
let g:flow#enable = 0

" Setup some default ignores for Ctrl-P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlPMRU<cr>

" Easy bindings for various Ctrl-P modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Show list of buffers as tabs along the top, and enable easy switching
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Show just the filename for each buffer
let g:airline#extensions#tabline#fnamemod = ':t'

" Better substitution
nmap <Leader>S :OverCommandLine<CR>

" Easymotion bindings
map <Leader> <Plug>(easymotion-prefix)
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>: <Plug>(easymotion-bd-jk)
nmap <Leader>: <Plug>(easymotion-overwin-line)
map <Leader>W <Plug>(easymotion-bd-w)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>hh <Plug>(easymotion-linebackward)

" Replace normal search with incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" Toggle the NERDTree sidebar with K
nmap K :NERDTreeTabsToggle<Enter>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.DS_Store$', '\.git$']
" Only open NERDTree on startup if a directory was given as a startup argument
let g:nerdtree_tabs_open_on_gui_startup = 2
" Focus the file window instead of NERDTree on startup
let g:nerdtree_tabs_smart_startup_focus = 2

" Toggle minimap on and off
let g:minimap_toggle='<leader>mm'

let g:startify_relative_path = 1 " Use relative paths where appropriate
let g:startify_session_persistence = 1 " Autosave sessions on quit
let g:startify_change_to_vcs_root = 1 " Change working dir to git root on open
let g:startify_change_to_dir = 0
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 
    \ 'commands']

" For heavenshell/vim-jsdoc
let g:jsdoc_allow_input_prompt = 1

" Syntastic shouldn't bug us about Angular
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute']
let g:syntastic_mode_map = { "mode": "passive" }

" Make Startify and NERDTree play nice with each other
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" Reqd for vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Use Silver Searcher for faster greps
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable('matcher')
    let g:ctrlp_match_func = { 'match': 'GoodMatch' }

    function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

      " Create a cache file if not yet exists
      let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
      if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
      endif
      if !filereadable(cachefile)
        return []
      endif

      " a:mmode is currently ignored. In the future, we should probably do
      " something about that. the matcher behaves like "full-line".
      let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
      if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
        let cmd = cmd.'--no-dotfiles '
      endif
      let cmd = cmd.a:str

      return split(system(cmd), "\n")

    endfunction
end

"""""""""""""""""""""""
" Visuals
"""""""""""""""""""""""

set macligatures " allow font ligatures for Fira Code
set linespace=2
set guifont=Fira\ Code:h12
set number
set relativenumber " use relative line numbers

" Tab settings
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set t_Co=256
set background=dark
let g:airline_powerline_fonts = 1 " use powerline special characters
set encoding=utf8
set laststatus=2 " always display statusline

" Get rid of scrollbars
set guioptions-=L
set guioptions-=l
set guioptions-=r

" Colorscheme settings. Comment/uncomment as appropriate to change colorscheme
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark='hard'

"colorscheme yowish
"let g:airline_theme='yowish'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#1A1A1A')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#1A1A1A')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#1A1A1A')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#1A1A1A')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#1A1A1A')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#1A1A1A')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#1A1A1A')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#1A1A1A')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#1A1A1A')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#1A1A1A')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#1A1A1A')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#1A1A1A')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#1A1A1A')

" Use vertical lines as indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_exclude_filetypes = ['nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3

" Add a vertical line at 80 chars
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")
