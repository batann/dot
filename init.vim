set nocp
syntax on
filetype plugin indent on
set autowrite
set hidden
set mouse=a
set swapfile
set nu
set relativenumber
set t_Co=256
set cursorcolumn
set cursorline
set scrolloff=10
colorscheme space-vim-dark

if filereadable("/etc/vim/vimrc.local")
		source /etc/vim/vimrc.local
	endif
let g:netrw_menu = 1
let g:netrw_preview = 1
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_lifestyle = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
source ~/.cache/calendar.vim/credentials.vim



autocmd! BufNewFile *.sh 0r ~/.vim/templates/sklt.sh
autocmd! BufNewFile *.html 0r ~/.vim/templates/sklt.html
autocmd! BufNewFile *.wiki 0r ~/.vim/templates/sklt.wiki
autocmd! BufNewFile *.txt 0r ~/.vim/templates/sklt.txt
autocmd! BufNewFile *note.wiki 0r ~/.vim/templates/sklt.note.wiki

nnoremap <leader>vvr :split $MYVIMRC<CR>
nnoremap <leader>svr :source $MYVIMRC<CR>
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd



" default task report type
let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = []
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
let g:task_rc_override     = 'rc.defaultwidth=999'
" default fields to ask when adding a new task
let g:task_default_prompt  = ['due', 'description']
" whether the info window is splited vertically
let g:task_info_vsplit     = 0
" info window size
let g:task_info_size       = 15
" info window position
let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
let g:task_log_directory   = '~/.task'
" max number of historical entries
let g:task_log_max         = '20'
" forward arrow shown on statusline
let g:task_left_arrow      = ' <<'
" backward arrow ...
let g:task_left_arrow      = '>> '


let g:vimwiki_hl_headers = 1
let wiki_2 = {}
let wiki_2.path = '/home/batan/10/vimwiki2/'
let wiki_2.path_html = '/home/batan/10/vimwiki2_html/'

let wiki_1 = {}
let wiki_1.path = '/home/batan/10/vimwiki/'
let wiki_1.path_html = '/home/batan/vimwiki_html/'


let wiki_3 = {}
let wiki_3.path = '/home/batan/10/vimwiki3/'
let wiki_3.path_html = '/home/batan/10/vimwiki3_html/'

let g:vimwiki_list=[wiki_1, wiki_2, wiki_3]

let g:table_mode_always_active= 1
let g:table_mode_tablesize_map='<Leader>tt'
let g:table_mode_tablesize_op_map='<Leader>T'

	"" code addons emmet-vim
	""let g:user_emmet_install_global = 0
	""autocmd FileType html,css EmmetInstall
	""
	""" ALE lint
	""let g:ale_fixers = {
		"" \ ‘html’: [‘prettier’],
		"" \ ‘css’: [‘stylelint’],
		"" \}let g:ale_linters = {
			"" \ ‘html’: [‘htmlhint’],
			"" \ ‘css’: [‘stylelint’],
			"" \}
			""let g:ale_linters_explicit = 1
			""let g:ale_fix_on_save = 1
			"
nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>

nmap <F8> :TagbarToggle<CR>
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}



let g:ale_fix_on_save = 1
let b:ale_linters = ['eslint']

let g:ale_linters = {
\   'javascript': ['eslint'],
\}


	let g:ale_completion_enabled = 0

set omnifunc=ale#completion#OmniFunc

let g:ale_completion_autoimport = 1
let g:airline#extensions#ale#enabled = 1
