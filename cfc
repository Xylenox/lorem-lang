; register layout
; ----------------
; r4 = pointer to input
; r9 = output file descriptor
; r10 = characters remaining in input
;
jmp star

exit:
    mov r0, 60
    mov r7, 0
    syscall

prin:                   ; printst
push r0
push r1
push r2
push r6
push r7
REX.WB
push r3
mov r2, r7
mov r7, r9
mov r6, r4
add r6, 56
mov r0, 1
syscall
REX.WB
pop r3
pop r7
pop r6
pop r2
pop r1
pop r0
ret

isal:           ; is alpha
cmp r7, 97      ; a
jl nalp
cmp r7, 123     ; z
jl yalp
jmp nalp
yalp:
mov r0, 1
ret
nalp:
mov r0, 0
ret

tore:           ; to register
    ; 8-bit registers
    cmp r7, "al"
    jne 4
    mov r0, 0
    mov r2, 8
    ret
    cmp r7, "cl"
    jne 4
    mov r0, 1
    mov r2, 8
    ret
    cmp r7, "dl"
    jne 4
    mov r0, 2
    mov r2, 8
    ret
    cmp r7, "bl"
    jne 4
    mov r0, 3
    mov r2, 8
    ret
    cmp r7, "spl"
    jne 4
    mov r0, 4
    mov r2, 8
    ret
    cmp r7, "bpl"
    jne 4
    mov r0, 5
    mov r2, 8
    ret
    cmp r7, "sil"
    jne 4
    mov r0, 6
    mov r2, 8
    ret
    cmp r7, "dil"
    jne 4
    mov r0, 7
    mov r2, 8
    ret
    cmp r7, "r8b"
    jne 4
    mov r0, 8
    mov r2, 8
    ret
    cmp r7, "r9b"
    jne 4
    mov r0, 9
    mov r2, 8
    ret
    cmp r7, "r10b"
    jne 4
    mov r0, 10
    mov r2, 8
    ret
    cmp r7, "r11b"
    jne 4
    mov r0, 11
    mov r2, 8
    ret
    cmp r7, "r12b"
    jne 4
    mov r0, 12
    mov r2, 8
    ret
    cmp r7, "r13b"
    jne 4
    mov r0, 13
    mov r2, 8
    ret
    cmp r7, "r14b"
    jne 4
    mov r0, 14
    mov r2, 8
    ret
    cmp r7, "r15b"
    jne 4
    mov r0, 15
    mov r2, 8
    ret
    cmp r7, "ax"
    jne 4
    mov r0, 0
    mov r2, 16
    ret
    cmp r7, "cx"
    jne 4
    mov r0, 1
    mov r2, 16
    ret
    cmp r7, "dx"
    jne 4
    mov r0, 2
    mov r2, 16
    ret
    cmp r7, "bx"
    jne 4
    mov r0, 3
    mov r2, 16
    ret
    cmp r7, "sp"
    jne 4
    mov r0, 4
    mov r2, 16
    ret
    cmp r7, "bp"
    jne 4
    mov r0, 5
    mov r2, 16
    ret
    cmp r7, "si"
    jne 4
    mov r0, 6
    mov r2, 16
    ret
    cmp r7, "di"
    jne 4
    mov r0, 7
    mov r2, 16
    ret
    cmp r7, "r8w"
    jne 4
    mov r0, 8
    mov r2, 16
    ret
    cmp r7, "r9w"
    jne 4
    mov r0, 9
    mov r2, 16
    ret
    cmp r7, "r10w"
    jne 4
    mov r0, 10
    mov r2, 16
    ret
    cmp r7, "r11w"
    jne 4
    mov r0, 11
    mov r2, 16
    ret
    cmp r7, "r12w"
    jne 4
    mov r0, 12
    mov r2, 16
    ret
    cmp r7, "r13w"
    jne 4
    mov r0, 13
    mov r2, 16
    ret
    cmp r7, "r14w"
    jne 4
    mov r0, 14
    mov r2, 16
    ret
    cmp r7, "r15w"
    jne 4
    mov r0, 15
    mov r2, 16
    ret
    cmp r7, "eax"
    jne 4
    mov r0, 0
    mov r2, 32
    ret
    cmp r7, "ecx"
    jne 4
    mov r0, 1
    mov r2, 32
    ret
    cmp r7, "edx"
    jne 4
    mov r0, 2
    mov r2, 32
    ret
    cmp r7, "ebx"
    jne 4
    mov r0, 3
    mov r2, 32
    ret
    cmp r7, "esp"
    jne 4
    mov r0, 4
    mov r2, 32
    ret
    cmp r7, "ebp"
    jne 4
    mov r0, 5
    mov r2, 32
    ret
    cmp r7, "esi"
    jne 4
    mov r0, 6
    mov r2, 32
    ret
    cmp r7, "edi"
    jne 4
    mov r0, 7
    mov r2, 32
    ret
    cmp r7, "r8d"
    jne 4
    mov r0, 8
    mov r2, 32
    ret
    cmp r7, "r9d"
    jne 4
    mov r0, 9
    mov r2, 32
    ret
    cmp r7, "r10d"
    jne 4
    mov r0, 10
    mov r2, 32
    ret
    cmp r7, "r11d"
    jne 4
    mov r0, 11
    mov r2, 32
    ret
    cmp r7, "r12d"
    jne 4
    mov r0, 12
    mov r2, 32
    ret
    cmp r7, "r13d"
    jne 4
    mov r0, 13
    mov r2, 32
    ret
    cmp r7, "r14d"
    jne 4
    mov r0, 14
    mov r2, 32
    ret
    cmp r7, "r15d"
    jne 4
    mov r0, 15
    mov r2, 32
    ret
    cmp r7, "rax"
    jne 4
    mov r0, 0
    mov r2, 64
    ret
    cmp r7, "rcx"
    jne 4
    mov r0, 1
    mov r2, 64
    ret
    cmp r7, "rdx"
    jne 4
    mov r0, 2
    mov r2, 64
    ret
    cmp r7, "rbx"
    jne 4
    mov r0, 3
    mov r2, 64
    ret
    cmp r7, "rsp"
    jne 4
    mov r0, 4
    mov r2, 64
    ret
    cmp r7, "rbp"
    jne 4
    mov r0, 5
    mov r2, 64
    ret
    cmp r7, "rsi"
    jne 4
    mov r0, 6
    mov r2, 64
    ret
    cmp r7, "rdi"
    jne 4
    mov r0, 7
    mov r2, 64
    ret
    cmp r7, "r8"
    jne 4
    mov r0, 8
    mov r2, 64
    ret
    cmp r7, "r9"
    jne 4
    mov r0, 9
    mov r2, 64
    ret
    cmp r7, "r10"
    jne 4
    mov r0, 10
    mov r2, 64
    ret
    cmp r7, "r11"
    jne 4
    mov r0, 11
    mov r2, 64
    ret
    cmp r7, "r12"
    jne 4
    mov r0, 12
    mov r2, 64
    ret
    cmp r7, "r13"
    jne 4
    mov r0, 13
    mov r2, 64
    ret
    cmp r7, "r14"
    jne 4
    mov r0, 14
    mov r2, 64
    ret
    cmp r7, "r15"
    jne 4
    mov r0, 15
    mov r2, 64
    ret
    cmp r7, "r0"
    jne 4
    mov r0, 0
    mov r2, 64
    ret
    cmp r7, "r1"
    jne 4
    mov r0, 1
    mov r2, 64
    ret
    cmp r7, "r2"
    jne 4
    mov r0, 2
    mov r2, 64
    ret
    cmp r7, "r3"
    jne 4
    mov r0, 3
    mov r2, 64
    ret
    cmp r7, "r4"
    jne 4
    mov r0, 4
    mov r2, 64
    ret
    cmp r7, "r5"
    jne 4
    mov r0, 5
    mov r2, 64
    ret
    cmp r7, "r6"
    jne 4
    mov r0, 6
    mov r2, 64
    ret
    cmp r7, "r7"
    jne 4
    mov r0, 7
    mov r2, 64
    ret

