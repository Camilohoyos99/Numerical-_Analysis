function [s, err, table] = cubic_spline(x, y, z)
% x es un vector que contiene los puntos x.
% y es un vector que contiene los valores f(x) correspondientes.
% z es el punto en el que se quiere evaluar el spline.

% Verificar que x y y tienen la misma longitud
if length(x) ~= length(y)
    error('Los vectores x e y deben tener la misma longitud.')
end

% Obtener el número de puntos
n = length(x);

% Calcular los coeficientes de los trazadores cúbicos
h = x(2:end) - x(1:end-1);
A = diag(2*(h(1:end-1)+h(2:end)));
A = [A; zeros(1,n-2)];
A = [zeros(n-2,1), A];
A = [A, zeros(n-2,1)];
for i = 1:n-3
    A(i+1,i+2) = h(i+1);
    A(i+1,i) = h(i);
end
B = 6*diff(diff(y))./diff(x(1:end-1));
B = [0; B; 0];
M = A\B;

% Inicializar el spline y la tabla de resultados
s = 0;
table = zeros(n-1, 8);
err = 0;

% Iterar sobre los intervalos
for i = 1:n-1
    % Calcular los coeficientes del polinomio cúbico
    a = y(i);
    b = (y(i+1) - y(i)) / h(i) - h(i) / 6 * (2*M(i) + M(i+1));
    c = M(i) / 2;
    d = (M(i+1) - M(i)) / (6*h(i));
    % Calcular el valor del spline en el punto z
    if z >= x(i) && z <= x(i+1)
        s = a + b * (z - x(i)) + c * (z - x(i))^2 + d * (z - x(i))^3;
    end
    % Calcular el error de interpolación
    err = err + abs(a + b * h(i) / 2 + c * h(i)^2 / 3 + d * h(i)^3 / 4 - s);
    % Guardar los resultados en la tabla
    table(i, 1) = i;
    table(i, 2) = x(i);
    table(i, 3) = x(i+1);
    table(i, 4) = a;
    table(i, 5) = b;
    table(i, 6) = c;
    table(i, 7) = d;
    table(i, 8) = err;
end

% Imprimir la tabla de resultados
fprintf('%-5s %-10s %-10s %-10s %-10s %-10s %-10s %-10s %-10s\n', 'i', 'x_i', 'x_{i+1}', 'a', 'b', 'c', 'd', 's(z)', 'error');
