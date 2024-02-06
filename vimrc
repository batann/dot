colorscheme afterglow

if filereadable("/etc/vim/vimrc.local")
		source /etc/vim/vimrc.local
	endif

	if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if filereadable("/etc/vim/vimrc.local")
		source /etc/vim/vimrc.local
	endif

"###   LEADER MAPPINGS   #################################
let mapleader = ","

nnoremap <Leader>te :terminal<CR>					pwd	
nnoremap <Leader>tc :terminal<CR>sudo -u batan bash $HOME/check/vim.cmd.sh <CR>				
nnoremap <Leader>xc :w !xclip -selection clipboard<CR>	"copy page to clipboard
nnoremap <leader>dd :Lexplore %:p:h<CR>					"open netrw in 20% of the screen to teh left
nnoremap <Leader>da :Lexplore<CR>						" -
nnoremap <leader>vv :split $MYVIMRC<CR>					"edit vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>				"source vimrc
nmap <F8> :TagbarToggle<CR>								"tagbar toggle

"###   TABLE MODE   #######################################
let g:table_mode_always_active= 1
let g:table_mode_tablesize_map='<Leader>tt'
let g:table_mode_tablesize_op_map='<Leader>T'

"###   AMY CONFIG   #######################################

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <C-space> ?
"" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
"" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
"" Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT
"" Close all the buffers
"map <leader>ba :bufdo bd<cr>
"map <leader>l :bnext<cr>
"map <leader>h :bprevious<cr>
"" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
"map <leader>t<leader> :tabnext<cr>
"" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()



" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/
" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Specify the behavior when switching between buffers
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

" Return to last edit position when opening files (You want this!)
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" Delete trailing white space on save, useful for some filetypes ;)
"fun! CleanExtraSpaces()
"    let save_cursor = getpos(".")
"    let old_query = getreg('/')
"    silent! %s/\s\+$//e
"    call setpos('.', save_cursor)
"    call setreg('/', old_query)
"endfun
"if has("autocmd")
"    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
"endif

syntax on
filetype plugin indent on
set laststatus=2
set so=7
set foldcolumn=1
set encoding=utf8
set ffs=unix,dos,mac
set cmdheight=1
set hlsearch
set lazyredraw
set magic
set showmatch
set mat=2
set foldcolumn=1
set encoding=utf8
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set nobackup
set nowb
set nocp
set autowrite
set hidden
set mouse=a
set noswapfile
set nu
set relativenumber
set t_Co=256
set cursorcolumn
set cursorline
set ruler
set scrolloff=10
colorscheme afterglow
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

"#############          GOOGLE CALENDAR TASK      ########################


let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
source ~/.cache/calendar.vim/credentials.vim


"### VimWiki SHow Last Modified files in menu   ##############################
function! ShowLastAccessedFiles()
    let files = systemlist('ls -lt | head -n 5 | awk \'{print $9}\'')
    let file_list = ['Last Accessed Files:']
    for file in files
        call add(file_list, '- ' . file)
    endfor
    return join(file_list, "\n")
endfunction

command! LastAccessedFiles echo ShowLastAccessedFiles()
"###################		NOTES		######################################
" Map <Leader>nn to open a specific file in a specific directory with dynamic naming
nnoremap <Leader>nn :call OpenSpecificFile()<CR>
" Function to open the specified file
function! OpenSpecificFile()
  " Set the base directory
  let s:directory = '10/notes'
  " Generate the filename based on the specified pattern with an incrementing counter
  let s:filename = 'note.' . strftime('%j.') . printf('%02d', s:getCounter()) . '.wiki'
  " Construct the full path
  let s:fullpath = expand('~/' . s:directory . '/' . s:filename)
  " Open the file
  execute 'edit ' . s:fullpath
  " Increment the counter for the next file
  call s:incrementCounter()
endfunction
" Function to get the counter from a file or initialize it
function! s:getCounter() abort
  let s:counterFile = expand('~/.vim_note_counter')
  let s:counter = filereadable(s:counterFile) ? system('cat ' . s:counterFile) : 0
  return s:counter
endfunction
" Function to increment and save the counter
function! s:incrementCounter() abort
  let s:counter = s:getCounter() + 1
  call writefile([s:counter], s:counterFile)
endfunction

"###################		TEMPLATES		#################################

autocmd! BufNewFile *.sh 0r ~/.vim/templates/sklt.sh
autocmd! BufNewFile *.html 0r ~/.vim/templates/sklt.html
autocmd! BufNewFile *.txt 0r ~/.vim/templates/sklt.txt
autocmd! BufNewFile *.w.wiki 0r ~/.vim/templates/sklt.w.wiki
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

"###################        VIM ENCRYTION     ###############################

