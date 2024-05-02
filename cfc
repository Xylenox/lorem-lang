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
push r11
mov r2, r7
mov r7, r9
mov r6, r4
add r6, 56
mov r0, 1
syscall
pop r11
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
    mov r2, 0x14
    ret
    cmp r7, "cl"
    jne 4
    mov r0, 1
    mov r2, 0x14
    ret
    cmp r7, "dl"
    jne 4
    mov r0, 2
    mov r2, 0x14
    ret
    cmp r7, "bl"
    jne 4
    mov r0, 3
    mov r2, 0x14
    ret
    cmp r7, "spl"
    jne 4
    mov r0, 4
    mov r2, 0x14
    ret
    cmp r7, "bpl"
    jne 4
    mov r0, 5
    mov r2, 0x14
    ret
    cmp r7, "sil"
    jne 4
    mov r0, 6
    mov r2, 0x14
    ret
    cmp r7, "dil"
    jne 4
    mov r0, 7
    mov r2, 0x14
    ret
    cmp r7, "r8b"
    jne 4
    mov r0, 8
    mov r2, 0x14
    ret
    cmp r7, "r9b"
    jne 4
    mov r0, 9
    mov r2, 0x14
    ret
    cmp r7, "r10b"
    jne 4
    mov r0, 10
    mov r2, 0x14
    ret
    cmp r7, "r11b"
    jne 4
    mov r0, 11
    mov r2, 0x14
    ret
    cmp r7, "r12b"
    jne 4
    mov r0, 12
    mov r2, 0x14
    ret
    cmp r7, "r13b"
    jne 4
    mov r0, 13
    mov r2, 0x14
    ret
    cmp r7, "r14b"
    jne 4
    mov r0, 14
    mov r2, 0x14
    ret
    cmp r7, "r15b"
    jne 4
    mov r0, 15
    mov r2, 0x14
    ret
    cmp r7, "ax"
    jne 4
    mov r0, 0
    mov r2, 0x24
    ret
    cmp r7, "cx"
    jne 4
    mov r0, 1
    mov r2, 0x24
    ret
    cmp r7, "dx"
    jne 4
    mov r0, 2
    mov r2, 0x24
    ret
    cmp r7, "bx"
    jne 4
    mov r0, 3
    mov r2, 0x24
    ret
    cmp r7, "sp"
    jne 4
    mov r0, 4
    mov r2, 0x24
    ret
    cmp r7, "bp"
    jne 4
    mov r0, 5
    mov r2, 0x24
    ret
    cmp r7, "si"
    jne 4
    mov r0, 6
    mov r2, 0x24
    ret
    cmp r7, "di"
    jne 4
    mov r0, 7
    mov r2, 0x24
    ret
    cmp r7, "r8w"
    jne 4
    mov r0, 8
    mov r2, 0x24
    ret
    cmp r7, "r9w"
    jne 4
    mov r0, 9
    mov r2, 0x24
    ret
    cmp r7, "r10w"
    jne 4
    mov r0, 10
    mov r2, 0x24
    ret
    cmp r7, "r11w"
    jne 4
    mov r0, 11
    mov r2, 0x24
    ret
    cmp r7, "r12w"
    jne 4
    mov r0, 12
    mov r2, 0x24
    ret
    cmp r7, "r13w"
    jne 4
    mov r0, 13
    mov r2, 0x24
    ret
    cmp r7, "r14w"
    jne 4
    mov r0, 14
    mov r2, 0x24
    ret
    cmp r7, "r15w"
    jne 4
    mov r0, 15
    mov r2, 0x24
    ret
    cmp r7, "eax"
    jne 4
    mov r0, 0
    mov r2, 0x44
    ret
    cmp r7, "ecx"
    jne 4
    mov r0, 1
    mov r2, 0x44
    ret
    cmp r7, "edx"
    jne 4
    mov r0, 2
    mov r2, 0x44
    ret
    cmp r7, "ebx"
    jne 4
    mov r0, 3
    mov r2, 0x44
    ret
    cmp r7, "esp"
    jne 4
    mov r0, 4
    mov r2, 0x44
    ret
    cmp r7, "ebp"
    jne 4
    mov r0, 5
    mov r2, 0x44
    ret
    cmp r7, "esi"
    jne 4
    mov r0, 6
    mov r2, 0x44
    ret
    cmp r7, "edi"
    jne 4
    mov r0, 7
    mov r2, 0x44
    ret
    cmp r7, "r8d"
    jne 4
    mov r0, 8
    mov r2, 0x44
    ret
    cmp r7, "r9d"
    jne 4
    mov r0, 9
    mov r2, 0x44
    ret
    cmp r7, "r10d"
    jne 4
    mov r0, 10
    mov r2, 0x44
    ret
    cmp r7, "r11d"
    jne 4
    mov r0, 11
    mov r2, 0x44
    ret
    cmp r7, "r12d"
    jne 4
    mov r0, 12
    mov r2, 0x44
    ret
    cmp r7, "r13d"
    jne 4
    mov r0, 13
    mov r2, 0x44
    ret
    cmp r7, "r14d"
    jne 4
    mov r0, 14
    mov r2, 0x44
    ret
    cmp r7, "r15d"
    jne 4
    mov r0, 15
    mov r2, 0x44
    ret
    cmp r7, "rax"
    jne 4
    mov r0, 0
    mov r2, 0x84
    ret
    cmp r7, "rcx"
    jne 4
    mov r0, 1
    mov r2, 0x84
    ret
    cmp r7, "rdx"
    jne 4
    mov r0, 2
    mov r2, 0x84
    ret
    cmp r7, "rbx"
    jne 4
    mov r0, 3
    mov r2, 0x84
    ret
    cmp r7, "rsp"
    jne 4
    mov r0, 4
    mov r2, 0x84
    ret
    cmp r7, "rbp"
    jne 4
    mov r0, 5
    mov r2, 0x84
    ret
    cmp r7, "rsi"
    jne 4
    mov r0, 6
    mov r2, 0x84
    ret
    cmp r7, "rdi"
    jne 4
    mov r0, 7
    mov r2, 0x84
    ret
    cmp r7, "r8"
    jne 4
    mov r0, 8
    mov r2, 0x84
    ret
    cmp r7, "r9"
    jne 4
    mov r0, 9
    mov r2, 0x84
    ret
    cmp r7, "r10"
    jne 4
    mov r0, 10
    mov r2, 0x84
    ret
    cmp r7, "r11"
    jne 4
    mov r0, 11
    mov r2, 0x84
    ret
    cmp r7, "r12"
    jne 4
    mov r0, 12
    mov r2, 0x84
    ret
    cmp r7, "r13"
    jne 4
    mov r0, 13
    mov r2, 0x84
    ret
    cmp r7, "r14"
    jne 4
    mov r0, 14
    mov r2, 0x84
    ret
    cmp r7, "r15"
    jne 4
    mov r0, 15
    mov r2, 0x84
    ret
    cmp r7, "r0"
    jne 4
    mov r0, 0
    mov r2, 0x84
    ret
    cmp r7, "r1"
    jne 4
    mov r0, 1
    mov r2, 0x84
    ret
    cmp r7, "r2"
    jne 4
    mov r0, 2
    mov r2, 0x84
    ret
    cmp r7, "r3"
    jne 4
    mov r0, 3
    mov r2, 0x84
    ret
    cmp r7, "r4"
    jne 4
    mov r0, 4
    mov r2, 0x84
    ret
    cmp r7, "r5"
    jne 4
    mov r0, 5
    mov r2, 0x84
    ret
    cmp r7, "r6"
    jne 4
    mov r0, 6
    mov r2, 0x84
    ret
    cmp r7, "r7"
    jne 4
    mov r0, 7
    mov r2, 0x84
    ret

