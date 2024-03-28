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
    movb al, [r8]
    cmp r0, " "
    je 2
    cmp r0, 10
    jne 3
    add r8, 1
    jmp whit
    ret

reat:
    push r5
    ; read token
    mov r5, 0           ; token output
    mov r1, 1           ; power of 256
    
    tloo:
    sub eax, eax
    movb al, [r8]
    cmp r0, " "         ; space
    je tdon
    cmp r0, 10          ; newline
    je tdon
    cmp r0, ":"         ; label
    je tdon
    cmp r0, "."         ; period
    je tdon
    cmp r0, ","
    je tdon
    cmp r0, "]"
    je tdon
    add r8, 1
    REX.W
    mul r1
    add r5, r0
    mov r0, r1
    mov r1, 256
    REX.W
    mul r1
    mov r1, r0
    jmp tloo

    tdon:
    mov r7, r5
    call tore
    pop r5
    ret

reas:           ; read string
    push r1
    push r5
    ; read string
    add r8, 1
    mov r5, 0           ; token output
    mov r1, 1           ; power of 256
    sloo:
    sub r0, r0
    movb al, [r8]
    cmp r0, 34        ; "
    je sdon
    add r8, 1
    REX.W
    mul r1
    add r5, r0
    mov r0, r1
    mov r1, 256
    REX.W
    mul r1
    mov r1, r0
    jmp sloo

    sdon:
    add r8, 1
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
    movb dil, [r8]
    cmp r7, 34              ; "
    jne 4
    call reas
    mov r2, 1
    jmp dore
    cmp r7, "["
    jne 8
    add r8, 1
    call reat
    mov r3, 0
    sub r3, r2
    mov r2, r3
    add r8, 1
    jmp dore
    call isal
    cmp r0, 1
    jne 4
    call reat
    jmp dore

    mov r0, 0
    mov r1, 10
    mov r5, 1
    dloo:
    sub r3, r3
    movb bl, [r8]
    cmp r3, " "
    je 2
    sub r3, 10              ; newline
    je dolo
    add r8, 1
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
    jmp dloo
    dolo:
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
    cmp rdx, 0
    jg 9
    ; memory in dest, want to swap
    push r1
    push r2
    push r6
    push r7
    pop r2
    pop r1
    pop r7
    pop r6
    ; TODO: immediate to memory operand size calculation
    ; register in dest, memory in source
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

carm:
    mov r0, rsi
    shl r0, 3
    add r0, rdi

    sub r4, 8
    mov [r4], eax
    
    ; source is r4
    cmp r7, 4
    mov r7, 1
    jne 6
    add r4, 1
    mov r0, 0x24
    mov [r4], eax
    sub r4, 1
    mov r7, 2
    ; TODO: FIX r5
    call prin

    add r4, 8
    ret

evrm:
    cmp rdi, "add"
    jne 3
    mov rdi, 0x03
    jmp rmfo
    cmp rdi, "mov"
    jne 3
    mov rdi, 0x8B
    jmp rmfo
    cmp rdi, "movb"              ; movbrm
    jne 3
    mov rdi, 0x8A
    jmp rmfo
    cmp rdi, "movs"              ; movs
    jne 3
    mov rdi, 0x63
    jmp rmfo
    jne inva
    rmfo:

    push r7
    mov r7, 1
    call prin
    pop r7

    mov rdi, rdx

    call carm

    ret

evmr:
    cmp rdi, "mov"
    jne 3
    mov rdi, 0x89
    jmp mrfo
    jne inva
    mrfo:

    push r7
    mov r7, 1
    call prin
    pop r7

    mov rdi, rdx

    push r6
    push r7
    pop r6
    pop r7

    call carm

    ret

evrr:
    mov r0, rdi
    mov r1, rsi
    mov r2, rdx
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
    jne inva

    shl r1, 3

    add r1, r2
    add r1, 0xC0

    sub r4, 8
    mov [r4], ebp
    add r4, 1
    mov [r4], ecx
    sub r4, 1

    mov r7, 2
    call prin
    add r4, 8
    ret

evri: ; evaluate ri
    ; add/sub/mov/cmpri
    mov r0, rdi
    mov r1, rsi
    mov r2, rdx
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
    jne inva

    add r7, r1

    sub r4, 8
    mov [r4], esi
    add r4, 1
    mov [r4], edi
    add r4, 1
    mov [r4], edx                ; imm
    sub r4, 2

    add r5, 2
    mov r7, r5
    call prin

    add r4, 8
    ret
