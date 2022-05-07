function []=rysuj_wykres(punkty,V,y1)
%% rysuj_wykres
% Funkcja rysuje wykres wielomianu i parabole, którymi jest przybliżany w
% metodzie Simpsona
% punkty - wektor punkty z funkcji Simpson, są to punkty wyznaczane w
% metodzie Simpsona 
% V - wektor współczynników wielomianu
% y1 - przyjmuje funkcję czebyszew
n=length(punkty);
N=(n-1)/2;
x=linspace(punkty(1),punkty(end),n*50);
figure;
plot(x,y1(V,x),'b');
hold on
for i=1:N   
    x_i1=linspace(punkty(2*i-1),punkty(2*i),50);
    x_i2=linspace(punkty(2*i),punkty(2*i+1),50);
    x_i=[x_i1,x_i2];
    fun=parabola(y1,V,punkty(2*i-1),punkty(2*i+1),punkty(2*i));
    area(x_i,fun(x_i),'FaceColor','r','LineStyle','none')
    plot(x_i,fun(x_i),'k-o', ...
    'MarkerSize',2,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','k', ...
    'MarkerIndices',[1,50,100])  
end
plot(x,y1(V,x),'b');
hold off
title('Wykres przyklad 1','FontSize',14);
legend({'wielomian','parabola Simpsona'},'Location','best');
xlabel('x');
ylabel('y');
end