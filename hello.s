.global _start

.text
_start:
    @ write(1, message, 14)
    mov r0, #1          @ 1 = stdout
    ldr r1, =message    @ pointer to message
    mov r2, #14         @ message length
    mov r7, #4          @ Linux write syscall number for 32-bit ARM
    svc #0              @ call kernel

    @ exit(0)
    mov r0, #0          @ status = 0
    mov r7, #1          @ Linux exit syscall number for 32-bit ARM
    svc #0              @ call kernel

.data
message:
    .ascii "Hello, World!\n"

