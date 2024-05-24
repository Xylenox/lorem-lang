; register layout
; ----------------
; r4 = pointer to input
; r9 = output file descriptor
; r10 = characters remaining in input
;
jmp star

inpf: dq 0
outf: dq 0
flen: dq 0
iter: dq 0
instruction_location_array: dq 0  ; offset array

exit:
    mov r0, 60
    mov r7, 0
    syscall

prin:                   ; printst
push r0
push r1
push rdx
push r6
push rdi
push r11
mov rdx, rdi
mov rdi, [outf]
mov r6, r4
add r6, 56
mov r0, 1
syscall
pop r11
pop rdi
pop r6
pop rdx
pop r1
pop r0
ret

is_alpha:           ; is alpha
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

    jmp registers_end
    registers:
    dq "al"
    dq 0
    dq 0x14
    dq "cl"
    dq 1
    dq 0x14
    registers_end:
    mov r0, [registers]
    
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
mov r2, 2
ret

scmp:
    cmp rdi, rsi
    je send
    cmp rdx, rcx
    je send

    sub rax, rax
    movb al, [rdi]
    push rbx
    sub rbx, rbx
    movb bl, [rdx]
    sub rax, rbx
    pop rbx
    add rdi, 1
    add rdx, 1
    cmp rax, 0
    je scmp
    jl 3
    mov rax, 1
    ret
    mov rax, -1
    ret
    

send:
    mov rax, 0
    cmp rdi, rsi
    jne 2
    add rax, -1
    cmp rdx, rcx
    jne 2
    add rax, 1
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
    push rdi
    push rbp
    ; read token
    mov rbp, 0           ; token output
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
    cmp eax, "-"
    je tdon
    cmp eax, "*"
    je tdon
    add r8, 1
    mul r1
    add rbp, r0
    mov r0, r1
    mov r1, 256
    mul r1
    mov r1, r0
    jmp tloo

    tdon:
    mov r7, rbp
    call tore
    pop rbp
    pop rdi
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

read_identifier: ; read identifier and return start and end pointers
    ; call whit
    mov rax, r8
    iloo:
    sub rcx, rcx
    movb cl, [r8]
    cmp rcx, " "         ; space
    je idon
    cmp rcx, 10          ; newline
    je idon
    cmp rcx, ":"         ; label
    je idon
    cmp rcx, "."         ; period
    je idon
    cmp rcx, ","
    je idon
    cmp rcx, "]"
    je idon
    cmp rcx, "+"
    je idon
    cmp rcx, "-"
    je idon
    cmp rcx, "*"
    je idon
    add r8, 1
    jmp iloo
    idon:
    mov rdx, r8
    ret
idti:  ; identifier to number
    mov rax, 0
    dtlo:
    cmp rdi, rsi
    je dtdo
    shl rax, 8
    sub rsi, 1
    sub rdx, rdx
    movb rdx, [rsi]
    add rax, rdx
    jmp dtlo
    dtdo:
    ret
read_memory_operand:
    add r8, 1
    ; call reat

    ; base in rdi
    ; scale in rsi
    ; index in rbp
    ; offset in rbx
    push rdi
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

    push rdi
    mov rdi, [rsp+8]
    call read_operand_2
    pop rdi
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
        add rbx, rax
        jmp mloo
        msca:
        mov rsi, rax
        jmp mloo

    mldo:
    add r8, 1
    add rsp, 8

    ; TODO: add support for index / scaled index

    mov rdx, 0x88
    add rdx, 0x004000
    add rdx, 0x060000

    cmp rdi, 8          ; rex byte
    jl 3
    add rdx, 0x0100
    sub rdi, 8

    cmp rbp, 8
    jl 3
    add rdx, 0x0200
    sub rbp, 8

    mov rax, 0x84       ; mod 10, rm 100
    cmp rdi, -1
    jne 3
    mov rdi, 5
    sub rax, 0x80
    shl rdi, 8
    add rax, rdi

    shl rbx, 16         ; base
    add rax, rbx

    cmp rbp, -1         ; index
    je 4
    shl rbp, 11
    add rax, rbp
    jmp 2
    add rax, 0x2000

    cmp rsi, 2
    jne 2
    add rax, 0x4000
    cmp rsi, 4
    jne 2
    add rax, 0x8000
    cmp rsi, 8
    jne 2
    add rax, 0xC000


    ret

read_operand:           ; read number
    push r1
    push r3
    push r5
    push r7

    call whit

    sub r7, r7
    movb dil, [r8]
    cmp rdi, 34              ; "
    jne 4
    call reas
    mov rdx, 1
    jmp dore
    cmp rdi, "["
    jne nome
    mov rdi, [rsp]
    call read_memory_operand
    jmp dore
    nome:
    call is_alpha
    cmp rax, 1
    jne 3
    call reat
    jmp dore

    mov r0, 0
    mov r1, 10
    mov r5, 1

    cmpb [r8], "-"
    jne dloo
    mov r5, -1
    add r8, 1
    call whit

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

