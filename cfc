; register layout
; ----------------
; r4 = pointer to input
; r9 = output file descriptor
; r10 = characters remaining in input
;

; open input
mov r6, 0x0             ; READ_ONLY
mov r2, 0xFFFF          ; all perms
REX.W
add r4, 16
REX.W
mov r7, [r4]            ; argv[1]
REX.W
sub r4, 16
mov r0, 2
syscall
REX.WR
mov r0, r0              ; save input file descriptor
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
REX.WR
mov r1, r0              ; save output file descriptor
; write header
REX.WB
mov r7, r1              ; output file descriptor
mov r6, 0x400000        ; program header location
mov r2, 0x78            ; program header length
mov r0, 1               ; write
syscall
; get input size
REX.W
sub r4, 0xC0            ; fstat size
REX.WB
mov r7, r0              ; input file descriptor
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
REX.WB
mov r6, r2              ; length
mov r2, 3               ; PROT_READ | PROT_WRITE
mov r10, 2              ; MAP_PRIVATE
mov r9, 0               ; offset
syscall

REX.WR
mov r0, r0              ; save mmap address
REX.WB
pop r2                  ; restore r10
REX.WB
pop r1                  ; restore r9


; make heap
mov r7, 0               ; adress
REX.WB
mov r6, r2              ; length
REX.WB
push r2                 ; save length
REX.W
add r6, r6              ; multiply length by 16
REX.W
add r6, r6
REX.W
add r6, r6
REX.W
add r6, r6

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
REX.WR
mov r5, r0              ; save instruction location array
REX.WR
mov r6, r0              ; save instruction location array end
REX.WRB
mov r7, r2              ; store max length of instruction location array
REX.WRB
add r7, r7
REX.R
push r7                 ; save jump info array
REX.WB
mov r0, r7
REX.WB
add r0, r7
REX.W
push r0                 ; save label info array




; main loop
sub r10, 0
jne 18
; end of file
; fix jumps
REX.WB
mov r0, r5
REX.WB
sub r0, r6
je 14
REX.WB
mov r3, r5
REX.W
mov r3, [r3]
; read opcode
; lseek
REX.WB
mov r7, r1
REX.W
mov r6, r3
mov r2, 0
mov r0, 8
syscall
jmp 5
jmp 41
jmp 41
jmp -19
jmp -22
REX.W
sub r4, 6
REX.W
mov r6, r4
mov r2, 3
mov r0, 0
syscall
REX.WB
mov r0, r5
REX.WB
add r0, r7
mov r5, [r0]
sub r5, 0
je 46
REX.W
add r4, r5
sub r0, r0
movb r0, [r4]
REX.WB
mov r2, r5
mov r1, r0
sub r1, 0x80
jl 3
REX.W
sub r0, 0x100
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
jmp -41
jmp -41
sub r2, 4
sub r2, r5
mov [r4], r2
; lseek
REX.WB
mov r7, r1
mov r6, r5
REX.W
sub r6, 3
mov r2, 1
mov r0, 8
syscall
REX.WB
mov r7, r1
REX.W
mov r6, r4
mov r2, 4
mov r0, 1
syscall
REX.W
add r4, 0
REX.WB
add r13, 8
jmp -24
; exit
mov r0, 60
mov r7, 0
syscall
; lseek
REX.WB
mov r7, r1
mov r6, 0
mov r2, 1
mov r0, 8
syscall
REX.WB
mov [r6], r0
REX.WB
add r14, 8
jmp 2
jmp -38



; read token
mov r5, 0           ; token output
mov r1, 1           ; power of 256
sub r0, r0
REX.B
movb r0, [r0]
cmp r0, 0x20        ; space
je 2
cmp r0, 10          ; newline
je 2
cmp r0, 58          ; label
je 2
cmp r0, 0x2E        ; period
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
jmp -25
REX.W
mov r0, r5
jmp 2
jmp -32




; syscall
REX.W
mov r3, r0
mov r0, 0x6C6C61
mov r1, 0x10000
REX.W
mul r1
REX.W
mul r1
REX.W
add r0, 0x63737973
REX.W
mov r1, r0
REX.W
mov r0, r3
cmp r0, r1
je 2
jne 17
sub r8, 4
mov r0, 0x050F
REX.B
mov [r0], r0
REX.WB
mov r7, r1
REX.WB
mov r6, r0
mov r2, 2
mov r0, 1
syscall
REX.W
add r8, 4
REX.WB
sub r10, 0
jmp -33





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
REX.WB
mov r3, r6
REX.W
add r3, [r4]
REX.W
mov [r3], r0
sub r14, 8
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
mov r7, r1
REX.WB
mov r6, r0
mov r2, 1
mov r0, 1
syscall
REX.W
add r8, 4
jmp -57



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
mov r7, r0
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
mov r7, r1
REX.WB
mov r6, r0
mov r2, 2
mov r0, 1
syscall
REX.W
add r8, 6
REX.WB
sub r10, 3
jmp -25



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
jmp 2
jne 6
REX.W
add r8, 1
mov r6, r3
mov r7, r2
jmp 3
jmp 39
jmp -28
; read number
mov r0, 0
mov r1, 10
mov r5, 1
sub r3, r3
REX.B
movb r3, [r0]
sub r3, 0x20
je 3
add r3, 0x20
sub r3, 10
je 25
REX.W
add r8, 1
REX.WB
sub r10, 1
add r3, 10
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
jmp -31
mul r5
jmp 3
jmp 35
jmp -39
mov r3, r6
mov r2, r7
sub r8, 7
REX.B
mov [r0], r2
REX.WR
add r0, r3
REX.B
mov [r0], r0
REX.WR
sub r0, r3
REX.WB
mov r7, r1
REX.WB
mov r6, r0
mov r2, r3
add r2, 4
mov r0, 1
syscall
REX.W
add r8, 7
REX.WB
sub r10, 1
REX.WB
mov r1, r7
REX.WB
add r1, r6
REX.W
sub r1, 8
mov r0, 2
REX.W
mov [r1], r3            ; save jump information in instruction location array
jmp -33



