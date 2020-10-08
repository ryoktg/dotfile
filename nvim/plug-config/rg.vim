if executable('rg')
  let g:rg_derive_root='true'
endif
nnoremap <Leader>ps :Rg<space>
nnoremap <Leader>pw :Rg <C-r>=expand("<cword>")<CR><CR>
