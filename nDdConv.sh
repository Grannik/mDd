#!/bin/bash
 source "sDd.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;37m";}
#
 HEAD()
{
 for (( a=2; a<=22; a++ ))
  do
   TPUT $a 1
        $E "\e[2m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
              TPUT  1 1;$E "\033[0m\033[2m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
              TPUT  2 3;$E "\033[36mКаждый символ CONV может быть:\033[0m";
              TPUT  3 1;$E "\e[2m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 20 1;$E "\e[2m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 21 2;$E "\033[2m Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\e[0m";
}
 FOOT(){ MARK;TPUT 23 1;$E "\033[0m\033[2m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  4 3; $e "Из   EBCDIC в  ASCII                                                  \e[32m ascii \e[0m";}
  M1(){ TPUT  5 3; $e "From ASCII  to           EBCDIC                                      \e[32m ebcdic \e[0m";}
  M2(){ TPUT  6 3; $e "From ASCII  to alternate EBCDIC                                         \e[32m ibm \e[0m";}
  M3(){ TPUT  7 3; $e "Дополнять записи, оканчивающиеся новой строкой, пробелами до cbs      \e[32m block \e[0m";}
  M4(){ TPUT  8 3; $e "Заменить конечные пробелы в записях размера cbs на новую строку     \e[32m unblock \e[0m";}
  M5(){ TPUT  9 3; $e "Изменить верхний регистр на нижний регистр                            \e[32m lcase \e[0m";}
  M6(){ TPUT 10 3; $e "Изменить нижний регистр на верхний регистр                            \e[32m ucase \e[0m";}
  M7(){ TPUT 11 3; $e "Попробуйте искать, а не записывать выходные блоки all-NU             \e[32m sparse \e[0m";}
  M8(){ TPUT 12 3; $e "Поменять местами каждую пару входных байтов                            \e[32m swab \e[0m";}
  M9(){ TPUT 13 3; $e "Дополнить каждый входной блок значениями NUL до размера ibs            \e[32m sync \e[0m";}
 M10(){ TPUT 14 3; $e "Ошибка, если выходной файл уже существует                              \e[32m excl \e[0m";}
 M11(){ TPUT 15 3; $e "Не создавать выходной файл                                          \e[32m nocreat \e[0m";}
 M12(){ TPUT 16 3; $e "Не обрезать выходной файл                                           \e[32m notrunc \e[0m";}
 M13(){ TPUT 17 3; $e "Продолжить после ошибок чтения                                      \e[32m noerror \e[0m";}
 M14(){ TPUT 18 3; $e "Физически записать данные выходного файла перед завершением       \e[32m fdatasync \e[0m";}
 M15(){ TPUT 19 3; $e "Аналогично, но также писать метаданные                                \e[32m fsync \e[0m";}
#
 M16(){ TPUT 22 3; $e "Exit                                                                         ";}
LM=16
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
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e " ";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e " дополнять записи, оканчивающиеся новой строкой, пробелами до размера cbs";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 дополнить каждый входной блок значениями NUL до размера ibs;
 при использовании с блокировкой или разблокировкой дополнять пробелами, а не NUL:
\e[32m dd if=/dev/disk2 of=/dev/disk3 bs=4096 conv=noerror,sync\e[0m
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 скопировать диск на другой:
\e[32m dd if=/dev/disk2 of=/dev/disk3 bs=4096 conv=noerror,sync\e[0m
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
#
 16) S=M16;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
