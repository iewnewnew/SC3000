company(sumsum).
company(appy).

competitor(sumsum,appy).
competitor(appy,sumsum).

developed(sumsum,galacticas3).

boss(stevey,appy).
stolen(stevey,galacticas3).

technology(galacticas3).
business(X) :- technology(X).

rival(X,Y) :- competitor(X,Y).

unethical(X) :- boss(X,Y), company(Y), stolen(X,Z), business(Z), developed(T,Z), company(T), rival(Y,T).