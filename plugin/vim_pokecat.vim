" Plugin: VimKawaiiCat
" Description: A super kawaii cat face that cheers you on while coding!
" Author: Claude

if exists('g:loaded_vim_kawaii_cat')
    finish
endif
let g:loaded_vim_kawaii_cat = 1

" Super kawaii cat face collection
let s:cat_faces = [
    \ "(=^・ω・^=)",
    \ "(=^･ｪ･^=)",
    \ "(=✪ ᆺ ✪=)",
    \ "ฅ^•ﻌ•^ฅ",
    \ "(^･o･^)ﾉ",
    \ "(=^-ω-^=)",
    \ "ฅ(ﾐ⚈ ﻌ ⚈ﾐ)ฅ",
    \ "(=`ω´=)",
    \ "(=^･^=)",
    \ "₍⸍⸌̣ʷ̣̫⸍̣⸌₎",
    \ "ଘ(੭ु*ˊᵕˋ)੭ु*.ﾟ",
    \ "(ﾐ⚈ ﻌ ⚈ﾐ)"
    \]

" Kawaii motivational messages (English + Japanese)
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
    \ "ふわふわ coding style~!"
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

" Function to display a random kawaii cat face with message
function! s:ShowCat()
    " Get random cat face, message and symbol
    let l:cat_face = s:cat_faces[rand() % len(s:cat_faces)]
    let l:message = s:messages[rand() % len(s:messages)]
    let l:symbol = s:kawaii_symbols[rand() % len(s:kawaii_symbols)]
    
    " Create a cute formatted message
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

" Command to manually show the cat
command! KawaiiCat call s:ShowCat()
command! KawaiiSparkle call s:ShowCatSparkles()

" Autocommands to track typing
augroup VimKawaiiCat
    autocmd!
    autocmd TextChanged,TextChangedI * call s:UpdateCat()
    autocmd VimEnter * echomsg "ฅ^•ﻌ•^ฅ Kawaii neko is here to cheer you on! Nya~! ✧･ﾟ"
augroup END

" Suggested keybindings
nnoremap <silent> <Leader>c :KawaiiCat<CR>
nnoremap <silent> <Leader>cs :KawaiiSparkle<CR>
