" C++ specific settings

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
setlocal textwidth=80
setlocal wrap

setlocal cindent
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

if filereadable("./Makefile")
  setlocal makeprg=make
else
  setlocal makeprg=clang++\ -std=c++11\ -stdlib=libc++\ -o\ %<\ %
endif