read_operand_2: ; read and convert label to immediate, takes lookup table in rdi
    push r8
    call read_operand
    test rdx, 0x02
    jnz 3
    add rsp, 8
    ret
    pop r8
    call whit
    call read_identifier

    push rax
    push rdx
    mov rdi, rax
    mov rsi, rdx
    call lookup_label
    mov rax, [rax]
    pop rdx
    pop rcx
    mov rdx, 0x01
    ret
ops1:
    test rdx, 0x01
    jz ni
    cmp rdi, "db"
    jne 2
    mov rax, 1
    cmp rdi, "dw"
    jne 2
    mov rax, 2
    cmp rdi, "dd"
    jne 2
    mov rax, 4
    cmp rdi, "dq"
    jne 2
    mov rax, 8

    push rsi
    mov rdi, rax
    call prin
    pop rsi
    ret

    ni:

    test rdx, 0x08
    jz nm
    cmp rdi, "mul"        ; mul
    jne 2
    mov rax, 0x20F7
    cmp rdi, "push"        ; push
    jne 2
    mov rax, 0x30FF
    cmp rdi, "pop"        ; pop
    jne 2
    mov rax, 0x008F

    mov rdi, rdx
    shr rdi, 8
    and rdi, 0xFF
    shl rax, 8
    add rax, rdi
    shl rsi, 16
    add rax, rsi
    shr rdx, 16
    and rdx, 0xFF
    
    push rax
    mov rdi, rdx
    add rdi, 2
    call prin
    pop rax
    ret

    nm:

    ; mulr
    test rdx, 0x04
    jz nr
    cmp rdi, "mul"        ; mul
    jne 2
    mov rax, 0xE0F7
    cmp rdi, "push"        ; push
    jne 2
    mov rax, 0xF0FF
    cmp rdi, "pop"        ; pop
    jne 2
    mov rax, 0xC08F

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

    shl rsi, 8
    add rax, rsi


    sub r4, 8
    mov [r4], rax
    mov r7, 2
    call prin
    add r4, 8
    ret
    nr:
    call inva
    ret
ops2:
    ; takes instruction mnem in rdi, operand name in rsi, and operand type in rdx
    mov rax, rdi
    mov rdi, rcx
    mov rcx, rsi
    ; moves opcode to rax, dest name to rcx, and dest type to rdx

    push rax
    push rcx
    push rdx
    call read_operand_2           ; TODO: implement using memory operand as immediate
    mov rsi, rax
    mov rdi, rdx
    pop rdx
    pop rcx
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
    cmp rax, "sub"
    jne 2
    mov rdi, 0x2B
    cmp rax, "mov"
    jne 2
    mov rdi, 0x8B
    cmp rax, "movb"
    jne 2
    mov rdi, 0x8A
    cmp rax, "movs"
    jne 2
    mov rdi, 0x63
    cmp rax, "lea"
    jne 2
    mov rdi, 0x8D
    cmp rax, "cmp"
    jne 2
    mov rdi, 0x3B

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
    cmp rax, "cmp"
    jne 2
    mov rdi, 0x39

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
    cmp rax, "add"
    jne 3
    mov rdx, 4
    mov rbx, 0x0081
    cmp rax, "sub"
    jne 3
    mov rdx, 4
    mov rbx, 0x2881
    cmp rax, "cmp"
    jne 3
    mov rdx, 4
    mov rbx, 0x3881

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

parse_label:
    push r8
    call read_identifier
    mov rdi, rax
    mov rsi, rdx

    cmpb [r8], 58
    jne parse_label_ret
    add rsp, 8
    sub [instruction_location_array], 8          ; instruction loc array
    add r8, 1
    mov rsi, [instruction_location_array]
    push [rsi]
    mov rdi, rax
    mov rsi, rdx
    call lookup_label
    pop rsi
    mov [rax], rsi
    mov rax, 1
    ret
parse_label_ret:
    mov rax, 0
    pop r8
    ret

