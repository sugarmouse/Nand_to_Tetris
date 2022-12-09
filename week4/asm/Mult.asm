// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// let sum
// for ( let i = 0; i <= R0, i++ ) {
//   sum += R1
// }
// print(sum)

// init value
  @R2
  M=0  //  R2=0

  @index
  M=0  // index=0


(LOOP)
  // if index >= R0 goto (END)
  @index
  D=M
  @R0
  D=M-D  // D=R0-index
  @END
  D;JLE // comp=index-R0

  // if(index < RAM[1] goto loop)
  @R1
  D=M  // D=R1
  @R2
  D=D+M // D=R1+R2
  @R2
  M=D  // R2 = D
  @index
  M=M+1 // index+1
  @LOOP
  0;JMP

(END)
  @END
  0;JMP