mov r0, r7
mov r2, 0
ret


whit:
    sub r0, r0
    REX.B
    movb r0, [r0]
    cmp r0, " "
    je 2
    cmp r0, 10
    jne 4
    add r8, 1
    sub r10, 1
    jmp whit
    ret

reat:
    push r1
    push r5
    push r7
    ; read token
    mov r5, 0           ; token output
    mov r1, 1           ; power of 256
    sub r0, r0
    REX.B
    movb r0, [r0]
    cmp r0, " "         ; space
    je 2
    cmp r0, 10          ; newline
    je 2
    cmp r0, ":"         ; label
    je 2
    cmp r0, "."         ; period
    je 2
    cmp r0, ","
    je 16
    add r8, 1
    REX.WB
    sub r10, 1
    REX.W
    mul r1
    REX.W
    add r5, r0
    REX.W
    mov r0, r1
    mov r1, 256
    REX.W
    mul r1
    REX.W
    mov r1, r0
    jmp -27

    REX.W
    mov r7, r5
    call tore
    pop r7
    pop r5
    pop r1
    ret

reas:           ; read string
    push r1
    push r5
    ; read string
    add r8, 1
    sub r10, 1
    mov r5, 0           ; token output
    mov r1, 1           ; power of 256
    sloo:
    sub r0, r0
    REX.B
    movb r0, [r0]
    cmp r0, 34        ; "
    je 15
    add r8, 1
    sub r10, 1
    REX.W
    mul r1
    REX.W
    add r5, r0
    REX.W
    mov r0, r1
    mov r1, 256
    REX.W
    mul r1
    REX.W
    mov r1, r0
    jmp sloo
    REX.W
    add r8, 1
    sub r10, 1
    mov r0, r5
    pop r5
    pop r1
    ret