parse_instruction:
    ; rdi is lookup table, rsi is instruction location, rdx is instruction location array
    call parse_label
    cmp rax, 0
    je not_label
    ret
    not_label:
    call read_identifier
    mov rdi, rax
    mov rsi, rdx
    call idti

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
    mov rcx, "all"
    shl rcx, 32
    add rcx, "sysc"
    cmp rax, rcx
    je 2
    jne nsys
    mov r0, 0x050F
    push r0
    mov r7, 2
    call prin
    pop r0
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
    sub [instruction_location_array], 8
    ret
    ncom:

    ; space/newline
    cmp r0, 0
    jne nspa
    add r8, 1
    sub [instruction_location_array], 8
    ret
    nspa:

    ; 1-operandsdsddddddd

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
    call whit

    push r8
    push rdx
    push rsi
    push rdi
    call read_operand
    mov rbp, rdx
    pop rdi
    pop rsi
    pop rdx

    test rbp, 0x02
    jz jnla
    pop r8
    push rdx
    push rsi
    push rdi
    call read_identifier
    pop rdi
    pop rsi

    push rsi
    mov rdi, rax
    mov rsi, rdx
    call lookup_label
    pop rsi
    pop rdx
    mov rax, [rax]
    jmp jfad

jnla:
    add rsp, 8
    mov r14, [instruction_location_array]
    mov rax, [r14 + 8*rax - 8]
jfad:
    mov rsi, [instruction_location_array]
    sub rax, [rsi - 8]
    sub rax, rbx
    sub rax, 4

    sub rsp, 8
    mov [rsp], edx
    mov [rsp+rbx], eax
    mov r7, 4
    add r7, rbx
    call prin
    add rsp, 8
    ret
njum:

    ; two operands


    push rax
    push rdi
    call read_operand_2
    pop rcx
    pop rdi
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

label_table:
    dq 0
    dq 0

lookup_label:
    ; call idti
    ; mov rdi, rax
    mov rcx, [label_table]
    mov rax, [label_table+8]
    lolo:
        cmp rcx, rax
        je lonf
        push rax
        push rcx
        push rdx
        push rsi
        push rdi
        mov rdx, [rcx]
        mov rcx, [rcx+8]
        call scmp
        cmp rax, 0
        ; cmp [rcx], rdi
        pop rdi
        pop rsi
        pop rdx
        pop rcx
        pop rax
        
        je loof
        add rcx, 24
        jmp lolo
    loof:
        lea rax, [rcx+16]
        ret
    lonf:
        mov [rcx], rdi
        mov [rcx+8], rsi
        add [label_table+8], 24
        lea rax, [rcx+16]
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
mov r0, 2               ; fopen
mov r6, 0x242           ; truncate/create/READ_WRITE
mov r2, 0xFFFF          ; all perms
mov r7, [rsp+24]            ; argv[2]
syscall
mov [outf], r0
; write header
mov r7, [outf]              ; output file descriptor
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
mov [flen], r10

; mmap input
mov r0, 9               ; mmap
mov r7, 0               ; address
mov r6, [flen]              ; length
mov r2, 3               ; PROT_READ | PROT_WRITE
mov r10, 2              ; MAP_PRIVATE
mov r9, 0               ; offset
syscall

mov r8, r0              ; save mmap address

; make heap
mov r7, 0               ; adress
mov r6, [flen]             ; length
shl r6, 8               ; 64 * file size, should be good

mov r2, 3               ; PROT_READ | PROT_WRITE
mov r10, 0x22           ; MAP_SHARED | MAP_ANONYMOUS
push r8                 ; save r8
mov r8, -1              ; file descriptor empty, anonymous
mov r9, 0               ; offset
mov r0, 9               ; mmap
syscall
pop r8                  ; restore r8
mov r14, r0             ; save instruction location array end
mov [instruction_location_array], rax
mov r15, [flen]            ; store max length of instruction location array
shl r15, 4              ; 16 * file size

mov [iter], 2
push r14
push r8

mov rax, [flen]
shl rax, 6
add rax, [instruction_location_array]

mov [label_table], rax
mov [label_table+8], rax

mov rax, [flen]
shl rax, 5

add [flen], r8

; need to reset r8, instruction location array, output file

resl:
    cmp [iter], 0
    je exit
    sub [iter], 1
    mov r8, [rsp]
    mov r14, [rsp+8]
    mov [instruction_location_array], r14

    ; truncate
    mov rdi, [outf]
    mov rsi, 0x78
    mov rax, 77
    syscall
    ; fix lseek
    mov rsi, 0
    mov rdx, 2      ; SEEK_END
    mov rax, 8
    syscall
main:
    ; main loop
    cmp r8, [flen]
    je resl
    mov r7, [outf]
    mov r6, 0
    mov r2, 1
    mov rax, 8
    syscall                     ; lseek save current instruction position
    add rax, 0x400000
    mov r14, [instruction_location_array]
    mov [r14], rax
    add [instruction_location_array], 8
    call parse_instruction
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
mov [outf], 0
call prin

add r4, 24

call exit
jmp 0
mov r0, r0