mov r0, r7
mov r2, 0
ret


whit:
    cmpb [r8], " "
    je 2
    cmpb [r8], 10
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
    cmp eax, " "         ; space
    je tdon
    cmp eax, 10          ; newline
    je tdon
    cmp eax, ":"         ; label
    je tdon
    cmp eax, "."         ; period
    je tdon
    cmp eax, ","
    je tdon
    cmp eax, "]"
    je tdon
    cmp eax, "+"
    je tdon
    cmp eax, "*"
    je tdon
    add r8, 1
    mul r1
    add r5, r0
    mov r0, r1
    mov r1, 256
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
    mul r1
    add r5, r0
    mov r0, r1
    mov r1, 256
    mul r1
    mov r1, r0
    jmp sloo

    sdon:
    add r8, 1
    mov r0, r5
    pop r5
    pop r1
    ret

ream:
    add r8, 1
    ; call reat

    ; base in rdi
    ; scale in rsi
    ; index in rbp
    ; offset in rbx
    mov rdi, -1
    mov rsi, 1
    mov rbp, -1
    mov rbx, 0
    mloo:
    call whit
    cmpb [r8], "]"
    je mldo

    cmpb [r8], "+"
    jne 3
    add r8, 1
    jmp mloo

    mov rcx, 0
    cmpb [r8], "*"
    jne 3
    add r8, 1
    mov rcx, 1

    call read
    call whit

    cmpb [r8], "*"
    jne 2
    mov rcx, 1

    test rdx, 0x01
    jnz mnum
    mreg:
    cmp rcx, 1
    je mind
    cmp rdi, -1
    jne mind
        mov rdi, rax
        jmp mloo
        mind:
        mov rbp, rax
        jmp mloo

    mnum:
    cmp rcx, 1
    je msca
        mov rbx, rax
        jmp mloo
        msca:
        mov rsi, rax
        jmp mloo

    mldo:
    add r8, 1

    ; TODO: add support for index / scaled index

    mov rdx, 0x88
    add rdx, 0x004000
    add rdx, 0x060000
    cmp rdi, 8          ; rex byte
    jl 3
    add rdx, 0x0100
    sub rdi, 8

    mov rax, 0x84       ; mod 10, rm 100
    add rax, 0x2000
    shl rdi, 8
    add rax, rdi

    shl rbx, 16
    add rax, rbx

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
    jne nome
    call ream
    jmp dore
    nome:
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
    cmp r3, "]"
    je 2
    cmp r3, "+"
    je 2
    cmp r3, "*"
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

