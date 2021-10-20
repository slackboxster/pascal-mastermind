program master;

   {$APPTYPE CONSOLE}
uses
  SysUtils, crt;

type
arraytypei = array [1..4] of byte;
arraytypeii = array [1..10] of byte;

var
choice : byte;
v : arraytypei; //secret code is stored here.
a : arraytypeii;
b : arraytypeii;
c : arraytypeii;
d : arraytypeii; //each a-d array corresponds to a column in the code, and contains 10 elements for 10 available guess rows.
x : byte; //indicates which row of guessing we are currently on.
y : byte; //compiler says var not used.

procedure guess; forward;

procedure again; forward;

procedure intro; forward;

procedure reveal;
begin
gotoxy(13,10);

case v[1] of
1 : textcolor(4); //TODO - make this byte to textcolor conversion into a function.
2 : textcolor(1);
3 : textcolor(2);
4 : textcolor(14);
5 : textcolor(7);
6 : textcolor(8);
end;
write('o  ');

case v[2] of
1 : textcolor(4);
2 : textcolor(1);
3 : textcolor(2);
4 : textcolor(14);
5 : textcolor(7);
6 : textcolor(8);
end;
write('o  ');

case v[3] of
1 : textcolor(4);
2 : textcolor(1);
3 : textcolor(2);
4 : textcolor(14);
5 : textcolor(7);
6 : textcolor(8);
end;
write('o  ');

case v[4] of
1 : textcolor(4);
2 : textcolor(1);
3 : textcolor(2);
4 : textcolor(14);
5 : textcolor(7);
6 : textcolor(8);
end;
write('o  ');
textcolor(7);
end;


procedure lose;
begin
gotoxy(12, 2*x+12);
writeln('You have lost.');
reveal;
again;
end;

procedure win;
begin
gotoxy(1, 2*x+12);
writeln('Congratulations! You have won!');
reveal;
again;
end;


procedure reproc;
begin
if (a[x]=v[1]) and (b[x]=v[2]) and (c[x]=v[3]) and (d[x]=v[4]) then win
else
if x=10 then lose
else guess;
end;

//this could be made much simpler by maintaining some sort of object or struct to track the state of evaluation for each token, and then process the evaluation state after computing it.
//basically make it a pure function, write to the screen after evaluation is complete.
procedure evaluate;
begin
if a[x]=v[1] then
begin
textcolor(8);
write('o');
end;

if b[x]=v[2] then
begin
textcolor(8);
write('o');
end;

if c[x]=v[3] then
begin
textcolor(8);
write('o');
end;

if d[x]=v[4] then
begin
textcolor(8);
write('o');
end;

textcolor(7);
if a[x]=v[1] then write('')
else
if (a[x]=v[2]) and (b[x]<>v[2]) then write('o')
else
if (a[x]=v[3]) and (c[x]<>v[3]) then write('o')
else
if (a[x]=v[4]) and (d[x]<>v[4]) then write('o')
else write('');

if b[x]=v[2] then write('')
else
if (b[x]=v[1]) and (a[x]<>v[1]) then write('o')
else
if (b[x]=v[3]) and (c[x]<>v[3]) and
((a[x]=v[1]) or (a[x]=v[2]) or (a[x]<>v[3]) or (a[x]=v[4])) then write('o')
else
if (b[x]=v[4]) and (d[x]<>v[4]) and
((a[x]=v[1]) or (a[x]=v[2]) or (a[x]=v[3]) or (a[x]<>v[4])) then write('o')
else write('');

