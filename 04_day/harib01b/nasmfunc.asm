GLOBAL  io_hlt,write_mem8          ; このプログラムに含まれる関数名
io_hlt: ; void io_hlt(void);
        HLT
        RET

write_mem8: ; void write_mem8(int addr, int data);
        MOV		ECX,[ESP+4]		; [ESP+4]にaddrが入っているのでそれをECXに読み込む
        MOV		AL,[ESP+8]		; [ESP+8]にdataが入っているのでそれをALに読み込む
        MOV		[ECX],AL
        RET
