tic
%Necesitas Vcambiobase,Matriz_Ni_auto
%Estos son los que me dio Armando
%q1 = [-0.2827 0.3021 -0.3325];
%p1 = [0.07724 0.3205 1.269];
q2 = [0.07859 1.014 0.1625];
p2 = [0.8736 -0.1314 -0.3981];
q3 = [0.4059 -0.6031 0.4765];
p3 = [-0.7915 -0.7679 0.1685];
gm = gmdistribution(0,1);

%X1 = random(gm,6);
%X1 = X1*sqrt(2)/sqrt(sum(X1.^2));
%X = [0.4476328 -0.5089790 -0.4889077 0.4486295 -0.9279765 0.48890048];
X1 = [-1.1223    0.5255   -0.5553    0.0626   -0.3405    0.1898];
q1 = X1(1:3);
p1 = X1(4:6);

%X2 = random(gm,6);
%X2 = X2*sqrt(2)/sqrt(sum(X2.^2));
X2 = [0.8510   -0.6128    0.1870    0.2834    0.5653 0.6822]; 
q2 = X2(1:3);
p2 = X2(4:6);

%X3 = random(gm,6);
%X3 = X3*sqrt(2)/sqrt(sum(X3.^2));
X3 = [-0.5868    0.7101   -0.3513   -0.2785    0.5255   -0.8212];
q3 = X3(1:3);
p3 = X3(4:6); 

X4 = [0.4059 -0.6031 0.4765 -0.7915 -0.7679 0.1685];
q4 = X4(1:3);
p4 = X4(4:6);
X5 = [0.3284   -0.4240   -0.3951   -0.2992   -1.0882    0.5316];
q5 = X5(1:3);
p5 = X5(4:6);
X6 = [-0.2827 0.3021 -0.3325 0.07724 0.3205 1.269];
q6 = X6(1:3);
p6 = X6(4:6);

%if sum(abs(q).^2)+sum(abs(p).^2)>2
%    error('Combinación no válida')
%end
%p(3) = sqrt(2-sum(abs(q).^2)-sum(abs(p).^2));
CoefCohe1 = EstadoCoherente(B,D,q1,p1);
CoefCohe2 = EstadoCoherente(B,D,q2,p2);
CoefCohe3 = EstadoCoherente(B,D,q3,p3);
CoefCohe4 = EstadoCoherente(B,D,q4,p4);
CoefCohe5 = EstadoCoherente(B,D,q5,p5);
CoefCohe6 = EstadoCoherente(B,D,q6,p6);
Coefauto1 = InvV*CoefCohe1;
Coefauto2 = InvV*CoefCohe2;
Coefauto3 = InvV*CoefCohe3;
Coefauto4 = InvV*CoefCohe4;
Coefauto5 = InvV*CoefCohe5;
Coefauto6 = InvV*CoefCohe6;
%figure 
%plot(e,abs(Coefauto1).^2,'r')
%hold on
%plot(e,abs(Coefauto2).^2,'b')
%plot(e,abs(Coefauto3).^2,'g')
%title(N)
EnergiaCohe1 = e'*abs(Coefauto1).^2/N;
EnergiaCohe2 = e'*abs(Coefauto2).^2/N;
EnergiaCohe3 = e'*abs(Coefauto3).^2/N;
EnergiaCohe4 = e'*abs(Coefauto4).^2/N;
EnergiaCohe5 = e'*abs(Coefauto5).^2/N;
EnergiaCohe6 = e'*abs(Coefauto6).^2/N;
%IPR1= 1/(sum(abs(Coefauto1).^4));
%IPR2= 1/(sum(abs(Coefauto2).^4));
%IPR3= 1/(sum(abs(Coefauto3).^4));


