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
 HEAD(){ for (( a=4; a<=41; a++ ))
  do
   TPUT $a 1
 $E "\033[34m\xE2\x94\x82                                                                                                      \xE2\x94\x82\033[0m";
  done
 TPUT 2 1
 $E "\033[34m\xE2\x94\x82   \033[1;36mСправочник dd - конвертировать и копировать файл                                                   \033[34m\xE2\x94\x82\033[0m";
 TPUT 3 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";
 TPUT 9 3
 $E "\033[36mOPTIONS                                                                     \033[0mОпции";
 TPUT 12 3
 $E "\033[36mDESCRIPTION                                                                 \033[0mОписание";
 TPUT 13 3
 $E "\033[32mКопируем файл, конвертируем и форматируем согласно операндам\033[0m";
 TPUT 28 3
 $E "\033[32mКаждый символ CONV может быть:\033[0m";
 TPUT 39 3
 $E "\033[32mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\033[0m";
 MARK;TPUT 1 1
 $E "\033[0m\033[34m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m" ;UNMARK;}
  i=0; CLEAR; CIVIS;NULL=/dev/null
 FOOT(){ MARK;TPUT 42 1
 $E "\033[0m\033[34m+~~~| Grannik | 2021.11.02 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\033[0m";UNMARK;}
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
 M0(){ TPUT  4 3; $e "Обзор                                                                      \033[32m SYNOPSIS               \033[0m";}
 M1(){ TPUT  5 3; $e "Автор                                                                      \033[32m AUTHOR                 \033[0m";}
 M2(){ TPUT  6 3; $e "Сообщение об ошибках                                                       \033[32m REPORTING BUGS         \033[0m";}
 M3(){ TPUT  7 3; $e "Авторские права                                                            \033[32m COPYRIGHT              \033[0m";}
 M4(){ TPUT  8 3; $e "Смотрите также                                                             \033[32m SEE ALSO               \033[0m";}
#
 M5(){ TPUT 10 3; $e "Oтобразить эту справку и выйти                                             \033[32m --help                 \033[0m";}
 M6(){ TPUT 11 3; $e "Bывести информацию о версии и выйти                                        \033[32m --version              \033[0m";}
#
 M7(){ TPUT 14 3; $e "читать и записывать до БАЙТОВ байтов за раз (по умолчанию: 512)            \033[32m bs=BYTES               \033[0m";}
 M8(){ TPUT 15 3; $e "конвертировать BYTES байты за раз                                          \033[32m cbs=BYTES              \033[0m";}
 M9(){ TPUT 16 3; $e "преобразовать файл в соответствии со списком символов, разделенных запятыми\033[32m conv=CONVS             \033[0m";}
