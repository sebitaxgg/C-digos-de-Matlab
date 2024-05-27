tic
Par = zeros(1,D/3);
Simetricos = zeros(3,D/3);
Posicion = zeros(3,D/3);
for i = 1:D/3
    for j= 1:3
        for k = 1:D/3
            for h = 1:3
            if B(1,Bsim(j,i)) == B(3,Bsim(h,k)) && B(2,Bsim(j,i)) == B(2,Bsim(h,k)) 
                   Simetricos(j,i)= k;
                   %Posicion(j,i) = h;
            end
            end
        end
    end
end
Positivos = [];
Negativos = [];
for i = 1:D/3
    for j = 1:D/3
        for k = 1:3
            Par(i) = Par(i)+Vid(j,i)*Vid(Simetricos(k,j),i)/3;
        end
    end
    if Par(i) > 0
         Positivos = [Positivos,i];
    else
         Negativos = [Negativos,i];
    end
end
ePos = eid(Positivos);
eNeg = eid(Negativos);
toc
%Para rotación
% meter esto debajo de simetricos Posicion(j,i) = h;
%for i = 1:D/3
%    for j = 1:D/3
%        for k = 1:3
%            Par(i) = Par(i)+VR(j,i)*VR(Simetricos(k,j),i)*conj(f(Posicion(k,j)))*f(k)/3;
%        end
%    end
%    if Par(i) > 0
%         Positivos = [Positivos,i];
%    else
%         Negativos = [Negativos,i];
%    end
%end