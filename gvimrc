" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                              GUI stuff                                    |
" -----------------------------------------------------------------------------  


" OS Specific *****************************************************************
if has("gui_macvim")

  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  set guifont=Consolas:h14
  set guioptions-=T  " remove toolbar
  set stal=2 " turn on tabs by default

elseif has("gui_gtk2")

  set guifont=Consolas-Bold:h16
  set guioptions-=T  " remove toolbar

elseif has("x11")
elseif has("gui_win32")
end


set guioptions-=e
set guioptions-=g

set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions-=l
set guioptions-=m
set guioptions-=R
set guioptions-=b


set noautochdir

" General *********************************************************************
set anti
colorscheme creativeKoder 
set transparency=20

" Default size of window
set columns=333
set lines=90

" Tab headings 
set gtl=%t gtt=%F