M10(){ TPUT 17 3; $e "копировать только N входных блоков                                         \033[32m count=N                \033[0m";}
M11(){ TPUT 18 3; $e "читать до БАЙТОВ байт за раз (по умолчанию: 512)                           \033[32m ibs=BYTES              \033[0m";}
M12(){ TPUT 19 3; $e "читать из ФАЙЛА вместо стандартного ввода                                  \033[32m if=FILE                \033[0m";}
M13(){ TPUT 20 3; $e "читать в соответствии со списком символов, разделенных запятыми            \033[32m iflag=FLAGS            \033[0m";}
M14(){ TPUT 21 3; $e "записывать БАЙТЫ байтов за раз (по умолчанию: 512)                         \033[32m obs=BYTES              \033[0m";}
M15(){ TPUT 22 3; $e "писать в ФАЙЛ вместо стандартного вывода                                   \033[32m of=FILE                \033[0m";}
M16(){ TPUT 23 3; $e "напишите в соответствии со списком символов, разделенных запятыми          \033[32m oflag=FLAGS            \033[0m";}
M17(){ TPUT 24 3; $e "блоки в начале вывода                                                      \033[32m seek=N skip N obs-sized\033[0m";}
M18(){ TPUT 25 3; $e "блоки в начале ввода                                                       \033[32m skip=N skip N ibs-sized\033[0m";}
M19(){ TPUT 26 3; $e "УРОВЕНЬ информации для печати в stderr                                     \033[32m status=LEVEL           \033[0m";}
M20(){ TPUT 27 3; $e "могут сопровождаться следующими мультипликативными суффиксами:             \033[32m N and BYTES            \033[0m";}
#
M21(){ TPUT 29 3; $e "из EBCDIC в ASCII                                                          \033[32m ascii                  \033[0m";}
M22(){ TPUT 30 3; $e "из ASCII в EBCDIC                                                          \033[32m ebcdic                 \033[0m";}
M23(){ TPUT 31 3; $e "из ASCII в альтернативный EBCDIC                                           \033[32m ibm                    \033[0m";}
M24(){ TPUT 32 3; $e "заполнять записи с завершением новой строки пробелами до размера cbs       \033[32m block                  \033[0m";}
M25(){ TPUT 33 3; $e "заменить конечные пробелы в записях cbs-size на новую строку               \033[32m unblock                \033[0m";}
M26(){ TPUT 34 3; $e "изменить верхний регистр на нижний                                         \033[32m lcase                  \033[0m";}
M27(){ TPUT 35 3; $e "изменить нижний регистр на верхний регистр                                 \033[32m ucase                  \033[0m";}
M28(){ TPUT 36 3; $e "старайтесь искать, а не писать блоки вывода, состоящие только из NUL       \033[32m sparse                 \033[0m";}
M29(){ TPUT 37 3; $e "поменять местами каждую пару входных байтов                                \033[32m swab                   \033[0m";}
M30(){ TPUT 38 3; $e "заполнять каждый входной блок значениями NUL до размера ibs                \033[32m sync                   \033[0m";}
#
M31(){ TPUT 40 3; $e "Далее                                                                      \033[32m onward                 \033[0m";}
M32(){ TPUT 41 3; $e "EXIT                                                                                               ";}
LM=32
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
  0) S=M0;SC;if [[ $cur == enter ]];then R;echo " dd [ОПЕРАНД]…
  или
 dd ПАРАМЕТР";ES;fi;;
  1) S=M1;SC;if [[ $cur == enter ]];then R;echo " Написано Полом Рубином, Дэвидом Маккензи и Стюартом Кемпом.";ES;fi;;
  2) S=M2;SC;if [[ $cur == enter ]];then R;echo " Онлайн-справка GNU coreutils:          https://www.gnu.org/software/coreutils/
 Сообщайте о любых ошибках перевода на: https://translationproject.org/team/";ES;fi;;
  3) S=M3;SC;if [[ $cur == enter ]];then R;echo " Авторские права © 2020 Free Software Foundation, Inc. Лицензия GPLv3 +: GNU GPL версии 3 или более поздней: https://gnu.org/licenses/gpl.html
 Это бесплатное программное обеспечение: вы можете изменять и распространять его. НИКАКИХ ГАРАНТИЙ в той степени, в которой это разрешено законом.";ES;fi;;
  4) S=M4;SC;if [[ $cur == enter ]];then R;echo " Полная документация:         https://www.gnu.org/software/coreutils/dd
 или доступен локально через: info '(coreutils) dd invocation'";ES;fi;;
#
  5) S=M5;SC;if [[ $cur == enter ]];then R;echo " dd --help";ES;fi;;
  6) S=M6;SC;if [[ $cur == enter ]];then R;echo " dd --version";ES;fi;;
  7) S=M7;SC;if [[ $cur == enter ]];then R;echo " читать и записывать до БАЙТОВ байтов за раз (по умолчанию: 512); отменяет ibs и obs";ES;fi;;
  8) S=M8;SC;if [[ $cur == enter ]];then R;echo " конвертировать BYTES байты за раз";ES;fi;;
  9) S=M9;SC;if [[ $cur == enter ]];then R;echo " преобразовать файл в соответствии со списком символов, разделенных запятыми";ES;fi;;
