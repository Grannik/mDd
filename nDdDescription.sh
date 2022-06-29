#!/bin/bash
 source "sDd.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;37m";}
#
 HEAD()
{
 for (( a=2; a<=24; a++ ))
  do
   TPUT $a 1
        $E "\e[2m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
              TPUT  1 1;$E "\033[0m\033[2m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
              TPUT  2 3;$E "\033[36mСкопируйте файл, конвертируя и форматируя в соответствии с операндами\033[0m";
              TPUT  3 1;$E "\e[2m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 17 1;$E "\e[2m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 22 1;$E "\e[2m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 23 3;$E "\033[2m\xE2\x86\x91 \xE2\x86\x93 Down Select Enter\e[0m";
}
 FOOT(){ MARK;TPUT 25 1;$E "\033[0m\033[2m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  4 3; $e "Чтение и запись до BYTES байтов за раз (по умолчанию: 512)         \e[33m bs=BYTES \e[0m";}
  M1(){ TPUT  5 3; $e "Конвертировать BYTES байт за раз                                  \e[32m cbs=BYTES \e[0m";}
  M2(){ TPUT  6 3; $e "Преобразовать файл в соответствии со списком символов            \e[33m conv=CONVS \e[0m";}
  M3(){ TPUT  7 3; $e "указать сколько блоков необходимо скопировать                       \e[33m count=N \e[0m";}
  M4(){ TPUT  8 3; $e "Читать до BYTES байт за раз (по умолчанию: 512)                   \e[32m ibs=BYTES \e[0m";}
  M5(){ TPUT  9 3; $e "Читать из ФАЙЛА вместо стандартного ввода                           \e[32m if=FILE \e[0m";}
  M6(){ TPUT 10 3; $e "Читать в соответствии со списком символов, разделенных запятыми \e[32m iflag=FLAGS \e[0m";}
  M7(){ TPUT 11 3; $e "Записывать BYTES байт за раз (по умолчанию: 512)                  \e[32m obs=BYTES \e[0m";}
  M8(){ TPUT 12 3; $e "Писать в ФАЙЛ вместо stdout                                         \e[32m of=FILE \e[0m";}
  M9(){ TPUT 13 3; $e "Напишите в соответствии со списком символов                     \e[32m oflag=FLAGS \e[0m";}
 M10(){ TPUT 14 3; $e "Пропустить блоки размером N obs в начале вывода                      \e[32m seek=N \e[0m";}
 M11(){ TPUT 15 3; $e "Пропускать блоки размером N ibs в начале ввода                       \e[33m skip=N \e[0m";}
 M12(){ TPUT 16 3; $e "Уровень информации для печати в stderr                         \e[32m status=LEVEL \e[0m";}
#
 M13(){ TPUT 18 3; $e "Kопированиe файлов                                                  \e[33m if= of= \e[0m";}
 M14(){ TPUT 19 3; $e "Cтереть диск                                                        \e[33m if= of= \e[0m";}
 M15(){ TPUT 20 3; $e "Сжатие файла образа диска                                             \e[33m bzip2 \e[0m";}
 M16(){ TPUT 21 3; $e "Сжатие файла образа диска                                              \e[33m gzip \e[0m";}
#
 M17(){ TPUT 24 3; $e "Exit                                                                         ";}
LM=17
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
 чтение, запись до BYTES байтов за раз (по умолчанию 512) переопределяет ibs и obs
 позволяет очень сильно влиять на скорость работы утилиты.

 Этот параметр позволяет установить размер одного блока при передаче данных:
\e[32m dd if=/dev/sda of=~/disk.img bs=5M\e[0m

 задать цифровое значение с одним из таких модификаторов формата:
\e[32m с \e[0m один символ;
\e[32m b \e[0m 512 байт;
\e[32m kB\e[0m 1000 байт;
\e[32m K \e[0m 1024 байт;
\e[32m MB\e[0m 1000 килобайт;
\e[32m M \e[0m 1024 килобайт;
\e[32m GB\e[0m 1000 мегабайт;
\e[32m G \e[0m 1024 мегабайт.
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 преобразовать файл в соответствии со списком символов, разделенных запятыми.

 Фильтр noerror позволяет отключить реагирование на ошибки:
\e[32m sudo dd if=/dev/sr0 of=~/CD.iso bs=2048 conv=noerror\e[0m
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Cоздать файл размером 512 мегабайт, заполнив его нулями из /dev/zero:
\e[32m sudo dd if=/dev/zero of=file.img bs=1M count=512\e[0m

 Cоздать файл размером 512 мегабайт, заполнив случайными цифрами из /dev/random:
\e[32m sudo dd if=/dev/random of=file.img bs=1M count=512\e[0m

 Проверить можно тем же dd, но преобразовав данные в hex:
\e[32m dd if=/dev/sda | hexdump -C\e[0m
 Должны посыпаться нули.

 Операции с MBR:
 MBR расположена в первых 512 байтах жесткого диска, и состоит из таблицы разделов,
 загрузчика и пары доп. байт.
 Иногда, ее приходится бекапить, восстанавливать и т.д. Бекап выполняется так:
\e[32m dd if=/dev/sda of=mbr.img bs=512 count=1\e[0m

 Восстановить можно проще:
\e[32m dd if=mbr.img of=/dev/sda\e[0m
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 напишите в соответствии со списком символов, разделенных запятыми
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Для анализа содержимого жесткого диска с выводом данных из отдельных блоков,
 в нашем случае, блока 1001 на разделе, представленном файлом устройства
 /dev/sdc1, достаточно использовать следующую команду:
\e[32m dd if=/dev/sdc1 count=1 skip=1000\e[0m

 Для того, чтобы увидеть первые 40 байт вашего жесткого диска
 в шестнадцатеричном представлении следует использовать команду:
\e[32m dd if=/dev/sda bs=1 count=40 | hexdump -C\e[0m

 В данном случае с помощью параметра bs задается размер блока диска.
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 УРОВЕНЬ информации для печати в stderr:
\e[32m none    \e[0m подавляет все, кроме сообщений об ошибках
\e[32m noxfer  \e[0m подавляет окончательную статистику передачи,
\e[32m progress\e[0m показывает периодическую статистику передачи
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m dd if=text1.txt of=text2.txt\e[0m
#
\e[32m dd if=/home/sergiy/test.txt of=/home/sergiy/test1.txt\e[0m
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 чтобы стереть диск вы можете просто забить его нулями из /dev/zero:
\e[32m sudo dd if=/dev/zero of=/dev/sdb\e[0m
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m dd if=/dev/sdb | bzip2 backup.img.bz2\e[0m
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m sudo dd if=/dev/disk3 | gzip -c > /Users/captain/raspberrypi.img.gz\e[0m
";ES;fi;;
#
 17) S=M17;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
