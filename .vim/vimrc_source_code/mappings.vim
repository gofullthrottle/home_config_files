" Source file for maps

" Notes: There are some exceptions, but as a rule, at the moment my normal mode
" maps start with <Space>, and my insert-mode imaps start with <c-j> or <c-k>
"
" This does not include my bash emacs shortcuts (in insert and command modes)
" 
" When looking to create (or find) a command, search the help page (:help) to
" see what commands exist and what you might be overwriting. As long as you use
" noremap, the commands you are overwriting should still be available for you
" to remap.
noremap <Space> <Nop>

" general-purpose maps --------------------------------------------------------
noremap <CR> :
noremap <c-s> :w<CR>
noremap <Space><Space> :noh<CR>

" clipboard copy and paste. Note paste is before cursor if C-p, after if M-p.
noremap <c-p> "+P
noremap <m-p> "+p
noremap <c-y> "+y

" It bothers my that dd vs D and cc vs C are consistent but not yy vs Y.
" This fixes that.
noremap Y y$

" Make Space-w work like C-w
map <Space>w <c-w>

" Extension maps --------------------------------------------------------------

" fuzzyfinder: 
noremap <Space>b :FufBuffer<CR>
noremap <Space>f :FufFile<CR>
noremap <Space>d :FufDir<CR>

" fuzzyfinder with auto-splitting:
noremap <Space>hb :sp<CR>:FufBuffer<CR>
noremap <Space>vb :vs<CR>:FufBuffer<CR>
noremap <Space>hf :sp<CR>:FufFile<CR>
noremap <Space>vf :vs<CR>:FufFile<CR>

" ctags shortcuts for opening windows
noremap <Space>vta :vs<Cr>:ta
noremap <Space>vtj :vs<Cr>:tj
noremap <Space>hta :sp<Cr>:ta
noremap <Space>htj :sp<Cr>:tj


" Nerdtree
noremap <Space>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" General purpose insert mode maps --------------------------------------------

" Notes regarding builtin insert mode stuff:
" ------------------------------------------
" Del and BS work fine. The arrow keys work, but I am trying to avoid them.
" C-y inserts the character immediately above the cursor. This can be
" super-useful on occasion.

" Saving... C-s takes you out of insert mode *and* saves.
inoremap <c-s> <c-c>:w<CR>
" Exiting... ESC and C-c work fine, but kj is faster on most keybards
" Note: as a result, k looks funny when I first type it. Don't worry about it.
inoremap kj <Esc>
" Tab completion, most basic (think about changing this to omni completion)
inoremap <Tab> <c-n>
"Untabbing needs a map, because C-d is used by my emacs bindings
inoremap <m-t> <c-d>

" Custom imaps leading with C-j -----------------------------------------------
"
inoremap <c-j> <Nop>
" l, t, and o for line, tag, and omni completion. c to close previews.
inoremap <c-j>l <c-x><c-l>
inoremap <c-j>t <c-x><c-]>
inoremap <c-j>o <c-x><c-o>
inoremap <c-j>c <c-c>:pc<CR>a
inoremap <c-j><c-l> <c-x><c-l>
inoremap <c-j><c-t> <c-x><c-l>
inoremap <c-j><c-o> <c-c>:pc<CR>a

" Custom imaps for char insertion, leading with C-k ---------------------------

" Note: Why C-k? Two reasons:
" 1. It is free in normal and command modes, which means I can use it in the
"    same way to avoid bad keys if I need to. This could be most useful in the
"    cases of a, A, {, and z.
" 2. It is really easy to type. In particular, C-k j rivals a for speed.

inoremap <c-k> <Nop>
" d and k, D and K for [ and ], { and } respectively.
inoremap <c-k>f [
inoremap <c-k>d {
inoremap <c-k>j ]
inoremap <c-k>k }
inoremap <c-k><c-t> [
inoremap <c-k><c-d> {
inoremap <c-k><c-y> ]
inoremap <c-k><c-k> }
" e for equal
inoremap <c-k>e =
inoremap <c-k><c-e> =
" j for a, because it is super fast
inoremap <c-k>j a
inoremap <c-k><c-j> a
" i for 1
noremap <c-k>i 1
noremap <c-k><c-i> 1
" s for z (I wouldn't use this imap, but as a map it could be handy)
inoremap <c-k><c-s> z
inoremap <c-k>s z
inoremap <c-k>S Z

" Custom maps corresponding to the C-k imaps ----------------------------------

noremap <c-k> <Nop>
" d and k, D and K for [ and ], { and } respectively.
noremap <c-k>f [
noremap <c-k>d {
noremap <c-k>j ]
noremap <c-k>k }
noremap <c-k><c-t> [
noremap <c-k><c-d> {
noremap <c-k><c-y> ]
noremap <c-k><c-k> }
" e for equal
noremap <c-k>e =
noremap <c-k><c-e> =
" j for A... note that this doesn't quite match the imap
noremap <c-k>j A
noremap <c-k><c-j> A
" i for 1
noremap <c-k>i 1
noremap <c-k><c-i> 1
" s for z (I wouldn't use this imap, but as a map it could be handy)
noremap <c-k><c-s> z
noremap <c-k>s z
noremap <c-k>S Z

" Bash emacs shortcuts --------------------------------------------------------

" basic movement
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-n> <Down>
inoremap <c-p> <Up>

" slightly more advanced movement
" Notes:
"    For whatever reason, M-f does not seem to be working (in terminal or gui)
inoremap <m-b> <S-Left>
inoremap <m-f> <S-Right>
inoremap <c-a> <Esc>I
inoremap <c-e> <Esc>A

" deletion: note that I skip C-Rubout (<c-BS>) because <BS> works fine.
"   Notes:
"     M-d should work under most circumstances, but it could occasionally 
"         result in funny cursor placement.
"     I did not include C-k or C-u (delete line forward or backward) because
"         they seem inappropriate for insert mode, and C-k is reserved for
"         character mappings.
"     I skipped C-Rubout (<c-BS>) because <BS> works fine (both in emacs and
"         vim insert mode).
inoremap <m-BS> <c-w>
inoremap <c-d> <Del>
inoremap <m-d> <Esc>lcw

" undo within-line edits (not impt in vim, but impt in bash so I included it)
inoremap <c-x><c-u> <c-u>

" missing but important in the shell is C-y, which pastes the last deletion.

" Bash emacs shortcuts for command line mode ----------------------------------

" basic movement
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-n> <Down>
cnoremap <c-p> <Up>

" slightly more advanced movement
cnoremap <m-b> <S-Left>
cnoremap <m-f> <S-Right>
cnoremap <c-a> <c-b>
cnoremap <c-e> <c-e>

" deletion: note that I skip C-Rubout (<c-BS>) because <BS> works fine.
"   Notes:
"     M-d won't work (vim has no equiv command)
"         result in funny cursor placement.
"     C-u and C-k delete big chunks, but not necessarily everything
cnoremap <m-BS> <c-w>
cnoremap <c-d> <Del>
cnoremap <c-u> <c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w><c-w>
cnoremap <c-k> <Del><Del><Del><Del><Del><Del><Del><Del><Del><Del><Del><Del>

" ****************************
" Stuff that needs to be moved
" ****************************

" Breakpoint. This really belongs in a filetype source file.
noremap <Space>p Oimport pudb; pudb.set_trace()<c-s>
inoremap <c-j>p <CR>import pudb; pudb.set_trace()
