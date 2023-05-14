function! vim-wrap-line#_text_wrap_test_cases_comment()

Test cases:

1)

Ah, now thou turn'st away thy face for shame! And, notwithstanding all this loss of blood, As from a conduit with three issuing spouts,

==>

Ah, now thou turn'st away thy face for shame! And, notwithstanding all this 
loss of blood, As from a conduit with three issuing spouts,


2)

Yet do thy cheeks look red as Titan's face Blushing to be encountered with a cloud. Shall I speak for thee? shall I say 'tis so?

==>

Yet do thy cheeks look red as Titan's face Blushing to be encountered with a 
cloud. Shall I speak for thee? shall I say 'tis so?


3)

O, that I knew thy heart; and knew the beast, That I might rail at him, to ease my mind!

==>

O, that I knew thy heart; and knew the beast, That I might rail at him, to ease 
my mind!


4)

Sorrow concealed, like an oven stopp'd, Doth burn the heart to cinders where it is.

==>

Sorrow concealed, like an oven stopp'd, Doth burn the heart to cinders where it 
is.


5)

  Or, had he heard the heavenly harmony Which that sweet tongue hath made, He would have dropp'd his knife, and fell asleep As Cerberus at the Thracian poet's feet.

==>

  Or, had he heard the heavenly harmony Which that sweet tongue hath made, He 
  would have dropp'd his knife, and fell asleep As Cerberus at the Thracian poet's feet.


6)

  Or, had he heard the heavenly harmony Which that sweet tongue hath made, He would have dropp'd his knife, and fell asleep As Cerberus at the Thracian poet's feet.
  There's another line right here.

==>

  Or, had he heard the heavenly harmony Which that sweet tongue hath made, He 
  would have dropp'd his knife, and fell asleep As Cerberus at the Thracian poet's feet.
  There's another line right here.


7)

This is a short line.

==>

This is a short line.

endfunction


" TODO:
" - (done) Repeat the indentation
" - (done) Noop if the current line is less than 80 chars
" - Remove trailing whitespace if there is a clean break
" - Add support for repetition with '.' (repeat.vim?)
function! vim-wrap-line#WrapLine()
  let l:current_line = getline('.')
  if (strwidth(l:current_line) <= 80)
    return
  endif
  call cursor(0, 80)
  let l:current_char = l:current_line[col('.') - 1]
  let l:num_indent = indent('.')
  if (l:current_char =~ '\s')
    " Remove the space so that it's not preserved at the beginning of the
    " wrapped line.
    :normal! l
    :normal! x
  else
    " It's not a space, so back up to the start of the word before wrapping.
    :normal! b
  endif
  let l:pos = col('.') - 1
  let l:lines = [l:current_line[:l:pos - 1], repeat(" ", l:num_indent) . l:current_line[l:pos:]]
  "call setline('.', l:lines)
  call setline('.', l:lines[0])
  call append('.', l:lines[1])
endfunction