ops1:

    ; mulr
    cmp rdi, "mul"        ; mul
    jne 4
    mov rax, 0xF7
    mov rcx, 0xE0
    jmp 5
    cmp rdi, "push"        ; push
    jne 4
    mov rax, 0xFF
    mov rcx, 0xF0
    jmp 5
    cmp rdi, "pop"        ; pop
    jne 4
    mov rax, 0x8F
    mov rcx, 0xC0
    jmp 2
    jne nr

    mov rdi, 0x40
    test rdx, 0x80
    je 2
    add rdi, 0x08
    cmp rsi, 8
    jl 3
    add rdi, 0x01
    sub rsi, 8

    push rdi
    mov rdi, 1
    call prin
    pop rdi

    add rcx, rsi


    sub r4, 8
    mov [r4], eax
    add r4, 1
    mov [r4], ecx
    sub r4, 1
    mov r7, 2
    call prin
    add r4, 8
    ret
    nr:
    ret
ops2:
    ; takes instruction mnem in rdi, operand name in rsi, and operand type in rdx
    mov rax, rdi
    mov rcx, rsi
    ; moves opcode to rax, dest name to rcx, and dest type to rdx

    push rax
    push rdx
    call read
    mov rsi, rax
    mov rdi, rdx
    pop rdx
    pop rax
    ; reads source name into rsi, source type into rdi

; ri
    test rdx, 0x04
    je nri
    test rdi, 0x01
    je nri

    mov rbx, 0x40
    test rdx, 0x80
    je 2
    add rbx, 0x08
    cmp rcx, 8
    jl 3
    sub rcx, 8
    add rbx, 0x01

    push rbx
    mov rdi, 1
    call prin
    pop rbx

    ; add/sub/mov/cmpri
    cmp rax, "add"
    jne 3
    mov rdi, 6
    mov rbx, 0xC081
    cmp rax, "sub"
    jne 3
    mov rdi, 6
    mov rbx, 0xE881
    cmp rax, "mov"
    jne 3
    mov rdi, 6
    mov rbx, 0xC0C7
    cmp rax, "cmp"
    jne 3
    mov rdi, 6
    mov rbx, 0xF881
    cmp rax, "shl"
    jne 3
    mov rdi, 3
    mov rbx, 0xE0C1
    cmp rax, "shr"
    jne 3
    mov rdi, 3
    mov rbx, 0xE8C1
    cmp rax, "test"
    jne 3
    mov rdi, 6
    mov rbx, 0xC0F7
    cmp rax, "and"
    jne 3
    mov rdi, 6
    mov rbx, 0xE081
    cmp rax, "or"
    jne 3
    mov rdi, 6
    mov rbx, 0xC881
    cmp rax, "xor"
    jne 3
    mov rdi, 6
    mov rbx, 0xF081

    sub rsp, 8

    shl rcx, 8
    add rbx, rcx
    shl rsi, 16
    add rbx, rsi
    mov [rsp], rbx
    call prin
    
    add rsp, 8
    ret
