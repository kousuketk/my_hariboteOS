GLOBAL	api_getkey

api_getkey:		; int api_getkey(int mode);
		MOV		EDX,15
		MOV		EAX,[ESP+4]	; mode
		INT		0x40
		RET
