GLOBAL	api_end

api_end:	; void api_end(void);
		MOV		EDX,4
		INT		0x40
