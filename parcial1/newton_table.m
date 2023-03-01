function newton_table(f, df, x0, tol, max_iter)
% f es la función a la que se le quiere encontrar la raíz.
% df es la derivada de la función f.
% x0 es el punto inicial.
% tol es la tolerancia deseada para la solución.
% max_iter es el número máximo de iteraciones permitidas.
disp("metodo newthon raphson")
% Imprimir la tabla de encabezado
fprintf('%-5s %-10s %-10s %-10s %-10s\n', 'n', 'x', 'f(x)', 'f''(x)', 'error')

% Inicializar la variable de iteración y el error
n = 0;
error = tol + 1;

% Iterar mientras no se alcance la tolerancia o se llegue al número máximo de iteraciones
while error > tol && n < max_iter
    % Calcular el nuevo punto x utilizando el método de Newton-Raphson
    x = x0 - f(x0) / df(x0);
    % Calcular el error en esta iteración
    error = abs(x - x0);
    % Calcular el valor de la función y su derivada en el punto x
    fx = f(x);
    dfx = df(x);
    % Imprimir la fila de la tabla correspondiente a esta iteración
    fprintf('%-5d %-10.4f %-10.4f %-10.4f %-10.4f\n', n, x, fx, dfx, error)
    % Actualizar el punto inicial x0
    x0 = x;
    % Incrementar el número de iteraciones
    n = n + 1;
end

% Verificar si se alcanzó la tolerancia o el número máximo de iteraciones
if error <= tol
    disp(['El método de Newton-Raphson convergió en ', num2str(n), ' iteraciones.'])
else
    disp('El método de Newton-Raphson no convergió en el número máximo de iteraciones.')
end

end
