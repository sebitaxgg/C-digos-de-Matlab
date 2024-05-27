tic
%Fórmula tiempo : 23*D^2/(2*13266400.5)
%T =  23*D^2/(2*13266400.5)
%Elementos de Matriz
H = zeros(D); % Sirve para cualquier combinación de N y L cambiando únicamente los J
for i = 1:D 
    for k = 1:L
        H(i,i) = H(i,i) + U*B(k,i)*(B(k,i)-1)/N; %Elementos diagonales
    end
    for j = i+1:D
        if sum(abs(B(:,i)-B(:,j))) == 2
            Indices = find(B(:,i)-B(:,j)); %Sé cuáles son los pozos donde actúa destrucción y creacción pero no se en cuál pasa el qué
            H(i,j) = -sqrt((B(Indices(1),i)-B(Indices(1),j))/2+1/2+B(Indices(1),j) ...
                )*sqrt((B(Indices(2),i)-B(Indices(2),j))/2+1/2+B(Indices(2),j))*J(Indices(1),Indices(2));
        % La fórmula anterior utilizo que el -1 se asocia al operador de
        % destrucción y (B(Indices(1),i)-B(Indices(1),j))/2+1/2 es una
        % función que manda el -1 al 0 y el 1 al 1, luego lo puedo juntar
        % para los coeficientes de los operadores.
        H(j,i) = H(i,j);
        end
    end
end
e = eig(H);
%Igual = zeros(1,D/3);
%for i = 1:D-2
%    if e(i+2) - e(i+1)<Tol && e(i+2) - e(i) <Tol && e(i+1) - e(i)<Tol
%        Igual(i)=1;
%    end
%end
%Trios = find(Igual);
toc