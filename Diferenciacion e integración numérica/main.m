format longG
f = @(x) sin(x);
f3x =@(x)-cos(x);
x0 = 0.9;
h =[0.1,0.05,0.02,0.01,0.005,0.002,0.001];

valor_h=zeros(1,length(h));
errores_h = zeros(1,length(h));
for i=1:length(h)
    [valor,error] = three_points(x0,h(i),f,f3x);
    valor_h(i)=valor;
    errores_h(i)=error;
end

% figure(1)
% grid on 
% plot(h, valor_h, '-o')
% xlabel('h')
% ylabel('Valor')
% title('Grafica de valor vs h')
% 
% 
% figure(2)
% grid on 
% plot(h, errores_h, '-x')
% xlabel('h')
% ylabel('error')
% title('Grafica de errores vs h')

valor_aprox = round(valor_h,5);
valor_real =0.62161;

figure
errores_totales=abs(valor_aprox-valor_real)
plot(h,errores_totales)
xlabel('h')
ylabel('errores totales')
title('Grafica de errores vs h')
   