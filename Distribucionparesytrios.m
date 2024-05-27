Disttriosrot = zeros(length(eid),1);
Disparinv = zeros(length(eid),1);
for i = 1:length(eid)
    Disttriosrot(i) = abs(eid(i)-eR(i));
    if i == 1
        Disparinv(i) = eid(i+1)- eid(i);
    elseif i == length(eid)
        Disparinv(i) = eid(i)-eid(i-1);
    else
        Disparinv(i) = min(eid(i+1)-eid(i),eid(i)-eid(i-1));
    end
end
figure
semilogy(eid/N,Disttriosrot,"r")
hold on
plot(eid/N,Disparinv,'g')
legend('distancia a trios','distancia a pares')
%T1 = table(eid/N,Disttriosrot',Disparinv');
%writetable(T1,'TriosDobles','Delimiter','\t','WriteRowNames',true);
T1 = table(eR/N);