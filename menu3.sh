 #/bin/bash


		E='echo -e';e='echo -en';trap "R;exit" 2
		ESC=$( $e "\e")
		TPUT(){ $e "\e[${1};${2}H";}
		CLEAR(){ $e "\ec";}
		CIVIS(){ $e "\e[?25l";}
		DRAW(){ $e "\e%@\e(0";}
		WRITE(){ $e "\e(B";}
		MARK(){ $e "\e[7m";}
		UNMARK(){ $e "\e[27m";}
		R(){ CLEAR ;stty sane;$e "\ec\e[30;46m\e[J";};
		HEAD(){ DRAW
			for each in $(seq 1 25);do
			$E " x                      x"
			done
			WRITE;MARK;TPUT 1 5
			$E "  Usefull Software  ";UNMARK;}
			i=0; CLEAR; CIVIS;NULL=/dev/null
			FOOT(){ MARK;TPUT 15 5
			printf " Privacy Matters   ";UNMARK;}
			ARROW(){ read -s -n3 key 2>/dev/null >&2
			if [[ $key = $ESC[A ]];then echo up;fi
			if [[ $key = $ESC[B ]];then echo dn;fi;}

		M0(){ TPUT 3 10; $e "Bash";}
	    M1(){ TPUT 4 10; $e "Aliases";}
	    M2(){ TPUT 5 10; $e "Vim";}
	    M3(){ TPUT 6 10; $e "Taskwarrior";}
	    M4(){ TPUT 7 10; $e "Neovim";}
	    M5(){ TPUT 8 10; $e "FeatherPad";}
		M6(){ TPUT 9 10; $e "Tmux";}
		M7(){ TPUT 10 10; $e "Xterm";}
		M8(){ TPUT 11 10; $e "Xboard";}
		M9(){ TPUT 12 10; $e "Megatools";}
		M10(){ TPUT 13 10; $e "VimCalendar";}
		M11(){ TPUT 14 10; $e "Vim Tamplates";}
		M12(){ TPUT 15 10; $e "Neovim Tamplates";}
		M13(){ TPUT 16 10; $e "xxxx";}
		M14(){ TPUT 17 10; $e "xxxx";}
		M15(){ TPUT 18 10; $e "xxxx";}
		M16(){ TPUT 19 10; $e "xxxx";}
		M17(){ TPUT 20 10; $e "xxxx";}
		M18(){ TPUT 21 10; $e "xxxx";}
		M19(){ TPUT 22 10; $e "xxxx";}
		M20(){ TPUT 23 10; $e "EXIT";}
		    LM=20
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
   POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
	REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
	INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
     ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
	while [[ "$O" != " " ]]; do case $i in



0) S=M0;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
2) S=M2;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
3) S=M3;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
4) S=M4;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
5) S=M5;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
6) S=M6;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
7) S=M7;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
8) S=M8;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
9) S=M9;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
10) S=M10;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
11) S=M11;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
12) S=M12;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
13) S=M13;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
14) S=M14;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
15) S=M15;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
16) S=M16;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
17) S=M17;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
18) S=M18;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
19) S=M19;SC;if [[ $cur == "" ]];then R;$e "\n$()\n";ES;fi;;
20) S=M20;SC;if [[ $cur == "" ]];then R;exit 0;fi;;

	esac;
	POS;
done









