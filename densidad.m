tic
% Valor con rotación e inversión rota   -0.5868    0.7101   -0.3513   -0.2785    0.5255   -0.8212
%Necesito Cambioatrio Matriz_Ni_autotrios
%gm = gmdistribution(0,1);
%X = random(gm,6);
%X = X*sqrt(2)/sqrt(sum(X.^2));
X = [-1.1223    0.5255   -0.5553    0.0626   -0.3405    0.1898]';
q1 = X(1:3);
p1 = X(4:6);
CoefCohe1 = EstadoCoherente(B,D,q1,p1);
Coeftrio = InvCambiotrio*CoefCohe1;
Coefid = invVid*Coeftrio(1:D/3);
CoefR =  invVR*Coeftrio(D/3+1:2*D/3);
CoefR2 = invVR2*Coeftrio(2*D/3+1:D);
Coefautotrio = [abs(Coefid).^2; abs(CoefR).^2 ;abs(CoefR2).^2]';
denseq = diag(Coefautotrio);
for i=1:D/3
    denseq(D/3+i,2*D/3+i) = CoefR(i)*conj(CoefR2(i));
    denseq(2*D/3+i,D/3+i) = conj(denseq(D/3+i,2*D/3+i));
end
denseqN1 = real(trace(denseq*N1autotrio));
denseqN2 = real(trace(denseq*N2autotrio));
denseqN3 = real(trace(denseq*N3autotrio));
denseqCorr = real(trace(denseq*Corrautotrio));
figure
plot(t,real(Obs1n1),"r");
hold on
plot(t,real(Obs1n2),"b");
plot(t,real(Obs1n3),"g");
yline(denseqN1,'-.m');
yline(denseqN2,'-.c');
yline(denseqN3,'-.k');
legend('N1','N2','N3','N1eq','N2eq','N3eq')
title(N)
ylim([0 N]);

figure
plot(t,real(Obs1Corr));
yline(0,'-.k');
hold on
yline(denseqCorr,'-.r');
toc
%EnergiaCohe1 = (eid'*abs(Coefid).^2+eR'*abs(CoefR).^2+eR2'*abs(CoefR2).^2)/N;
%A = [denseqN1 denseqN2 denseqN3 denseqCorr EnergiaCohe1]
%X'
%C = [X' EnergiaCohe1 denseqCorr];
%if abs(denseqCorr) > 1
%   tabla(Siguiente,:) = C;
%   Siguiente  = Siguiente+1;
%end

