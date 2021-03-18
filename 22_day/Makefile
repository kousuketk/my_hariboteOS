OBJS_BOOTPACK = bootpack.o graphic.o dsctbl.o nasmfunc.o hankaku.o mysprintf.o int.o fifo.o keyboard.o mouse.o memory.o sheet.o timer.o mtask.o window.o console.o file.o
OBJS_BOOTPACK2 = hello3.o a_nasm.o
OBJS_BOOTPACK3 = crack1.o a_nasm.o

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

hello3.hrb : $(OBJS_BOOTPACK2) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_BOOTPACK2) -o $@

crack1.hrb : $(OBJS_BOOTPACK3) hrb.ld Makefile
	$(CC) $(CFLAGS) -march=i486 -nostdlib -T hrb.ld -g $(OBJS_BOOTPACK3) -o $@

crack2.hrb : crack2.nas Makefile
	nasm $< -o $@ -l crack2.lst

crack3.hrb : crack3.nas Makefile
	nasm $< -o $@ -l crack3.lst

crack4.hrb : crack4.nas Makefile
	nasm $< -o $@ -l crack4.lst

crack5.hrb : crack5.nas Makefile
	nasm $< -o $@ -l crack5.lst

crack6.hrb : crack6.nas Makefile
	nasm $< -o $@ -l crack6.lst

haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

haribote.img : ipl10.bin haribote.sys hello.hrb hello2.hrb hello3.hrb \
		crack1.hrb crack2.hrb crack3.hrb crack4.hrb crack5.hrb crack6.hrb Makefile
	mformat -f 1440 -C -B ipl10.bin -i haribote.img ::
	mcopy -i haribote.img haribote.sys ::
	mcopy -i haribote.img hello.hrb ::
	mcopy -i haribote.img hello2.hrb ::
	mcopy -i haribote.img hello3.hrb ::
	mcopy -i haribote.img crack1.hrb ::
	mcopy -i haribote.img crack2.hrb ::
	mcopy -i haribote.img crack3.hrb ::
	mcopy -i haribote.img crack4.hrb ::
	mcopy -i haribote.img crack5.hrb ::
	mcopy -i haribote.img crack6.hrb ::	

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
