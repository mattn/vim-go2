function! s:run() abort
  let l:res = webapi#http#post('https://go2goplay.golang.org/compile', {
  \  'version': 2,
  \  'body': join(getline(1, '$'), "\n"),
  \})
  let o = json_decode(l:res.content)
  if o.Errors != ''
    echohl Error
    echo o.Errors
    echohl NONE
    return
  endif
  for e in o.Events
    echo e.Message
  endfor
endfunction

command! -buffer Run call s:run()