expr:
    ; pass mnemonic in r7
    call evri
    ret

ops2:
    push r0
    call read
    mov r1, r0
    pop r0


    add r8, 1
    push rax
    push rdx
    call read
    mov rsi, rax
    mov rdi, rdx
    pop rdx
    pop rax


    push r0
    push r1
    push r2
    push r6
    push r7

    call rex
    push r0
    mov r7, 1
    call prin                   ; print REX byte
    pop r0

    pop r7
    pop r6
    pop r2
    pop r1
    pop r0

    cmp rcx, 8                  ; normalize destination
    jl 2
    sub rcx, 8

    cmp rdi, 1                  ; normalize src
    je 4
    cmp rsi, 8
    jl 2
    sub rsi, 8


    mov rbx, rdx
    mov rbp, rdi
    mov rdx, rsi
    mov rdi, rax
    mov rsi, rcx
    cmp rbx, 1
    jl domr
    cmp rbp, 1
    jl dorm
    je dori
    jne dorr

    domr:
        call evmr
        ret
    dorm:
        call evrm
        ret
    dorr:
        call evrr
        ret
    dori:
        call evri
        ret

pars:
    call reat

    ; ret
    cmp r0, "ret"
    jne nret
    mov r0, 0xC3
    push r0
    mov r7, 1
    call prin
    pop r0
    ret
    nret:

    ; syscall
    mov r3, r0
    mov r0, "all"
    mov r1, 0x10000
    REX.W
    mul r1
    REX.W
    mul r1
    add r0, "sysc"
    mov r1, r0
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
    ret
    nsys:                   ; not sys


    ; comments
    cmp r0, 0x3B
    jne ncom
    coml:
    sub r0, r0
    movb al, [r8]
    cmp r0, 10
    je 3
    add r8, 1
    jmp coml
    sub r14, 8
    ret

    ncom:

    ; space/newline
    cmp r0, 0
    jne nspa
    add r8, 1
    sub r14, 8
    ret
    nspa:

    ; label
    sub r1, r1
    movb cl, [r8]
    cmp r1, 58
    jne nlab
    sub r14, 8
    mov r3, r14
    add r4, 8
    add r3, [r4]            ; label info array
    sub r4, 8
    mov [r3], r0
    add r8, 1
    ret
    nlab:


    ; REX
    cmp r0, "REX"
    je 2
    jne nrex
    add r8, 1
    mov r0, 0x40
    sub r1, r1
    movb cl, [r8]
    cmp r1, 0x57
    jne 3
    add r0, 8
    add r8, 1
    sub r1, r1
    movb cl, [r8]
    cmp r1, 0x52
    jne 3
    add r0, 4
    add r8, 1
    sub r1, r1
    movb cl, [r8]
    cmp r1, 0x58
    jne 3
    add r0, 2
    add r8, 1
    sub r1, r1
    movb cl, [r8]
    sub r1, 0x42
    jne 3
    add r0, 1
    add r8, 1
    sub r8, 4
    mov [r8], eax
    mov r7, r9
    mov r6, r8
    mov r2, 1
    mov r0, 1
    syscall
    add r8, 4
    ret

    nrex:

    ; 1-operands

    ; jumps
    cmp r0, "jne"        ; jne
    jne 4
    mov r2, 0x850F
    mov r3, 2
    jmp 5
    cmp r0, "jmp"        ; jmp
    jne 4
    mov r2, 0xE9
    mov r3, 1
    jmp 5
    cmp r0, "je"          ; je
    jne 4
    mov r2, 0x840F
    mov r3, 2
    jmp 5
    cmp r0, "jl"          ; jl
    jne 4
    mov r2, 0x8C0F
    mov r3, 2
    jmp 5
    cmp r0, "jg"          ; jg
    jne 4
    mov r2, 0x8F0F
    mov r3, 2
    jmp 5
    cmp r0, "call"          ; call
    jne 4
    mov r2, 0xE8
    mov r3, 1
    jmp 2
    jne njum
    add r8, 1
    push r2

    call read

    mov r5, r2
    pop r2

    sub r4, 8
    mov [r4], edx
    add r4, r3
    mov [r4], eax
    sub r4, r3
    mov r7, r3
    add r7, 4
    call prin
    add r4, 8
    mov r2, r15
    add r2, r14
    sub r2, 8
    mov r0, 2
    cmp r5, 0
    jne 2
    add r3, 256
    mov [r2], r3            ; save jump information in instruction location array
    ret

    njum:

    ; two operands

    ; mulr
    cmp r0, "mul"        ; mul
    jne 4
    mov r6, 0xF7
    mov r7, 0xE0
    jmp 5
    cmp r0, "push"        ; push
    jne 4
    mov r6, 0xFF
    mov r7, 0xF0
    jmp 5
    cmp r0, "pop"        ; pop
    jne 4
    mov r6, 0x8F
    mov r7, 0xC0
    jmp 2
    jne nr

    call read
    add r0, r7

    sub r4, 8
    mov [r4], r6
    add r4, 1
    mov [r4], eax
    sub r4, 1
    mov r7, 2
    call prin
    syscall
    add r4, 8
    ret
    nr:

    ; r1 = REX byte
    ; r2 = reg
    ; r3 = r/m/immediate
    ; r5 = opcode
    ; r6 = opcode 2

    call ops2
    ret

