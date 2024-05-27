tic
%Necesitas Vcambiobase,Matriz_Ni_auto
gm = gmdistribution(0,1);
Numestados = 6;
%Coeficientes = zeros(6,Numestados); %Los que vaya a estudiar
CoeficientesCohe = zeros(D,Numestados);
Coeficientesauto = zeros(D,Numestados);
EnergiasCohe = zeros(Numestados,1);
IPRCoef = zeros(Numestados,1);
for i = 1:Numestados
    q = Coeficientes(1:3,i);
    p = Coeficientes(4:6,i);
    CoeficientesCohe(:,i) = EstadoCoherente(B,D,q,p);
    Coeficientesauto(:,i) = InvV*CoeficientesCohe(:,i);
    EnergiasCohe(i,1) = e'*abs(Coeficientesauto(:,i )).^2/N;
    IPRCoef(i,1)= 1/(sum(abs(Coeficientesauto(:,i )).^4));
end 
a = exp(1);
Numeropasos = 1001;
t = linspace(0,100,Numeropasos)';
Evotemp1 = zeros(Numeropasos,Numestados);
Evotemp2 = zeros(Numeropasos,Numestados);
Evotemp3 = zeros(Numeropasos,Numestados);
EvoCorr = zeros(Numeropasos,Numestados);
for i = 1:Numeropasos
    Exptrio = -1i*(Etrio'-Etrio)*t(i); % Es el exponente de la Energia colocado en-em corresponde con el m,n
    ExpEner2 = a.^Exptrio;
    N1t = (ExpEner2).*N1auto;
    N2t = (ExpEner2).*N2auto;
    N3t = (ExpEner2).*N3auto;
    Corrt = (ExpEner2).*CorrV;
    for j = 1:Numestados
         ObsCorr = zeros(length(t),1);
         Evotemp1(i,j) = Coeficientesauto(:,j)'*N1t*Coeficientesauto(:,j);
         Evotemp2(i,j) = Coeficientesauto(:,j)'*N2t*Coeficientesauto(:,j);
         Evotemp3(i,j) = Coeficientesauto(:,j)'*N3t*Coeficientesauto(:,j); 
         EvoCorr(i,j) = Coeficientesauto(:,j)'*Corrt*Coeficientesauto(:,j);
    end
end 
axs1 = [-1 1];
ays1 = [0 0];
axs2 = [real(exp(2i*pi/3)) -real(exp(2i*pi/3))];
ays2 = [imag(exp(2i*pi/3)) -imag(exp(2i*pi/3))];
axs3 = [real(exp(4i*pi/3)) -real(exp(4i*pi/3))];
ays3 = [imag(exp(4i*pi/3)) -imag(exp(4i*pi/3))];
figure
tiledlayout(3,6)
for i = 1:Numestados
    nexttile
    plot(t,real(Evotemp1(:,i)),"r");
    hold on
    plot(t,real(Evotemp2(:,i)),"b");
    plot(t,real(Evotemp3(:,i)),"g");
    legend('N1','N2','N3')
    title(N)
    ylim([0 N]);
end
for i = 1:Numestados
    nexttile
    O1 = real(Evotemp1(:,i))+real(Evotemp2(:,i))*exp(2i*pi/3)+ real(Evotemp3(:,i))*exp(4i*pi/3);
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
end
for i = 1:Numestados
    nexttile
    plot(t,real(EvoCorr(:,i)));
    yline(0,'-.k');
end
%varNames = ["t","N1","N2","N3"];
T1 = table(t,real(Evotemp1),real(Evotemp2),real(Evotemp3),real(EvoCorr));
%T2 = table(t,real(Obs2n1),real(Obs2n2),real(Obs2n3),'VariableNames',varNames);
%T3 = table(t,real(Obs3n1),real(Obs3n2),real(Obs3n3),'VariableNames',vetable(T1,'N120Caso1.txt','Delimiter','\t','WriteRowNames',true);
%writetable(T2,'N120Caso2.txt','Delimiter','\t','WriteRowNames',true);
%writetable(T3,'N120Caso3.txt','Delimiter','\t','WriteRowNames',true);
toc
%writetable(T1,'EVOLUCIONES','Delimiter','\t','WriteRowNames',true);