// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Load R0 into n
  @R0
  D = M

  @n
  M = D

// Load R1 into m
  @R1
  D = M

  @m
  M = D

// Initialize i and R2 = 0
  @i
  M = 0

  @R2
  M = 0

(LOOP)
  // Check if i < n, if true add m to R2, else jump to end
    @n
    D = M
    @i
    D = D - M
    @i
    M = M + 1
    @END
    D; JLE
  // (This part is only acccessed if i < n), add m to R2
    @m
    D = M
    @R2
    M = M + D
    @LOOP
    0; JMP
(END)
  @END
  0; JMP
