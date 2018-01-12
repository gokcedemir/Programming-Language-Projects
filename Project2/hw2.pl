%*******************************************%
% CSE341 Programming Languages HW02         %
% Author: Gökçe Demir           	    %
% Student Id: 141044067	        	    %
%*******************************************%

:- style_check(-singleton).

%***  PART 1 ***%

% knowledge base

flight(istanbul,izmir,3). % fact: Istanbul and Izmir has a flight with cost 3.
flight(istanbul,trabzon,3). % fact: Istanbul and Trabzon has a flight with cost 3.
flight(istanbul,ankara,5). % fact: Istanbul and Ankara has a flight with cost 5.

flight(trabzon,ankara,2). % fact: Trabzon and Ankara has a flight with cost 2.
flight(trabzon,istanbul,3). % fact: Trabzon and Istanbul has a flight with cost 3.

flight(izmir,istanbul,3). % fact: Izmir and Istanbul has a flight with cost 3.
flight(izmir,ankara,6). % fact: Izmir and Ankara has a flight with cost 6.
flight(izmir,antalya,1). % fact: Izmir and Antalya has a flight with cost 1.

flight(ankara,istanbul,5). % fact: Ankara and Istanbul has a flight with cost 5.
flight(ankara,izmir,6). % fact: Ankara and Izmir has a flight with cost 6.
flight(ankara,trabzon,2). % fact: Ankara and Trabzon has a flight with cost 2.
flight(ankara,konya,8). % fact: Ankara and Konya has a flight with cost 8.

flight(antalya,izmir,1). % fact: Antalya and Izmir has a flight with cost 1.
flight(antalya,diyarbakir,5). % fact: Antalya and Diyarbakir has a flight with cost 5.

flight(konya,ankara,8). % fact: Konya and Ankara has a flight with cost 8.
flight(konya,diyarbakir,1). % fact: Konya and Diyarbakir has a flight with cost 1.
flight(konya,kars,5). % fact: Konya and Kars has a flight with cost 5.

flight(diyarbakir,antalya,5). % fact: Diyarbakir and Antalya has a flight with cost 5.
flight(diyarbakir,konya,1). % fact: Diyarbakir and Konya has a flight with cost 1.

flight(kars,konya,5). % fact: Kars and Konya has a flight with cost 5.
flight(kars,gaziantep,3). % fact: Kars and Gaziantep has a flight with cost 3.

flight(gaziantep,kars,3). % fact: Gaziantep and Kars has a flight with cost 3.


flight(edirne,edremit,5). % fact: Edirne and Edremit has a flight with cost 5.

flight(edremit,edirne,5). % fact: Edremit and Edirne has a flight with cost 5.
flight(edremit,erzincan,7). % fact: Edremit and Erzincan has a flight with cost 7.

flight(erzincan,edremit,7). % fact: Erzincan and Edremit has a flight with cost 7.

% rules


route(X,Y,C) :- flight(X,Y,C). % a predicate indicating there exist a route between
route(X,Y,C1):-route(Y,Z,C),flight(Z,X,G),
		not(X = Y), C1 is C+G.

%***  PART 2 ***%
% cheapest route
cheapest(istanbul, antalya,4).
cheapest(istanbul,konya,10).
cheapest(istanbul,kars,15).
cheapest(istanbul,gaziantep,18).
cheapest(istanbul,diyarbakir,9).

cheapest(kars,diyarbakir,6).
cheapest(kars,ankara,13).
cheapest(kars,trabzon,15).
cheapest(kars,istanbul,15).
cheapest(kars,izmir,12).
cheapest(kars,antalya,11).

cheapest(gaziantep,konya,8).
cheapest(gaziantep,diyarbakir,9).
cheapest(gaziantep,ankara,16).
cheapest(gaziantep,antalya,14).
cheapest(gaziantep,izmir,15).
cheapest(gaziantep,trabzon,18).
cheapest(gaziantep,istanbul,18).

cheapest(diyarbakir,kars,6).
cheapest(diyarbakir,gaziantep,9).
cheapest(diyarbakir,ankara,9).
cheapest(diyarbakir,istanbul,9).
cheapest(diyarbakir,izmir,6).
cheapest(diyarbakir,trabzon,11).

cheapest(konya,gaziantep,8).
cheapest(konya,antalya,6).
cheapest(konya,izmir,7).
cheapest(konya,istanbul,10).
cheapest(konya,trabzon,10).