read:           ; read number
    push r1
    push r3
    push r5
    push r7

    call whit

    sub r7, r7
    REX.B
    movb r7, [r0]
    cmp r7, 34
    jne 4
    call reas
    mov r2, 1
    jmp dore
    call isal
    cmp r0, 1
    jne 4
    call reat
    jmp dore

    mov r0, 0
    mov r1, 10
    mov r5, 1
    sub r3, r3
    REX.B
    movb r3, [r0]
    cmp r3, " "
    je 2
    sub r3, 10              ; newline
    je 27
    REX.W
    add r8, 1
    REX.WB
    sub r10, 1
    add r3, 10
    cmp r1, 256
    je 17
    sub r3, 0x2D
    jne 3
    mov r5, -1
    jmp 5
    add r3, 0x2D
    sub r3, 0x78
    jne 3
    mov r1, 16
    jmp 10
    add r3, 0x78
    sub r3, 0x41
    jl 3
    add r3, 10
    jmp 3
    add r3, 0x41
    sub r3, 0x30
    mul r1
    add r0, r3
    jmp -32
    mul r5

    mov r2, 1           ; type is integer

    dore:               ; done read
    pop r7
    pop r5
    pop r3
    pop r1
ret

rex:            ; encoding calculation, returns REX in r0 and 
; source in rsi, rdi
; dest in rcx, rdx

mov rax, 0x40            ; right now it is only registers allowed in dest
cmp rdx, 64
jne 2
; 64 bit
add r0, 0x08
cmp rdi, 1 
jne 5
cmp rcx, 8              ; ri
jl 2
add rax, 0x01           ; REX.B
ret
cmp rcx, 8              ; rr 
jl 2
add rax, 0x04           ; REX.R
cmp rsi, 8
jl 2
add rax, 0x01           ; REX.B
ret

