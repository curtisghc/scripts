#!/bin/bash
# Draw header

clear
columns=$(tput cols)
count=15
echo -e -n "\e[1;44m   System Info"
while [ "$count" -le "$columns" ]
do
	echo -e -n " "
	(( count++ ))
done


# Start info section
echo -e "\033[0m"


fun1(){
echo "   $(whoami)@$(hostname)"
}
fun2(){
echo "   \e[1;30mCPU:\033[0m $( cat /proc/cpuinfo | awk -F: '/name/ {print $2}' |\
 head -n 1 | sed -e 's/  */\ /g')" 
}
fun3() {
	echo -e "   \e[1;31mMEM:\033[0m  $(free -m | awk '/cache:/ {print $3}')/$(free -m | awk '/Mem:/ {print $2}')MB"
}
fun4(){
	echo -e "   \e[1;32mGTK2:\033[0m $(awk -F= '/gtk-theme-name/ {print $2}' ~/.gtkrc-2.0 | tr -d \")"
}
fun5(){
	echo -e "   \e[1;33mGTK3:\033[0m $(awk -F= '/gtk-theme-name/ {print $2}' ~/.config/gtk-3.0/settings.ini)"
}
fun6(){
	echo -e "   \e[1;34mICON:\033[0m $(awk -F= '/gtk-icon-theme/	{print $2}' ~/.gtkrc-2.0 | tr -d \")"
}
fun7(){
	DISK="$(df -h --total 2> /dev/null | tail -1)"
	DISKS="$(echo $DISK | awk '{print $2}')"
	DISKF="$(echo $DISK | awk '{print $4}')"
	echo -e "   \e[1;35mDISK:\033[0m $DISKF/$DISKS Available"
}
fun8(){
	echo -e "   \e[1;36mUPTM:\033[0m 4:20"
}
fun9(){
	echo "   \e[1;37mPKGS:\033[0m 420"
}
fun10(){
echo -n -e "  $(export | grep "x TERM=" | sed s/"declare -x"/""/g | sed s/'"'/""/g | sed s/'='/": "/g)"
}
funMU(){
	echo -e " \e[1;33m♫\033[0m $(mpc current)"
}
funWM(){
	echo -e -n "   \e[1;33mWM:\033[0m" && cat ~/.xinitrc | grep exec | sed s/"#exec"/""/g   
}
echo -e "
$(fun1)
$(fun2)
$(fun3)
$(fun4)
$(fun5)
$(fun6)
$(fun7)
$(funWM)
$(funMU)
"
