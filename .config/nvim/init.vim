" init.vim
" version 0.1
" -----------

" Basic Settings
" --------------
set title              " sets the terminal window title
set ruler              " shows current cursor position on lower right corner
set number             " show line numbers
set list               " lets list to show the tab and whitspace chars
set nowrap             " disables text wrapping
set incsearch          " searches for text as typed
set showmatch          " jumps briefly to brace/parenthese/brackets match of current block when closing brace typed
set ignorecase         " ignores case sensitivity when searching
set smartcase          " overrides 'ignorecase' when searching with capitals
set wildmenu           " this enables code completion
set hlsearch           " enable search highlighting
set showcmd            " shows aritalliy the command in the bottom right of screen
set nobackup           " disables backup of files
set noswapfile         " disables use of swap files
set nowritebackup      " disables more backup stuff
set splitright         " vsplit file opens on the right
set splitbelow         " split file opens below
set nofoldenable       " Disable folding
set noexpandtab        " disable conversion of tabs to spaces
set shiftround         " round indent to multiple of 'shiftwidth'


" Assignments
" -----------
set encoding=utf-8              " Ensure correct encoding
set history=256                 " Set a sensible history limit
set timeoutlen=250              " Change wait time after ESC, default can be a pain
set laststatus=2                " shows indenting and line numers by defualt
set shiftwidth=4                " number of spaces to use for each setp of (auto)indent
set softtabstop=4               " TODO not sure but handy
set tabstop=4                   " set 1 tab to be equal to this many spaces
set listchars=tab:>\ ,trail:.   " show tabs and trailing whitespace
set completeopt=menuone,longest " for code completion always show the menu and longest match first
set scrolloff=0                 " sets scrolling offset x lines before beginning or end
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set mouse=a                     " default mouse on
set textwidth=0                 " Don't wrap lines by default

" Neovim python provider
let g:python3_host_prog = $HOME..'/.pyenv/versions/neovim/bin/python'

" Navigate between buffers
nmap <silent> <C-n> :bp<CR>
nmap <silent> <C-m> :bn<CR>

" Disable CTRL-Space in insert mode
imap <NUL> <Space>

" Disable CTRL+Z
map <C-Z> <Nop>

" Reload init.vim and reinstall
map <A-r> :so ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:q<CR>

" Navigate windows in normal mode:
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Navigate windows in terminal-mode:
tnoremap <A-Up>    <C-\><C-N><C-w>k
tnoremap <A-Down>  <C-\><C-N><C-w>j
tnoremap <A-Left>  <C-\><C-N><C-w>h
tnoremap <A-Right> <C-\><C-N><C-w>l

" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

nmap <silent> <C-home> :vertical botright Ttoggle<CR><A-Right>
nmap <silent> <C-end> :botright Ttoggle<CR><A-Down>

" Toggle off terminal
tnoremap <C-home> <C-\><C-N>:Ttoggle<CR>
tnoremap <C-end> <C-\><C-N>:Ttoggle<CR>

" Auto enter terminal
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
autocmd TermOpen * setlocal nonumber

" Auto close pane on termina exit
autocmd TermClose * close

" Remember where we were last time
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

au BufNewFile,BufRead Jenkinsfile setf groovy

" Bootstrap Plug
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
let plugin_path = stdpath('config') . '/plugged'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . ' --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
endif
unlet autoload_plug_path

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'kassio/neoterm'
Plug 'dag/vim-fish'
Plug 'hashivim/vim-terraform'
Plug 'cespare/vim-toml'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'icollar/vim-better-whitespace'
call plug#end()

if filewritable(plugin_path . '/vim-code-dark') == 2
  colorscheme codedark
endif

hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi LineNR guibg=NONE ctermbg=NONE
hi Directory guibg=NONE ctermbg=NONE
hi CursorLine ctermbg=234
hi SignColumn ctermbg=NONE
hi NERDTreeExecFile ctermfg=22 cterm=bold
hi GitGutterAdd ctermbg=2 ctermfg=2
hi GitGutterChange ctermbg=3 ctermfg=3
hi GitGutterDelete ctermbg=1 ctermfg=1

hi GitGutterAddLineNR ctermfg=76
hi GitGutterChangeLineNR ctermfg=226
hi GitGutterDeleteLineNR ctermfg=196
hi GitGutterChangeDeleteLineNR ctermfg=208

set updatetime=10

let g:gitgutter_signs = 0
let g:gitgutter_highlight_linenrs = 1
set scl=no


hi Whitespace ctermbg=NONE ctermfg=243
hi ExtraWhitespace ctermbg=196 ctermfg=white cterm=bold
let g:show_mixed_whitespace_indentations=1


" Cleanup trailing whitespace
nmap <silent> <leader>z :StripWhitespace<CR>


" Fish
autocmd FileType fish syntax enable
autocmd FileType fish filetype plugin indent on
autocmd FileType fish compiler fish

" Airline
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts                 = 1
let g:airline_whitespace_detect               = 0
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Deoplete
let g:deoplete#enable_at_startup = 1

" Ansible
"let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 0
let g:ansible_template_syntaxes = { '*.sh.j2': 'sh', '*.env.j2': 'sh', 'Dockerfile.j2': 'Dockerfile', '*.conf.j2': 'apache' }


if filewritable(plugin_path . '/nerdtree') == 2
  " NERDTree
  autocmd VimEnter * NERDTree | wincmd l
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
