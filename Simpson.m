function [y]=Simpson(wielomian,V,a,b,N)
%% Simpson
% Funkcja oblicza przybliżoną wartość całki na przedziale [a,b] złożoną
% metodą Simpsona, przy okazji wywołuje funkcje rysuj_wykres 
% dla liczonej całki
% wielomian - przyjmuje funkcję czebyszew
% V - wektor współczynników wielomianu
% a - początek przedziału całkowania
% b - koniec przedziału całkowania
% N - liczba przedziałów w złożonej metodzie Simpsona
% y - przybliżona wartość całki
if N==1
    y=((b-a)/6)*(wielomian(V,a)+4*wielomian(V,((a+b)/2))+wielomian(V,b));
    punkty=[a,(a+b)/2,b];
else
    H=(b-a)/N;
    suma1=0;
    punkty=zeros(1,2*N+1);
    punkty(1)=a;
    punkty(end)=b;
    for k=1:(N-1)
        p=a+k*H;
        suma1=suma1+wielomian(V,p);
        punkty(2*k+1)=p;
    end
    suma2=0;
    for k=0:(N-1)
        p=a+k*H+H/2;
        suma2=suma2+wielomian(V,p);
        punkty(2*(k+1))=p;
    end
    y=(H/6)*(wielomian(V,a)+wielomian(V,b)+2*suma1+4*suma2);
end
rysuj_wykres(punkty,V,wielomian)
end