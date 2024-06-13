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
current_location: dq 0  ; offset array

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
cmp r7, "a"      ; a
jl nalp
cmp r7, "z"     ; z
jg nalp
yalp:
mov r0, 1
ret
nalp:
mov r0, 0
ret

is_digit:           ; is alpha
cmp r7, "0"
jl not_digit
cmp r7, "9"
jg not_digit
yes_digit:
mov r0, 1
ret
not_digit:
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
    dq "dl"
    dq 2
    dq 0x14
    dq "bl"
    dq 3
    dq 0x14
    dq "spl"
    dq 4
    dq 0x14
    dq "bpl"
    dq 5
    dq 0x14
    dq "sil"
    dq 6
    dq 0x14
    dq "dil"
    dq 7
    dq 0x14
    dq "r8b"
    dq 8
    dq 0x14
    dq "r9b"
    dq 9
    dq 0x14
    dq "r10b"
    dq 10
    dq 0x14
    dq "r11b"
    dq 11
    dq 0x14
    dq "r12b"
    dq 12
    dq 0x14
    dq "r13b"
    dq 13
    dq 0x14
    dq "r14b"
    dq 14
    dq 0x14
    dq "r15b"
    dq 15
    dq 0x14
    dq "ax"
    dq 0
    dq 0x24
    dq "cx"
    dq 1
    dq 0x24
    dq "dx"
    dq 2
    dq 0x24
    dq "bx"
    dq 3
    dq 0x24
    dq "sp"
    dq 4
    dq 0x24
    dq "bp"
    dq 5
    dq 0x24
    dq "si"
    dq 6
    dq 0x24
    dq "di"
    dq 7
    dq 0x24
    dq "r8w"
    dq 8
    dq 0x24
    dq "r9w"
    dq 9
    dq 0x24
    dq "r10w"
    dq 10
    dq 0x24
    dq "r11w"
    dq 11
    dq 0x24
    dq "r12w"
    dq 12
    dq 0x24
    dq "r13w"
    dq 13
    dq 0x24
    dq "r14w"
    dq 14
    dq 0x24
    dq "r15w"
    dq 15
    dq 0x24
    dq "eax"
    dq 0
    dq 0x44
    dq "ecx"
    dq 1
    dq 0x44
    dq "edx"
    dq 2
    dq 0x44
    dq "ebx"
    dq 3
    dq 0x44
    dq "esp"
    dq 4
    dq 0x44
    dq "ebp"
    dq 5
    dq 0x44
    dq "esi"
    dq 6
    dq 0x44
    dq "edi"
    dq 7
    dq 0x44
    dq "r8d"
    dq 8
    dq 0x44
    dq "r9d"
    dq 9
    dq 0x44
    dq "r10d"
    dq 10
    dq 0x44
    dq "r11d"
    dq 11
    dq 0x44
    dq "r12d"
    dq 12
    dq 0x44
    dq "r13d"
    dq 13
    dq 0x44
    dq "r14d"
    dq 14
    dq 0x44
    dq "r15d"
    dq 15
    dq 0x44
    dq "rax"
    dq 0
    dq 0x84
    dq "rcx"
    dq 1
    dq 0x84
    dq "rdx"
    dq 2
    dq 0x84
    dq "rbx"
    dq 3
    dq 0x84
    dq "rsp"
    dq 4
    dq 0x84
    dq "rbp"
    dq 5
    dq 0x84
    dq "rsi"
    dq 6
    dq 0x84
    dq "rdi"
    dq 7
    dq 0x84
    dq "r8"
    dq 8
    dq 0x84
    dq "r9"
    dq 9
    dq 0x84
    dq "r10"
    dq 10
    dq 0x84
    dq "r11"
    dq 11
    dq 0x84
    dq "r12"
    dq 12
    dq 0x84
    dq "r13"
    dq 13
    dq 0x84
    dq "r14"
    dq 14
    dq 0x84
    dq "r15"
    dq 15
    dq 0x84
    dq "r0"
    dq 0
    dq 0x84
    dq "r1"
    dq 1
    dq 0x84
    dq "r2"
    dq 2
    dq 0x84
    dq "r3"
    dq 3
    dq 0x84
    dq "r4"
    dq 4
    dq 0x84
    dq "r5"
    dq 5
    dq 0x84
    dq "r6"
    dq 6
    dq 0x84
    dq "r7"
    dq 7
    dq 0x84
    registers_end:

    mov r0, registers
    to_register_loop:
    cmp r0, registers_end
    jg to_register_not_found
    
    cmp r7, [r0]
    je to_register_found
    add r0, 24
    jmp to_register_loop
    to_register_found:
    mov rdx, [rax+16]
    mov rax, [rax+8]
    ret
    to_register_not_found:


