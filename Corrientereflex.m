Corriente = zeros(D);
Numerosopuestos = [2 3 1 ;3 1 2]; %Lo creo para que cuando j valga 1 tener el 2 y 3 y pongo el primero el que va con +i
for i = 1:D
    for j = 1:3
        if B(j,i) ~= 0
            c=1;
            b=1;
            Numeros = Numerosopuestos(:,j);
            k = i+1;
            while k <= D && (c+b)>0 %c+b hacen de bandera para parar el bucle antes.
                if B(Numeros(1),k) == B(Numeros(1),i) + 1 && B(j,k) == B(j,i)-1
                    Corriente(i,k) = 1i*sqrt(B(j,i))*sqrt(B(Numeros(1),i)+1);
                    Corriente(k,i) = -Corriente(i,k);
                    c=0;
                end
                if B(Numeros(2),k) == B(Numeros(2),i) + 1 && B(j,k) == B(j,i)-1
                    Corriente(i,k) = -1i*sqrt(B(j,i))*sqrt(B(Numeros(2),i)+1);
                    Corriente(k,i) = -Corriente(i,k);
                    b=0;
                end 
                k = k+1;
            end
        end
    end
end
