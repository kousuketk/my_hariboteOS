# my_hariboteOS

## command

- nas(imgファイルを作成)

nasm helloos.nas -o helloos.img

- qemu(imgファイルを実行)

qemu-system-i386 -drive file=helloos.img,format=raw,if=floppy -boot a
