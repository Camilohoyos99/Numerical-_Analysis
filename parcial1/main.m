%BIsection
% Definir la función f
f = @(x) x^3 - 2*x - 5;

% Definir los puntos iniciales del intervalo
a = 2;
b = 3;

% Definir la tolerancia y el número máximo de iteraciones
tol = 0.001;
max_iter = 50;

% Llamar a la función bisection_table
%Sbisection_table(f, a, b, tol, max_iter);


%false position mismos valores
false_position_table(f,a,b,tol,max_iter)

%punto fijo mismos valores
% Definir la función f y la función de iteración g
f = @(x) exp(x)-4 +x;
g = @(x) log(4-x);

% Definir el punto inicial x0
x0 = 2;

% Definir la tolerancia y el número máximo de iteraciones
tol = 0.001;
max_iter = 50;

% Llamar a la función fixed_point_table
%fixed_point_table(g, x0, tol, max_iter);

%Newthon Raphson
% Definir la función f y su derivada df
f = @(x) x^3 - 2*x - 5;
df = @(x) 3*x^2 - 2;

% Definir el punto inicial x0
x0 = 2;

% Definir la tolerancia y el número máximo de iteraciones
tol = 0.001;
max_iter = 50;

% Llamar a la función newton_table
%newton_table(f, df, x0, tol, max_iter);


% metodo de la secante
% Definir la función
f = @(x) x^3 - 2*x - 5;

% Definir los puntos iniciales
x0 = 2;
x1 = 3;

% Definir la tolerancia y el número máximo de iteraciones
tol = 0.0001;
max_iter = 50;

% Llamar a la función secant_table
secant_table(f, x0, x1, tol, max_iter);

%lagrange interpolation
% Definir los puntos x y los valores de f(x)
x = [1, 2, 3, 4];
f = [1, 3, 2, 1];

% Evaluar el polinomio interpolante en x = 2.5 y calcular el error de interpolación
z = 2.5;
[y, err] = lagrange_interpolation(x, f, z);
fprintf('El valor del polinomio interpolante en x = %f es %f, y el error de interpolación es %f\n', z, y, err)

x = [1 2 3 4 5];
y = [2.5 3.6 4.8 6.1 7.5];

z = 2.7;

% Spline lineal
fprintf('Spline lineal:\n')
[s, err] = linear_spline(x, y, z);

% Spline cuadrático
fprintf('Spline cuadrático:\n')
[s, err] = quadratic_spline(x, y, z);

% Spline cúbico
fprintf('Spline cúbico:\n')
[s, err] = cubic_spline(x, y, z);


