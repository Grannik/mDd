#!/bin/bash
 source "sDd.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;37m";}
#
 HEAD()
{
 for (( a=2; a<=20; a++ ))
  do
   TPUT $a 1
        $E "\e[2m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
              TPUT  1 1;$E "\033[0m\033[2m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
              TPUT  2 3;$E "\033[36mКаждый символ FLAG может быть:\033[0m";
              TPUT  3 1;$E "\e[2m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 18 1;$E "\e[2m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 19 3;$E "\e[2mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\e[0m";
}
 FOOT(){ MARK;TPUT 21 1;$E "\033[0m\033[2m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  4 3; $e "Режим добавления                                                     \e[32m append \e[0m";}
  M1(){ TPUT  5 3; $e "Использовать прямой ввод-вывод для данных                            \e[32m direct \e[0m";}
  M2(){ TPUT  6 3; $e "Сбой, если каталог                                                \e[32m directory \e[0m";}
  M3(){ TPUT  7 3; $e "Использовать синхронизированный ввод-вывод для данных                 \e[32m dsync \e[0m";}
  M4(){ TPUT  8 3; $e "Аналогично, но и для метаданных                                        \e[32m sync \e[0m";}
  M5(){ TPUT  9 3; $e "Накапливать полные блоки ввода (только iflag)                     \e[32m fullblock \e[0m";}
  M6(){ TPUT 10 3; $e "Использовать неблокирующий ввод-вывод                              \e[32m nonblock \e[0m";}
  M7(){ TPUT 11 3; $e "Не обновлять время доступа                                          \e[32m noatime \e[0m";}
  M8(){ TPUT 12 3; $e "Запрос на удаление кеша. См. также oflagu003dsync                   \e[32m nocache \e[0m";}
  M9(){ TPUT 13 3; $e "Не назначать управляющий терминал из файла                           \e[32m noctty \e[0m";}
 M10(){ TPUT 14 3; $e "Не переходить по симлинкам                                         \e[32m nofollow \e[0m";}
 M11(){ TPUT 15 3; $e "Обрабатывать 'countu003dN' как количество байтов (только iflag) \e[32m count_bytes \e[0m";}
 M12(){ TPUT 16 3; $e "Обрабатывать 'skipu003dN' как количество байтов (только iflag)   \e[32m skip_bytes \e[0m";}
 M13(){ TPUT 17 3; $e "Обрабатывать 'seeku003dN' как количество байтов ( для флага )    \e[32m seek_bytes \e[0m";}
#
 M14(){ TPUT 20 3; $e "Exit                                                                         ";}
LM=14
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 режим добавления (имеет смысл только для вывода; рекомендуется convu003dnotrunc)";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
#
 14) S=M14;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
