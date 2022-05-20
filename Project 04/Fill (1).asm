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


@8192 //initialize program by introducing a max
D=A
@max
M=D //store value into variable max


(BEGIN)
@0 //load up clear
D=A
@screenptr //screenptr for the screen
M=D

(LOOP)
//Increment screenptr
@screenptr //anytime you reset this you jump back to begin
M=M+1

//Reset screenptr if needed
D=M-1
@max //point to max and dereference max 
D=M-D
@BEGIN //if need to jump back to begin 
D;JEQ   //if got back to 0 

//copy current value into register 
@KBD
D=M
@BLACK
D;JNE //if D is non-zero


@screenptr //CLEAR
D=M 
@SCREEN //load up value from screen
A=A+D
M=0 //copy 0 value into screen
@LOOP
0;JMP //Back to Beginning

(BLACK) //draw black 
@screenptr
D=M
@SCREEN
A=A+D
M=-1 //drawblack
@LOOP
0;JMP //Back to Beginning