if c[x]=v[3] then write('')
else
if (c[x]=v[1]) and (a[x]<>v[1]) and
((b[x]<>v[1]) or (b[x]=v[2]) or (b[x]=v[3]) or (b[x]=v[4])) then write('o')
else
if (c[x]=v[2]) and (b[x]<>v[2]) and
((a[x]=v[1]) or (a[x]<>v[2]) or (a[x]=v[3]) or (a[x]=v[4])) then write('o')
else
if (c[x]=v[4]) and (d[x]<>v[4]) and
((a[x]=v[1]) or (a[x]=v[2]) or (a[x]=v[3]) or (a[x]<>v[4])) and
((b[x]=v[1]) or (b[x]=v[2]) or (b[x]=v[3]) or (b[x]<>v[4])) then write('o')
else write('');

if d[x]=v[4] then write('')
else
if (d[x]=v[1]) and (a[x]<>v[1]) and
((b[x]<>v[1]) or (b[x]=v[2]) or (b[x]=v[3]) or (b[x]=v[4])) and
((c[x]<>v[1]) or (c[x]=v[2]) or (c[x]=v[3]) or (c[x]=v[4])) then write('o')
else
if (d[x]=v[2]) and (b[x]<>v[2]) and
((a[x]=v[1]) or (a[x]<>v[2]) or (a[x]=v[3]) or (a[x]=v[4])) and
((c[x]=v[1]) or (c[x]<>v[2]) or (c[x]=v[3]) or (c[x]=v[4])) then write('o')
else
if (d[x]=v[3]) and (c[x]<>v[3]) and
((a[x]=v[1]) or (a[x]=v[2]) or (a[x]<>v[3]) or (a[x]=v[4])) and
((b[x]=v[1]) or (b[x]=v[2]) or (b[x]<>v[3]) or (b[x]=v[4])) then write('o')
else write('');
reproc;
end;
//TODO - unit tests. - I think we'll find some strange edge cases.n

procedure inval;
begin
write('Invalid entry. Please try again');
guess;
end;

procedure guess;
begin
x:=x+1;
gotoxy(1,2*x+10);
write('Enter guess:');
readln(a[x], b[x], c[x], d[x]);
gotoxy(13,2*x+10);

case a[x] of
1 : textcolor(4);
2 : textcolor(1);
3 : textcolor(2);
4 : textcolor(14);
5 : textcolor(7);
6 : textcolor(8);
else inval;
end;
write('o  ');

case b[x] of
1 : textcolor(4);
2 : textcolor(1);
3 : textcolor(2);
4 : textcolor(14);
5 : textcolor(7);
6 : textcolor(8);
else
inval;
end;
write('o  ');

case c[x] of
1 : textcolor(4);
2 : textcolor(1);
3 : textcolor(2);
4 : textcolor(14);
5 : textcolor(7);
6 : textcolor(8);
else
inval;
end;
write('o  ');

case d[x] of
1 : textcolor(4);
2 : textcolor(1);
3 : textcolor(2);
4 : textcolor(14);
5 : textcolor(7);
6 : textcolor(8);
else
inval;
end;
write('o  ');
evaluate;
end;


procedure make;
begin
randomize;
v[1]:=random(6)+1;
v[2]:=random(6)+1;
v[3]:=random(6)+1;
v[4]:=random(6)+1;
gotoxy(13,10);
write('c  o  d  e');
guess;
end;


procedure exit;
begin
gotoxy(1, 2*x+16);
writeln('The game will now exit. Good-Bye.');
end;


procedure again;
begin
gotoxy(1, 2*x+14);
textcolor(7);
writeln('Do you wish to play again? 1.y.2.n.');
readln(choice); //TODO - this seems to result in EInOutError: Invalid Input every time.
if choice=1 then intro
else exit;
end;


procedure intro;
begin
x:=0;
clrscr;
textcolor(7);
writeln('Welcome to Heathcote''s Mastermind.');
writeln('The game will now begin. Pressing ESC during your turn will exit.');
writeln('When breaking the code, use numbers 1-6 for colours.');
writeln('1:red. 2:blue. 3:green. 4:yellow. 5:white. 6:black.');
make;
end;


begin
  { TODO -oUser -cConsole Main : Insert code here }
clrscr;
intro;
readln;
end.