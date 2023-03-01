function secant_table(f, x0, x1, tol, max_iter)
% f es la función a la que se le quiere encontrar la raíz.
% x0 y x1 son los puntos iniciales.
% tol es la tolerancia deseada para la solución.
% max_iter es el número máximo de iteraciones permitidas.
disp("metodo de la secante")
% Imprimir la tabla de encabezado
fprintf('%-5s %-10s %-10s %-10s %-10s %-10s\n', 'n', 'x0', 'x1', 'f(x0)', 'f(x1)', 'error')

% Inicializar la variable de iteración y el error
n = 0;
error = tol + 1;

% Iterar mientras no se alcance la tolerancia o se llegue al número máximo de iteraciones
while error > tol && n < max_iter
    % Calcular el nuevo punto x utilizando el método de la secante
    x = x1 - f(x1)*(x1 - x0) / (f(x1) - f(x0));
    % Calcular el error en esta iteración
    error = abs(x - x1);
    % Calcular el valor de la función en los puntos x0, x1 y x
    fx0 = f(x0);
    fx1 = f(x1);
    fx = f(x);
    % Imprimir la fila de la tabla correspondiente a esta iteración
    fprintf('%-5d %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f\n', n, x0, x1, fx0, fx1, error)
    % Actualizar los puntos iniciales x0 y x1
    x0 = x1;
    x1 = x;
    % Incrementar el número de iteraciones
    n = n + 1;
end

% Verificar si se alcanzó la tolerancia o el número máximo de iteraciones
if error <= tol
    disp(['El método de la secante convergió en ', num2str(n), ' iteraciones.'])
else
    disp('El método de la secante no convergió en el número máximo de iteraciones.')
end

end
