opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_First_8bits
	FNCALL	_First_8bits,_I2C_Master_Start
	FNCALL	_First_8bits,_I2C_Master_Write
	FNCALL	_First_8bits,_I2C_Master_Stop
	FNROOT	_main
	global	_arr
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
	line	17

;initializer for _arr
	retlw	0
	retlw	0

	retlw	08h
	retlw	0

	retlw	010h
	retlw	0

	retlw	018h
	retlw	0

	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_i
	global	_j
	global	_PORTC
_PORTC	set	7
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPEN
_SSPEN	set	165
	global	_SSPIF
_SSPIF	set	99
	global	_SSPM0
_SSPM0	set	160
	global	_SSPM1
_SSPM1	set	161
	global	_SSPM2
_SSPM2	set	162
	global	_SSPM3
_SSPM3	set	163
	global	_SSPADD
_SSPADD	set	147
	global	_TRISC
_TRISC	set	135
	global	_PEN
_PEN	set	1162
	global	_SEN
_SEN	set	1160
	file	"24LC02_EEPROM.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_i:
       ds      2

_j:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
_arr:
       ds      20

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+20)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_I2C_Master_Start
?_I2C_Master_Start:	; 0 bytes @ 0x0
	global	??_I2C_Master_Start
??_I2C_Master_Start:	; 0 bytes @ 0x0
	global	?_I2C_Master_Write
?_I2C_Master_Write:	; 0 bytes @ 0x0
	global	?_I2C_Master_Stop
?_I2C_Master_Stop:	; 0 bytes @ 0x0
	global	??_I2C_Master_Stop
??_I2C_Master_Stop:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_First_8bits
?_First_8bits:	; 2 bytes @ 0x0
	global	I2C_Master_Write@d
I2C_Master_Write@d:	; 2 bytes @ 0x0
	ds	2
	global	??_First_8bits
??_First_8bits:	; 0 bytes @ 0x2
	global	??_I2C_Master_Write
??_I2C_Master_Write:	; 0 bytes @ 0x2
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 0, constant 0, data 20, bss 4, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       9
;; BANK0           80      0      20
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_First_8bits
;;   _First_8bits->_I2C_Master_Write
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      15
;;                        _First_8bits
;; ---------------------------------------------------------------------------------
;; (1) _First_8bits                                          3     3      0      15
;;                                              2 COMMON     3     3      0
;;                   _I2C_Master_Start
;;                   _I2C_Master_Write
;;                    _I2C_Master_Stop
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Master_Stop                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Master_Write                                     2     0      2      15
;;                                              0 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _I2C_Master_Start                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _First_8bits
;;     _I2C_Master_Start
;;     _I2C_Master_Write
;;     _I2C_Master_Stop
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      1F      12        0.0%
;;ABS                  0      0      1D       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      0      14       5       25.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 20 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_First_8bits
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
	line	20
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	22
	
l1792:	
;main.c: 22: TRISC = 0xFF;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	23
	
l1794:	
;main.c: 23: PORTC = 0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	28
	
l1796:	
;main.c: 28: SSPADD = 0x3f;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(147)^080h	;volatile
	line	29
	
l1798:	
;main.c: 29: SSPM3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(163/8),(163)&7
	line	30
	
l1800:	
;main.c: 30: SSPM2 = 0;
	bcf	(162/8),(162)&7
	line	31
	
l1802:	
;main.c: 31: SSPM1 = 0;
	bcf	(161/8),(161)&7
	line	32
	
l1804:	
;main.c: 32: SSPM0 = 0;
	bcf	(160/8),(160)&7
	line	33
	
l1806:	
;main.c: 33: SSPEN = 1;
	bsf	(165/8),(165)&7
	line	36
	
l1808:	
;main.c: 36: First_8bits();
	fcall	_First_8bits
	goto	l576
	line	41
;main.c: 41: while(1)
	
l575:	
	line	43
