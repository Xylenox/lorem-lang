;open files     mov r6, 0x@     mov r2, 0x��    REX.W           add r4, 0x     REX.W           mov r7, [r4]    REX.W           sub r4, 0x     mov r0, 0x     syscall         REX.WR          mov r0, r0                      mov r0, 0x     mov r2, 0x��    mov r6, 0xB    REX.W           add r4, 0x     REX.W           mov r7, [r4]    REX.W           sub r4, 0x     syscall         REX.WR          mov r1, r0                      ; write header  REX.WB          mov r7, r1      mov r6, 0x  @   mov r2, 0xx     mov r0, 0x     syscall                         ; read input    REX.W           sub r4, 0x�     REX.WB          mov r7, r0      REX.W           mov r6, r4      mov r0, 0x     syscall                         REX.W           add r4, 0x0     REX.WR          mov r2, [r4]    REX.W           sub r4, 0x0     REX.WB          sub r4, r2      REX.WB          mov r7, r0      REX.W           mov r6, r4      REX.WB          mov r2, r2      mov r0, 0x      syscall                          �<$ u&H��I���I��H��I�Ҹ   �<   �    �ԁ<$sub tu�|$rtu	f�|$, tu�|$rtu8�D$,0���D$	,0��$+�D$I��H���   �   H��
I��
랁<$add tu�|$rtu	f�|$, tu�|$	xtuB�D$,0��$��D$I��H���   �   H��
I��H���   �   H��I��딀<$ u
H��I����<$REX.ui�@H��I���<$Wu
H��I���<$Ru
H��I���<$Xu
H��I���<$Bu
H��I��H���$I��H���   �   H��댁<$add tu�|$rtu	f�|$, tu�|$	rtuG�D$,0���D$
,0 �$�D$I��H���   �|$
4u���D$$�   H��I��돁<$sysctu	f�|$altu�|$ltu"f�$I��H���   �   H��I��뽁<$mov tu�|$rtu	f�|$, tu�|$	rtuG�D$,0���D$
,0 �$��D$I��H���   �|$
4u���D$$�   H��I��돁<$mov tu�|$rtu	f�|$, tu�|$	xtuB�D$,0��$ǈD$I��H���   �   H��
I��H���   �   H��I��딁<$mov tu�|$rtu	f�|$, tu�|$rtu8�D$,0���D$	,0��$��D$I��H���   �   H��
I��
랁<$sub tu�|$rtu	f�|$, tu�|$	xtuB�D$,0��$��D$I��H���   �   H��
I��H���   �   H��I��딀<$;u
H��I����