mov r0, r7
mov r2, 2
ret

scmp:
    cmp rdi, rsi
    je end_of_string
    cmp rdx, rcx
    je end_of_string

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
    jl less
    mov rax, 1
    ret
    less:
    mov rax, -1
    ret

end_of_string:
    mov rax, 0
    cmp rdi, rsi
    jne not_first_shorter
    add rax, -1
    not_first_shorter:
    cmp rdx, rcx
    jne not_second_shorter
    add rax, 1
    not_second_shorter:
    ret


read_space:
    cmp r8, [flen]
    je done_space
    cmpb [r8], " "
    je not_done_space
    done_space:
    ret
    not_done_space:
    add r8, 1
    jmp read_space
    
read_whitespace:
    cmp r8, [flen]
    je done_whitespace
    cmpb [r8], " "
    je not_done_whitespace
    cmpb [r8], 10
    je not_done_whitespace
    done_whitespace:
    ret
    not_done_whitespace:
    add r8, 1
    jmp read_whitespace

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
    ; call read_whitespace
    push r8
    iloo:
    sub rcx, rcx
    movb cl, [r8]
    mov rdi, rcx
    call is_alpha
    cmp rax, 1
    je identifier_loop_continue
    call is_digit
    cmp rax, 1
    je identifier_loop_continue
    cmp rcx, "_"
    je identifier_loop_continue
    jmp idon
    identifier_loop_continue:
    add r8, 1
    jmp iloo
    idon:
    pop rax
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
    call read_whitespace
    cmpb [r8], "]"
    je mldo

    cmpb [r8], "+"
    jne not_plus
    add r8, 1
    jmp mloo

    not_plus:

    mov rcx, 0
    cmpb [r8], "*"
    jne not_times
    add r8, 1
    mov rcx, 1
    not_times:

    push rdi
    mov rdi, [rsp+8]
    call read_operand
    pop rdi
    call read_whitespace

    cmpb [r8], "*"
    jne not_times_two
    mov rcx, 1
    not_times_two:

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
    jl jump_a
    add rdx, 0x0100
    sub rdi, 8
    jump_a:

    cmp rbp, 8
    jl jump_b
    add rdx, 0x0200
    sub rbp, 8
    jump_b:

    mov rax, 0x84       ; mod 10, rm 100
    cmp rdi, -1
    jne jump_c
    mov rdi, 5
    sub rax, 0x80
    jump_c:
    shl rdi, 8
    add rax, rdi

    shl rbx, 16         ; base
    add rax, rbx

    cmp rbp, -1         ; index
    je jump_d
    shl rbp, 11
    add rax, rbp
    jmp jump_e
    jump_d:
    add rax, 0x2000
    jump_e:
    cmp rsi, 2
    jne jump_f
    add rax, 0x4000
    jump_f:
    cmp rsi, 4
    jne jump_g
    add rax, 0x8000
    jump_g:
    cmp rsi, 8
    jne jump_h
    add rax, 0xC000
    jump_h:
    ret

