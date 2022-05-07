function [wynik]= czebyszew(V,x)
%% czebyszew
% Funkcja wyznacza wartość 
% wielomianu będącego kombinacją liniową
% wielomianów czebyszewa drugiego rodzaju
% V - wektor współczynników wielomianu 
% x - dane skalar lub wektor 
% wynik - skalar lub wektor analogicznie do danych
n=length(V);
tablica=zeros(length(x),n);
tablica(:,1)=1;
tablica(:,2)=x.*2;
if n>2
    for i=3:n
        tablica(:,i)=2*x'.*tablica(:,i-1)-tablica(:,i-2);
    end
end
wynik=sum(tablica.*V,2);
end

