function [fun]=parabola(wielomian,V,a,b,c)
%% parabola
% Funkcja wyznacza wzór paraboli, 
% która w metodzie simpsona przybliża funkcję
% wielomian - przyjmuje funkcję czebyszew
% V - wektor współczynników wielomianu
% a - początek przedziału, który przybliża się parabolą
% b - koniec przediału, który przybliża się parabolą
% c - środek przedziału, który przybliża się parabolą
% fun - funkcja kwadratowa, wzór paraboli
x1=a;
if nargin==4
    x2=(a+b)/2;
else
    x2=c;
end
x3=b;
y1=wielomian(V,x1);
y2=wielomian(V,x2);
y3=wielomian(V,x3);
denom = (x1 - x2) * (x1 - x3) * (x2 - x3);
A     = (x3 * (y2 - y1) + x2 * (y1 - y3) + x1 * (y3 - y2)) / denom;
B     = (x3*x3 * (y1 - y2) + x2*x2 * (y3 - y1) + x1*x1 * (y2 - y3)) / denom;
C     = (x2 * x3 * (x2 - x3) * y1 + x3 * x1 * (x3 - x1) * y2 + x1 * x2 * (x1 - x2) * y3) / denom;
fun=@(x) (x.^2).*A+x.*B+C;
end