PORTB = $6000
DDRB = $6002

PORTA = $6001
DDRA = $6003

E  = %10000000
RW = %01000000
RS = %00100000

  .org $8000

reset:
  lda #%11111111 ; SET ALL PINS ON PORT B TO OUTPUT
  sta DDRB

  lda #%11100000 ; SET TOP 3 PIN ON PORT A TO OUTPUT
  sta DDRA

  lda #%00111000 ; SET 8-bit MODE; 2-line DISPLAY; 5x8 FONT
  sta PORTB

  lda #0	 ; CLEAR RS/RW/E bits
  sta PORTA

  lda #E	 ; TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA

  lda #0         ; CLEAR RS/RW/E bits
  sta PORTA

  lda #%00001110 ; SET DISPLAY ON, SET CURSOR ON, SET CURSOR-BLINKING OFF 
  sta PORTB

  lda #0         ; CLEAR RS/RW/E bits
  sta PORTA

  lda #E         ; TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA

  lda #0         ; CLEAR RS/RW/E bits
  sta PORTA

  lda #%00000110 ; SET DISPLAY TO SHIFT THE CURSOR TO THE RIGHT, SET TO NOT SHIFT DISPLAY
  sta PORTB

  lda #0         ; CLEAR RS/RW/E bits
  sta PORTA

  lda #E         ; TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA

  lda #%00000001 ; CLEAR DISPLAY
  sta PORTB
  lda #0         ; CLEAR RS/RW/E bits
  sta PORTA
  lda #E         ; TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #0         ; CLEAR RS/RW/E bits
  sta PORTA

  lda #"H"	 ; WRITE H 
  sta PORTB 
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"e"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"l"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"l"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"o"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #","       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #" "       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"w"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"o"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"r"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"l"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"d"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

  lda #"!"       ; WRITE H
  sta PORTB
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA
  lda #(RS | E)  ; KEEP RS SET AND TOGGLE ENABLE BIT FOR SENDING THE INSTRUCTION
  sta PORTA
  lda #RS        ; SET RS AND CLEAR RW/E bits
  sta PORTA

loop:
  jmp loop

  .org $fffc
  .word reset
  .word $0000