cheapest(ankara,antalya,7).
cheapest(ankara,diyarbakir,9).
cheapest(ankara,kars,13).
cheapest(ankara,gaziantep,16).

cheapest(izmir,konya,7).
cheapest(izmir,diyarbakir,6).
cheapest(izmir,kars,12).
cheapest(izmir,gaziantep,15).
cheapest(izmir,trabzon,6).

cheapest(antalya,istanbul,4).
cheapest(antalya,trabzon,7).
cheapest(antalya,konya,6).
cheapest(antalya,kars,11).
cheapest(antalya,gaziantep,14).
cheapest(antalya,ankara,7).

cheapest(trabzon,izmir,6).
cheapest(trabzon,antalya,7).
cheapest(trabzon,izmir,6).
cheapest(trabzon,konya,10).
cheapest(trabzon,kars,15).
cheapest(trabzon,gaziantep,18).
cheapest(trabzon,diyarbakir,11).

cheapest(edirne,erzincan,12).
cheapest(erzincan,edirne,12).

croute(X,Y,Z):- flight(X,Y,Z), !;
				cheapest(X,Y,Z).

%***  PART 3 ***%

% time of the session X is Y

when(a, 10).
when(b, 12).
when(c, 11).
when(d, 16).
when(e, 17).

% place of the session X is Y

where(a, 101).
where(b, 104).
where(c, 102).
where(d, 103).
where(e, 103).

% X is enrolled in session Y

enrolled(1, a).
enrolled(1, b).
enrolled(2, a).
enrolled(3, b).
enrolled(4, c).
enrolled(5, d).
enrolled(6, d).
enrolled(6, a).

%*****3.0*****%
%add attandee in enrollment table
enrolled(7,a).
enrolled(7,b).
enrolled(7,d).
enrolled(7,c).
enrolled(8,c).
enrolled(8,d).
enrolled(9,d).
enrolled(9,a).
enrolled(10,b).
enrolled(10,c).
enrolled(11,b).
enrolled(11,d).
enrolled(13,a).
enrolled(13,d).

%*****3.1*****%
% associates an attandee to a place and time of session
schedule(S,P,T):- enrolled(S,Z),where(Z,P),when(Z, T).

%*****3.2*****%
% usage times of a room
usage(P,T):- where(S,P), when(S,T).

%*****3.3*****%
conflictTime(X,Y):- when(X,T), when(Y,Z),
				((T-Z>0, T-Z<2); (Z-T>0, Z-T<2)).

conflictRoom(X,Y):- where(X,T), where(Y,Z),
				T == Z.

conflict(X,Y):- ((conflictRoom(X,Y));
				(conflictTime(X,Y))), !.

%*****3.4*****%
meet(X,Y):- enrolled(X,A1),where(A1,P1),
			enrolled(Y,A2),where(A2,P2),
			A1 == A2 , P1 ==P2,!.


%***** PART 4 *****%

%***** 4.1 *****%
union([], S, S).   % bos liste ile bir listeyi toplayinca kendisini dondurur
union([],[],[]).   % bos liste ile bos liste bos liste dondurur

union([HEAD|TAIL],S,[HEAD|U]) :-
\+ mylist(HEAD,S), union(TAIL,S,U).
union([HEAD|TAIL],S,U) :- mylist(HEAD,S), union(TAIL,S,U).

mylist(HEAD,[_|TAIL]) :-mylist(HEAD, TAIL).
mylist(HEAD,[HEAD|_]).


%***** 4.2 *****%
%iki listenin kesisimini bulup yeni liste dondurur
mylist(L1, [L1|TAIL]).
mylist(L1, [HEAD|TAIL]) :- mylist(L1,TAIL).

intersect([],L2,[]).
intersect([HEAD|TAIL],L2,[HEAD|I]) :- mylist(HEAD,L2), intersect(TAIL,L2,I).
intersect([HEAD|TAIL],L2,I) :- intersect(TAIL,L2,I).

%***** 4.3 *****%
% This predicate flatten is the list of lists
% in L binding results to F.

flatten([], []) :- !.
flatten([HEAD|TAIL], List) :- !,
    flatten(HEAD, ListH),flatten(TAIL, ListT),
    	mylist(ListH, ListT, List).
flatten(L, [L]).
mylist([],F,F).
mylist([HEAD|TAIL],F,[HEAD|T]):- mylist(TAIL,F,T).


%********************END*************************%
