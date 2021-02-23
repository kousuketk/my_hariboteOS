# my_hariboteOS

## command

- nas(imgファイルを作成)

nasm helloos.nas -o helloos.img

- qemu(imgファイルを実行)

qemu-system-i386 -drive file=helloos.img,format=raw,if=floppy -boot a


- ipl.nas

```
    ;RESB   0x7dfe-$           
    TIMES▸--0x01fe-($-$$) DB 0  ▸---; 0x7dfeまでを0x00で埋める命令
```
