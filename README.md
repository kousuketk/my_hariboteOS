# my_hariboteOS

## command

- nas
nasm helloos.nas -o helloos.img

- qemu
qemu-system-i386 -drive file=helloos.img,format=raw,if=floppy -boot a
