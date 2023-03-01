function [s, err, table] = quadratic_spline(x, y, z)
% x es un vector que contiene los puntos x.
% y es un vector que contiene los valores f(x) correspondientes.
% z es el punto en el que se quiere evaluar el spline.

% Verificar que x y y tienen la misma longitud
if length(x) ~= length(y)
    error('Los vectores x e y deben tener la misma longitud.')
end

% Obtener el número de puntos
n = length(x);

% Inicializar el spline y la tabla de resultados
s = 0;
table = zeros(n-2, 6);
err = 0;

% Iterar sobre los intervalos
for i = 1:n-2
    % Calcular los coeficientes del polinomio cuadrático
    a = y(i);
    b = (y(i+1) - y(i)) / (x(i+1) - x(i));
    c = (y(i+2) - 2*y(i+1) + y(i)) / ((x(i+2) - x(i+1))^2);
    % Calcular el valor del spline en el punto z
    if z >= x(i) && z <= x(i+1)
        s = a + b * (z - x(i)) + c * (z - x(i))^2;
    elseif z >= x(i+1) && z <= x(i+2)
        s = a + b * (z - x(i)) + c * (z - x(i))^2 + (y(i+2) - y(i+1)) / (x(i+2) - x(i+1)) * (z - x(i+1));
    end
    % Calcular el error de interpolación
    err = err + abs(a + b * (x(i+1) - x(i)) / 2 + c * (x(i+1) - x(i))^2 / 3 - s);
    % Guardar los resultados en la tabla
    table(i, 1) = i;
    table(i, 2) = x(i);
    table(i, 3) = x(i+1);
    table(i, 4) = x(i+2);
    table(i, 5) = s;
    table(i, 6) = err;
end

% Imprimir la tabla de resultados
fprintf('%-5s %-10s %-10s %-10s %-10s %-10s\n', 'i', 'x_i', 'x_{i+1}', 'x_{i+2}', 's(z)', 'error');
for i = 1:size(table, 1)
    fprintf('%-5d %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f\n', table(i, :));
end

end
