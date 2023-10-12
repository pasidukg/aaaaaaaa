
%



































































































































































Area densitiy population

area(kandy,160).
area(ampara,450).
area(jaffna,265).
area(colombo,80).

population(kandy,1650).
population(ampara,865).
population(jaffna,798).
population(colombo,3650).

density(X) :- area(X,Y),
              population(X,Z),
              Den is Z/Y,
              format("The Density is ~2f",[Den]).

%%
density(kandy).
%%





%BMI calculator

calculate_bmi():-
    write("Enter your Weight (kg):"),
    read(Weight),
    write("Ënter your Height (m):"),
    read(Height),
    BMI is Weight/(Height*Height),
    format("Your BMI is ~w",[BMI]).

% calculate_bmi. %-





calculate_sum():-
    sum is N1+N2.





%calculator
operation(A,B,'+' ,Result) :- Result is A+B.
operation(A,B,'-' ,Result) :- Result is A-B.
operation(A,B,'*' ,Result) :- Result is A*B.
operation(A,B,'/' ,Result) :- Result is A/B.

calculator :-
    write("Enter your First number:"),
    read(A),
    write("Enter your Second number:"),
    read(B),
    write("select your Operator :"),
    read(Operator),
    operation(A,B,Operator,Result),
    format("Your Output is ~w",[Result]).

% calculator. %





%check Child or adult
is_a_child(Age) :- Age =<18, write("Child").
is_a_child(Age) :- Age >18, write("Adult").

check :-
    write("Enter Your Age :"),
    read(Age),
    is_a_child(Age).

% check. %





%Check Greater number
gt(X,Y) :- X>Y , format("~w is Greater than ~w",[X,Y]).
gt(X,Y) :- X<Y , format("~w is Greater than ~w", [Y,X]).
gt(X,Y) :- X=:=Y , format("~w is equal to ~w",[X,Y]).

check:-
      write('X'),
      read(X),
      write('Y'),
      read(Y),
      gt(X,Y).

% check. %







%Favorite
likes(jhon,pizza).
likes(jhon,ice-cream).
likes(mary,pizza).
likes(susan,salad).

fav(X) :- likes(X,pizza), likes(X,ice-cream).
food(P) :- likes(P,pizza), likes(P,salad).

% fav(jhon). %






%Student details
student :-
    write("Enter Name"),
    read(Name),
    write("Enter Age"),
    read(Age),
    write("Enter Specialization"),
    read(Spe),
    write("Enter GPA"),
    read(Gpa),
    format("name ~w,age ~w,specialization ~w,gpa ~w,[Name,Age,Spe,Gpa]").






%Marks avarage pass fail
marks:-
    write("Enter Your 1st Marks:"),
    read(M1),
    write("Enter Your 2nd Marks:"),
    read(M2),
    write("Enter Your 3rd Marks:"),
    read(M3),

    Average is(M1+M2+M3)/3,
    check(Average).

   check(Average) :- Average >= 50,write("pass").
   check(Average) :- Average < 50,write("Fail").






%loop
loop(11).
loop(N) :- N>=1 ,write(N),nl,
    Y is N+1,
    loop(Y).











%passpaper 1 realtionship
male(amara).
male(kamal).
male(nimal).
male(perera).
male(chinthaka).
male(shehan).
female(nayanaa).
female(sumanaa).
female(kusuma).
female(dinesha).
female(sumanawathee).
female(nethmi).

parent(amara,kamal).
parent(amara,nimal).
parent(amara,sumanaa).
parent(amara,kusuma).
parent(nayanaa,kamal).
parent(nayanaa,nimal).
parent(nayanaa,sumanaa).
parent(nayanaa,kusuma).
parent(perera,nayanaa).
parent(perera,dinesha).
parent(sumanawathee,nayanaa).
parent(sumanawathee,dinesha).
parent(chinthaka,supun).
parent(chinthaka,nethmi).
parent(dinesha,supun).
parent(dinesha,nethmi).


father(X,Y):-male(X),parent(X,Y).
mother(X,Y):-female(X),parent(X,Y).

daughter(X,Y):-female(X),parent(Y,X).


ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z),ancestor(Z,Y).

grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

cousin(X, Y) :- parent(Z, X), parent(W, Y), sibling(Z, W), X \= Y.
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

%
%father(X,kamal).
%father(X,amara).
%









month_days(january, 31).
month_days(february, 28).
month_days(march, 31).
month_days(april, 30).
month_days(may, 31).
month_days(june, 30).
month_days(july, 31).
month_days(august, 31).
month_days(september, 30).
month_days(october, 31).
month_days(november, 30).
month_days(december, 31).


has_31_days(Month) :- month_days(Month, 31).


number_of_days(Month, Days) :- month_days(Month, Days).






sweet(chocolate).
sweet(toffee).
sweet(donut).

hot(chilli_chicken).
hot(chilli_burger).
hot(spiced_pasta).
hot(spiced_curry).


likes(Child, Food) :- sweet(Food), child(Child).
likes(Adult, Food) :- hot(Food), adult(Adult).

hates(Child, Food) :- hot(Food), child(Child).
hates(Adult, Food) :- sweet(Food), adult(Adult).


is_sweet(Food) :- sweet(Food).
is_hot(Food) :- hot(Food).






%chases animals
animal(fido,dog,large).
animal(rover,dog,small).
animal(tom,cat,small).
animal(fred,dog,large).
animal(mary,cat,large).
animal(jane,cat,small).
animal(harry,cat,large).
animal(henry,cat,large).
animal(bill,cat,large).
animal(steve,cat,large).

