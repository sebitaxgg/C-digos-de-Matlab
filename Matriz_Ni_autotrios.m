%Calculo N1 en la base auto trip
%Supongo que esto es más rápido que Cambiotrio
tic
Ntercios = N/3*ones(1,D);
N1trio = diag(Ntercios);
N2trio = diag(Ntercios);
N3trio = diag(Ntercios);
for i = 1:D/3 %Para n1
    N1trio(D/3+i,i) = (B(1,Bsim(1,i)) + exp(2i*pi/3)*B(3,Bsim(1,i)) + exp(4i*pi/3)*B(2,Bsim(1,i)))/3;
    N1trio(2*D/3+i,i) = (B(1,Bsim(1,i)) + exp(4i*pi/3)*B(3,Bsim(1,i)) + exp(2i*pi/3)*B(2,Bsim(1,i)))/3;
    N1trio(2*D/3+i,D/3+i) = (B(1,Bsim(1,i)) + exp(2i*pi/3)*B(3,Bsim(1,i)) + exp(4i*pi/3)*B(2,Bsim(1,i)))/3;
    N1trio(i,D/3+i) = conj(N1trio(D/3+i,i));
    N1trio(i,2*D/3+i) = conj(N1trio(2*D/3+i,i)) ;
    N1trio(D/3+i,2*D/3+i) = conj(N1trio(2*D/3+i,D/3+i));
end
for i = 1:D/3 %Para n2
    N2trio(D/3+i,i) = (B(2,Bsim(1,i)) + exp(2i*pi/3)*B(1,Bsim(1,i)) + exp(4i*pi/3)*B(3,Bsim(1,i)))/3;
    N2trio(2*D/3+i,i) = (B(2,Bsim(1,i)) + exp(4i*pi/3)*B(1,Bsim(1,i)) + exp(2i*pi/3)*B(3,Bsim(1,i)))/3;
    N2trio(2*D/3+i,D/3+i) = (B(2,Bsim(1,i)) + exp(2i*pi/3)*B(1,Bsim(1,i)) + exp(4i*pi/3)*B(3,Bsim(1,i)))/3;
    N2trio(i,D/3+i) = conj(N2trio(D/3+i,i));
    N2trio(i,2*D/3+i) = conj(N2trio(2*D/3+i,i)) ;
    N2trio(D/3+i,2*D/3+i) = conj(N2trio(2*D/3+i,D/3+i));
end
for i = 1:D/3 %Para n3
    N3trio(D/3+i,i) = (B(3,Bsim(1,i)) + exp(2i*pi/3)*B(2,Bsim(1,i)) + exp(4i*pi/3)*B(1,Bsim(1,i)))/3;
    N3trio(2*D/3+i,i) = (B(3,Bsim(1,i)) + exp(4i*pi/3)*B(2,Bsim(1,i)) + exp(2i*pi/3)*B(1,Bsim(1,i)))/3;
    N3trio(2*D/3+i,D/3+i) = (B(3,Bsim(1,i)) + exp(2i*pi/3)*B(2,Bsim(1,i)) + exp(4i*pi/3)*B(1,Bsim(1,i)))/3;
    N3trio(i,D/3+i) = conj(N3trio(D/3+i,i));
    N3trio(i,2*D/3+i) = conj(N3trio(2*D/3+i,i)) ;
    N3trio(D/3+i,2*D/3+i) = conj(N3trio(2*D/3+i,D/3+i));
end
Vtrios(1:D/3,1:D/3) = Vid;
Vtrios(D/3+1:2*D/3,1+D/3:2*D/3) = VR;
Vtrios(2*D/3+1:D,2*D/3+1:D) = VR2;
InvVtrios(1:D/3,1:D/3) = invVid;
InvVtrios(D/3+1:2*D/3,1+D/3:2*D/3) = invVR;
InvVtrios(2*D/3+1:D,2*D/3+1:D) = invVR2;
N1autotrio = InvVtrios*N1trio*Vtrios;
N2autotrio = InvVtrios*N2trio*Vtrios;
N3autotrio = InvVtrios*N3trio*Vtrios;
Corrautotrio = InvVtrios*Corrtrio*Vtrios;
etr = [eid;eR;eR2]; %Poner si haces Evosim
Etrios = zeros(D);
for i=1:D
    Etrios(:,i) = etr;
end
a = exp(1);
toc
