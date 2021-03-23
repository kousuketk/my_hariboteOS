GLOBAL	_alloca

_alloca:
		ADD		EAX,-4
		SUB		ESP,EAX
		JMP		DWORD [ESP+EAX]		; RET‚Ì‘ã‚í‚è