star:
; open input
mov r6, 0x0             ; READ_ONLY
mov r2, 0xFFFF          ; all perms
add r4, 16
REX.W
mov r7, [r4]            ; argv[1]
sub r4, 16
mov r0, 2
syscall
mov r8, r0              ; save input file descriptor
; open output
mov r0, 2               ; READ_WRITE
mov r2, 0xFFFF          ; all perms
mov r6, 0x242           ; truncate/create/.??
REX.W
add r4, 24
REX.W
mov r7, [r4]            ; argv[2]
REX.W
sub r4, 24
syscall
mov r9, r0              ; save output file descriptor
; write header
mov r7, r9              ; output file descriptor
mov r6, 0x400000        ; program header location
mov r2, 0x78            ; program header length
mov r0, 1               ; write
syscall
; get input size
REX.W
sub r4, 0xC0            ; fstat size
mov r7, r8              ; input file descriptor
REX.W
mov r6, r4              ; fstat buffer
mov r0, 5               ; fstat
syscall
REX.W
add r4, 48
REX.WR
mov r2, [r4]            ; file size
REX.W
sub r4, 48

; mmap input
REX.WB
push r1                 ; save r9
REX.WB                  ; save r10
push r2

mov r0, 9               ; mmap
mov r7, 0               ; address
mov r6, r10              ; length
mov r2, 3               ; PROT_READ | PROT_WRITE
mov r10, 2              ; MAP_PRIVATE
mov r9, 0               ; offset
syscall

mov r8, r0              ; save mmap address
REX.WB
pop r2                  ; restore r10
REX.WB
pop r1                  ; restore r9


; make heap
mov r7, 0               ; adress
mov r6, r10              ; length
REX.WB
push r2                 ; save length
shl r6, 4

mov r2, 3               ; PROT_READ | PROT_WRITE
mov r10, 0x22           ; MAP_SHARED | MAP_ANONYMOUS
REX.WB
push r0                 ; save r8
REX.WB
push r1                 ; save r9
mov r8, -1              ; file descriptor empty, anonymous
mov r9, 0               ; offset
mov r0, 9               ; mmap
syscall
REX.WB
pop r1                  ; restore r9
REX.WB
pop r0                  ; restore r8
REX.WB
pop r2                  ; restore r10
mov r13, r0              ; save instruction location array
mov r14, r0              ; save instruction location array end
mov r15, r10              ; store max length of instruction location array
add r15, r15
REX.R
push r7                 ; save jump info array
mov r0, r15
add r0, r15
REX.WB
push r5
REX.W
push r0                 ; save label info array



main:
; main loop
sub r10, 0
jne 18
; end of file
; fix jumps
REX.WB
mov r0, r13
REX.WB
sub r0, r14
je 14
REX.WB
mov r3, r13
REX.W
mov r3, [r3]
; read opcode
; lseek
REX.WB
mov r7, r9
REX.W
mov r6, r3
mov r2, 0
mov r0, 8
syscall
jmp 5
jmp 66
jmp 66
jmp -19
jmp -22
REX.WB
mov r0, r13
REX.WB
add r0, r15
mov r5, [r0]                ; get jump info



; read instruction stuffs
REX.W
sub r4, 6
REX.W
mov r6, r4
mov r2, 6                   ; TODO: read amount based on instruction id length
mov r0, 0
syscall                     ; read instruction



sub r5, 0
je 71

cmp r5, 256
jl 27
sub r5, 256
add r4, 6
pop r0                      ; label info offset
pop r1                      ; array location
push r1
push r0
sub r4, 6
REX.W
add r1, r0
REX.W
add r4, r5
REX.W
mov r7, [r4]
REX.W
sub r4, r5
REX.W
mov r2, [r1]                ; get label at r0
cmp edx, edi
je 3
add r1, 8
jmp -5
REX.W
sub r1, r0
REX.W
mov r2, [r1]
jmp 18

