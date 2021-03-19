OBJS_BOOTPACK = bootpack.o graphic.o dsctbl.o nasmfunc.o hankaku.o mysprintf.o int.o fifo.o keyboard.o mouse.o memory.o sheet.o timer.o mtask.o window.o console.o file.o
OBJS_HELLO3 = hello3.o a_nasm.o
OBJS_HELLO4 = hello4.o a_nasm.o
OBJS_WINHELO = winhelo.o a_nasm.o
OBJS_WINHELO2 = winhelo2.o a_nasm.o
OBJS_WINHELO3 = winhelo3.o a_nasm.o
OBJS_STAR1 = star1.o a_nasm.o
OBJS_STARS = stars.o a_nasm.o
OBJS_BUG1 = bug1.o a_nasm.o
OBJS_BUG2 = bug2.o a_nasm.o

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

a_nasm.o : a_nasm.asm Makefile
	nasm -g -f elf $< -o $@ -l nasmfunc.lst

bootpack.hrb : $(OBJS_BOOTPACK) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_BOOTPACK) -o $@

hello.hrb : hello.nas Makefile
	nasm $< -o $@ -l hello.lst

hello2.hrb : hello2.nas Makefile
	nasm $< -o $@ -l hello2.lst

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

bug1.hrb : $(OBJS_BUG1) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_BUG1) -o $@

bug2.hrb : $(OBJS_BUG2) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_BUG2) -o $@

haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

haribote.img : ipl10.bin haribote.sys hello.hrb hello2.hrb hello3.hrb hello4.hrb \
	winhelo.hrb winhelo2.hrb winhelo3.hrb star1.hrb stars.hrb bug1.hrb bug2.hrb Makefile
	mformat -f 1440 -C -B ipl10.bin -i haribote.img ::
	mcopy -i haribote.img haribote.sys ::
	mcopy -i haribote.img hello.hrb ::
	mcopy -i haribote.img hello2.hrb ::
	mcopy -i haribote.img hello3.hrb ::
	mcopy -i haribote.img hello4.hrb ::
	mcopy -i haribote.img winhelo.hrb ::
	mcopy -i haribote.img winhelo2.hrb ::
	mcopy -i haribote.img winhelo3.hrb ::
	mcopy -i haribote.img star1.hrb ::
	mcopy -i haribote.img stars.hrb ::
	mcopy -i haribote.img bug1.hrb ::
	mcopy -i haribote.img bug2.hrb ::

# 一般規則

%.o : %.c
	$(CC) $(CFLAGS) -c $*.c -o $*.o

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
	-$(DEL) *.sys
	-$(DEL) *.hrb
	-$(DEL) hankaku.c
	-$(DEL) convHankakuTxt

src_only :
	$(MAKE) clean
	-$(DEL) haribote.img
