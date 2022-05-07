function [wynik]=tabela(wielomian,V,a,b,N,tru)
%% tabela
% Funkcja tworzy tabelke z 10 wierszami dla decyli z przedziału [1,N],
% gdzie N to liczba przedziałów w metodzie Simpsona i 6 kolumnach:
% N - liczba przedziałów w metodzie Simpsona
% a - początek przedziału całkowania
% b - koniec przedziału całkowania
% Simpson - wartość całki obliczona funkcją Simpson
% dokladna - wartość całki obliczona za pomocą wolframalpha, z dokładnością
% do 4 miejsc po przecinku
% blad - błąd wzlędny metody Simpsona
% Funkcja poprzez wywoływnie funkcji rysuj_wykres poprzez wywoływanie
% funckji Simpson rysuje wykresy odpowiadające całkom z każdego wiersza
% Funkcja przyjmuje:
% wielomian - przyjmuje funkcję czebyszew
% V - wektor współczynników wielomianu
% a - początek przedziału całkowania
% b - koniec przedziału całkowania
% N - liczba przedziałów w złożonej metodzie Simpsona
% tru - wartość całki obliczona za pomocą wolframalpha, z dokładnością
% do 4 miejsc po przecinku

sz=[10,6];
wynik=zeros(sz);
wynik(:,1)=floor(linspace(1,N,10))';
wynik(:,2)=a;
wynik(:,3)=b;
for k=1:10 
    wynik(k,4)=Simpson(wielomian,V,a,b,wynik(k,1));
    wynik(k,5)=tru;
    wynik(k,6)=((abs(wynik(k,4)-wynik(k,5)))/(wynik(k,5)));
end
colnames = {'N','a','b','Simpson','dokladna','blad'};
wynik = table(wynik(:,1), wynik(:,2), wynik(:,3), wynik(:,4),wynik(:,5),wynik(:,6),'VariableNames', colnames);
%xd
end