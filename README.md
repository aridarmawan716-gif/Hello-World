# Hello-World
Simple program
section .data
    msg db "Hello, Assembly!", 10  ; '10' adalah karakter newline (\n)
    len equ $ - msg                ; Menghitung panjang pesan secara otomatis

section .text
    global _start                  ; Titik masuk (entry point) untuk linker

_start:
    ; --- Tampilkan Pesan ke Layar ---
    mov rax, 1          ; System call nomor 1 (sys_write)
    mov rdi, 1          ; File descriptor 1 (stdout/layar)
    mov rsi, msg        ; Alamat pesan yang akan dicetak
    mov rdx, len        ; Panjang pesan dalam byte
    syscall             ; Panggil kernel untuk eksekusi

    ; --- Keluar dari Program ---
    mov rax, 60         ; System call nomor 60 (sys_exit)
    xor rdi, rdi        ; Status keluar 0 (artinya sukses)
    syscall             ; Panggil kernel untuk berhenti
    
