OBJS_BOOTPACK = bootpack.o graphic.o dsctbl.o nasmfunc.o hankaku.o mysprintf.o int.o fifo.o keyboard.o mouse.o memory.o sheet.o timer.o mtask.o window.o console.o file.o
OBJS_API = api001.obj api002.obj api003.obj api004.obj api005.obj api006.obj api007.obj api008.obj api009.obj api010.obj \
			api011.obj api012.obj api013.obj api014.obj api015.obj api016.obj api017.obj api018.obj api019.obj api020.obj
OBJS_HELLO3 = hello3.o api001.obj api004.obj
OBJS_HELLO4 = hello4.o $(OBJS_API)
OBJS_WINHELO = winhelo.o $(OBJS_API)
OBJS_WINHELO2 = winhelo2.o $(OBJS_API)
OBJS_WINHELO3 = winhelo3.o $(OBJS_API)
OBJS_STAR1 = star1.o $(OBJS_API)
OBJS_STARS = stars.o $(OBJS_API)
OBJS_STARS2 = stars2.o $(OBJS_API)
OBJS_LINES = lines.o $(OBJS_API)
OBJS_WALK = walk.o $(OBJS_API)
OBJS_NOODLE = noodle.o mysprintf.o $(OBJS_API) 
OBJS_BEEP = beepdown.o $(OBJS_API)
OBJS_COLOR = color.o $(OBJS_API)
OBJS_COLOR2 = color2.o $(OBJS_API)

MAKE     = make -r
DEL      = rm -f
CC			 = i386-elf-gcc
CFLAGS 	 = -m32 -fno-builtin

# デフォルト動作

default :
	$(MAKE) img

# ファイル生成規則

txt2c : txt2c.c
	gcc $< -o $@

hankaku.c : hankaku.txt txt2c
	./txt2c

ipl10.bin : ipl10.nas Makefile
	nasm $< -o $@ -l ipl10.lst

asmhead.bin : asmhead.nas Makefile
	nasm $< -o $@ -l asmhead.lst

nasmfunc.o : nasmfunc.asm Makefile
	nasm -g -f elf $< -o $@ -l nasmfunc.lst

bootpack.hrb : $(OBJS_BOOTPACK) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_BOOTPACK) -o $@

hello3.hrb : $(OBJS_HELLO3) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_HELLO3) -o $@

hello4.hrb : $(OBJS_HELLO4) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_HELLO4) -o $@

winhelo.hrb : $(OBJS_WINHELO) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_WINHELO) -o $@

winhelo2.hrb : $(OBJS_WINHELO2) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_WINHELO2) -o $@

winhelo3.hrb : $(OBJS_WINHELO3) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_WINHELO3) -o $@

star1.hrb : $(OBJS_STAR1) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_STAR1) -o $@

stars.hrb : $(OBJS_STARS) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_STARS) -o $@

stars2.hrb : $(OBJS_STARS2) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_STARS2) -o $@

lines.hrb : $(OBJS_LINES) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_LINES) -o $@

walk.hrb : $(OBJS_WALK) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_WALK) -o $@

noodle.hrb : $(OBJS_NOODLE) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_NOODLE) -o $@

beepdown.hrb : $(OBJS_BEEP) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_BEEP) -o $@

color.hrb : $(OBJS_COLOR) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_COLOR) -o $@

color2.hrb : $(OBJS_COLOR2) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_COLOR2) -o $@

haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

haribote.img : ipl10.bin haribote.sys Makefile \
	hello3.hrb hello4.hrb \
	winhelo.hrb winhelo2.hrb winhelo3.hrb \
	star1.hrb stars.hrb stars2.hrb \
	lines.hrb walk.hrb noodle.hrb beepdown.hrb \
	color.hrb color2.hrb Makefile
	mformat -f 1440 -C -B ipl10.bin -i haribote.img ::
	mcopy -i haribote.img haribote.sys ::
	mcopy -i haribote.img hello3.hrb ::
	mcopy -i haribote.img hello4.hrb ::
	mcopy -i haribote.img winhelo.hrb ::
	mcopy -i haribote.img winhelo2.hrb ::
	mcopy -i haribote.img winhelo3.hrb ::
	mcopy -i haribote.img star1.hrb ::
	mcopy -i haribote.img stars.hrb ::
	mcopy -i haribote.img stars2.hrb ::
	mcopy -i haribote.img lines.hrb ::
	mcopy -i haribote.img walk.hrb ::
	mcopy -i haribote.img noodle.hrb ::
	mcopy -i haribote.img beepdown.hrb ::
	mcopy -i haribote.img color.hrb ::
	mcopy -i haribote.img color2.hrb ::

# 一般規則

%.o : %.c
	$(CC) $(CFLAGS) -c $*.c -o $*.o

%.obj : %.asm Makefile
	nasm -g -f elf $< -o $@ -l nasmfunc.lst

# コマンド

img :
	$(MAKE) haribote.img

run :
	$(MAKE) img
	qemu-system-i386 -drive file=haribote.img,format=raw,if=floppy -boot a

clean :
	-$(DEL) *.bin
	-$(DEL) *.lst
	-$(DEL) *.o
	-$(DEL) *.obj
	-$(DEL) *.sys
	-$(DEL) *.hrb
	-$(DEL) hankaku.c
	-$(DEL) convHankakuTxt

src_only :
	$(MAKE) clean
	-$(DEL) haribote.img
