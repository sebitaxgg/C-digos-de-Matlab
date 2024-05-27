function[CoefCohe] = EstadoCoherente(B,D,q1,p1)
    CoefCohe = zeros(D,1);
    for i =1:D
        CoefCohe(i,1) = (q1(1)+1i*p1(1))^(B(1,i))/sqrt(factorial(B(1,i)))*(q1(2)+1i*p1(2))^(B(2,i))/sqrt(factorial(B(2,i)))*(q1(3)+1i*p1(3))^(B(3,i))/sqrt(factorial(B(3,i)));
    end
    Norma1 = sqrt(sum(abs(CoefCohe).^2));
    CoefCohe = CoefCohe/Norma1;
end