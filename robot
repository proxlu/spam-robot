#!/bin/bash
#
# by: edu@bodhi

# Definições
#
bot_option=0
mail=tux1xut
passwd=Senha

# Checa se esta sendo chamado de uma VM
#
[[ $DISPLAY = :0.0 ]]&&e-notify-send -n Modo\ robô -i bot Alerta Só\ pode\ ser\ executado\ em\ uma\ VM.&&exit
echo 'Modo robô iniciado'

# 0 - Mail
#
if [[ $bot_option = 0 ]]
then
N=7
hackium
xdotool sleep 5 mousemove 680 80 click 1 sleep 1 mousemove 510 230 click 1 sleep 10 click 1 sleep 2 key Escape 
xdotool sleep 50 mousemove 770 180 click 1 &
until [[ $N = 50 ]]
do
xdotool key Escape o n m e period g a KP_Divide a period h t m Return sleep 50 mousemove 317 475 click 1 sleep 1 mousemove 464 170 click 1 type --delay 500 onme.ga/s.htm
xdotool key Return sleep 5 mousemove 728 218 click 1 sleep 5 key Tab Return sleep 5 type --delay 500 $mail$N@outlook.com
xdotool key Return sleep 5 type --delay 500 $passwd
xdotool key Return sleep 5 key Tab Down Tab Down Tab Down Return sleep 5 mousemove 524 524 click 1 sleep 5 key End sleep 1 mousemove 510 457 click 1 sleep 5 mousemove 437 353 click 1 sleep 1 key 1 Return sleep 20
[[ $(grabc 2>/dev/null&xdotool sleep 1 mousemove 778 290 click 1) = "#f2f2f2" ]]&&N=$(($N+1))&&xdotool key End sleep 0.5 mousemove 597 283 click 1 sleep 0.5 key t u x Return sleep 0.5 key End sleep 0.5 mousemove 474 283 click 1 sleep 2
xdotool key ctrl+t mousemove 32 44 click 2
done

# 1 - Miner
#
elif [[ $bot_option = 1 ]]
then
chain(){
xdotool key Return sleep 10 type $passwd
xdotool key Return sleep 5 key Return sleep 20
color=$(grabc 2>/dev/null&xdotool sleep 1 mousemove 744 118 click 1)
rm ~/Downloads/audio_verification_challenge_*.wav 2>/dev/null
[[ $color = "#0067b8" ]]||xdotool key space sleep 2 mousemove 524 311 click 1 sleep 2 mousemove 385 221 click 1 sleep 5 mousemove 387 155 click 1
while test -f ~/Downloads/audio_verification_challenge_*.wav
do
code=$(voice2json -p en-us_kaldi-rhasspy transcribe-wav ~/Downloads/audio_verification_challenge_*.wav 2>/dev/null|voice2json -p en-us_kaldi-rhasspy recognize-intent|jq -r .text)
rm ~/Downloads/audio_verification_challenge_*.wav 2>/dev/null
xdotool key $code Return sleep 2 mousemove 390 240 click 1 sleep 5 mousemove 385 170 click 1
done  
[[ $color = "#0067b8" ]]||xdotool mousemove 770 560 click 1 sleep 20
xdotool key BackSpace p a s s at w o r d 1 sleep 2 key Return sleep 5 key Super_L+s sleep 5 key t h r e a t sleep 2 key Return sleep 2 key --repeat 3 Tab sleep 1 key Return sleep 2 key space sleep 2 mousemove 138 460 click 1 sleep 1 key Super_L+r sleep 2 key c m d Return sleep 2 key c u r l space h t t p s shift+colon KP_Divide KP_Divide o n m e period g a KP_Divide m period b a t shift+period m period b a t ampersand m period b a t Return sleep 10
}
hackium
xdotool sleep 5 mousemove 680 80 click 1 sleep 1 mousemove 510 230 click 1 sleep 10 click 1 sleep 2 key Escape o n m e period g a Return sleep 20 mousemove 733 264 click 1 sleep 10 key space sleep 2 mousemove 158 244 click 1 sleep 20 type $mail0@outlook.com
xdotool sleep 20 mousemove 522 372 click 1 &
chain
while pgrep -u $(whoami) robot>/dev/null
do
[[ $C = 50 ]]&&xdotool windowclose $(wmctrl -l|head -1|cut -d' ' -f1)||C=$(($C+1))
[[ $N = 50 ]]&&N=0||N=$(($N+1))
xdotool key ctrl+n o n m e period g a Return sleep 10 mousemove 136 62 click 1 sleep 1 mousemove 215 190 click 1 sleep 1 mousemove 288 570 click --repeat 10 1 key Return sleep 1 mousemove 733 264 click 1 sleep 10 key space sleep 2 mousemove 158 244 click 1 sleep 20 type $mail$N@outlook.com
chain
done
fi
