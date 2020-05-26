function [f, cap] = FordFulkerson(CapMatrix, S, T)

cap = CapMatrix;
f = 0;

while true
    
    % Hallar 
    path = findPath(cap, S, T);
    
    if path(1) == 0
        break
    end
    
    % Flujo 
    flow = max(max(cap));
    
    for j = 2:length(path)
        flow = min(flow, cap(path(j), path(j-1)));
    end
    
    for j = 2:length(path)
        a = path(j); b = path(j-1);
        cap(a,b) = cap(a,b) - flow;
        cap(b,a) = cap(b,a) + flow;
    end
    
    f = f + flow;
end

end


function F = findPath(CapMatrix, S, T)
% BFS (Breadth-first Search)

% Número de nodos
n = length(CapMatrix);

% Contadores de frente y trasero
front = 1; 
back = 2;

% Fila (queue)
queue = zeros(1,n);
queue(front) = S;

% Iniciar conjunto de predecesores
pred = zeros(1,n);
pred(S) = S; 

while front ~= back
    % Elegimos nuevo nodo y aumentamos 1 a frente
    node = queue(front);
	front = front + 1;
    
    % Iterar sobre todos los nodos
    for i = 1:n
        % Si el nodo no es predecesor y la capacidad máxima es positiva,
        % agregarlo a la cola y aumentar 1 al contador de trasero 'back'.
        % Además, actualizar el predecesor
        if pred(i) == 0 && CapMatrix(node,i) > 0
            queue(back) = i;
            back = back + 1;
            pred(i) = node;
        end
    end
end

% Iniciar variable de camino
path = zeros(1,n);


if pred(T) ~= 0
    i = T; c = 1;
	
    while pred(i) ~= i
    	path(c) = i;
        c = c + 1;
        i = pred(i);
    end
    
    path(c) = S;
    path(c+1:n) = [];
end

% Devolver camino final
F = path;
end