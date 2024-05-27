ticgm = gmdistribution(0,3);
x = 1; %Banderas
y = 1;
z = 1;
Paso = 0;
while x+y+z>0 && Paso <= 50 
    if x>0
        X = random(gm,6);
        X = X*sqrt(2)/sqrt(sum(X.^2));
        %X = [0.07859 1.014 0.1625 0.8736 -0.1314 -0.3981];
        q1 = X(1:3);
        p1 = X(4:6);
    end
    if y>0
        Y = random(gm,6);
        Y = Y*sqrt(2)/sqrt(sum(Y.^2));
        %Y = [-1.1223    0.5255   -0.5553    0.0626   -0.3405    0.1898]; 
        q2 = Y(1:3);
        p2 = Y(4:6);
    end
    if z>0
        Z = random(gm,6);
        Z = Z*sqrt(2)/sqrt(sum(Z.^2));
        %Z = [-0.8034    0.4207    0.3552    0.0005   -0.0292   -1.0250];
        q3 = Z(1:3);
        p3 = Z(4:6);
    end
    %if sum(abs(q).^2)+sum(abs(p).^2)>2
    %    error('Combinación no válida')
    %end
    %p(3) = sqrt(2-sum(abs(q).^2)-sum(abs(p).^2));
    CoefCohe1 = EstadoCoherente(B,D,q1,p1);
    CoefCohe2 = EstadoCoherente(B,D,q2,p2);
    CoefCohe3 = EstadoCoherente(B,D,q3,p3);
    Coefauto1 = V^(-1)*CoefCohe1;
    Coefauto2 = V^(-1)*CoefCohe2;
    Coefauto3 = V^(-1)*CoefCohe3;
    %figure 
    %plot(e,abs(Coefauto1).^2,'r')
    %hold on
    %plot(e,abs(Coefauto2).^2,'b')
    %plot(e,abs(Coefauto3).^2,'g')
    %title(N)
    EnergiaCohe1 = e'*abs(Coefauto1).^2/N;
    EnergiaCohe2 = e'*abs(Coefauto2).^2/N;
    EnergiaCohe3 = e'*abs(Coefauto3).^2/N;
    IPR1= 1/(sum(abs(Coefauto1).^4));
    IPR2= 1/(sum(abs(Coefauto2).^4));
    IPR3= 1/(sum(abs(Coefauto3).^4));
    if EnergiaCohe1 >-2.25  && EnergiaCohe1 <-1.75 && IPR1<250 && x>0
        x = 0;
        X'
        EnergiaCohe1
        IPR1
    end
    if EnergiaCohe2>-2.25  && EnergiaCohe2 <-1.75 && IPR2<250 && y>0
        y = 0;
        Y'
        EnergiaCohe2
        IPR2
    end
    if EnergiaCohe3 >-2.25  && EnergiaCohe3 <-1.75 && IPR3<250 && z>0
        z = 0;
        Z'
        EnergiaCohe3
        IPR3
    end
    Paso = Paso+1;
    Paso
end