10) S=M10;SC;if [[ $cur == enter ]];then R;echo " копировать только N входных блоков";ES;fi;;
11) S=M11;SC;if [[ $cur == enter ]];then R;echo " читать до БАЙТОВ байт за раз (по умолчанию: 512)";ES;fi;;
12) S=M12;SC;if [[ $cur == enter ]];then R;echo " читать из ФАЙЛА вместо стандартного ввода";ES;fi;;
13) S=M13;SC;if [[ $cur == enter ]];then R;echo " читать в соответствии со списком символов, разделенных запятыми";ES;fi;;
14) S=M14;SC;if [[ $cur == enter ]];then R;echo " записывать БАЙТЫ байтов за раз (по умолчанию: 512)";ES;fi;;
15) S=M15;SC;if [[ $cur == enter ]];then R;echo " писать в ФАЙЛ вместо стандартного вывода";ES;fi;;
16) S=M16;SC;if [[ $cur == enter ]];then R;echo " напишите в соответствии со списком символов, разделенных запятыми";ES;fi;;
17) S=M17;SC;if [[ $cur == enter ]];then R;echo " блоки в начале вывода";ES;fi;;
18) S=M18;SC;if [[ $cur == enter ]];then R;echo " блоки в начале ввода";ES;fi;;
19) S=M19;SC;if [[ $cur == enter ]];then R;echo " УРОВЕНЬ информации для печати в stderr; 'none' подавляет все, кроме сообщений об ошибках, 'noxfer' подавляет окончательную статистику передачи, 'progress'
 показывает статистику периодических переводов";ES;fi;;
20) S=M20;SC;if [[ $cur == enter ]];then R;echo " N и BYTES могут сопровождаться следующими мультипликативными суффиксами:
 c = 1, w = 2, b = 512, kB = 1000, K = 1024, MB = 1000 * 1000, M = 1024 * 1024, xM = M, GB = 1000 * 1000 * 1000, G = 1024 * 1024 * 1024
 и так далее для T, P, E, Z, Y.
 Также можно использовать двоичные префиксы: KiB = K, MiB = M и так далее.";ES;fi;;
21) S=M21;SC;if [[ $cur == enter ]];then R;echo " из EBCDIC в ASCII";ES;fi;;
22) S=M22;SC;if [[ $cur == enter ]];then R;echo " из ASCII в EBCDIC";ES;fi;;
23) S=M23;SC;if [[ $cur == enter ]];then R;echo " из ASCII в альтернативный EBCDIC";ES;fi;;
24) S=M24;SC;if [[ $cur == enter ]];then R;echo " заполнять записи с завершением новой строки пробелами до размера cbs";ES;fi;;
25) S=M25;SC;if [[ $cur == enter ]];then R;echo " заменить конечные пробелы в записях cbs-size на новую строку";ES;fi;;
26) S=M26;SC;if [[ $cur == enter ]];then R;echo " изменить верхний регистр на нижний";ES;fi;;
27) S=M27;SC;if [[ $cur == enter ]];then R;echo " изменить нижний регистр на верхний регистр";ES;fi;;
28) S=M28;SC;if [[ $cur == enter ]];then R;echo " старайтесь искать, а не писать блоки вывода, состоящие только из NUL";ES;fi;;
29) S=M29;SC;if [[ $cur == enter ]];then R;echo " поменять местами каждую пару входных байтов";ES;fi;;
30) S=M30;SC;if [[ $cur == enter ]];then R;echo " заполнять каждый входной блок значениями NUL до размера ibs; при использовании с блокировкой или разблокировкой вставляйте пробелы, а не NUL";ES;fi;;
#
31) S=M31;SC;if [[ $cur == enter ]];then R;./ddB.sh;ES;fi;;
32) S=M32;SC;if [[ $cur == enter ]];then R;clear;ls -l;exit 0;fi;;
 esac;POS;done
