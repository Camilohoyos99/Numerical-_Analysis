function [derivada,error] = three_points(x0,h,f,f3x)
a=x0-h;
b=x0+h;
epsilon = rand(1) *(b-a)+a;
error= (h^2/6)* f3x(epsilon);

fxh=round(f(x0+h),5);

fxh2=round(f(x0-h),5);

derivada = 1/(2*h)*(fxh-fxh2);

derivada = round(derivada,5);
end