"GNUPG EDIT
"" Transparent editing of GnuPG-encrypted files
" Based on a solution by Wouter Hanegraaff
"augroup encrypted
"    au!
"    " First make sure nothing is written to ~/.viminfo while editing
"    " an encrypted file.
"    autocmd BufReadPre,FileReadPre      *.gpg,*.asc set viminfo=
"    " We don't want a swap file, as it writes unencrypted data to disk.
"    autocmd BufReadPre,FileReadPre      *.gpg,*.asc set noswapfile
"    " Switch to binary mode to read the encrypted file.
"    autocmd BufReadPre,FileReadPre      *.gpg       set bin
"    autocmd BufReadPre,FileReadPre      *.gpg,*.asc let ch_save = &ch|set ch=2
"    autocmd BufReadPost,FileReadPost    *.gpg,*.asc
"             \ '[,']!sh -c 'gpg --decrypt 2> /dev/null'
"    " Switch to normal mode for editing
"    autocmd BufReadPost,FileReadPost    *.gpg       set nobin
"    autocmd BufReadPost,FileReadPost    *.gpg,*.asc let &ch = ch_save|unlet ch_save
"    autocmd BufReadPost,FileReadPost    *.gpg,*.asc
"             \ execute ":doautocmd BufReadPost " . expand("%:r")
"
"    " Convert all text to encrypted text before writing
"    autocmd BufWritePre,FileWritePre    *.gpg
"             \ '[,']!sh -c 'gpg --default-recipient-self -e 2>/dev/null'
"    autocmd BufWritePre,FileWritePre    *.asc
"             \ '[,']!sh -c 'gpg --default-recipient-self -e -a 2>/dev/null'
"    " Undo the encryption so we are back in the normal text, directly
"    " after the file has been written.
"    autocmd BufWritePost,FileWritePost  *.gpg,*.asc u
"augroup END




"###   STARTUP PAGE MODIFIED    ############################################
autocmd VimEnter * nested
\ if !argc() && (line2byte('$') == -1) && (v:progname =~? '^[-gmnq]\=vim\=x\=\%[\.exe]$')

    " Define a function to open netrw only for the initial buffer
    function! OpenNetrwOnStartup()
        if line2byte('$') == -1
            " Open netrw if it's the initial buffer
            explore
        endif
    endfunction

    " Define a function to get and display Taskwarrior tasks
    function! DisplayTaskwarriorTasks()
        " Get the 5 most urgent tasks
        let tasks = systemlist('task +Urgency:1 limit:5 export')
        " Display tasks in a new buffer
        silent! execute 'new'
        call setline(1, tasks)
        " Set buffer options
        setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    endfunction

    " Automatically call the functions on VimEnter
    autocmd VimEnter * nested call OpenNetrwOnStartup() | call DisplayTaskwarriorTasks()

\ | endif

"autocmd VimEnter * nested
"\ if !argc() && (line2byte('$') == -1) && (v:progname =~? '^[-gmnq]\=vim\=x\=\%[\.exe]$')



"" Define VimWiki links
"function! SetupVimWikiLinks()
"    " Clear current buffer
"    silent! execute '%delete _'
"    " Set buffer options
"    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"    " Add VimWiki links
"    call append(0, ['# VimWiki Links'])
"    call append(1, ['[1] Vimwiki Index'])
"    call append(2, ['[2] Link 1'])
"    call append(3, ['[3] Link 2'])
"    call append(4, ['[4] Link 3'])
"    call append(5, ['[5] Link 4'])
"    call append(6, ['[6] Link 5'])
"endfunction
"" Define a command to set up VimWiki links
"command VimwikiLinks call SetupVimWikiLinks()
"" Automatically call the command on Vim startup
"autocmd VimEnter * nested VimwikiLinks
"autocmd VimEnter * nested Vexplore
""This code creates a function SetupVimWikiLinks() that populates the buffer with links to various VimWiki pages. It adds these links to the buffer on Vim startup using the autocmd VimEnter event.
" Define a function to open netrw only for the initial buffer
"function! OpenNetrwOnStartup()
"    if line2byte('$') == -1
"        " Open netrw if it's the initial buffer
"        Vexplore
"    endif
"endfunction
"
"    " Define a function to get and display Taskwarrior tasks
"function! DisplayTaskwarriorTasks()
"    " Get the 5 most urgent tasks
"    let tasks = systemlist('task +PRIORITY:1 limit:5 export')
"    " Display tasks in a new buffer
"    silent! execute 'new'
"    call setline(1, tasks)
"    " Set buffer options
"    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"endfunction
"" Automatically call the function on VimEnter
"autocmd VimEnter * nested call OpenNetrwOnStartup()
"\ | endif



"##########################   TASK WIKI   ###############################
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


"##############################   VIMWIKI   ###################################


let g:vimwiki_list = [{
  \ 'path': '$HOME/10/vimwiki/templates/',
  \ 'template_path': '$HOME/10/vimwiki/templates',
  \ 'template_default': 'default',
  \ 'template_ext': '.html'}]


let g:vimwiki_hl_headers = 1
let wiki_2 = {}
let wiki_2.path = '/home/batan/10/vimwiki/vimwiki2/'
let wiki_2.path_html = '/home/batan/10/vimwiki/vimwiki2_html/'

let wiki_1 = {}
let wiki_1.path = '/home/batan/10/vimwiki/vimwiki/'
let wiki_1.path_html = '/home/batan/10/vimwiki/vimwiki_html/'


let wiki_3 = {}
let wiki_3.path = '/home/batan/10/vimwiki3/'
let wiki_3.path_html = '/home/batan/10/vimwiki/vimwiki3_html/'

let wiki_4 = {}
let wiki_4.path = '/home/batan/10/vimwiki/vimwiki4/'
let wiki_4.path_html = '/home/batan/10/vimwiki/vimwiki4_html/'

let wiki_10 = {}
let wiki_10.path = '/home/batan/10/vimwiki/vimwiki10/'
let wiki_10.path_html = '/home/batan/10/vimwiki/vimwiki10_html/'
let g:vimwiki_list=[wiki_1, wiki_2, wiki_3, wiki_4, wiki_10]

func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WP call WordProcessorMode()
