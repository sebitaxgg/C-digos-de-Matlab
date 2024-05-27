tic
%Elementos de Matriz
Hid = zeros(D/3); %Hamiltoniano identidad
H2 = zeros(D/3); %Hamiltoniano identidad
HR = zeros(D/3);%Hamiltoniano rotación
HR2 = zeros(D/3);%Hamiltoniano 2 rotación
%Puede estar mal HR y HR2 y sean las traspuestas?
for i = 1:D/3
    for j = i:D/3
        Hid(i,j) = (H(Bsim(1,i),Bsim(1,j))+H(Bsim(2,i),Bsim(1,j))+H(Bsim(3,i),Bsim(1,j))+H(Bsim(1,i),Bsim(2,j))+H(Bsim(2,i),Bsim(2,j))+H(Bsim(3,i),Bsim(2,j))+H(Bsim(1,i),Bsim(3,j))+H(Bsim(2,i),Bsim(3,j))+H(Bsim(3,i),Bsim(3,j)))/3; 
        HR(i,j) =  (H(Bsim(1,i),Bsim(1,j))+exp(4i*pi/3)*H(Bsim(1,i),Bsim(2,j))+exp(2i*pi/3)*H(Bsim(1,i),Bsim(3,j))+exp(2i*pi/3)*H(Bsim(2,i),Bsim(1,j))+H(Bsim(2,i),Bsim(2,j))+exp(4i*pi/3)*H(Bsim(2,i),Bsim(3,j))+exp(4i*pi/3)*H(Bsim(3,i),Bsim(1,j))+exp(2i*pi/3)*H(Bsim(3,i),Bsim(2,j))+H(Bsim(3,i),Bsim(3,j)))/3;
        HR2(i,j) = (H(Bsim(1,i),Bsim(1,j))+exp(2i*pi/3)*H(Bsim(1,i),Bsim(2,j))+exp(4i*pi/3)*H(Bsim(1,i),Bsim(3,j))+exp(4i*pi/3)*H(Bsim(2,i),Bsim(1,j))+H(Bsim(2,i),Bsim(2,j))+exp(2i*pi/3)*H(Bsim(2,i),Bsim(3,j))+exp(2i*pi/3)*H(Bsim(3,i),Bsim(1,j))+exp(4i*pi/3)*H(Bsim(3,i),Bsim(2,j))+H(Bsim(3,i),Bsim(3,j)))/3;        
    Hid(j,i) = Hid(i,j);   
    HR(j,i) = conj(HR(i,j));   
    HR2(j,i) = conj(HR2(i,j));
    end
end
HR(D/3,D/3) = real(HR(D/3,D/3));
HR2(D/3,D/3) = real(HR2(D/3,D/3));
%eid = eig(Hid);
%eR = eig(HR);
%eR2 = eig(HR2);
[Vid,Did,Wid] = eig(Hid);
eid = diag(Did);
invVid = Wid';
[VR,DR,WR] = eig(HR);
eR = diag(DR);
invVR = WR';
[VR2,DR2,WR2] = eig(HR2);
eR2 = diag(DR2);
invVR2 = WR2';
toc