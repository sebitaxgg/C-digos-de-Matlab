tic
f = @(x) exp((x-1)*(-3*x+10)*1i*pi/3);
Cambiotrio = zeros(D);
for i = 1:D/3
   for j=1:3
     Cambiotrio(Bsim(j,i),i) = 1/sqrt(3); 
     Cambiotrio(Bsim(j,i),D/3+i) = f(j)/sqrt(3); 
     Cambiotrio(Bsim(j,i),2*D/3+i) = conj(f(j))/sqrt(3); 
   end
end
InvCambiotrio = Cambiotrio^(-1);
Corrtrio = InvCambiotrio*Corriente*Cambiotrio;
toc
