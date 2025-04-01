" Plugin: PurrVim
" Description: A playful cat companion that cheers you on while coding in Vim!
" Author: SergioBonatto
" Version: 1.2.0

if exists('g:loaded_purrvim')
    finish
endif
let g:loaded_purrvim = 1

" Configuration defaults
let g:purrvim_frequency = get(g:, 'purrvim_frequency', 15)
let g:purrvim_sleepy_time = get(g:, 'purrvim_sleepy_time', 30)
let g:purrvim_enable_at_startup = get(g:, 'purrvim_enable_at_startup', 1)
let g:purrvim_auto_show = get(g:, 'purrvim_auto_show', 1)
let g:purrvim_face_width = get(g:, 'purrvim_face_width', 20)  " Largura desejada para os rostos

" Collection of cute cat faces
let s:cat_faces = [
    \ "(=^・ω・^=)",
    \ "(=^･ｪ･^=)",
    \ "ฅ^•ﻌ•^ฅ",
    \ "(^･o･^)ﾉ",
    \ "(=^-ω-^=)",
    \ "ฅ(ﾐ⚈ ﻌ ⚈ﾐ)ฅ",
    \ "(=`ω´=)",
    \ "(=^･^=)",
    \ "₍⸍⸌̣ʷ̣̫⸍̣⸌₎",
    \ "/ᐠ - ˕ -マ Ⳋ",
    \ "/ᐠ ˵> ⩊ <˵マ",
    \ "≽^•⩊ •^≼",
    \ "ᓚ₍ ^. .^₎",
    \ "ᓚ₍⑅^..^₎♡",
    \ "ദ്ദി（• ˕ •マ.ᐟ",
    \ "₍^ >ヮ<^₎ .ᐟ.ᐟ",
    \ "/ᐠ. .ᐟ\ฅ",
    \ "₍^. .^₎⟆",
    \ "ฅ^>⩊ <^ ฅ",
    \ "ฅᨐ ฅ ",
    \ "≽^• ˕ • ྀི ≼   ",
    \ "ฅ≽(•⩊ •マ≼",
    \ "ฅ/ᐠ˶> ﻌ<˶ᐟ\ฅ",
    \ "˓˓ก₍⸍⸌̣ʷ̣̫⸍̣⸌₎ค˒˒",
    \ "≽^•༚ • ྀི≼",
    \ "/ᐠ > ˕ <マ ₊˚",
    \ "(ﾐ⚈ ﻌ ⚈ﾐ)"
    \]

" Sleepy cat faces
let s:sleepy_faces = [
    \ "(=｡•́‿•̀｡=)",
    \ "(=ｘェｘ=)",
    \ "(=^._.^=)zzz",
    \ "(ΦωΦ)..zzZ",
    \ "(=^-ω-^=) zzz",
    \ "zzz (=｡-ω-｡=) zzz",
    \ "ฅ(≈>ܫ<≈)ฅ zZ"
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

" Sleepy messages
let s:sleepy_messages = [
    \ "Waiting for more code...",
    \ "Don't forget about me~",
    \ "Ready when you are!",
    \ "Neko is getting sleepy...",
    \ "More coding please~?",
    \ "Nyan... so quiet...",
    \ "Neko wants to see more code~",
    \ "Is coding time over?",
    \ "Your keyboard misses you...",
    \ "Time for a nya-p?"
    \]

" Sparkles for sparkle mode
let s:sparkles = [
    \ "✧･ﾟ: *",
    \ "✩°｡⋆",
    \ "⊹˚.",
    \ "✧˖°",
    \ "⋆｡°✩",
    \ "⋆⭒˚｡⋆",
    \ "✿❀✿",
    \ "✧˖°♡°✧˖"
    \]

" Animation variables
let s:last_action_time = localtime()
let s:purrvim_enabled = 1
let s:normalized_cat_faces = []
let s:normalized_sleepy_faces = []

" Function to normalize faces for consistent display
function! s:NormalizeFaces()
    " Normalize cat faces
    let s:normalized_cat_faces = []
    for face in s:cat_faces
        let l:width = strdisplaywidth(face)
        let l:padding = repeat(' ', max([0, g:purrvim_face_width - l:width]))
        call add(s:normalized_cat_faces, face . l:padding)
    endfor

    " Normalize sleepy faces
    let s:normalized_sleepy_faces = []
    for face in s:sleepy_faces
        let l:width = strdisplaywidth(face)
        let l:padding = repeat(' ', max([0, g:purrvim_face_width - l:width]))
        call add(s:normalized_sleepy_faces, face . l:padding)
    endfor
endfunction

" Helper function to get a random item from a list
function! s:GetRandom(list)
    return a:list[rand() % len(a:list)]
endfunction

" Function to update and occasionally show the cat
function! s:UpdateCat()
    " Only run if the plugin is enabled
    if !s:purrvim_enabled || !g:purrvim_auto_show
        return
    endif

    let l:current_time = localtime()
    let l:time_diff = l:current_time - s:last_action_time
    let s:last_action_time = l:current_time

    " Appear more often when user is actively coding
    if l:time_diff < 5 && rand() % g:purrvim_frequency == 0
        call s:ShowCat()
    elseif l:time_diff > g:purrvim_sleepy_time && rand() % 30 == 0
        call s:ShowSleepyCat()
    endif
endfunction

" Function to display a random cat face with message
function! s:ShowCat()
    " Get random cat face, message, and symbol
    let l:cat_face = s:GetRandom(s:normalized_cat_faces)
    let l:message = s:GetRandom(s:messages)
    let l:symbol = s:GetRandom(s:kawaii_symbols)

    " Create a formatted message
    let l:display = l:cat_face . " " . l:message . " " . l:symbol

    " Display with default highlight
    echomsg l:display
endfunction

" Function to show a sleepy cat when idle
function! s:ShowSleepyCat()
    let l:face = s:GetRandom(s:normalized_sleepy_faces)
    let l:message = s:GetRandom(s:sleepy_messages)

    echomsg l:face . " " . l:message
endfunction

" Show random cat emoji with sparkles
function! s:ShowCatSparkles()
    let l:face = s:GetRandom(s:normalized_cat_faces)
    let l:sparkle = s:GetRandom(s:sparkles)

    echomsg l:sparkle . " " . l:face . " " . l:sparkle
endfunction

" Toggle the plugin on/off
function! s:TogglePurrVim()
    let s:purrvim_enabled = !s:purrvim_enabled
    if s:purrvim_enabled
        echo "ฅ^•ﻌ•^ฅ PurrVim is now active! Nya~!"
    else
        echo "(=^-ω-^=) PurrVim is taking a cat nap..."
    endif
endfunction

" Commands to manually trigger the cat
command! PurrVimCat call s:ShowCat()
command! PurrVimSparkle call s:ShowCatSparkles()
command! PurrVimToggle call s:TogglePurrVim()

" Initialize the normalized faces
call s:NormalizeFaces()

" Autocommands to track typing
augroup PurrVim
    autocmd!
    if g:purrvim_enable_at_startup
        autocmd TextChanged,TextChangedI * call s:UpdateCat()
        autocmd VimEnter * echomsg "ฅ^•ﻌ•^ฅ PurrVim is here to cheer you on! Nya~! ✧･ﾟ"
    endif
augroup END

" Suggested keybindings
nnoremap <silent> <Leader>c :PurrVimCat<CR>
nnoremap <silent> <Leader>cs :PurrVimSparkle<CR>
nnoremap <silent> <Leader>ct :PurrVimToggle<CR>