%IPR0 = [IPR1 IPR2 IPR3]
%EnergiaCohe = [EnergiaCohe1 EnergiaCohe2 EnergiaCohe3]
%if EnergiaCohe/N < -0.8 && EnergiaCohe/N >- 3.84
%    error('No es útil dará alrededor de N/3')
%end
t = linspace(0,50,51)';
Obs1n1 = zeros(length(t),1);
Obs1n2 = zeros(length(t),1);
Obs1n3 = zeros(length(t),1);
Obs2n1 = zeros(length(t),1);
Obs2n2 = zeros(length(t),1);
Obs2n3 = zeros(length(t),1);
Obs3n1 = zeros(length(t),1);
Obs3n2 = zeros(length(t),1);
Obs3n3 = zeros(length(t),1);
Obs4n1 = zeros(length(t),1);
Obs4n2 = zeros(length(t),1);
Obs4n3 = zeros(length(t),1);
Obs5n1 = zeros(length(t),1);
Obs5n2 = zeros(length(t),1);
Obs5n3 = zeros(length(t),1);
Obs6n1 = zeros(length(t),1);
Obs6n2 = zeros(length(t),1);
Obs6n3 = zeros(length(t),1);
Obs1Corr = zeros(length(t),1);
Obs2Corr = zeros(length(t),1);
Obs3Corr = zeros(length(t),1);
Obs4Corr = zeros(length(t),1);
Obs5Corr = zeros(length(t),1);
Obs6Corr = zeros(length(t),1);
a = exp(1);
for i = 1:length(t)
    Exptrio = -1i*(Etrio'-Etrio)*t(i); % Es el exponente de la Energia colocado en-em corresponde con el m,n
    ExpEner2 = a.^Exptrio;
    N1t = (ExpEner2).*N1auto;
    N2t = (ExpEner2).*N2auto;
    N3t = (ExpEner2).*N3auto;
    Corrt = (ExpEner2).*CorrV;
    Obs1n1(i) = Coefauto1'*N1t*Coefauto1;
    Obs1n2(i) = Coefauto1'*N2t*Coefauto1;
    Obs1n3(i) = Coefauto1'*N3t*Coefauto1; 
    Obs2n1(i) = Coefauto2'*N1t*Coefauto2;
    Obs2n2(i) = Coefauto2'*N2t*Coefauto2;
    Obs2n3(i) = Coefauto2'*N3t*Coefauto2;
    Obs3n1(i) = Coefauto3'*N1t*Coefauto3;
    Obs3n2(i) = Coefauto3'*N2t*Coefauto3;
    Obs3n3(i) = Coefauto3'*N3t*Coefauto3;
    Obs4n1(i) = Coefauto4'*N1t*Coefauto4;
    Obs4n2(i) = Coefauto4'*N2t*Coefauto4;
    Obs4n3(i) = Coefauto4'*N3t*Coefauto4; 
    Obs5n1(i) = Coefauto5'*N1t*Coefauto5;
    Obs5n2(i) = Coefauto5'*N2t*Coefauto5;
    Obs5n3(i) = Coefauto5'*N3t*Coefauto5;
    Obs6n1(i) = Coefauto6'*N1t*Coefauto6;
    Obs6n2(i) = Coefauto6'*N2t*Coefauto6;
    Obs6n3(i) = Coefauto6'*N3t*Coefauto6;
    Obs1Corr(i) = Coefauto1'*Corrt*Coefauto1;
    Obs2Corr(i) = Coefauto2'*Corrt*Coefauto2;
    Obs3Corr(i) = Coefauto3'*Corrt*Coefauto3;
    Obs4Corr(i) = Coefauto4'*Corrt*Coefauto4;
    Obs5Corr(i) = Coefauto5'*Corrt*Coefauto5;
    Obs6Corr(i) = Coefauto6'*Corrt*Coefauto6;
end
figure
tiledlayout(3,6)
nexttile
plot(t,real(Obs1n1),"r");
hold on
plot(t,real(Obs1n2),"b");
plot(t,real(Obs1n3),"g");
legend('N1','N2','N3')
title(N)
ylim([0 N]);
nexttile


plot(t,real(Obs2n1),"r");
hold on
plot(t,real(Obs2n2),"b");
plot(t,real(Obs2n3),"g");
legend('N1','N2','N3')
title(N)
ylim([0 N]);
nexttile


plot(t,real(Obs3n1),"r");
hold on
plot(t,real(Obs3n2),"b");
plot(t,real(Obs3n3),"g");
legend('N1','N2','N3')
title(N)
ylim([0 N]);
nexttile

plot(t,real(Obs4n1),"r");
hold on
plot(t,real(Obs4n2),"b");
plot(t,real(Obs4n3),"g");
legend('N1','N2','N3')
title(N)
ylim([0 N]);
nexttile

plot(t,real(Obs5n1),"r");
hold on
plot(t,real(Obs5n2),"b");
plot(t,real(Obs5n3),"g");
legend('N1','N2','N3')
title(N)
ylim([0 N]);
nexttile


plot(t,real(Obs6n1),"r");
hold on
plot(t,real(Obs6n2),"b");
plot(t,real(Obs6n3),"g");
legend('N1','N2','N3')
title(N)
ylim([0 N]);
nexttile

axs1 = [-1 1];
ays1 = [0 0];
axs2 = [real(exp(2i*pi/3)) -real(exp(2i*pi/3))];
ays2 = [imag(exp(2i*pi/3)) -imag(exp(2i*pi/3))];
axs3 = [real(exp(4i*pi/3)) -real(exp(4i*pi/3))];
ays3 = [imag(exp(4i*pi/3)) -imag(exp(4i*pi/3))];

O1 = real(Obs1n1)+real(Obs1n2)*exp(2i*pi/3)+ real(Obs1n3)*exp(4i*pi/3);
plot(real(O1)/N,imag(O1)/N,"b");
hold on
xlim([-1 1])
ylim([-1 1])
plot(axs1,ays1,'-.k');
plot(axs2,ays2,'-.k');
plot(axs3,ays3,'-.k');
text(1,0,'N1')
text(real(exp(2i*pi/3)), imag(exp(2i*pi/3)),'N2')
text(real(exp(4i*pi/3)), imag(exp(4i*pi/3)),'N3')
nexttile

O2 = real(Obs2n1)+real(Obs2n2)*exp(2i*pi/3)+ real(Obs2n3)*exp(4i*pi/3);
plot(real(O2)/N,imag(O2)/N,"b");
hold on
xlim([-1 1])
ylim([-1 1])
plot(axs1,ays1,'-.k');
plot(axs2,ays2,'-.k');
plot(axs3,ays3,'-.k');
text(1,0,'N1')
text(real(exp(2i*pi/3)), imag(exp(2i*pi/3)),'N2')
text(real(exp(4i*pi/3)), imag(exp(4i*pi/3)),'N3')
nexttile

O3 = real(Obs3n1)+real(Obs3n2)*exp(2i*pi/3)+ real(Obs3n3)*exp(4i*pi/3);
plot(real(O3)/N,imag(O3)/N,"b");
hold on
xlim([-1 1])
ylim([-1 1])
plot(axs1,ays1,'-.k');
plot(axs2,ays2,'-.k');
plot(axs3,ays3,'-.k');
text(1,0,'N1')
text(real(exp(2i*pi/3)), imag(exp(2i*pi/3)),'N2')
text(real(exp(4i*pi/3)), imag(exp(4i*pi/3)),'N3')
nexttile

O4 = real(Obs4n1)+real(Obs4n2)*exp(2i*pi/3)+ real(Obs4n3)*exp(4i*pi/3);
plot(real(O4)/N,imag(O4)/N,"b");
hold on
xlim([-1 1])
ylim([-1 1])
plot(axs1,ays1,'-.k');
plot(axs2,ays2,'-.k');
plot(axs3,ays3,'-.k');
text(1,0,'N1')
text(real(exp(2i*pi/3)), imag(exp(2i*pi/3)),'N2')
text(real(exp(4i*pi/3)), imag(exp(4i*pi/3)),'N3')
nexttile

O5 = real(Obs5n1)+real(Obs5n2)*exp(2i*pi/3)+ real(Obs5n3)*exp(4i*pi/3);
plot(real(O5)/N,imag(O5)/N,"b");
hold on
xlim([-1 1])
ylim([-1 1])
plot(axs1,ays1,'-.k');
plot(axs2,ays2,'-.k');
plot(axs3,ays3,'-.k');
text(1,0,'N1')
text(real(exp(2i*pi/3)), imag(exp(2i*pi/3)),'N2')
text(real(exp(4i*pi/3)), imag(exp(4i*pi/3)),'N3')
nexttile

O6 = real(Obs6n1)+real(Obs6n2)*exp(2i*pi/3)+ real(Obs6n3)*exp(4i*pi/3);
plot(real(O6)/N,imag(O6)/N,"b");
hold on
xlim([-1 1])
ylim([-1 1])
plot(axs1,ays1,'-.k');
plot(axs2,ays2,'-.k');
plot(axs3,ays3,'-.k');
text(1,0,'N1')
text(real(exp(2i*pi/3)), imag(exp(2i*pi/3)),'N2')
text(real(exp(4i*pi/3)), imag(exp(4i*pi/3)),'N3')
nexttile

plot(t,real(Obs1Corr));
yline(0,'-.k');
nexttile
plot(t,real(Obs2Corr));
yline(0,'-.k');
nexttile    
plot(t,real(Obs3Corr));
yline(0,'-.k');
nexttile
plot(t,real(Obs4Corr));
yline(0,'-.k');
nexttile
plot(t,real(Obs5Corr));
yline(0,'-.k');
nexttile    
plot(t,real(Obs6Corr));
yline(0,'-.k');


%varNames = ["t","N1","N2","N3"];
%T1 = table(t,real(Obs1n1),real(Obs1n2),real(Obs1n3),'VariableNames',varNames);
%T2 = table(t,real(Obs2n1),real(Obs2n2),real(Obs2n3),'VariableNames',varNames);
%T3 = table(t,real(Obs3n1),real(Obs3n2),real(Obs3n3),'VariableNames',varNames);
%writetable(T1,'N120Caso1.txt','Delimiter','\t','WriteRowNames',true);
%writetable(T2,'N120Caso2.txt','Delimiter','\t','WriteRowNames',true);
%writetable(T3,'N120Caso3.txt','Delimiter','\t','WriteRowNames',true);
toc

