function false_position_table(f, a, b, tol, max_iter)
% f es la función a la que se le quiere encontrar la raíz.
% a y b son los puntos iniciales del intervalo en el que se buscará la raíz.
% tol es la tolerancia deseada para la solución.
% max_iter es el número máximo de iteraciones permitidas.
disp("metodo de falsa posicion")
% Verificar si la función tiene signos diferentes en a y b
if sign(f(a)) == sign(f(b))
    error('La función debe tener signos diferentes en a y b')
end

% Imprimir la tabla de encabezado
fprintf('%-5s %-10s %-10s %-10s %-10s %-10s %-10s\n', 'n', 'a', 'b', 'f(a)', 'f(b)', 'c', 'f(c)', 'error')

% Inicializar la variable de iteración y el error
n = 0;
error = tol + 1;

% Iterar mientras no se alcance la tolerancia o se llegue al número máximo de iteraciones
while error > tol && n < max_iter
    % Calcular el nuevo punto c utilizando el método de la falsa posición
    c = (a*f(b) - b*f(a)) / (f(b) - f(a));
    % Calcular el valor de la función en los puntos a, b y c
    fa = f(a);
    fb = f(b);
    fc = f(c);
    % Imprimir la fila de la tabla correspondiente a esta iteración
    fprintf('%-5d %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f %-10.4f\n', n, a, b, fa, fb, c, fc, error)
    % Verificar en qué mitad del intervalo se encuentra la raíz
    if sign(fc) == sign(f(a))
        % La raíz está en el intervalo [c, b]
        a = c;
    else
        % La raíz está en el intervalo [a, c]
        b = c;
    end
    % Calcular el nuevo error
    error = abs(fc);
    % Incrementar el número de iteraciones
    n = n + 1;
end

% Verificar si se alcanzó la tolerancia o el número máximo de iteraciones
if error <= tol
    disp(['El método de la falsa posición convergió en ', num2str(n), ' iteraciones.'])
else
    disp('El método de la falsa posición no convergió en el número máximo de iteraciones.')
end

end

