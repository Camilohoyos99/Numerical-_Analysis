function [s, err] = linear_spline(x, y, z)
% x es un vector que contiene los puntos x.
% y es un vector que contiene los valores f(x) correspondientes.
% z es el punto en el que se quiere evaluar el spline.
disp("spline lineal")
% Verificar que x y y tienen la misma longitud
if length(x) ~= length(y)
    error('Los vectores x e y deben tener la misma longitud.')
end

% Obtener el número de puntos
n = length(x);

% Inicializar el spline y la tabla de resultados
s = 0;
table = zeros(n-1, 4);
err = 0;

% Iterar sobre los intervalos
for i = 1:n-1
    % Calcular la pendiente del intervalo
    m = (y(i+1) - y(i)) / (x(i+1) - x(i));
    % Calcular el valor del spline en el punto z
    if z >= x(i) && z <= x(i+1)
        s = y(i) + m * (z - x(i));
    end
    % Calcular el error de interpolación
    err = err + abs(y(i) + m * (x(i+1) - x(i)) / 2 - s);
    % Guardar los resultados en la tabla
    table(i, 1) = i;
    table(i, 2) = x(i);
    table(i, 3) = x(i+1);
    table(i, 4) = s;
    % Imprimir la fila correspondiente a esta iteración
    fprintf('%-5d %-10.4f %-10.4f %-10.4f %-10.4f\n', table(i, 1), table(i, 2), table(i, 3), table(i, 4), err)
end

end
