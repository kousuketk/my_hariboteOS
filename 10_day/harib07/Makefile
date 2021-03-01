OBJS_BOOTPACK = bootpack.o graphic.o dsctbl.o nasmfunc.o hankaku.o mysprintf.o int.o fifo.o keyboard.o mouse.o memory.o

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

haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

haribote.img : ipl10.bin haribote.sys Makefile
	mformat -f 1440 -C -B ipl10.bin -i haribote.img ::
	mcopy -i haribote.img haribote.sys ::

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