nri:
; rr
    test rdx, 0x04
    je nrr
    test rdi, 0x04
    je nrr

    mov rbx, 0x40
    test rdx, 0x80
    je 2
    add rbx, 0x08
    cmp rcx, 8
    jl 3
    sub rcx, 8
    add rbx, 0x04
    cmp rsi, 8
    jl 3
    sub rsi, 8
    add rbx, 0x01

    push rbx
    mov rdi, 1
    call prin
    pop rbx

    ; sub/add/movrr
    cmp rax, "add"        ; add
    jne 2
    mov rbx, 0xC003
    cmp rax, "sub"        ; sub
    jne 2
    mov rbx, 0xC02B
    cmp rax, "mov"        ; mov
    jne 2
    mov rbx, 0xC08B
    cmp rax, "cmp"        ; cmp
    jne 2
    mov rbx, 0xC03B
    cmp rax, "or"        ; cmp
    jne 2
    mov rbx, 0xC00B

    shl rcx, 11
    add rbx, rcx
    shl rsi, 8
    add rbx, rsi

    sub rsp, 8
    mov rdi, 2
    mov [rsp], rbx
    call prin
    add rsp, 8
    ret
nrr:
; rm
    test rdx, 0x04
    je nrm
    test rdi, 0x08
    je nrm

    mov rbx, 0x40
    test rdx, 0x80
    je 2
    add rbx, 0x08
    cmp rcx, 8
    jl 3
    sub rcx, 8
    add rbx, 0x04

    push rdi

    shr rdi, 8
    and rdi, 0xFF
    or rbx, rdi
    

    push rbx
    mov rdi, 1
    call prin
    pop rbx
    
    
    cmp rax, "add"
    jne 2
    mov rdi, 0x03
    cmp rax, "mov"
    jne 2
    mov rdi, 0x8B
    cmp rax, "movb"              ; movbrm
    jne 2
    mov rdi, 0x8A
    cmp rax, "movs"              ; movs
    jne 2
    mov rdi, 0x63

    push rdi
    mov rdi, 1
    call prin
    pop rdi
    
    mov rax, rcx
    shl rax, 3
    add rax, rsi

    pop rdi
    shr rdi, 16
    and rdi, 0xFF

    push rax
    call prin
    pop rax
    ret
nrm:
; mr
    test rdx, 0x08
    je nmr
    test rdi, 0x04
    je nmr

    mov rbx, 0x40
    test rdi, 0x80
    je 2
    add rbx, 0x08
    cmp rsi, 8
    jl 3
    sub rsi, 8
    add rbx, 0x04

    push rdx

    shr rdx, 8
    and rdx, 0xFF
    or rbx, rdx

    push rbx
    mov rdi, 1
    call prin
    pop rbx
    
    cmp rax, "mov"
    jne 2
    mov rdi, 0x89

    push rdi
    mov rdi, 1
    call prin
    pop rdi
    
    mov rax, rsi
    shl rax, 3
    add rax, rcx

    pop rdi
    shr rdi, 16
    and rdi, 0xFF

    push rax
    call prin
    pop rax
    ret
nmr:
; mi
    test rdx, 0x08
    je nmi
    test rdi, 0x01
    je nmi

    mov rbx, 0x40
    test rdi, 0x80
    je 2
    add rbx, 0x08

    push rdx

    shr rdx, 8
    and rdx, 0xFF
    or rbx, rdx

    push rbx
    mov rdi, 1
    call prin
    pop rbx
    

    cmp rax, "cmpb"
    jne 3
    mov rdx, 1
    mov rbx, 0x3880
    cmp rax, "mov"
    jne 3
    mov rdx, 4
    mov rbx, 0x00C7

    pop rdi
    shr rdi, 16
    and rdi, 0xFF
    add rdi, 1
    shl rcx, 8
    add rbx, rcx

    push rbx
    call prin
    pop rbx

    push rsi
    mov rdi, rdx
    call prin
    pop rsi

    ret
