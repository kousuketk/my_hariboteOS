GLOBAL	api_getlang

api_getlang:		; int api_getlang(void);
		MOV		EDX,27
		INT		0x40
		RET
