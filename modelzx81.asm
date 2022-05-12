;Base model for optimal ZX81 code in lowres 

; 12 bytes from #4000 to #400B free reuseable for own "variables", tables or short routine

	org #4009

; in LOWRES more sysvar are used, but in this way the shortest code
; over sysvar to start machinecode. This saves 11 bytes of BASIC

; DO NOT CHANGE AFTER BASIC+3 (=DFILE)
basic   ld h,dfile/256			; highbyte of dfile
        jr init1

	db 236				; BASIC over DFILE data
	db 212,28			
	db 126,143,0,18			; shortest FP notation of #4009

	dw last

chadd	dw last-1
keys	db 0,0,0,0,0,0			; x
berg	db 0				; x

mem	db 0,0				; x OVERWRITTEN ON LOAD

init1	ld l, dfile mod 256		; low byte of dfile
bcard	jr init2			
		
lastk	db 255,255,255
margin  db 55

nxtlin  dw basic			; BASIC-line over sysvar	

flagx   equ init2+2
init2	ld (basic+3),hl			; repair correct DFILE flagx will be set with 64, the correct value
	
	ld h,vars/256
	db 0,0				; x used by ZX81, not effective code after loading

	ld l,vars mod 256
frames  db #37				; 1 more than actual command  executes LD (HL),#E9
	db #e9				; this must have bit 7 set

	jp gamecode			; YOUR ACTUAL GAMECODE, can be everywhere
	db 0,0

cdflag  db 64
; DO NOT CHANGE SYSVAR ABOVE!


; free codeable memory
gamecode jr gamecode

; the display file, Code the lines needed.
dfile 	db 118

; each line has text and a Newline
 	db "T"-27,"E"-27,"S"-27,"T"-27,118

; this byte fills the unused part of the screen	
vars    db 128				; becomes JP (HL)
last	equ $   	
end                	