REX.W
add r4, r5
REX.W
movs r0, [r4]
REX.W
sub r4, r5
REX.WB
mov r2, r13
REX.W
add r0, r0
REX.W
add r0, r0
REX.W
add r0, r0
REX.W
add r2, r0
mov r2, [r2]
REX.W
sub r2, r3
jmp 5
jmp 30
jmp 26
jmp -66
jmp -66
sub r2, 4
sub r2, r5
mov [r4], r2
; lseek
REX.WB
mov r7, r9
mov r6, r5
REX.W
sub r6, 6
mov r2, 1
mov r0, 8
syscall

REX.WB
mov r7, r9
REX.W
mov r6, r4
mov r2, 4
mov r0, 1
syscall                     ; write jump offset

REX.W
add r4, 6
REX.WB
add r13, 8
jmp -24
; exit
mov r0, 60
mov r7, 0
syscall
; lseek
REX.WB
mov r7, r9
mov r6, 0
mov r2, 1
mov r0, 8
syscall
REX.WB
mov [r6], r0
REX.WB
add r14, 8
jmp 2
jmp main


call reat

; ret
cmp r0, "ret"
jne nret
mov r0, 0xC3
push r0
mov r7, 1
call prin
pop r0
jmp main
nret:

; syscall
REX.W
mov r3, r0
mov r0, "all"
mov r1, 0x10000
REX.W
mul r1
REX.W
mul r1
REX.W
add r0, "sysc"
REX.W
mov r1, r0
REX.W
mov r0, r3
cmp r0, r1
je 2
jne nsys
sub r8, 4
mov r0, 0x050F
push r0
mov r7, 2
call prin
pop r0
add r8, 4
sub r10, 0
jmp main
nsys:                   ; not sys





; comments
cmp r0, 0x3B
jne 13
sub r0, r0
REX.B
movb r0, [r0]
cmp r0, 10
je 6
add r8, 1
REX.WB
sub r10, 1
jmp -8
REX.WB
sub r14, 8
jmp -14


; space/newline
cmp r0, 0
jne 6
REX.W
add r8, 1
sub r10, 1
sub r14, 8
jmp -7


; label
sub r1, r1
REX.B
movb r1, [r0]
cmp r1, 58
jne 11
sub r14, 8
REX.WB
mov r3, r14
REX.W
add r3, [r4]
REX.W
mov [r3], r0
add r8, 1
sub r10, 1
jmp -15


; REX
cmp r0, 0x584552
je 2
jne 55
add r8, 1
REX.WB
sub r10, 1
mov r0, 0x40
sub r1, r1
REX.B
movb r1, [r0]
cmp r1, 0x57
jne 5
add r0, 8
add r8, 1
REX.WB
sub r10, 1
sub r1, r1
REX.B
movb r1, [r0]
cmp r1, 0x52
jne 5
add r0, 4
add r8, 1
REX.WB
sub r10, 1
sub r1, r1
REX.B
movb r1, [r0]
cmp r1, 0x58
jne 5
add r0, 2
add r8, 1
REX.WB
sub r10, 1
sub r1, r1
REX.B
movb r1, [r0]
sub r1, 0x42
jne 6
add r0, 1
REX.W
add r8, 1
REX.WB
sub r10, 1
sub r8, 4
REX.B
mov [r0], r0
REX.WB
mov r7, r9
REX.WB
mov r6, r8
mov r2, 1
mov r0, 1
syscall
REX.W
add r8, 4
jmp main



; read first operand


; 1-operands

