" Plugin: PurrVim
" Description: A playful cat companion that cheers you on while coding in Vim!
" Author: SergioBonatto

if exists('g:loaded_purrvim')
    finish
endif
let g:loaded_purrvim = 1

" Collection of cute cat faces
let s:cat_faces = [
    \ "(=^・ω・^=)  ",
    \ "(=^･ｪ･^=)  ",
    \ "(=✪ ᆺ ✪=)  ",
    \ "ฅ^•ﻌ•^ฅ  ",
    \ "(^･o･^)ﾉ  ",
    \ "(=^-ω-^=)  ",
    \ "ฅ(ﾐ⚈ ﻌ ⚈ﾐ)ฅ  ",
    \ "(=`ω´=)  ",
    \ "(=^･^=)  ",
    \ "₍⸍⸌̣ʷ̣̫⸍̣⸌₎  ",
    \ "/ᐠ - ˕ -マ Ⳋ  ",
    \ "/ᐠ ˵> ⩊ <˵マ  ",
    \ "≽^•⩊•^≼  ",
    \ "ᓚ₍ ^. .^₎  ",
    \ "ᓚ₍⑅^..^₎♡  ",
    \ "ദ്ദി（• ˕ •マ.ᐟ  ",
    \ "₍^ >ヮ<^₎ .ᐟ.ᐟ  ",
    \ "/ᐠ. .ᐟ\ฅ  ",
    \ "₍^. .^₎⟆  ",
    \ "ฅ^>⩊<^ ฅ  ",
    \ "ฅᨐฅ  ",
    \ "≽^• ˕ • ྀི≼  ",
    \ "ฅ≽(•⩊ •マ≼  ",
    \ "ฅ/ᐠ˶> ﻌ<˶ᐟ\ฅ  ",
    \ "˓˓ก₍⸍⸌̣ʷ̣̫⸍̣⸌₎ค˒˒  ",
    \ "≽^•༚• ྀི≼  ",
    \ "ଘ(੭ु*ˊᵕˋ)੭ु*.ﾟ  ",
    \ "/ᐠ > ˕ <マ ₊˚  ",
    \ "(ﾐ⚈ ﻌ ⚈ﾐ)  "
    \]

" Motivational messages (English + Japanese)
let s:messages = [
    \ "You're coding purrfectly~! ♡",
    \ "Sugoi! Amazing work!",
    \ "Ganbare! Keep going!",
    \ "Coding like a neko ninja!",
    \ "Kawaii code desu~!",
    \ "You're sugoi amazing!",
    \ "にゃんにゃん~ (Nyan nyan~)",
    \ "Kitto daijoubu! You got this!",
    \ "Pawsitively fantastic!",
    \ "どきどき! So exciting!",
    \ "Nya~! Great progress!",
    \ "Kawaii coder detected!",
    \ "Ganbatte kudasai!",
    \ "Purrfect typing rhythm~",
    \ "Coding like a pro-nyan!",
    \ "Meowvelous work!",
    \ "ワクワク! So exciting!",
    \ "Neko approves your code!",
    \ "Keep up the good work-nya~!",
    \ "ふわふわ coding style~!",
    \ "ORA ORA ORA! Your coding is unstoppable!",
    \ "MUDA MUDA MUDA! Don't write useless code!",
    \ "ZA WARUDO! Stop time and fix that bug!",
    \ "Yare Yare Daze... Don't get lazy now!",
    \ "It's not just a code... it's a Stand ability!"
    \]

" Cute emojis and symbols
let s:kawaii_symbols = [
    \ "♡",
    \ "★",
    \ "☆",
    \ "❀",
    \ "✧",
    \ "✿",
    \ "♪",
    \ "✩",
    \ "~",
    \ "ᵔᴥᵔ",
    \ "✧˖°",
    \ "˗ˏˋ✿ˎˊ˗"
    \]

" Animation variables
let s:last_action_time = localtime()

" Function to update and occasionally show the cat
function! s:UpdateCat()
    let l:current_time = localtime()
    let l:time_diff = l:current_time - s:last_action_time
    let s:last_action_time = l:current_time

    " Appear more often when user is actively coding
    if l:time_diff < 5 && rand() % 15 == 0
        call s:ShowCat()
    elseif l:time_diff > 30 && rand() % 30 == 0
        call s:ShowSleepyCat()
    endif
endfunction

" Function to display a random cat face with message
function! s:ShowCat()
    " Get random cat face, message, and symbol
    let l:cat_face = s:cat_faces[rand() % len(s:cat_faces)]
    let l:message = s:messages[rand() % len(s:messages)]
    let l:symbol = s:kawaii_symbols[rand() % len(s:kawaii_symbols)]

    " Create a formatted message
    let l:display = l:cat_face . " " . l:message . " " . l:symbol

    " Display with highlight
    echohl MoreMsg
    echomsg l:display
    echohl None
endfunction

" Function to show a sleepy cat when idle
function! s:ShowSleepyCat()
    let l:sleepy_faces = ["(=｡•́‿•̀｡=)", "(=ｘェｘ=)", "(=^._.^=)zzz"]
    let l:sleepy_messages = [
        \ "Waiting for more code...",
        \ "Don't forget about me~",
        \ "Ready when you are!",
        \ "Neko is getting sleepy...",
        \ "More coding please~?"
        \]

    let l:face = l:sleepy_faces[rand() % len(l:sleepy_faces)]
    let l:message = l:sleepy_messages[rand() % len(l:sleepy_messages)]

    echohl Comment
    echomsg l:face . " " . l:message
    echohl None
endfunction

" Show random cat emoji with sparkles
function! s:ShowCatSparkles()
    let l:sparkles = ["✧･ﾟ: *", "✩°｡⋆", "⊹˚.", "✧˖°", "⋆｡°✩"]
    let l:face = s:cat_faces[rand() % len(s:cat_faces)]
    let l:sparkle = l:sparkles[rand() % len(l:sparkles)]

    echohl WarningMsg
    echomsg l:sparkle . " " . l:face . " " . l:sparkle
    echohl None
endfunction

" Commands to manually trigger the cat
command! PurrVimCat call s:ShowCat()
command! PurrVimSparkle call s:ShowCatSparkles()

" Autocommands to track typing
augroup PurrVim
    autocmd!
    autocmd TextChanged,TextChangedI * call s:UpdateCat()
    autocmd VimEnter * echomsg "ฅ^•ﻌ•^ฅ PurrVim is here to cheer you on! Nya~! ✧･ﾟ"
augroup END

" Suggested keybindings
nnoremap <silent> <Leader>c :PurrVimCat<CR>
nnoremap <silent> <Leader>cs :PurrVimSparkle<CR>