read_number:
    mov r0, 0
    mov r1, 10
    mov r5, 1

    cmpb [r8], "-"
    jne number_loop
    mov r5, -1
    add r8, 1
    call read_whitespace

    number_loop:
    sub r3, r3
    movb bl, [r8]
    cmp r3, " "
    je done_number_loop
    cmp r3, "]"
    je done_number_loop
    cmp r3, "+"
    je done_number_loop
    cmp r3, "*"
    je done_number_loop
    sub r3, 10              ; newline
    je done_number_loop
    add r8, 1
    add r3, 10
    cmp r1, 256
    je operand_loop_skip
    cmp r3, "-"
    jne not_negative
    mov r5, -1
    jmp number_loop
    not_negative:
    cmp r3, "x"
    jne not_hex
    mov r1, 16
    jmp number_loop
    not_hex:
    sub r3, "A"
    jl not_hex_character
    add r3, 10
    jmp operand_loop_skip
    not_hex_character:
    add r3, "A"
    sub r3, 0x30
    operand_loop_skip:
    mul r1
    add r0, r3
    jmp number_loop
    done_number_loop:
    mul r5
    mov r2, 1           ; type is integer
    ret

read_operand_or_label:           ; read number
    push r1
    push r3
    push r5
    push r7

    call read_whitespace

    sub r7, r7
    movb dil, [r8]
    cmp rdi, 34              ; "
    jne jump_i
    call reas
    mov rdx, 1
    jmp dore
    jump_i:
    cmp rdi, "["
    jne nome
    mov rdi, [rsp]
    call read_memory_operand
    jmp dore
    nome:
    call is_alpha
    cmp rax, 1
    jne jump_j
    call reat
    jmp dore
    jump_j:
    call read_number
    dore:               ; done read
    pop r7
    pop r5
    pop r3
    pop r1
    ret

search_array:
; search value in rdi, array start in rsi, offset in rdx
    mov rax, rsi
    search_array_loop:
    cmp rdi, [rax]
    je search_array_found
    add rax, rdx
    jmp search_array_loop
    search_array_found:
    ret

