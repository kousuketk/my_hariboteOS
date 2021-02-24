MAKE     = make -r
DEL      = rm -f

# デフォルト動作

default :
	$(MAKE) img

# ファイル生成規則

# txt2c.c は標準ライブラリが必要なので、macOS標準のgccを使う
txt2c : txt2c.c
	gcc txt2c.c -o txt2c

hankaku.c : hankaku.txt txt2c
	./txt2c

ipl10.bin : ipl10.nas Makefile
	nasm ipl10.nas -o ipl10.bin -l ipl10.lst

asmhead.bin : asmhead.nas Makefile
	nasm asmhead.nas -o asmhead.bin -l asmhead.lst

nasmfunc.o : nasmfunc.asm Makefile          # nasmfunc.asmのバイナリファイル作成
	nasm -g -f elf nasmfunc.asm -o nasmfunc.o -l nasmfunc.lst
	# nasm -g -f elf nasmfunc.nas -o nasmfunc.o -l nasmfunc.lst

bootpack.hrb : bootpack.c hrb.ld hankaku.c nasmfunc.o mysprintf.c Makefile       # リンク，コンパイル
	i386-elf-gcc -march=i486 -m32 -nostdlib -fno-builtin -T hrb.ld -g bootpack.c hankaku.c nasmfunc.o mysprintf.c -o bootpack.hrb

haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

haribote.img : ipl10.bin haribote.sys Makefile
	mformat -f 1440 -C -B ipl10.bin -i haribote.img ::
	mcopy -i haribote.img haribote.sys ::

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

src_only :
	$(MAKE) clean
	-$(DEL) haribote.img
