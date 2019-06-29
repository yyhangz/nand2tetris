// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Initialize scrconst = 8192, scr = 0 (white)
  @8192
  D = A
  @scrconst
  M = D
  @scr
  M = 0

// Loop that processes keypress and determines whether change is needed
  (LOOPCTRL)
    @KBD  // Load keyboard val
    D = M
    @i
    MD = D
    @CHKWHITE // Check screen colour when key is pressed
    D; JGT
    @CHKBLACK // Check screen colour when key is not pressed
    D; JEQ
    @LOOPCTRL
    0; JMP

  (CHKWHITE)
    @scr
    D = M
    @INIT
    D; JEQ // Jump to init if scr == 0
    @LOOPCTRL
    0; JMP

  (CHKBLACK)
    @scr
    D = M
    @INIT
    D; JLT // Jump to init if scr == -1
    @LOOPCTRL
    0; JMP

  (INIT)
    @scr
    M = !D // Set screen to result val (-1 if white and 0 if black)
    @SCREEN
    D = A
    @j
    M = D // Set j to screen val
    @k
    M = 0 // Set counter k to 0
    @LOOPFILL
    0; JMP

  (LOOPFILL)
  @scrconst
  D = M
  @k
  D = D - M
  @LOOPCTRL // Check if k < 8192, if false, jump to loopctrl
  D; JEQ

  @scr
  D = M // Load screen "colour" value
  @j
  A = M
  M = D // Fill pixels in current j address with screen colour
  @k
  M = M + 1 // k++
  @j
  M = M + 1 // j++
  @LOOPFILL
  0; JMP // Go back to start of loopfill