read_operand: ; read and convert label to immediate, takes lookup table in rdi
    push r8
    call read_operand_or_label
    test rdx, 0x02
    jnz found_label
    add rsp, 8
    ret
    found_label:
    pop r8
    call read_whitespace
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
    jmp immediate_only_array_end
    immediate_only_array:
    dq "db"
    dq 1    ; length of immediate
    dq 0    ; is jump
    dq 0    ; length of opcode
    dq 0    ; opcode
    dq "dw"
    dq 2
    dq 0
    dq 0
    dq 0
    dq "dd"
    dq 4
    dq 0
    dq 0
    dq 0
    dq "dq"
    dq 8
    dq 0
    dq 0
    dq 0
    dq "push"
    dq 4
    dq 0
    dq 1
    dq 0x68
    dq "jmp"
    dq 4
    dq 1
    dq 1
    dq 0xE9
    dq "jne"
    dq 4
    dq 1
    dq 2
    dq 0x850F
    dq "jnz"
    dq 4
    dq 1
    dq 2
    dq 0x850F
    dq "je"
    dq 4
    dq 1
    dq 2
    dq 0x840F
    dq "jz"
    dq 4
    dq 1
    dq 2
    dq 0x840F
    dq "jl"          ; jl
    dq 4
    dq 1
    dq 2
    dq 0x8C0F
    dq "jg"          ; jg
    dq 4
    dq 1
    dq 2
    dq 0x8F0F
    dq "call"          ; call
    dq 4
    dq 1
    dq 1
    dq 0xE8
    immediate_only_array_end:
    push rsi
    mov rsi, immediate_only_array
    mov rdx, 40
    call search_array
    pop rsi
    mov rdx, [rax+32]
    mov rcx, [rax+24]
    mov rdi, [rax+16]
    mov rax, [rax+8]

    cmp rdi, 1
    jne not_jump
    sub rsi, [current_location]
    sub rsi, rcx
    sub rsi, rax
    not_jump:

    push rdx
    mov rdi, rcx
    call prin
    pop rdx

    push rsi
    mov rdi, rax
    call prin
    pop rsi
    ret

    ni:

    test rdx, 0x08
    jz nm
    jmp memory_only_array_end
    memory_only_array:
    dq "mul"
    dq 0x20F7
    dq "push"
    dq 0x30FF
    dq "pop"
    dq 0x008F
    memory_only_array_end:
    push rdx
    push rsi
    mov rsi, memory_only_array
    mov rdx, 16
    call search_array
    mov rax, [rax+8]
    pop rsi
    pop rdx

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
    jmp register_only_array_end
    register_only_array:
    dq "mul"
    dq 0xE0F7
    dq "push"
    dq 0xF0FF
    dq "pop"
    dq 0xC08F
    register_only_array_end:
    push rdx
    push rsi
    mov rsi, register_only_array
    mov rdx, 16
    call search_array
    mov rax, [rax+8]
    pop rsi
    pop rdx

    mov rdi, 0x40
    test rdx, 0x80
    je jump_k
    add rdi, 0x08
    jump_k:
    cmp rsi, 8
    jl jump_l
    add rdi, 0x01
    sub rsi, 8
    jump_l:

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
    call read_operand           ; TODO: implement using memory operand as immediate
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
    je jump_m
    add rbx, 0x08
    jump_m:
    cmp rcx, 8
    jl jump_n
    sub rcx, 8
    add rbx, 0x01
    jump_n:

    push rbx
    mov rdi, 1
    call prin
    pop rbx

    jmp ri_array_end
    ri_array:
    dq "add"
    dq 6
    dq 0xC081
    dq "sub"
    dq 6
    dq 0xE881
    dq "mov"
    dq 6
    dq 0xC0C7
    dq "cmp"
    dq 6
    dq 0xF881
    dq "shl"
    dq 3
    dq 0xE0C1
    dq "shr"
    dq 3
    dq 0xE8C1
    dq "test"
    dq 6
    dq 0xC0F7
    dq "and"
    dq 6
    dq 0xE081
    dq "or"
    dq 6
    dq 0xC881
    dq "xor"
    dq 6 ; rdi
    dq 0xF081 ; rbx
    ri_array_end:
    push rsi
    mov rdi, rax
    mov rsi, ri_array
    mov rdx, 24
    call search_array
    mov rdi, [rax+8]
    mov rbx, [rax+16]
    pop rsi

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
    je jump_o
    add rbx, 0x08
    jump_o:
    cmp rcx, 8
    jl jump_p
    sub rcx, 8
    add rbx, 0x04
    jump_p:
    cmp rsi, 8
    jl jump_q
    sub rsi, 8
    add rbx, 0x01
    jump_q:

    push rbx
    mov rdi, 1
    call prin
    pop rbx

    jmp rr_array_end
    rr_array:
    dq "add"        ; add
    dq 0xC003
    dq "sub"        ; sub
    dq 0xC02B
    dq "mov"        ; mov
    dq 0xC08B
    dq "cmp"        ; cmp
    dq 0xC03B
    dq "or"        ; cmp
    dq 0xC00B
    rr_array_end:
    push rsi
    mov rdi, rax
    mov rsi, rr_array
    mov rdx, 16
    call search_array
    mov rbx, [rax+8]
    pop rsi

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
    je jump_r
    add rbx, 0x08
    jump_r:
    cmp rcx, 8
    jl jump_s
    sub rcx, 8
    add rbx, 0x04
    jump_s:

    push rdi

    shr rdi, 8
    and rdi, 0xFF
    or rbx, rdi
    

    push rbx
    mov rdi, 1
    call prin
    pop rbx
    
    jmp rm_array_end
    rm_array:
    dq "add"
    dq 0x03
    dq "sub"
    dq 0x2B
    dq "mov"
    dq 0x8B
    dq "movb"
    dq 0x8A
    dq "movs"
    dq 0x63
    dq "lea"
    dq 0x8D
    dq "cmp"
    dq 0x3B
    rm_array_end:
    push rsi
    mov rdi, rax
    mov rsi, rm_array
    mov rdx, 16
    call search_array
    mov rdi, [rax+8]
    pop rsi

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
    je jump_t
    add rbx, 0x08
    jump_t:
    cmp rsi, 8
    jl jump_u
    sub rsi, 8
    add rbx, 0x04
    jump_u:

    push rdx

    shr rdx, 8
    and rdx, 0xFF
    or rbx, rdx

    push rbx
    mov rdi, 1
    call prin
    pop rbx
    
    jmp mr_array_end
    mr_array:
    dq "mov"
    dq 0x89
    dq "cmp"
    dq 0x39
    dq "add"
    dq 0x01
    dq "movb"
    dq 0x88
    mr_array_end:
    push rsi
    mov rdi, rax
    mov rsi, mr_array
    mov rdx, 16
    call search_array
    mov rdi, [rax+8]
    pop rsi

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
    je jump_v
    add rbx, 0x08
    jump_v:

    push rdx

    shr rdx, 8
    and rdx, 0xFF
    or rbx, rdx

    push rbx
    mov rdi, 1
    call prin
    pop rbx
    
    jmp mi_array_end
    mi_array:
    dq "cmpb"
    dq 1
    dq 0x3880
    dq "mov"
    dq 4
    dq 0x00C7
    dq "add"
    dq 4
    dq 0x0081
    dq "sub"
    dq 4
    dq 0x2881
    dq "cmp"
    dq 4
    dq 0x3881
    mi_array_end:
    push rsi
    mov rdi, rax
    mov rsi, mi_array
    mov rdx, 24
    call search_array
    mov rdx, [rax+8]
    mov rbx, [rax+16]
    pop rsi

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
    call read_space
    call read_identifier
    mov rdi, rax
    mov rsi, rdx

    call peek_character
    cmpb [r8], ":"
    jne parse_label_ret
    add rsp, 8
    add r8, 1
    call lookup_label
    mov rsi, [current_location]
    mov [rax], rsi
    mov rax, 1
    ret