star:
; open input
mov r6, 0x0             ; READ_ONLY
mov r2, 0xFFFF          ; all perms
add r4, 16
mov r7, [r4]            ; argv[1]
sub r4, 16
mov r0, 2
syscall
mov r8, r0              ; save input file descriptor
; open output
mov r0, 2               ; READ_WRITE
mov r2, 0xFFFF          ; all perms
mov r6, 0x242           ; truncate/create/.??
add r4, 24
mov r7, [r4]            ; argv[2]
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
sub r4, 0xC0            ; fstat size
mov r7, r8              ; input file descriptor
mov r6, r4              ; fstat buffer
mov r0, 5               ; fstat
syscall
add r4, 48
mov r10, [r4]            ; file size
sub r4, 48

; mmap input
REX.WB
push r1                 ; save r9
REX.WB                  
push r2                 ; save r10

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

add r10, r8

main:
    ; main loop
    cmp r8, r10
    jl cont
    ; end of file
    ; fix jumps
fixj:
    mov r0, r13
    sub r0, r14
    je exit
    mov r3, r13
    mov r3, [r3]
    ; read opcode
    ; lseek
    mov r7, r9
    mov r6, r3
    mov r2, 0
    mov r0, 8
    syscall
    mov r0, r13
    add r0, r15
    mov ebp, [r0]                ; get jump info

    ; read instruction stuffs
    sub r4, 6
    mov r6, r4
    mov r2, 6                   ; TODO: read amount based on instruction id length
    mov r0, 0
    syscall                     ; read instruction

    cmp r5, 0
    je skip

    cmp r5, 256
    jl rel
    sub r5, 256
    add r4, 6
    pop r0                      ; label info offset
    pop r1                      ; array location
    push r1
    push r0
    sub r4, 6
    add r1, r0
    add r4, r5
    mov r7, [r4]
    sub r4, r5
    mov r2, [r1]                ; get label at r0
    cmp edx, edi
    je 3
    add r1, 8
    jmp -4
    sub r1, r0
    mov r2, [r1]
    jmp drel

rel:
    add r4, r5
    movs r0, [r4]
    sub r4, r5
    mov r2, r13
    shl r0, 3
    add r2, r0
    mov edx, [r2]

drel:
    sub r2, r3
    sub r2, 4
    sub r2, r5
    mov [r4], edx
    ; lseek
    mov r7, r9
    mov r6, r5
    sub r6, 6
    mov r2, 1
    mov r0, 8
    syscall

    mov r7, r9
    mov r6, r4
    mov r2, 4
    mov r0, 1
    syscall                     ; write jump offset

skip:
    REX.W
    add r4, 6
    REX.WB
    add r13, 8
    jmp fixj

    
cont:
    mov r7, r9
    mov r6, 0
    mov r2, 1
    mov r0, 8
    syscall                     ; lseek save current instruction position
    mov [r14], r0
    add r14, 8

call pars
jmp main

inva:

; invalid
sub r4, 4
mov r0, 10
mov [r4], eax
sub r4, 4
mov r0, "ion"
mov [r4], eax
sub r4, 4
mov r0, "ruct"
mov [r4], eax
sub r4, 4
mov r0, "inst"
mov [r4], eax
sub r4, 4
mov r0, "lid "
mov [r4], eax
sub r4, 4
mov r0, "inva"
mov [r4], eax

mov r7, 21
mov r9, 0
call prin

pop r0
pop r0
pop r0

call exit
jmp 0
mov r0, r0
