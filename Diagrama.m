tic 
%autoval = ePos; %Esto es para los autovalores de Paridad +1
%autoval = eNeg;
%autoval = e; %No tiene sentido, ya que hay mucha degeneración por doblete
%dada la simetria de rotación.
%autoval = eid;
autoval = eR;
%autoval = eR2; no tiene sentido porque son los mismos que eR 
Energias = linspace(0.10,0.90,81);
Energias = -1;
figure
tiledlayout(1,1)
for j =1:length(Energias)
    Ebar= Energias(j);
    E = Ebar*(autoval(length(autoval))-autoval(1))+autoval(1);
    E = -3.9; %Para tripletes
    %E = -0.8*N;
    E = -2;
    CentroE = find(abs(autoval-E)==min(abs(autoval-E)),1); %Busco el elemento minimo igualando el absoluto de la diferencia con el minimo de la diferencia
    %Longinf = min(50, CentroE-1); %Tomo como mucho 50 a cada lado sin pasarme
    Longsup = min(50, length(autoval)-CentroE-1);
    Longinf = CentroE-1; %Para tripletes
    Longsup = length(autoval)-CentroE-1;%Para dobletes
    Longinf = CentroE-8752;
    Longsup = 10854-CentroE;
    Long = Longsup + Longinf;
    S = zeros(1,Long);
    for i = CentroE-Longinf:CentroE+Longsup
        S(i-CentroE+Longinf+1) = autoval(i+1)-autoval(i);
    end
    R = zeros(1,Long-1);
    Rbar = zeros(1,Long-1);
    for i = 1:Long-1
        R(i)=S(i+1)/S(i);
        Rbar(i) = min(R(i),1/R(i));
    end
    nexttile
    h = histogram(Rbar);
    h.BinWidth = 0.05;
    hold on
    area = sum(h.Values)*h.BinWidth;
    h.BinCounts = h.BinCounts/area
    f = @(x) 2/(x+1)^2
    g = @(x) 27/4*(x+x^2)/(1+x+x^2)^(5/2);
    f2 = @(x) 2*81*sqrt(3)*area/(4*pi)*(x+x^2)^2/(1+x+x^2)^(4);
    f3 = @(x) 2*729*sqrt(3)*area/(4*pi)*(x+x^2)^4/(1+x+x^2)^(7);
    fplot(f,[0,1],'b')
    fplot(g,[0,1],'g')
    %fplot(f2,[0,1],'r')
    %fplot(f3,[0,1],'k')
    legend(' r̃','Poisson', 'GOE','GUE','GSE')
    xlabel(' r̃')
    title('Ratios del sector \alpha = e^{2iπ/3} para valores -2.2<e < -1.8')

end
toc
