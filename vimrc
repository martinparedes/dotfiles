" To copy to clipboard:
" "+y
" To paste from the clipboard:
" "+p

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-vinegar.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/airblade/vim-gitgutter.git'

call plug#end()

nnoremap <C-p> :FZF<CR>

" Set for tabs
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>

if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

syntax enable
set background=dark
set number
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

set backspace=indent,eol,start  " Make backspace work as you would expect.
set directory=$HOME/.vim/files/swap/ " Move swp file to .vim directory.
set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Set for tabs
:nmap <C-l> :tabnext<CR>
:nmap <C-h> :tabprevious<CR>
:nmap <C-t> :tabnew<CR>

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
" set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
