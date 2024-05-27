tic
N1Cohe = diag(B(1,:));
N2Cohe = diag(B(2,:));
N3Cohe = diag(B(3,:));
N1auto = InvV*N1Cohe*V;
N2auto = InvV*N2Cohe*V;
N3auto = InvV*N3Cohe*V;
Etrio = zeros(D);
for i=1:D
    Etrio(:,i) = e;
end
CorrV = InvV*Corriente*V;
a = exp(1); %Número e
toc