nmi:

    jmp inva

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
    mul r1
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

    ; 1-operands

    ; jumps
    mov rbx, -1
    
    cmp r0, "jne"
    jne 3
    mov rdx, 0x850F
    mov rbx, 2
    cmp r0, "jnz"
    jne 3
    mov rdx, 0x850F
    mov rbx, 2
    cmp r0, "jmp"
    jne 3
    mov rdx, 0xE9
    mov rbx, 1
    cmp r0, "je"
    jne 3
    mov rdx, 0x840F
    mov rbx, 2
    cmp r0, "jz"
    jne 3
    mov rdx, 0x840F
    mov rbx, 2
    cmp r0, "jl"          ; jl
    jne 3
    mov rdx, 0x8C0F
    mov rbx, 2
    cmp r0, "jg"          ; jg
    jne 3
    mov rdx, 0x8F0F
    mov rbx, 2
    cmp r0, "call"          ; call
    jne 3
    mov rdx, 0xE8
    mov rbx, 1

    cmp rbx, -1
    je njum
    add r8, 1

    push rdx
    call read
    mov rbp, rdx
    pop rdx

    sub rsp, 8
    mov [rsp], edx
    add rsp, rbx
    mov [rsp], eax
    sub rsp, rbx
    mov r7, rbx
    add r7, 4
    call prin
    add rsp, 8
    
    mov rdx, r15
    add rdx, r14
    sub rdx, 8
    mov rax, 2
    cmp rbp, 0
    jne 2
    add rbx, 256
    mov [rdx], rbx            ; save jump information in instruction location array
    ret
    njum:

    ; two operands


    mov rdi, rax
    call read
    mov rsi, rax

    sub rax, rax
    movb rax, [r8]
    cmp rax, ","
    je 3
    call ops1
    ret

    add r8, 1

    ; passes instruction mnem in rdi, operand name in rsi, and operand type in rdx
    call ops2
    ret

star:
; open input
mov r6, 0x0             ; READ_ONLY
mov r2, 0xFFFF          ; all perms
mov r7, [rsp+16]            ; argv[1]
mov r0, 2
syscall
mov r8, r0              ; save input file descriptor
; open output
mov r0, 2               ; READ_WRITE
mov r2, 0xFFFF          ; all perms
mov r6, 0x242           ; truncate/create/.??
mov r7, [rsp+24]            ; argv[2]
syscall
mov r9, r0              ; save output file descriptor
; write header
mov r7, r9              ; output file descriptor
mov r6, 0x400000        ; program header location
mov r2, 0x78            ; program header length
mov r0, 1               ; write
syscall
; get input size
sub rsp, 0xC0            ; fstat size
mov r7, r8              ; input file descriptor
mov r6, rsp              ; fstat buffer
mov r0, 5               ; fstat
syscall
mov r10, [rsp+48]            ; file size

; mmap input
push r9                 ; save r9
push r10                ; save r10

mov r0, 9               ; mmap
mov r7, 0               ; address
mov r6, r10              ; length
mov r2, 3               ; PROT_READ | PROT_WRITE
mov r10, 2              ; MAP_PRIVATE
mov r9, 0               ; offset
syscall

mov r8, r0              ; save mmap address
pop r10                 ; restore r10
pop r9                  ; restore r9


; make heap
mov r7, 0               ; adress
mov r6, r10             ; length
push r10                ; save length
shl r6, 4

mov r2, 3               ; PROT_READ | PROT_WRITE
mov r10, 0x22           ; MAP_SHARED | MAP_ANONYMOUS
push r8                 ; save r8
push r9                 ; save r9
mov r8, -1              ; file descriptor empty, anonymous
mov r9, 0               ; offset
mov r0, 9               ; mmap
syscall
pop r9                  ; restore r9
pop r8                  ; restore r8
pop r10                 ; restore r10
mov r13, r0              ; save instruction location array
mov r14, r0              ; save instruction location array end
mov r15, r10              ; store max length of instruction location array
add r15, r15
mov r0, r15
add r0, r15
push r13
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
    add r4, 6
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
sub r4, 24
mov [r4], "inva"
mov [r4+4], "lid "
mov [r4+8], "inst"
mov [r4+12], "ruct"
mov [r4+16], "ion"
mov [r4+20], 10

mov r7, 21
mov r9, 0
call prin

pop r0
pop r0
pop r0

call exit
jmp 0
mov r0, r0