;main.c: 42: {
	
l576:	
	line	41
	goto	l576
	
l577:	
	line	45
	
l578:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_First_8bits
psect	text91,local,class=CODE,delta=2
global __ptext91
__ptext91:

;; *************** function _First_8bits *****************
;; Defined at:
;;		line 48 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  564[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Master_Start
;;		_I2C_Master_Write
;;		_I2C_Master_Stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text91
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
	line	48
	global	__size_of_First_8bits
	__size_of_First_8bits	equ	__end_of_First_8bits-_First_8bits
	
_First_8bits:	
	opt	stack 6
; Regs used in _First_8bits: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	50
	
l1764:	
;main.c: 50: I2C_Master_Start();
	fcall	_I2C_Master_Start
	line	52
	
l1766:	
;main.c: 52: I2C_Master_Write(0xA0);
	movlw	low(0A0h)
	movwf	(?_I2C_Master_Write)
	movlw	high(0A0h)
	movwf	((?_I2C_Master_Write))+1
	fcall	_I2C_Master_Write
	line	53
;main.c: 53: for(j=0;j<=4;){
	movlw	low(0)
	movwf	(_j)
	movlw	high(0)
	movwf	((_j))+1
	movlw	high(05h)
	subwf	(_j+1),w
	movlw	low(05h)
	skipnz
	subwf	(_j),w
	skipc
	goto	u2171
	goto	u2170
u2171:
	goto	l1770
u2170:
	goto	l1788
	
l1768:	
	goto	l1788
	
l581:	
	line	54
	
l1770:	
;main.c: 54: for(i =65; i<91; i++){
	movlw	low(041h)
	movwf	(_i)
	movlw	high(041h)
	movwf	((_i))+1
	movlw	high(05Bh)
	subwf	(_i+1),w
	movlw	low(05Bh)
	skipnz
	subwf	(_i),w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l1774
u2180:
	goto	l1786
	
l1772:	
	goto	l1786
	
l583:	
	line	55
	
l1774:	
;main.c: 55: I2C_Master_Write(arr[j]);
	movf	(_j),w
	movwf	(??_First_8bits+0)+0
	addwf	(??_First_8bits+0)+0,w
	addlw	_arr&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_I2C_Master_Write)
	incf	fsr0,f
	movf	indf,w
	movwf	(?_I2C_Master_Write+1)
	fcall	_I2C_Master_Write
	line	56
	
l1776:	
;main.c: 56: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_First_8bits+0)+0+2),f
movlw	163
movwf	((??_First_8bits+0)+0+1),f
	movlw	189
movwf	((??_First_8bits+0)+0),f
u2217:
	decfsz	((??_First_8bits+0)+0),f
	goto	u2217
	decfsz	((??_First_8bits+0)+0+1),f
	goto	u2217
	decfsz	((??_First_8bits+0)+0+2),f
	goto	u2217
	clrwdt
opt asmopt_on

	line	57
	
l1778:	
;main.c: 57: I2C_Master_Write(i);
	movf	(_i+1),w
	clrf	(?_I2C_Master_Write+1)
	addwf	(?_I2C_Master_Write+1)
	movf	(_i),w
	clrf	(?_I2C_Master_Write)
	addwf	(?_I2C_Master_Write)

	fcall	_I2C_Master_Write
	line	59
	
l1780:	
;main.c: 59: j++;
	movlw	low(01h)
	addwf	(_j),f
	skipnc
	incf	(_j+1),f
	movlw	high(01h)
	addwf	(_j+1),f
	line	54
	
l1782:	
	movlw	low(01h)
	addwf	(_i),f
	skipnc
	incf	(_i+1),f
	movlw	high(01h)
	addwf	(_i+1),f
	
l1784:	
	movlw	high(05Bh)
	subwf	(_i+1),w
	movlw	low(05Bh)
	skipnz
	subwf	(_i),w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l1774
u2190:
	goto	l1786
	
l584:	
	line	53
	
l1786:	
	movlw	high(05h)
	subwf	(_j+1),w
	movlw	low(05h)
	skipnz
	subwf	(_j),w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l1770
u2200:
	goto	l1788
	
l582:	
	line	63
	
l1788:	
;main.c: 60: }
;main.c: 61: }
;main.c: 63: I2C_Master_Stop();
	fcall	_I2C_Master_Stop
	line	64
	
l1790:	
;main.c: 64: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_First_8bits+0)+0+2),f
movlw	163
movwf	((??_First_8bits+0)+0+1),f
	movlw	189
