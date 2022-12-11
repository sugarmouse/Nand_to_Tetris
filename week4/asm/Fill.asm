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

// initial data
 
(CHECK)
// (CHECK KEYBOARD)
  @i
  M=0

  @SCREEN
  D=A
  @addr
  M=D  // init

  @KBD
  D=M
  @WHITE
  D;JEQ  // if RAM[24576] == 0 goto (WHITE)
  @KBD
  D=M
  @BLACK
  D;JNE // if RAM[KBD] > 0 goto (BLACK)

// (BLACK)
//   set all the screen map Bits to 1
//   goto check RAM[24576]
(BLACK)
  @i
  D=M
  @addr
  M=M+D
  @addr
  A=M  // A = RAM[addr]
  M=-1 // RAM[addr] = -1 (1111,1111,1111,1111)
  @i
  M=M+1 // i++

  @SCREEN
  D=A
  @addr
  M=D  // reset RAM[addr]

  @i
  D=M
  @8191
  D=A-D // D = 8192 - index
  @BLACK
  D;JGE  // if 8192-index >= 0 jump back to BLACK

  @CHECK
  0;JEQ  // jump back to check keyboard after set all keyboard mapping bits to 1


// set all the screen map Bits to 0
// goto chech RAM[24576]
(WHITE)
  @i
  D=M
  @addr
  M=M+D // address = index + SCREEN

  @addr
  A=M
  M=0 // RAM[addr] = 0 (1111,1111,1111,1111)

  @i
  M=M+1 // i++
  
  @SCREEN
  D=A
  @addr
  M=D  // reset RAM[addr]

  @i
  D=M
  @8191
  D=A-D // D = 8192 - index
  @WHITE
  D;JGE  // if 8192-index >= 0 jump back to BLACK

  @CHECK
  0;JEQ // jump back to check keyboard after set all keyboard mapping bits to 0