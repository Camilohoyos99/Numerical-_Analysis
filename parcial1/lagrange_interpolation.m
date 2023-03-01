function [y, err] = lagrange_interpolation(x, f, z)
% x es un vector que contiene los puntos x.
% f es un vector que contiene los valores f(x) correspondientes.
% z es el punto en el que se quiere evaluar el polinomio interpolante.
disp("lagrange interpolation")
% Verificar que x y f tienen la misma longitud
if length(x) ~= length(f)
    error('Los vectores x y f deben tener la misma longitud.')
end

% Obtener el número de puntos
n = length(x);

% Imprimir la tabla de encabezado
fprintf('%-5s %-10s %-10s %-10s\n', 'n', 'L(x)', 'P(x)', 'Error')

% Inicializar el polinomio interpolante, la tabla de resultados y el error
y = 0;
table = zeros(n, 3);
err = 0;

% Iterar sobre los puntos
for i = 1:n
    % Calcular el término Li(x)
    Li = 1;
    for j = 1:n
        if j ~= i
            Li = Li * (z - x(j)) / (x(i) - x(j));
        end
    end
    % Agregar el término Li(x) al polinomio interpolante
    y = y + f(i) * Li;
    % Calcular el error de interpolación
    err = err + abs(f(i) * Li);
    % Guardar los resultados en la tabla
    table(i, 1) = i;
    table(i, 2) = Li;
    table(i, 3) = y;
    table(i, 4) = err;
    % Imprimir la fila correspondiente a esta iteración
    fprintf('%-5d %-10.4f %-10.4f %-10.4f\n', table(i, 1), table(i, 2), table(i, 3), table(i, 4))
end

end
