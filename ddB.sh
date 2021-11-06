#!/bin/bash
 E='echo -e';e='echo -en';trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
# 25 возможно это 
 CIVIS(){ $e "\e[?25l";}
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;34m";}
# 0 это цвет заднего фона списка
 UNMARK(){ $e "\e[0m";}
# ~~~~~~~~ Эти строки задают цвет фона ~~~~~~~~
 R(){ CLEAR ;stty sane;CLEAR;};
#R(){ CLEAR ;stty sane;$e "\ec\e[37;44m\e[J";};
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 HEAD(){ for (( a=4; a<=29; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                  \xE2\x94\x82\033[0m";
  done
 TPUT 2 1
 $E "\033[34m\xE2\x94\x82   \033[1;36mСправочник dd - конвертировать и копировать файл                               \033[34m\xE2\x94\x82\033[0m";
 TPUT 3 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";
 TPUT 10 3
 $E "\033[36mКаждый символ ФЛАГА может быть:\033[0m";
 TPUT 25 3
 $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 TPUT 27 3
 $E "\033[32mОтправка сигнала USR1 в запущенный процесс 'dd'\033[0m";
 TPUT 28 3
 $E "\033[32mзаставляет его распечатать статистику ввода-вывода до стандартной ошибки,\033[0m";
 TPUT 29 3
 $E "\033[32mа затем возобновить копирование.\033[0m";
 MARK;TPUT 1 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 30 1
 $E "\033[0m\033[34m+~~~| Grannik | 2021.11.03 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
# это управляет кнопками ввер/хвниз
 i=0; CLEAR; CIVIS;NULL=/dev/null
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then 
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
 M0(){ TPUT  4 3; $e "сбой, если выходной файл уже существует                            \033[32m excl       \033[0m";}
 M1(){ TPUT  5 3; $e "не создавать выходной файл                                         \033[32m nocreat    \033[0m";}
 M2(){ TPUT  6 3; $e "не обрезать выходной файл                                          \033[32m notrunc    \033[0m";}
 M3(){ TPUT  7 3; $e "продолжить после ошибок чтения                                     \033[32m noerror    \033[0m";}
 M4(){ TPUT  8 3; $e "физически записать данные выходного файла перед завершением        \033[32m fdatasync  \033[0m";}
 M5(){ TPUT  9 3; $e "аналогично, но также записывать метаданные                         \033[32m fsync      \033[0m";}
#
 M6(){ TPUT 11 3; $e "режим добавления                                                   \033[32m append     \033[0m";}
 M7(){ TPUT 12 3; $e "использовать прямой ввод/вывод для данных                          \033[32m direct     \033[0m";}
 M8(){ TPUT 13 3; $e "сбой, если только каталог                                          \033[32m directory  \033[0m";}
 M9(){ TPUT 14 3; $e "использовать синхронизированный ввод/вывод для данных              \033[32m dsync      \033[0m";}
M10(){ TPUT 15 3; $e "аналогично, но и для метаданных                                    \033[32m sync       \033[0m";}
M11(){ TPUT 16 3; $e "накапливать полные блоки ввода (только iflag)                      \033[32m fullblock  \033[0m";}
M12(){ TPUT 17 3; $e "использовать неблокирующий ввод/вывод                              \033[32m nonblock   \033[0m";}
M13(){ TPUT 18 3; $e "не обновлять время доступа                                         \033[32m noatime    \033[0m";}
M14(){ TPUT 19 3; $e "Запрос на сброс кеша. См. Также oflag = sync                       \033[32m nocache    \033[0m";}
M15(){ TPUT 20 3; $e "не назначать управляющий терминал из файла                         \033[32m noctty     \033[0m";}
M16(){ TPUT 21 3; $e "не следуйте символическим ссылкам                                  \033[32m nofollow   \033[0m";}
M17(){ TPUT 22 3; $e "обрабатывать count = N как количество байтов (только iflag)        \033[32m count_bytes\033[0m";}
M18(){ TPUT 23 3; $e "обрабатывать skip = N как счетчик байтов (только iflag)            \033[32m skip_bytes \033[0m";}
M19(){ TPUT 24 3; $e "рассматривать seek = N как счетчик байтов (только для запаздывания)\033[32m seek_bytes \033[0m";}
#
M20(){ TPUT 26 3; $e "EXIT                                                                           ";}
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
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC;if [[ $cur == enter ]];then R;echo " сбой, если выходной файл уже существует";ES;fi;;
  1) S=M1;SC;if [[ $cur == enter ]];then R;echo " не создавать выходной файл";ES;fi;;
  2) S=M2;SC;if [[ $cur == enter ]];then R;echo " не обрезать выходной файл";ES;fi;;
  3) S=M3;SC;if [[ $cur == enter ]];then R;echo " продолжить после ошибок чтения";ES;fi;;
  4) S=M4;SC;if [[ $cur == enter ]];then R;echo " физически записать данные выходного файла перед завершением";ES;fi;;
  5) S=M5;SC;if [[ $cur == enter ]];then R;echo " аналогично, но также записывать метаданные";ES;fi;;
#
  6) S=M6;SC;if [[ $cur == enter ]];then R;echo " режим добавления (имеет смысл только для вывода; предлагается conv = notrunc)";ES;fi;;
  7) S=M7;SC;if [[ $cur == enter ]];then R;echo " использовать прямой ввод/вывод для данных";ES;fi;;
  8) S=M8;SC;if [[ $cur == enter ]];then R;echo " сбой, если только каталог";ES;fi;;
  9) S=M9;SC;if [[ $cur == enter ]];then R;echo " использовать синхронизированный ввод/вывод для данных";ES;fi;;
10) S=M10;SC;if [[ $cur == enter ]];then R;echo " аналогично, но и для метаданных";ES;fi;;
11) S=M11;SC;if [[ $cur == enter ]];then R;echo " накапливать полные блоки ввода (только iflag)";ES;fi;;
12) S=M12;SC;if [[ $cur == enter ]];then R;echo " использовать неблокирующий ввод/вывод";ES;fi;;
13) S=M13;SC;if [[ $cur == enter ]];then R;echo " не обновлять время доступа";ES;fi;;
14) S=M14;SC;if [[ $cur == enter ]];then R;echo " Запрос на сброс кеша. См. Также oflag = sync";ES;fi;;
15) S=M15;SC;if [[ $cur == enter ]];then R;echo " не назначать управляющий терминал из файла";ES;fi;;
16) S=M16;SC;if [[ $cur == enter ]];then R;echo " не следуйте символическим ссылкам";ES;fi;;
17) S=M17;SC;if [[ $cur == enter ]];then R;echo " обрабатывать count = N как количество байтов (только iflag)";ES;fi;;
18) S=M18;SC;if [[ $cur == enter ]];then R;echo " обрабатывать skip = N как счетчик байтов (только iflag)";ES;fi;;
19) S=M19;SC;if [[ $cur == enter ]];then R;echo " рассматривать seek = N как счетчик байтов (только для запаздывания)";ES;fi;;
#
20) S=M20;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
