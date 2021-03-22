GLOBAL	api_alloctimer

api_alloctimer:	; int api_alloctimer(void);
		MOV		EDX,16
		INT		0x40
		RET