; two operands

; movmr
cmp r0, 0x766F6D
je 2
jne 9
REX.WB
mov r3, r0
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
mov r7, r1
REX.WB
mov r6, r0
mov r0, 1
syscall
REX.W
add r8, 12
REX.WB
sub r10, 9
jmp -28




; sub/add/movrr
cmp r0, 0x646461        ; add
jne 3
mov r5, 0x03
jmp 4
cmp r0, 0x627573        ; sub
jne 3
mov r5, 0x2B
jmp 4
cmp r0, 0x766F6D        ; mov
jne 3
mov r5, 0x8B
jmp 4
cmp r0, 0x706D63        ; cmp
jne 3
mov r5, 0x3B
jmp 2
jne 9
REX.WB
mov r3, r0
REX.W
add r3, 1
sub r1, r1
movb r1, [r3]
sub r1, 0x72
je 2
jne 7
REX.W
add r3, 2
sub r1, r1
movb r1, [r3]
sub r1, 0x2C
je 2
jne 7
REX.W
add r3, 1
sub r1, r1
movb r1, [r3]
sub r1, 0x20
je 2
jne 7
REX.W
add r3, 1
sub r1, r1
movb r1, [r3]
sub r1, 0x72
je 3
jne 36
jmp -48
add r8, 2
REX.B
movb r0, [r0]
sub r0, 0x30
add r0, r0
add r0, r0
add r0, r0
add r8, 4
REX.B
add r0, [r0]
sub r0, 0x30
add r0, 0xC0
sub r8, 10
REX.B
mov [r0], r5
add r8, 1
REX.B
mov [r0], r0
REX.W
sub r8, 1
jmp 2
jmp -22
REX.WB
mov r7, r1
REX.WB
mov r6, r0
mov r2, 2
mov r0, 1
syscall
REX.W
add r8, 11
REX.WB
sub r10, 7
jmp -12






; add/mov/movbrm
cmp r0, 0x646461
jne 3
mov r2, 3
jmp 4
cmp r0, 0x766F6D
jne 3
mov r2, 0x8B
jmp 4
cmp r0, 0x62766F6D
jne 3
mov r2, 0x8A
jmp 2
jne 9
REX.WB
mov r3, r0
REX.W
add r3, 1
sub r1, r1
movb r1, [r3]
sub r1, 0x72
je 2
jne 6
REX.W
add r3, 2
mov r1, [r3]
cmp r1, 0x725B202C
je 8
sub r2, 0x8A
jne 5
REX.W
sub r8, 1
REX.WB
add r10, 1
jne 17
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
jmp 3
jmp 29
jmp -52
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
mov r7, r1
REX.WB
mov r6, r0
mov r0, 1
syscall
REX.W
add r8, 12
REX.WB
sub r10, 9
jmp -27




; r1 = REX byte
; r2 = reg
; r3 = r/m/immediate
; r5 = opcode
; r6 = opcode 2

add r8, 2               ; get first register operand
sub r2, r2
REX.B
movb r2, [r0]
sub r2, 0x30
add r8, 1
sub r1, r1
REX.B
movb r1, [r0]
cmp r1, 0x2C
je 6
; 2 digit number
mov r2, r1
sub r2, 0x30
add r2, 10
add r8, 1
sub r10, 1
; done
add r8, 2

mov r1, 0x48            ; REX byte
cmp r2, 8
jl 3
add r1, 1
sub r2, 8

jmp 2
jmp -24



; add/sub/mov/cmpri
cmp r0, 0x646461
jne 4
mov r6, 0x81
mov r7, 0xC0
jmp 5
cmp r0, 0x627573
jne 4
mov r6, 0x81
mov r7, 0xE8
jmp 5
cmp r0, 0x766F6D
jne 4
mov r6, 0xC7
mov r7, 0xC0
jmp 5
cmp r0, 0x706D63
jne 4
mov r6, 0x81
mov r7, 0xF8
jmp 2
jne 22


add r2, r7
mov r7, r6
REX.
push r7
mov r3, r2
sub r8, 4
REX.B
mov [r0], r1
REX.WB                  ; printst
mov r7, r1
REX.WB
mov r6, r0
mov r2, 1
mov r0, 1
syscall
REX.W
add r8, 4
REX.B
mov r7, r7
mov r6, r3


jmp 3
jmp 39
jmp -44
; read number
mov r0, 0
mov r1, 10
mov r7, 1
sub r3, r3
REX.B
movb r3, [r0]
sub r3, 0x20
je 3
add r3, 0x20
sub r3, 10
je 25
REX.W
add r8, 1
REX.WB
sub r10, 1
add r3, 10
sub r3, 0x2D
jne 3
mov r7, -1
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
jmp -31
mul r7
jmp 3
jmp 27
jmp -39

REX.
pop r7

sub r8, 8
REX.B
mov [r0], r7
add r8, 1
REX.B
mov [r0], r6
add r8, 1
REX.B
mov [r0], r0
REX.W
sub r8, 2
REX.WB
mov r7, r1
REX.WB
mov r6, r0
mov r2, 6
mov r0, 1
syscall
REX.W
add r8, 8
REX.WB
sub r10, 5
jmp -25





; invalid
jmp 0
