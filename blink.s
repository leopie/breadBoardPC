  .org $8000

reset:
  lda #$ff
  sta $6002

loop:
  lda #$ff
  sta $6000

  lda #$55
  sta $6000

  lda #$aa
  sta $6000

  lda #$00
  sta $6000

  jmp loop

  .org $fffc
  .word reset
  .word $0000