; mulr
cmp r0, 0x6C756D        ; mul
jne 4
mov r2, 0xF7
mov r3, 0xE0
jmp 5
cmp r0, 0x68737570        ; push
jne 4
mov r2, 0xFF
mov r3, 0xF0
jmp 5
cmp r0, 0x706F70        ; pop
jne 4
mov r2, 0x8F
mov r3, 0xC0
jmp 2
jne 9
REX.WB
mov r7, r8
REX.W
add r7, 1
sub r1, r1
movb r1, [r7]
sub r1, 0x72
je 3
jne 27
jmp -26
sub r8, 3
REX.B
mov [r0], r2
add r8, 5
REX.B
mov r0, [r0]
sub r0, 0x30
add r0, r3
sub r8, 4
REX.B
mov [r0], r0
REX.W
sub r8, 1
REX.WB
mov r7, r9
REX.WB
mov r6, r8
mov r2, 2
mov r0, 1
syscall
REX.W
add r8, 6
REX.WB
sub r10, 3
jmp main



; jumps
cmp r0, 0x656E6A        ; jne
jne 4
mov r2, 0x850F
mov r3, 2
jmp 5
cmp r0, 0x706D6A        ; jmp
jne 4
mov r2, 0xE9
mov r3, 1
jmp 5
cmp r0, 0x656A          ; je
jne 4
mov r2, 0x840F
mov r3, 2
jmp 5
cmp r0, 0x6C6A          ; jl
jne 4
mov r2, 0x8C0F
mov r3, 2
jmp 5
cmp r0, 0x6C6C6163          ; call
jne 4
mov r2, 0xE8
mov r3, 1
jmp 2
jne njum
REX.W
add r8, 1
push r2

call read

mov r5, r2
pop r2

sub r8, 7
REX.B
mov [r0], r2
REX.WR
add r8, r3
REX.B
mov [r0], r0
REX.WR
sub r8, r3
REX.WB
mov r7, r9
REX.WB
mov r6, r8
mov r2, r3
add r2, 4
mov r0, 1
syscall
REX.W
add r8, 7
REX.WB
sub r10, 1
REX.WB
mov r2, r15
REX.WB
add r2, r14
REX.W
sub r2, 8
mov r0, 2
cmp r5, 0
jne 2
add r3, 256
REX.W
mov [r2], r3            ; save jump information in instruction location array
jmp main

njum:

; two operands

; movmr
cmp r0, 0x766F6D
je 2
jne 9
REX.WB
mov r3, r8
REX.W
add r3, 7
sub r1, r1
movb r1, [r3]
sub r1, 0x72
je 2
jne 7
REX.W
sub r3, 6
sub r1, r1
movb r1, [r3]
cmp r1, 0x5B
je 2
jne 17
add r8, 8
REX.B
movb r0, [r0]
sub r0, 0x30
add r0, r0
add r0, r0
add r0, r0
sub r8, 5
sub r1, r1
REX.B
movb r1, [r0]
REX.B
add r0, [r0]
sub r0, 0x30
sub r8, 6
jmp 3
jmp 30
jmp -37
mov r2, 0x89
REX.B
mov [r0], r2
add r8, 1
REX.B
mov [r0], r0
sub r8, 1
mov r2, 2
; source is r4
sub r1, 0x34
jne 8
add r8, 2
mov r0, 0x24
REX.B
mov [r0], r0
REX.W
sub r8, 2
mov r2, 3
REX.WB
mov r7, r9
REX.WB
mov r6, r8
mov r0, 1
syscall
REX.W
add r8, 12
REX.WB
sub r10, 9
jmp main




