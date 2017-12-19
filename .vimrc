set directory=$HOME/.vim//
set backupdir=$HOME/.vim//
set undodir=$HOME/.vim//
set number
set rnu

" Set hidden allows moving to other buffers without saving
set hidden

" Allows mouse interaction
set mouse=a

" Yanks and pastes off system clipboard as default clipboard
set clipboard=unnamedplus

" Allow modification of certain buffers
set ma
let g:netrw_bufsettings = 'noma nomod rnu nu nobl nowrap ro'

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" System dependencies:
" Vim 8+ - make sure it is compiled with system clipboard support
" Python 2 or 3 - for autocomplete engine
" Ag - for project searches
" Node, NPM, Typescript (2.5.3) for typescript auto completion

" Sensible vim defaults
Plug 'tpope/vim-sensible'

"Functionality for surrounding text objects
Plug 'tpope/vim-surround'

"Auto comment (gc)
Plug 'tpope/vim-commentary'

" Improved netrw (the default file explorer)
" Plug 'tpope/vim-vinegar'
Plug 'matthewd/vim-vinegar', { 'branch': 'netrw-plug' }

" Awesome git interaction
Plug 'tpope/vim-fugitive'

" Git gutter for buffers
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Handy visualisation of jump commands (f & t)
Plug 'unblevable/quick-scope'

" Nice file explorer / interactions
Plug 'scrooloose/nerdtree'

" Apply editor config settings to buffers
Plug 'editorconfig/editorconfig-vim'

" Multi cursor support in vim
Plug 'terryma/vim-multiple-cursors'
 
" Fuzzy finder support - search buffers, project files etc.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Vim airline - visual  
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Snippet support
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'cristianoliveira/vim-react-html-snippets'

" Syntax highlighting support (for errors etc.)
Plug 'vim-syntastic/syntastic'

" Typescript
" Typescript styling
Plug 'HerringtonDarkholme/yats.vim'
" Typescript utilities
Plug 'quramy/tsuquyomi'


" Auto completion / drop down / utilities for multi languages (and ts)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Color Schemes
Plug 'flazz/vim-colorschemes'
Plug 'crusoexia/vim-monokai'

" For high productivity
Plug 'rbtnn/game_engine.vim'
Plug 'rbtnn/mario.vim'
call plug#end()
colorscheme monokai

" Airline customization
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='minimalist'

" Quick scope settings
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Sensible syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Sensible typescript settings
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_single_quote_import = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']

" File fuzzy find all files in a project that aren't git ignored
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Use space as leader key
let mapleader = "\<Space>"

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']


" Config for build in omnisearch 
set completeopt=noinsert,menuone

" aliases 
nnoremap <leader>p :Files<CR>
vnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
vnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Ag!<CR>
" Show unsaved changes
nnoremap <leader>uc :w !diff % -<CR>
" Open current file in nerd tree
nnoremap <leader>n :NERDTreeFind<CR>
vnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader><leader> <C-W>w
vnoremap <leader><leader> <C-W>w
" Yank visual selection into search
vnoremap <leader>/ y/<C-R>"<CR>
" Take visual selection and put it into search replace
vnoremap <leader>r y:%s/<C-R>"
" Switch windows
nnoremap <leader>w :w<CR>
vnoremap <leader>w :w<CR>
nnoremap <leader>] :TsuDefinition<CR>
vnoremap <leader>] :TsuDefinition<CR>
nnoremap <leader>} :YcmCompleter GoToReferences<CR>
vnoremap <leader>} :YcmCompleter GoToReferences<CR>
nnoremap <leader><CR> :TsuImport<CR>
vnoremap <leader><CR> :TsuImport<CR>
" Replace pane buffer on buffer deletion
cnoreabbrev bd bp\|bd #
" Don't overwrite clipboard on visual paste
vnoremap p "ddP
vnoremap y ygv<Esc>


" Sensible multi cursor defaults
let g:multi_cursor_start_key='<C-j>'
let g:multi_cursor_start_word_key='<C-j>'
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" edit .vimrc
nnoremap <leader>ev :tabe $MYVIMRC<CR>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

"https://stackoverflow.com/a/47361068/2393941
" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:OnBufEnter ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call OnBufEnter()
augroup END

" Nerd tree 
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "~",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Jump to airline buffer
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>k <Plug>AirlineSelectPrevTab
nmap <leader>j <Plug>AirlineSelectNextTab

" https://stackoverflow.com/questions/1534835/how-do-i-close-all-buffers-that-arent-shown-in-a-window-in-vim
function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