parse_label_ret:
    mov rax, 0
    pop r8
    ret

parse_instruction:
    ; rdi is lookup table, rsi is instruction location, rdx is instruction location array
    call read_space
    call read_identifier
    cmp rax, rdx
    jne yes_identifier
    ret
    yes_identifier:
    mov rdi, rax
    mov rsi, rdx
    call idti

    jmp no_operands_end
    no_operands_array:
    dq "ret"
    dq 1
    dq 0xC3
    dq "syscall"
    dq 2
    dq 0x050F
    no_operands_end:
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
    je jump_w
    jne nsys
    jump_w:
    mov r0, 0x050F
    push r0
    mov r7, 2
    call prin
    pop r0
    ret
    nsys:                   ; not sys

    ; 1-operandsdsddddddd

    push rax
    push rdi
    call read_operand
    pop rcx
    pop rdi
    mov rsi, rax

    sub rax, rax
    movb rax, [r8]
    cmp rax, ","
    je jump_y
    call ops1
    ret
    jump_y:

    add r8, 1

    ; passes instruction mnem in rdi, operand name in rsi, and operand type in rdx
    call ops2
    ret


parse_comment:
    call peek_character
    cmp rax, 0x3B
    jne done_comment
    coml:
    call peek_character
    cmp rax, 10
    je done_comment
    add r8, 1
    jmp coml
    done_comment:
    ret

peek_character:
    sub rax, rax
    cmp r8, [flen]
    je peek_character_ret
    movb rax, [r8]
    peek_character_ret:
    ret

read_newline:
    call read_space
    call peek_character
    cmp rax, 10
    jne newline_done
    add r8, 1
    newline_done:
    ret

parse_line:
    call parse_label
    call parse_instruction
    call parse_comment
    call read_newline
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
mov [current_location], rax
mov r15, [flen]            ; store max length of instruction location array
shl r15, 4              ; 16 * file size

mov [iter], 2
push r14
push r8

mov rax, [flen]
shl rax, 6
add rax, [current_location]

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
    mov [current_location], rax
    call parse_line
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
