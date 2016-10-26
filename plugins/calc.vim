
function! s:CalculateCell(cell)
    if a:cell !~ '^\s*='
        return a:cell
    endif
    
    let l:data = substitute(a:cell, "'", '', "g")
    let l:data = substitute(l:data, '^\s*=', "", "")
    let l:stdout = system('dfbc scale=2\; ''' . l:data . "'")
    let l:stdout = substitute(l:stdout, '^\.', "0.", "")
    let l:stdout = substitute(l:stdout, "\n", "", "")
    let l:ret = v:shell_error
    if l:ret != 0
        let l:stdout = "err:" . l:ret
    endif
    return l:stdout
endfunction

function! s:CalculateLine(line)
    "execute "read ! echo '" . a:line . "' | bc"
    let l:cells = split(a:line, "|")
    let l:retcells = ""
    for cell in cells
        let l:ret = s:CalculateCell(cell)
        let l:ret = substitute(l:ret, '^\s', '', '')
        let l:ret = substitute(l:ret, '\s$', '', '')
        let l:retcells = l:retcells . "| " . l:ret . " "
    endfor
    if l:retcells != ""
        let l:retcells = l:retcells . "|"
    endif
    return l:retcells
endfunction

function! s:CalculateTable(fretrow)
    let l:cur = line('.')
    let l:efileline = line('$')
    let l:frow = l:cur
    let l:erow = l:cur
    let l:collen = len(split(getline(l:cur), "|"))
    let l:reg = "^"
    let l:i = 0
    while i < collen
        let l:reg = l:reg . '|.*'
        let l:i += 1
    endwhile
    let l:reg = l:reg . '|'

    while l:frow - 1 >= 1 && getline(l:frow - 1) =~ l:reg
        let l:frow -= 1
    endwhile

    while l:erow + 1 <= l:efileline && getline(l:erow + 1) =~ l:reg
        let l:erow += 1
    endwhile
    
    let l:nrow = l:frow
    let l:retrows = range(l:erow - l:frow + 1)
    
    " debug
    " echo "l:nrow = " . l:nrow . ",  l:erow = " . l:erow
    while l:nrow <= l:erow
        let l:retrows[l:nrow - l:frow] = s:CalculateLine(getline(l:nrow))
        let l:nrow += 1
    endwhile
    
    call append(a:fretrow+l:erow, l:retrows)
endfunction

command! -nargs=0 Calculate call s:CalculateTable(1)

