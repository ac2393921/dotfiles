if empty(glob('~/dotfiles/.vim/colors/despacio.vim'))
  silent !curl -fLo ~/dotfiles/.vim/colors/despacio.vim --create-dirs
    \ https://raw.githubusercontent.com/AlessandroYorba/Despacio/master/colors/despacio.vim
    \ >/dev/null 2>&1
endif
colorscheme despacio

"" options
set number  " 行番号を表示する
set encoding=UTF-8
set backspace=indent,eol,start  " バックスペースを有効にする
set termwinsize=12x0  " ターミナルのサイズを指定
set updatetime=250  " 反映時間を短くする(デフォルトは4000ms)

"" キーマップ
" タブを作成する
nnoremap tc :tabnew<CR>
" 前のタブを開く
nnoremap tp :tabp<CR>
" 次のタブを開く
nnoremap tn :tabn<CR>
" タブを閉じる
nnoremap tx :tabclose<CR>

"" plugin
call plug#begin()

"" vim-airline
" ステータスラインを表示する
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'

"" fern.vim
Plug 'lambdalisue/fern.vim'
" diffを表示する
Plug 'lambdalisue/fern-git-status.vim'

" アイコンを表示する
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" アイコンに色をつける
Plug 'lambdalisue/glyph-palette.vim'

Plug 'preservim/nerdtree'

"" git
" diffを表示する
Plug 'airblade/vim-gitgutter'
" gitコマンドを使う
Plug 'tpope/vim-fugitive'
" GitHubを開く
Plug 'tpope/vim-rhubarb'

"" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'cohama/lexima.vim'
Plug 'rhysd/vim-operator-surround'

call plug#end()


"" vim-airline
" VSCodeのテーマ

" powerlineを有効にする
let g:airline_powerline_fonts = 1
" タブラインを表示する
let g:airline#extensions#tabline#enabled = 1
" ステータスラインに表示する項目を変更する
" 参考: https://original-game.com/vim-airline/
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ ['z']
  \ ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#hunks#non_zero_only = 1 " 変更がなければdiffの行数を表示しない
" タブラインの表示を変更する
" 参考: https://www.reddit.com/r/vim/comments/crs61u/best_airline_settings/
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0


"" ferm.vim
" ファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
" アイコンを表示する
let g:fern#renderer = 'nerdfont'
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END


"" git操作
" 前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" 次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" diffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" カーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red
" 該当のファイルをGitHubで開く
nnoremap gb :Gbrowse<CR>
vnoremap gb :Gbrowse<CR>

"" fzf
" ファイル検索を開く
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<CR>

" 文字列検索を開く
" <S-?>でプレビューを表示/非表示する
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <C-g> :Rg<CR>

" カーソル位置の単語をファイル検索する
nnoremap fr vawy:Rg <C-R>"<CR>
" 選択した単語をファイル検索する
xnoremap fr y:Rg <C-R>"<CR>

" バッファ検索を開く
nnoremap fb :Buffers<CR>
" fpでバッファの中で1つ前に開いたファイルを開く
nnoremap fp :Buffers<CR><CR>
" 開いているファイルの文字列検索を開く
nnoremap fl :BLines<CR>
" マーク検索を開く
nnoremap fm :Marks<CR>
" ファイル閲覧履歴検索を開く
nnoremap fh :History<CR>
" コミット履歴検索を開く
nnoremap fc :Commits<CR>

nnoremap <silent><C-e> :NERDTreeToggle<CR>