movwf	((??_First_8bits+0)+0),f
u2227:
	decfsz	((??_First_8bits+0)+0),f
	goto	u2227
	decfsz	((??_First_8bits+0)+0+1),f
	goto	u2227
	decfsz	((??_First_8bits+0)+0+2),f
	goto	u2227
	clrwdt
opt asmopt_on

	line	67
	
l585:	
	return
	opt stack 0
GLOBAL	__end_of_First_8bits
	__end_of_First_8bits:
;; =============== function _First_8bits ends ============

	signat	_First_8bits,90
	global	_I2C_Master_Stop
psect	text92,local,class=CODE,delta=2
global __ptext92
__ptext92:

;; *************** function _I2C_Master_Stop *****************
;; Defined at:
;;		line 78 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_First_8bits
;; This function uses a non-reentrant model
;;
psect	text92
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
	line	78
	global	__size_of_I2C_Master_Stop
	__size_of_I2C_Master_Stop	equ	__end_of_I2C_Master_Stop-_I2C_Master_Stop
	
_I2C_Master_Stop:	
	opt	stack 6
; Regs used in _I2C_Master_Stop: []
	line	79
	
l976:	
;main.c: 79: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	80
;main.c: 80: while(SSPIF==0);
	goto	l594
	
l595:	
	
l594:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u31
	goto	u30
u31:
	goto	l594
u30:
	
l596:	
	line	81
;main.c: 81: SSPIF=0;
	bcf	(99/8),(99)&7
	line	82
	
l597:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_Stop
	__end_of_I2C_Master_Stop:
;; =============== function _I2C_Master_Stop ends ============

	signat	_I2C_Master_Stop,88
	global	_I2C_Master_Write
psect	text93,local,class=CODE,delta=2
global __ptext93
__ptext93:

;; *************** function _I2C_Master_Write *****************
;; Defined at:
;;		line 85 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
;; Parameters:    Size  Location     Type
;;  d               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_First_8bits
;; This function uses a non-reentrant model
;;
psect	text93
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
	line	85
	global	__size_of_I2C_Master_Write
	__size_of_I2C_Master_Write	equ	__end_of_I2C_Master_Write-_I2C_Master_Write
	
_I2C_Master_Write:	
	opt	stack 6
; Regs used in _I2C_Master_Write: [wreg]
	line	86
	
l974:	
;main.c: 86: SSPBUF = d;
	movf	(I2C_Master_Write@d),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	87
;main.c: 87: while(SSPIF==0);
	goto	l600
	
l601:	
	
l600:	
	btfss	(99/8),(99)&7
	goto	u21
	goto	u20
u21:
	goto	l600
u20:
	
l602:	
	line	88
;main.c: 88: SSPIF=0;
	bcf	(99/8),(99)&7
	line	89
	
l603:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_Write
	__end_of_I2C_Master_Write:
;; =============== function _I2C_Master_Write ends ============

	signat	_I2C_Master_Write,4216
	global	_I2C_Master_Start
psect	text94,local,class=CODE,delta=2
global __ptext94
__ptext94:

;; *************** function _I2C_Master_Start *****************
;; Defined at:
;;		line 71 in file "C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_First_8bits
;; This function uses a non-reentrant model
;;
psect	text94
	file	"C:\Users\Mugi\OneDrive\Desktop\MUGI STORAGE\Program files\Mp Lab Programs\24LC02_EEPROM_DATA WRITE\main.c"
	line	71
	global	__size_of_I2C_Master_Start
	__size_of_I2C_Master_Start	equ	__end_of_I2C_Master_Start-_I2C_Master_Start
	
_I2C_Master_Start:	
	opt	stack 6
; Regs used in _I2C_Master_Start: []
	line	72
	
l972:	
;main.c: 72: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	73
;main.c: 73: while(SSPIF==0);
	goto	l588
	
l589:	
	
l588:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u11
	goto	u10
u11:
	goto	l588
u10:
	
l590:	
	line	74
;main.c: 74: SSPIF=0;
	bcf	(99/8),(99)&7
	line	75
	
l591:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Master_Start
	__end_of_I2C_Master_Start:
;; =============== function _I2C_Master_Start ends ============

	signat	_I2C_Master_Start,88
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