is_large(Animal) :-
    animal(Animal,_,large).

is_small(Animal) :-
    animal(Animal,_,small).

chases(Dog,Animal) :-
    animal(Dog, dog, large),
    animal(Animal,_,small).

chases(Dog,Animal) :-
    animal(Dog,_,small),
    animal(Animal,_,_).


%
%chases(fred,fido).
%










%Monkey banana
move(state(middle,onbox,middle,hasnot),
   grasp,
   state(middle,onbox,middle,has)).
move(state(P,onfloor,P,H),
   climb,
   state(P,onbox,P,H)).
move(state(P1,onfloor,P1,H),
   drag(P1,P2),
   state(P2,onfloor,P2,H)).
move(state(P1,onfloor,B,H),
   walk(P1,P2),
   state(P2,onfloor,B,H)).
canget(state(_,_,_,has)).
canget(State1) :-
   move(State1,_,State2),
   canget(State2).

%
%trace.
%canget(state(atdoor, onfloor, atwindow, hasnot)).
%






%Hanoi puzzel
move(1,X,Y,_) :-
   write('Move top disk from '), write(X), write(' to '), write(Y), nl.
move(N,X,Y,Z) :-
   N>1,
   M is N-1,
   move(M,X,Z,Y),
   move(1,X,Y,_),
   move(M,Z,Y,X).

%
%move(3,source,target,auxiliary).
%






%waterjug

water_jug(X,Y):- X>4, Y<3, write("4L water jug over flowed"),nl.
water_jug(X,Y):-X<4, Y>3, write("3L water jug over flowed"),nl.
water_jug(X,Y):- X<4, Y<3, write("both are emty"),nl.

write_jug(X, Y):-
    (X=:= 0, Y=:=0, write('4L:4 & 3L:0, 3L is empty'),X is 4, water_jug(4,0));
    (X=:= 0, Y=:=0, write('4L:0 & 3L:3, 4L is empty'),X is 3, water_jug(0,3));
    (X=:= 2, Y=:=0, write('reach the goal'),X is 4, water_jug(4,0));

    (X=:= 0, Y=:=3, write('4L:3 & 3L:0, 4L is now 3L'),X is 3, water_jug(3,0));
    (X=:= 4, Y=:=0, write('4L:3 & 1L:3, 4L is now 1L'),X is 1, water_jug(1,3));

    (X=:= 3, Y=:=3, write('4L:3 & 3L:0'),water_jug(4,2));
    (X=:= 0, Y=:=2, write('4L:2 & 3L:0'),water_jug(2,0)).


% write_jug(2,0). %









%Create a list of five colors

colors([pink,blue,yellow,black,white]).




%Check the pink is available in your list

check:-memberchk(pink,[pink,blue,yellow,black,white]).




%Check the user enter colour is available in your list.

checkuser:-write('Enter a colour: '),
 read(Col),
 memberchk(Col,[pink,blue,yellow,black,white]).




%If pink color is unavailable,add pink to the list.

avilablecheck:-memberchk(pink,[pink,blue,yellow,black,white]) ->
 append([grey],[pink,blue,yellow,black,white],NewList),
 write(NewList);
 append([pink],[pink,blue,yellow,black,white],NewList),
 write(NewList).





%Order the list into descending order and display the last colour in the list.

orderlist:-sort(0,@>,[pink,blue,yellow,black,white],NewList),
 write('descending ordered list: '),
 write(NewList),
 last(NewList,X),nl,
 write('descending ordered list last item: '),
 write(X)





%Display the number of colors in the list.

lengthchk:-length([pink,blue,yellow,black,white],Length),
 write(Length).








%1. Create a knowledge base to store student and their score details.

student(name(['Saman', 'Perera']), 11021).
student(name(['Mohamed', 'Humaith']), 11022).
student(name(['Nimal', 'Silva']), 11023).
student(name(['Viji', 'Kumar']), 11024).
student(name(['Lasantha', 'Jayamanna']), 11025).
student(name(['Namal', 'Silva']), 11026).
student(name(['Ponnambalam', 'Ramanadan']), 11027).
marks(11021, score([50, 71, 57, 65, 61])).
marks(11022, score([65, 50, 85, 49, 82])).
marks(11023, score([100, 85, 100, 89, 76])).
marks(11024, score([73, 65, 59, 82, 66])).
marks(11025, score([60, 90, 78, 96,100])).



%2. Is Janaka Silva an undergraduate student?

checkname:-student(name(['Janaka','Silva']),_).



%3. Who are the registered undergraduates in the departments?

registeredstd(X,Y,Z):-student(name([X,Y]),Z).



%4. Check user entered student registered or not in in the departments?

userinputchk(Fname,Lname):-student(name([Fname,Lname]),_) ->
 write('Registered');
 write('Not Registered').



%5. What is the index no of Silva?

indexcheck(Lname):-student(name([Fname,Lname]),Index),
 write(Fname),
 write(' '),
 write(Lname),nl,
 write(Index).



%6. Who sat the examination?

whosatexam:-student(name([Fname,Lname]),Index),
 marks(Index,score(_)),
 write(Fname),write(' '),
 write(Lname),write(' '),
 write(Index).



%7. Who missed the examination?

whomissexam:-student(name([Fname,Lname]),Index),
 not(marks(Index,score(_))),
 write(Fname),write(' '),
 write(Lname),write(' '),
 write(Index).

















