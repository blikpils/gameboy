REM Automatically generated from Makefile
..\..\..\bin\lcc -Wa-l -Wl-m  -c -o obj\banks.o src\banks.c
..\..\..\bin\lcc -Wa-l -Wl-m  -c -o obj\srcfile_1.o res\srcfile_1.c
..\..\..\bin\lcc -Wa-l -Wl-m  -c -o obj\srcfile_2.o res\srcfile_2.c
..\..\..\bin\lcc -Wa-l -Wl-m  -c -o obj\srcfile_3.o res\srcfile_3.c
..\..\..\bin\lcc -Wa-l -Wl-m -Wf-ba0 -c -o obj\savestate.o res\savestate.c
..\..\..\bin\bankpack -ext=.rel -v -yt19 obj\banks.o obj\srcfile_1.o obj\srcfile_2.o obj\srcfile_3.o  obj\savestate.o 
..\..\..\bin\lcc -Wa-l -Wl-m  -Wl-yt19 -Wl-yo4 -Wl-ya4 -o obj\autobanks.gb obj\banks.rel obj\srcfile_1.rel obj\srcfile_2.rel obj\srcfile_3.rel obj\savestate.rel 
