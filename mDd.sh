#!/bin/bash
 source "sDd.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[30;47m";}
#
 HEAD()
{
 for (( a=2; a<=37; a++ ))
          do
              TPUT $a 1
                        $E "\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m";
          done
              TPUT  1 1;$E "\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m"
              TPUT  3 3;$E "\e[1;36m*** dd ***\e[0m\e[36m                 data duplicator                 дупликатор данных\e[0m";
              TPUT  4 4;$E "Convert and copy a file";
              TPUT  5 4;$E "Kопирование данных из одного места в другое на двоичном уровне";
              TPUT  6 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 13 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 14 3;$E "\e[2m Options                                                               Опции\e[0m";
              TPUT 17 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 18 3;$E "\e[1;2m Description                                                        Описание\e[0m";
              TPUT 19 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 21 3;$E "\e[2m За N и BYTES могут следовать следующие мультипликативные суффиксы:\e[0m";
              TPUT 22 3;$E "\e[2m cu003d1, wu003d2, bu003d512, kBu003d1000, Ku003d1024, MBu003d1000*1000,\e[0m";
              TPUT 23 3;$E "\e[2m Mu003d1024*1024, xMu003dM, GBu003d 1000*1000*1000, Gu003d1024*1024*1024\e[0m";
              TPUT 24 3;$E "\e[2m и т. д. для T, P, E, Z, Y. Также можно использовать двоичные префиксы:\e[0m";
              TPUT 25 3;$E "\e[2m KiBu003dK, MiBu003dM и т. д.\e[0m";
              TPUT 26 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 28 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 30 3;$E "\e[2m Отправка сигнала USR1 запущенному процессу dd заставляет его печатать стати-\e[0m";
              TPUT 31 3;$E "\e[2m стику ввода-вывода со стандартной ошибкой, а затем возобновлять копирование.\e[0m";
              TPUT 32 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 34 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
              TPUT 35 3;$E "\e[2m Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\e[0m";
}
 FOOT(){ MARK;TPUT 38 1;$E "\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  7 3; $e " Краткое содержание                                                \e[32m Synopsis \e[0m";}
  M1(){ TPUT  8 3; $e " Синтаксис                                                           \e[32m Syntax \e[0m";}
  M2(){ TPUT  9 3; $e " Авторы                                                              \e[32m Author \e[0m";}
  M3(){ TPUT 10 3; $e " Сообщение об ошибках                                        \e[32m Reporting bugs \e[0m";}
  M4(){ TPUT 11 3; $e " Авторские права                                                  \e[32m Copyright \e[0m";}
  M5(){ TPUT 12 3; $e " Смотрите также                                                    \e[32m See also \e[0m";}
#
  M6(){ TPUT 15 3; $e " Display this help and exit                                          \e[32m --help \e[0m";}
  M7(){ TPUT 16 3; $e " Output version information and exit                              \e[32m --version \e[0m";}
#
  M8(){ TPUT 20 3; $e "\e[36m Скопируйте файл, конвертируя и форматируя в соответствии с операндами       \e[0m";}
#
  M9(){ TPUT 27 3; $e "\e[36m Каждый символ CONV может быть:                                              \e[0m";}
#
 M10(){ TPUT 29 3; $e "\e[36m Каждый символ ФЛАГ может быть:                                              \e[0m";}
#
 M11(){ TPUT 33 3; $e " Grannik Git                                                                 ";}
#
 M12(){ TPUT 36 3; $e " Exit                                                                        ";}
LM=12
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 dd [OPERAND]...
 dd OPTION
\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Стандартный синтаксис команды выглядит следующим образом:
\e[32m dd if=<имя исходного файла> of=<имя целевого файла> [параметры]\e[0m

\e[32m dd if=источник_копирования of=место_назначения параметры\e[0m

 С помощью параметра \e[32mif\e[0m вам нужно указать источник, откуда будут копироваться бло-
 ки, это может быть устройство, например, /dev/sda или файл - disk.img.
 Дальше, с помощью параметра \e[32mof\e[0m необходимо задать устройство или файл назначения.
 Другие параметры имеют такой же синтаксис, как if и of.

 Cоздать образ жесткого диска:
\e[32m dd if=/dev/sda of=~/disk.img\e[0m
 В вашей домашней папке будет создан файл с именем disk1.img

 записать образ на жесткий диск достаточно поменять местами адреса устройств:
\e[32m dd if=~/disk.img of=/dev/sda\e[0m
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo "
 Авторы сценария: Пол Рубин, Дэвид Маккензи и Стюарт Кемп.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Онлайн-справка GNU coreutils:
\e[36m https://www.gnu.org/software/coreutils/\e[0m

 Сообщайте о любых ошибках перевода по адресу:
\e[36m https://translationproject.org/team/\e[0m
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Copyright © 2020 Free Software Foundation, Inc. Лицензия GPLv3+: GNU GPL версии 3
 или выше:\e[36m https://gnu.org/licenses/gpl.html\e[0m.
 Это бесплатное программное обеспечение. Bы можете изменять и распространять его.
 НИКАКИХ ГАРАНТИЙ, насколько это разрешено законом.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Полная документация:\e[36m https://www.gnu.org/software/coreutils/dd\e[0m
 или доступны локально через:\e[32m info '(coreutils) dd invocation'\e[0m
";ES;fi;;
#
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Display this help and exit\e[32m dd --help\e[0m
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Output version information and exit:\e[32m dd --version\e[0m
";ES;fi;;
#
  8) S=M8;SC;  if [[ $cur == enter ]];then R;./nDdDescription.sh;ES;fi;;
  9) S=M9;SC;  if [[ $cur == enter ]];then R;./nDdConv.sh;ES;fi;;
 10) S=M10;SC; if [[ $cur == enter ]];then R;./nDdFlag.sh;ES;fi;;
#
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Mi 29 Jun 2022
 mDd описание утилиты dd.
 dd - Kопирование данных из одного места в другое на двоичном уровне.

 Asciinema:  \e[36m https://asciinema.org/a/504937\e[0m
 Github:     \e[36m https://github.com/GrannikOleg/mDd\e[0m
 Gitlab:     \e[36m https://gitlab.com/GrannikOleg/mdd/-/tree/main/\e[0m
 Sourceforge:\e[36m https://sourceforge.net/projects/mdd-sh/files/\e[0m
 Notabug     \e[36m https://notabug.org/Grannikoleg/mDd\e[0m
 Codeberg    \e[36m https://codeberg.org/Grannik/mDd\e[0m
 Bitbucket   \e[36m https://bitbucket.org/grannikoleg/workspace/projects/MDD\e[0m
 Framagit    \e[36m https://framagit.org/GrannikOleg/mdd\e[0m
 Gitea       \e[36m https://try.gitea.io/Grannik/mDd\e[0m
 Gogs        \e[36m https://try.gogs.io/Grannik/mDd\e[0m
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;clear;exit 0;fi;;
 esac;POS;done