; add/mov/movbrm
    cmp r0, "add"
    jne 3
    mov r2, 3
    jmp 4
    cmp r0, "mov"
    jne 3
    mov r2, 0x8B
    jmp 4
    cmp r0, "movb"              ; movbrm
    jne 3
    mov r2, 0x8A
    jmp 4
    cmp r0, "movs"              ; movs
    jne 3
    mov r2, 0x63
    jmp 2
    jne nrm
    REX.WB
    mov r3, r8
    REX.W
    add r3, 1
    sub r1, r1
    movb r1, [r3]
    cmp r1, 0x72
    jne nrm
    add r3, 2
    mov r1, [r3]
    cmp r1, 0x725B202C
    jne nrm
    add r8, 2
    REX.B
    movb r0, [r0]
    sub r0, 0x30
    add r0, r0
    add r0, r0
    add r0, r0
    add r8, 5
    sub r1, r1
    REX.B
    movb r1, [r0]
    REX.B
    add r0, [r0]
    sub r0, 0x30
    sub r8, 10
    REX.B
    mov [r0], r2
    add r8, 1
    REX.B
    mov [r0], r0
    sub r8, 1
    mov r2, 2
    ; source is r4
    sub r1, 0x34
    jne 8
    REX.W
    add r8, 2
    mov r0, 0x24
    REX.B
    mov [r0], r0
    sub r8, 2
    mov r2, 3
    REX.WB
    mov r7, r9
    REX.WB
    mov r6, r8
    mov r0, 1
    syscall
    REX.W
    add r8, 12
    REX.WB
    sub r10, 9
    jmp main

    nrm:



; r1 = REX byte
; r2 = reg
; r3 = r/m/immediate
; r5 = opcode
; r6 = opcode 2

push r0
call read
mov r1, r0

add r8, 1
sub r10, 1


push r2
call read
mov rsi, rax
mov rdi, rdx
pop r2

call rex
push r7
push r0
mov r7, 1
call prin                   ; print REX byte
pop r0
pop r7

cmp rcx, 8                  ; normalize destination
jl 2
sub rcx, 8

cmp rdi, 1                  ; normalize src
je 4
cmp rsi, 8
jl 2
sub rsi, 8
; ptr will now be at space after the comma

cmp rdi, 1
mov r2, rsi
pop r0
je nrr


; sub/add/movrr
cmp r0, "add"        ; add
jne 3
mov r5, 0x03
jmp 4
cmp r0, "sub"        ; sub
jne 3
mov r5, 0x2B
jmp 4
cmp r0, "mov"        ; mov
jne 3
mov r5, 0x8B
jmp 4
cmp r0, "cmp"        ; cmp
jne 3
mov r5, 0x3B
jmp 2
jne nrr

shl r1, 3

add r1, r2
add r1, 0xC0

sub r4, 8
mov [r4], r5
add r4, 1
mov [r4], r1
sub r4, 1

mov r7, 2
call prin
add r4, 8

jmp main

nrr:


; add/sub/mov/cmpri
cmp r0, "add"
jne 5
mov r5, 4
mov r6, 0x81
mov r7, 0xC0
jmp 6
cmp r0, "sub"
jne 5
mov r5, 4
mov r6, 0x81
mov r7, 0xE8
jmp 6
cmp r0, "mov"
jne 5
mov r5, 4
mov r6, 0xC7
mov r7, 0xC0
jmp 6
cmp r0, "cmp"
jne 5
mov r5, 4
mov r6, 0x81
mov r7, 0xF8
jmp 6
cmp r0, "shl"
jne 5
mov r5, 1
mov r6, 0xC1
mov r7, 0xE0
jmp 6
cmp r0, "shr"
jne 5
mov r5, 1
mov r6, 0xC1
mov r7, 0xE8
jmp 2
jne nri


add r7, r1

push r7

pop r7


sub r4, 8
mov [r4], r6
add r4, 1
mov [r4], r7
add r4, 1
mov [r4], r2                ; imm
sub r4, 2

add r5, 2
mov r7, r5
call prin

add r4, 8
jmp main

nri:


; invalid
sub r4, 4
mov r0, 10
mov [r4], r0
sub r4, 4
mov r0, "ion"
mov [r4], r0
sub r4, 4
mov r0, "ruct"
mov [r4], r0
sub r4, 4
mov r0, "inst"
mov [r4], r0
sub r4, 4
mov r0, "lid "
mov [r4], r0
sub r4, 4
mov r0, "inva"
mov [r4], r0

mov r7, 21
mov r9, 0
call prin

pop r0
pop r0
pop r0

call exit
jmp 0
mov r0, r0
